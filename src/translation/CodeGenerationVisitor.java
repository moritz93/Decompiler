package translation;

import java.awt.Point;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.jgraph.graph.DefaultEdge;

import main.Visitor;
import parser.TokenKind;
import semantics.Type;
import semantics.expression.AtomicExpression;
import semantics.expression.BinaryExpression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.EmptyStatement;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

public class CodeGenerationVisitor implements Visitor {

	/**
	 * The index which declares the local variable names. Incremented after each
	 * statement, except "SW". Scope ends with function.
	 */
	public int index;

	/**
	 * The offset from $gp to the start of sdata section.
	 */
	public final int sdataGpOffset = 32768;

	/**
	 * The map containing the local variables created while generating code.
	 * e.g. "Register $29 is mapped to local variable %1."
	 * 
	 * @key Point.x The register number. Point.y The label block number.
	 * @value The number of the local variable.
	 */
	private Map<Point, Integer> localVars;

	/**
	 * The stack array size to be allocated.
	 */
	private final int stackOffset;

	/**
	 * The global data array size to be allocated.
	 */
	private final int dataOffset;

	/**
	 * The global sdata array size to be allocated.
	 */
	private final int sdataOffset;

	/**
	 * The current statement's address.
	 */
	private int currentAddress;

	/**
	 * The current @LabelStatement
	 */
	private LabelStatement currentLabelStmt;

	/**
	 * The current @LabelBlockStatement.
	 */
	private LabelBlockStatement currentLabelBlock;

	/**
	 * The writer which prints the LLVM assembly to the destination file.
	 */
	private final PrintWriter writer;

	/**
	 * The previous instruction to insert required jumps in intermediate
	 * presentation if not already given in SimpleScalar code.
	 */
	private TokenKind previousInstruction;

	/**
	 * Contains all registers-localVar mapping that were null in the first run
	 * cause of back jump loops.
	 */
	private Map<Point, Integer> phiInstructionVars;
	
	private final HashMap<String, Type[]> functionParams;
	private final HashMap<String, Type> returnTypes;

	/**
	 * This writer inserts all fake load instructions to file fake.load
	 */
	private final PrintWriter fakeLoadWriter;

	public CodeGenerationVisitor(int stackOffset, int globalOffset, int sdataAllocation, PrintWriter writer,
			PrintWriter fakeLoadWriter, HashMap<String, Type[]> map, HashMap<String, Type> returnTypes) {
		this.stackOffset = stackOffset;
		this.dataOffset = globalOffset;
		this.sdataOffset = sdataAllocation;
		this.writer = writer;
		this.fakeLoadWriter = fakeLoadWriter;
		functionParams = map;
		this.returnTypes = returnTypes;
	}

	@Override
	public void visit(BinaryExpression e) {
		String res = "";
		String arg = "";
		int arg1;
		String dest = "";
		String shiftOffset = "";
		int offset, offsetAligned;
		switch (e.getInstruction().getKind()) {
		case SW:
		case SB:
			e.getE1().accept(this);
			arg = e.getE1().getTranslation();
			int register = -1;
			if (arg.equals("null")) {
				register = Integer.parseInt(
						((PrimaryExpression) ((UnaryExpression) e.getE1()).getExpression()).getInstruction().getText());
				switch (register) {
				// Handles all callee-saved registers with fake load.
				case 31:
				case 30:
				case 16:
				case 17:
				case 18:
				case 19:
				case 20:
				case 21:
				case 22:
				case 23:
					printFakeLoad(currentLabelStmt.getName(), "zero");
					res += LLVMcodeGenerator.loadGlobalStmt(index, "zero") + "\n";
					insert(register);
					break;

				default:
					break;
				}
			} else {
				register = Integer.parseInt(arg);
			}
			// Get element pointer.
			e.getE2().accept(this);
			res += e.getE2().getTranslation() + "\n";
			int var = arg.equals("null") ? getLocalVar(register, currentLabelBlock.getLabelNum())
					: Integer.parseInt(arg);
			boolean truncNeeded = false;
			boolean zextNeeded = false;
			// Cast
			if (e.getInstruction().getKind() == TokenKind.SW) {
				res += LLVMcodeGenerator.castStmt(index, "i8*", index - 1, "i32*") + "\n";
				index++;
				if (var != -10 && e.getE1().getType() != Type.INTEGER && e.getE1().getType() != Type.VALUE && e.getE1().getType() != Type.UNKNOWN) {
					zextNeeded = true;
					res += LLVMcodeGenerator.zExtStmt(index, e.getE1().getType().getText(), "" + var,
							Type.INTEGER.getText()) + "\n";
					index++;
				}
			} else if (var != -10 && e.getE1().getType() != Type.BYTE) {
				truncNeeded = true;
				res += LLVMcodeGenerator.truncStmt(index, e.getE1().getType().getText(), "" + var, "i8") + "\n";
				index++;
			}
			int adr;
			if (truncNeeded || zextNeeded) {
				var = index - 1;
				adr = index - 2;
			} else {
				adr = index - 1;
			}
			// If var == 0.
			if (var == -10) {
				res += LLVMcodeGenerator.storeStmtZero(e.getInstruction().getKind() == TokenKind.SB ? "i8" : "i32",
						adr);
			} else {
				res += LLVMcodeGenerator.storeStmt(var, e.getInstruction().getKind() == TokenKind.SB ? "i8" : "i32",
						adr);

			}
			break;

		case LBU:
		case LW:
		case LHU:
			// Get element pointer.
			e.getE2().accept(this);
			res += e.getE2().getTranslation() + "\n";

			// Cast
			String type = "";
			if (e.getInstruction().getKind() == TokenKind.LBU) {
				type = "i8*";
			} else {
				res += LLVMcodeGenerator.castStmt(index, "i8*", index - 1,
						e.getInstruction().getKind() == TokenKind.LW ? "i32*" : "i16*") + "\n";
				index++;
				if (e.getInstruction().getKind() == TokenKind.LHU) {
					type = "i16*";
				} else {
					type = "i32*";
				}
			}
			dest = ((PrimaryExpression) ((UnaryExpression) e.getE1()).getExpression()).getInstruction().getText();
			res += LLVMcodeGenerator.loadStmt(index, type, index - 1);
			insert(dest);
			break;

		case LUI:
			e.getE2().accept(this);
			int ui = Integer.parseInt(e.getE2().getTranslation());
			if (e.getType() == Type.POINTER) {
				// Global address pointed to in disassembly.
				int address = (int) (ui * Math.pow(2, 16));
				res += "%" + index + " = getelementptr inbounds [" + dataOffset
						+ " x i8]* @global, i32 0, i32 " + (address - Translator.dataSegmentStart);
			} else {
				res += "%" + index + " = shl i32 " + ui + ", 16";
			}
			String reg = ((PrimaryExpression) ((UnaryExpression) e.getE1()).getExpression()).getInstruction().getText();
			insert(reg);
			break;

		case LWR:
		case LWL:
			// Get destination register's local variable.
			e.getE1().accept(this);
			arg = e.getE1().getTranslation();

			// Handle memory offset.
			e.getE2().accept(this);
			res += e.getE2().getTranslation();

			// Get the aligned offset.
			offset = Integer.parseInt(e.getE2().getInstruction().getText());
			if (e.getInstruction().getKind() == TokenKind.LWR) {
				offset++;
			} else {
				offset--;
			}
			offsetAligned = offset - (offset % 4);
			res = res.substring(0, res.lastIndexOf(" ") + 1) + offsetAligned + "\n";

			// Cast
			res += LLVMcodeGenerator.castStmt(index, "i8*", index - 1, "i32*") + "\n";
			index++;

			// Load statement.
			res += LLVMcodeGenerator.loadStmt(index, "i32*", index - 1) + "\n";
			// Save index of load statement for subsequent calculation.
			arg1 = index;
			index++;

			String regMask = "";
			shiftOffset = "";
			int shiftIndex = index;
			// Calculate value. Mask.
			if (e.getInstruction().getKind() == TokenKind.LWR) {
				// LWR
				shiftOffset += Integer.toHexString((3 - offset % 4) * 8);
				res += LLVMcodeGenerator.shiftRightStmt(index++, "i32", "" + arg1, shiftOffset) + "\n";
				switch (offset % 4) {
				// register and memory mask.
				case 0:
					regMask += "4294967040";
					break;
				case 1:
					regMask += "4294901760";
					break;
				case 2:
					regMask += "4278190080";
					break;
				case 3:
					regMask += "0";
					break;
				default:
					break;
				}
			} else {
				// LWL
				shiftOffset += Integer.toHexString((offset % 4) * 8);
				res += LLVMcodeGenerator.shiftLeftStmt(index++, "i32", "" + arg1, shiftOffset) + "\n";
				switch (offset % 4) {
				case 0:
					regMask += "0";
					break;
				case 1:
					regMask += "255";
					break;
				case 2:
					regMask += "65535";
					break;
				case 3:
					regMask += "16777215";
					break;
				default:
					break;
				}
			}
			String tmp = "";
			// If register was not written yet, fake load zero.
			if (arg.equals("null")) {
				tmp = LLVMcodeGenerator.loadGlobalStmt(index++, "zero") + "\n";
				// Print Fake load
				printFakeLoad(currentLabelStmt.getName(), "zero");
				tmp += "%" + index + " = and i32 %" + (index - 1) + ", " + regMask + "\n";
			} else {
				tmp = LLVMcodeGenerator.andStmt(index, "i32", arg, regMask) + "\n";
			}
			index++;
			res += tmp;
			res += LLVMcodeGenerator.orStmtReg(index, "i32", shiftIndex, index - 1);
			dest = ((PrimaryExpression) ((UnaryExpression) e.getE1()).getExpression()).getInstruction().getText();
			insert(dest);

			break;

		case SWR:
		case SWL:
			// Get source register's local variable.
			e.getE1().accept(this);
			arg = e.getE1().getTranslation();

			// Handle memory offset.
			e.getE2().accept(this);
			res += e.getE2().getTranslation();

			// Get aligned offset.
			offset = Integer.parseInt(e.getE2().getInstruction().getText());
			// Offset in/decrement by one. cause of SimpleScalar semantics.
			if (e.getInstruction().getKind() == TokenKind.SWR) {
				offset++;
			} else {
				offset--;
			}
			offsetAligned = offset - (offset % 4);
			res = res.substring(0, res.lastIndexOf(" ") + 1) + offsetAligned + "\n";

			// Cast
			res += LLVMcodeGenerator.castStmt(index, "i8*", index - 1, "i32*") + "\n";
			index++;

			// Load statement.
			res += LLVMcodeGenerator.loadStmt(index, "i32*", index - 1) + "\n";
			printFakeLoad(currentLabelStmt.getName(), "%" + (index - 1));
			// Save index of load statement for subsequent calculation.
			arg1 = index;
			index++;

			String memoryMask = "";
			shiftOffset = "";
			shiftIndex = index;
			// Calculate value. Mask.
			if (e.getInstruction().getKind() == TokenKind.SWR) {
				// SWR
				shiftOffset += Integer.toHexString((3 - offset % 4) * 8);
				res += LLVMcodeGenerator.shiftLeftStmt(index++, "i32", "" + arg, shiftOffset) + "\n";

				switch (offset % 4) {
				// register and memory mask.
				case 0:
					memoryMask += "16777215";
					break;
				case 1:
					memoryMask += "65535";
					break;
				case 2:
					memoryMask += "255";
					break;
				case 3:
					memoryMask += "0";
					break;
				default:
					break;
				}
			} else {
				// SWL
				shiftOffset += Integer.toHexString((offset % 4) * 8);
				res += LLVMcodeGenerator.shiftRightStmt(index++, "i32", "" + arg, shiftOffset) + "\n";

				switch (offset % 4) {
				case 0:
					memoryMask += "0";
					break;
				case 1:
					memoryMask += "4278190080";
					break;
				case 2:
					memoryMask += "4294901760";
					break;
				case 3:
					memoryMask += "4294967040";
					break;
				default:
					break;
				}
			}

			res += LLVMcodeGenerator.andStmt(index++, "i32", arg1 + "", memoryMask) + "\n";
			res += LLVMcodeGenerator.orStmtReg(index, "i32", shiftIndex, index - 1) + "\n";
			index++;
			res += LLVMcodeGenerator.storeStmt(index - 1, "i32", index - 5);
			break;

		case MULT:
			e.getE1().accept(this);
			String fac1 = e.getE1().getTranslation();
			e.getE2().accept(this);
			String fac2 = e.getE2().getTranslation();
			// Zeroextent both factors to i64.
			res += LLVMcodeGenerator.zExtStmt(index, e.getE1().getType().getText(), fac1, "i64") + "\n";
			fac1 = "" + index++;
			res += LLVMcodeGenerator.zExtStmt(index, e.getE2().getType().getText(), fac2, "i64") + "\n";
			fac2 = "" + index++;

			// Get multiplication statement.
			res += LLVMcodeGenerator.mulStmt(index++, "i64", fac1, fac2) + "\n";

			// Trunc to i32 to get lower part.
			res += LLVMcodeGenerator.truncStmt(index, "i64", "" + (index - 1), "i32") + "\n";
			index++;
			res += LLVMcodeGenerator.storeToGlobalStmt(index - 1, Type.INTEGER.getText(), "@low") + "\n";
			printFakeLoad(currentLabelStmt.getName(), "low");
			
			// Shift right by 32 to get higher part.
			res += LLVMcodeGenerator.shiftRightStmt(index, "i64", index - 2 + "", "20") + "\n";
			index++;
			// Trunc to i32.
			res += LLVMcodeGenerator.truncStmt(index, "i64", "" + (index - 1), "i32") + "\n";
			index++;
			res += LLVMcodeGenerator.storeToGlobalStmt(index - 1, Type.INTEGER.getText(), "@high");
			printFakeLoad(currentLabelStmt.getName(), "high");
			break;

		default:
			break;
		}

		e.setTranslation(res);
	}

	@Override
	public void visit(PrimaryExpression e) {
		String res = "";

		switch (e.getInstruction().getKind()) {

		case NUMBER:
		case HEXA:
			res = e.getInstruction().getText();
			break;

		case ADDRESS:
			if (e.isFunctionCall()) {
				res = e.getLabel().getText();
			} else {
				res = e.getInstruction().getText();
			}
			break;

		default:
			break;
		}

		e.setTranslation(res);
	}

	@Override
	public void visit(TernaryExpression e) {
		// Checks whether the global pointer is incremented.
		// In this case a print is expected to follow.
		if (e.getE2().getRegister() == 28 || e.getE3().getRegister() == 28) {
			e.setTranslation("; $gp iincrement was skipped.");
			return;
		}
		e.getE2().accept(this);
		e.getE3().accept(this);
		String arg1 = "";
		String arg2 = e.getE2().getTranslation();
		String arg3 = e.getE3().getTranslation();
		Type t1 = e.getE2().getType();
		Type t2 = e.getE3().getType();
		Type tmax = Type.maxBitSize(t1, t2);
		String res = "";
		switch (e.getInstruction().getKind()) {
		case ADDIU:
			if (e.getType() == Type.POINTER) {
				res += LLVMcodeGenerator.getElementPtr(index, "i8*", arg2, arg3, e.getE3().getType().getText());
			} else {
				res += LLVMcodeGenerator.addStmt(index, tmax.getText(), arg2, arg3);
			}
			insert(e.getE1().getRegister());
			break;

		case ADDU:
			if (e.getType() == Type.POINTER) {
				Type e3 = e.getE3().getType();
				Type e2 = e.getE2().getType();
				String offsetIndex;
				if (e3.isValue()) {
					offsetIndex = arg3;
					if (e3 != Type.INTEGER && !arg3.equals("-10")) {
						res += LLVMcodeGenerator.zExtStmt(index, e3.getText(), arg3, Type.INTEGER.getText()) + "\n";
						offsetIndex = "" + index;
						index++;
					}
					res += LLVMcodeGenerator.getElementPtrReg(index, "i8*", arg2,
							arg3.equals("-10") ? "0" : offsetIndex, Type.INTEGER.getText());
				} else {
					offsetIndex = arg2;
					if (e2 != Type.INTEGER && !arg2.equals("-10")) {
						res += LLVMcodeGenerator.zExtStmt(index, e2.getText(), arg2, Type.INTEGER.getText()) + "\n";
						offsetIndex = "" + index;
						index++;
					}
					res += LLVMcodeGenerator.getElementPtrReg(index, "i8*", arg3,
							arg2.equals("-10") ? "0" : offsetIndex, Type.INTEGER.getText());
				}

			} else {
				if (t1 != t2 && t1 != Type.VALUE && t2 != Type.VALUE) {
					if (t1.ordinal() < t2.ordinal()) {
						res += LLVMcodeGenerator.zExtStmt(index, t1.getText(), arg2, t2.getText()) + "\n";
						arg2 = "" + index;
					} else {
						res += LLVMcodeGenerator.zExtStmt(index, t2.getText(), arg3, t1.getText()) + "\n";
						arg3 = "" + index;
					}
					index++;
				}
				res += LLVMcodeGenerator.addStmtReg(index, tmax.getText(), arg2, arg3);
			}
			insert(e.getE1().getRegister());
			break;

		case SLL:
			// Is a zero extend needed?
			boolean zextNeeded = false;
			if (e.getE2().getType() != Type.INTEGER) {
				zextNeeded = true;
				res += LLVMcodeGenerator.zExtStmt(index, e.getE2().getType().getText(), arg2, Type.INTEGER.getText())
						+ "\n";
				index++;
			}
			res += LLVMcodeGenerator.shiftLeftStmt(index, Type.INTEGER.getText(), zextNeeded ? "" + (index - 1) : arg2,
					arg3);
			insert(e.getE1().getRegister());
			break;

		case SRL:
			res += LLVMcodeGenerator.shiftRightStmt(index, tmax.getText(), arg2, arg3);
			insert(e.getE1().getRegister());
			break;

		case SLTI:
			res += "%" + index + " = icmp slt " + tmax.getText() + " %" + arg2 + ", " + arg3;
			insert(e.getE1().getRegister());
			break;

		case SLT:
			if (t1 != t2) {
				if (t1.ordinal() < t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index, t1.getText(), arg2, t2.getText()) + "\n";
				} else {
					res += LLVMcodeGenerator.zExtStmt(index, t2.getText(), arg3, t1.getText()) + "\n";
				}
				index++;
			}
			res += "%" + index + " = icmp slt " + tmax.getText() + " %" + arg2 + ", %" + arg3;
			insert(e.getE1().getRegister());
			break;

		case BEQ:
		case BNE:
			String op = e.getInstruction().getKind() == TokenKind.BEQ ? "eq" : "ne";
			e.getE1().accept(this);
			arg1 = e.getE1().getTranslation();
			if (arg2.equals("-10") || arg1.equals("-10")) {
				res += "%" + index + " = icmp " + op + " "
						+ (arg1.equals("-10") ? e.getE2().getType().getText() : e.getE1().getType().getText()) + " %"
						+ (arg1.equals("-10") ? arg2 : arg1) + ", 0\n";
			} else {
				t1 = e.getE1().getType();
				t2 = e.getE2().getType();
				tmax = Type.maxBitSize(t1, t2);
				boolean pointer = t1.isValue() && t2.isValue();

				if (pointer && t1.ordinal() < t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index++, t1.getText(), arg1, tmax.getText()) + "\n";
					arg1 = "" + (index - 1);
				} else if (pointer && t1.ordinal() > t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index++, t2.getText(), arg2, tmax.getText()) + "\n";
					arg2 = "" + (index - 1);
				}

				res += "%" + index + " = icmp " + op + " " + tmax.getText() + " %" + arg1 + ", %" + arg2 + "\n";
			}
			index++;
			res += "br i1 %" + (index - 1) + ", label %label-" + getLabelForAddress(Integer.parseInt(arg3, 16))
					+ ", label %label-" + getLabelForAddress(currentAddress + 0x8);
			break;

		case OR:
			if (t1 != t2) {
				if (t1.ordinal() < t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index, t1.getText(), arg2, t2.getText()) + "\n";
					arg2 = "" + index;
				} else {
					res += LLVMcodeGenerator.zExtStmt(index, t2.getText(), arg3, t1.getText()) + "\n";
					arg3 = "" + index;
				}
				index++;
			}
			res += LLVMcodeGenerator.orStmtReg(index, tmax.getText(), arg2, arg3);
			insert(e.getE1().getRegister());
			break;

		case XOR:
			if (t1 != t2) {
				if (t1.ordinal() < t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index, t1.getText(), arg2, t2.getText()) + "\n";
					arg2 = "" + index;
				} else {
					res += LLVMcodeGenerator.zExtStmt(index, t2.getText(), arg3, t1.getText()) + "\n";
					arg3 = "" + index;
				}
				index++;
			}
			res += LLVMcodeGenerator.xorStmtReg(index, tmax.getText(), arg2, arg3);
			insert(e.getE1().getRegister());
			break;

		case ANDI:
			res += LLVMcodeGenerator.andStmt(index, tmax.getText(), arg2, arg3);
			insert(e.getE1().getRegister());
			break;

		case DIV:
			int divisor = Integer.parseInt(arg3);
			int dividend = Integer.parseInt(arg2);
			if (t1 != Type.INTEGER) {
				dividend = index;
				res += LLVMcodeGenerator.zExtStmt(index++, t1.getText(), arg2, Type.INTEGER.getText()) + "\n";
			}
			if (t2 != Type.INTEGER) {
				divisor = index;
				res += LLVMcodeGenerator.zExtStmt(index++, t2.getText(), arg3, Type.INTEGER.getText()) + "\n";
			}
			res += LLVMcodeGenerator.divStmt(index++, tmax.getText(), "" + dividend, "" + divisor) + "\n";
			res += LLVMcodeGenerator.storeToGlobalStmt(index - 1, Type.INTEGER.getText(), "@low") + "\n";
			printFakeLoad(currentLabelStmt.getName(), "low");
			res += LLVMcodeGenerator.remStmt(index++, tmax.getText(), "" + dividend, "" + divisor) + "\n";
			res += LLVMcodeGenerator.storeToGlobalStmt(index - 1, Type.INTEGER.getText(), "@high");
			printFakeLoad(currentLabelStmt.getName(), "high");
			break;

		case SUBU:
			if (t1 != t2) {
				if (t1.ordinal() < t2.ordinal()) {
					res += LLVMcodeGenerator.zExtStmt(index, t1.getText(), arg2, t2.getText()) + "\n";
					arg2 = "" + index;
				} else {
					res += LLVMcodeGenerator.zExtStmt(index, t2.getText(), arg3, t1.getText()) + "\n";
					arg3 = "" + index;
				}
				index++;
			}
			res += LLVMcodeGenerator.subStmt(index, tmax.getText(), arg2, arg3);
			insert(e.getE1().getRegister());
			break;

		default:
			break;
		}
		e.setTranslation(res);

	}

	@Override
	public void visit(UnaryExpression e) {
		String res = "", arg = "";

		switch (e.getInstruction().getKind()) {
		case JAL:
			e.getExpression().accept(this);
			arg = e.getExpression().getTranslation();
			// Check if the given address to jump to is in range in concern to
			// ignore library jumps.
			String functionName = ((PrimaryExpression) e.getExpression()).getLabel().getText();
			if (functionName.contains("main")) {
				break;
			}
			// Checks for a printf instruction.
			if (functionName.equals("printf")) {
				String func = "call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i8 %"
						+ getLocalVar(5, currentLabelBlock.getLabelNum()) + ") nounwind";
				res += "%" + index + " = " + func;
				index++;
				break;
			}

			// Function parameters from $4 to $7.
			int maxNumOfArgs = 0, offset = 4;
			try {
				maxNumOfArgs = functionParams.get(functionName).length;
			} catch (Exception e2) {
				System.err
						.println("The called function should have parameters: " + Integer.toHexString(currentAddress));
			}
			String parameters = "(";
			for (int i = 0; i < maxNumOfArgs; i++) {
				// Get the parameter.
				Integer reg = getLocalVar(i + offset, currentLabelBlock.getLabelNum());
				if (reg == null) {
					reg = findVirtualRegister(i + offset, currentLabelBlock);
				}
				Type type = functionParams.get(functionName)[i];
				parameters += type.getText() + " %" + reg + ", ";
			}
			parameters = parameters.substring(0, parameters.length() - 2) + ")";
			Integer var = getLocalVar(29, currentLabelBlock.getLabelNum());
			if (var == null) {
				// Single predecessor.
				int pred = currentLabelBlock.getPredecessors(29).iterator().next();
				var = getLocalVar(29, pred);
			}
			// Passes the correct stack offset to the sub function.
			res += "store i8* %" + var + ", i8** @stack_" + arg + "\n";
			printFakeLoad(currentLabelStmt.getName(), "stack_" + arg);

			Type returnType = returnTypes.get(functionName);
			switch (returnType) {
			case VOID:
				res += "call void @" + arg + parameters + " nounwind";
				break;

			case INTEGER:
				res += "%" + index + " = call i32 @" + arg + parameters + " nounwind";
				insert(2);
				break;

			case BYTE:
				res += "%" + index + " = call i8 @" + arg + parameters + " nounwind";
				insert(2);
				break;

			default:
				break;
			}
			break;

		case J:
			e.getExpression().accept(this);
			arg = e.getExpression().getTranslation();
			res += "br label %label-" + getLabelForAddress(Integer.parseInt(arg, 16));
			break;

		case JR:
			res += "br label %return\n\n";
			res += "return:\n";
			Type retType = currentLabelStmt.getReturnType();
			if (retType != Type.VOID) {
				var = getLocalVar(2, currentLabelBlock.getLabelNum());
				if (var == null) {
					// Single predecessor.
					int pred = currentLabelBlock.getPredecessors(2).iterator().next();
					var = getLocalVar(2, pred);
				}

				String t = "";
				switch (retType) {
				case BYTE:
					t = "i8";
					break;
				case INTEGER:
					t = "i32";
					break;
				default:
					break;
				}

				res += "%retvall = alloca " + t + "\n";
				res += "store " + t + " %" + var + ", " + t + "* %retvall\n";
				res += "%retval = load " + t + "* %retvall\n";
				res += "ret " + t + " %retval";

				printFakeLoad(currentLabelStmt.getName(), "retval");
			} else {
				res += "ret void";
			}

			break;

		case NUMBER:
			e.getExpression().accept(this);
			arg = e.getExpression().getTranslation();
			res += LLVMcodeGenerator.getElementPtr(index, "i8*", arg,
					e.getRegister() == 28 ? "" + (sdataGpOffset - Integer.parseInt(e.getInstruction().getText()))
							: "" + e.getInstruction().getText(),
					"i32");
			index++;
			break;

		case DOLLAR:
			e.getExpression().accept(this);
			arg = e.getExpression().getTranslation();

			int reg = Integer.parseInt(arg);
			Integer localVar = getLocalVar(reg, currentLabelBlock.getLabelNum());
			if (localVar == null) {
				Set<Integer> tmp = currentLabelBlock.getPredecessors(reg);
				if (tmp != null && tmp.size() == 1) {
					// Single predecessor
					localVar = getLocalVar(reg, tmp.iterator().next());
				} else if (ParameterPassingVisitor.isParameterRegister(reg)) {
					// Parameter registers are mapped to the first block of the
					// @LabelStatement
					// if there were not stored somewhere else.
					localVar = getLocalVar(reg, 0);
				} else if (arg.equals("0")) {
					// Encode 0 as -10 to distinguish between match and digit 0.
					localVar = -10;
				}
			}
			res += localVar;

			break;

		case MINUS:
			e.getExpression().accept(this);
			arg = e.getExpression().getTranslation();
			if (e.getExpression() instanceof UnaryExpression) {
				// Negative offset.
				String offset1 = e.getExpression().getInstruction().getText();
				if (e.getExpression().getRegister() == 28) {
					offset1 = "" + (sdataGpOffset - Integer.parseInt(offset1));
				}
				String o = e.getExpression().getRegister() == 28 ? " " + offset1 : " -" + offset1;
				res = arg = arg.substring(0, arg.lastIndexOf(offset1) - 1) + o;
			} else {
				res += "-" + arg;
			}
			break;

		case MFLO:
			res += LLVMcodeGenerator.loadGlobalStmt(index, "low");
			printFakeLoad(currentLabelStmt.getName(), "low");
			insert(e.getExpression().getRegister());
			break;
		case MFHI:
			res += LLVMcodeGenerator.loadGlobalStmt(index, "high");
			insert(e.getExpression().getRegister());
			printFakeLoad(currentLabelStmt.getName(), "high");
			break;

		default:
			break;
		}
		e.setTranslation(res);
	}

	@Override
	public void visit(EmptyStatement s) {
		s.setTranslation("");
	}

	@Override
	public void visit(ExpressionStatement s) {
		// Update the current statement's address.
		// phiInstructions = new String[2];
		currentAddress = s.getAddress();
//		currentInstruction = s.getExpression().getInstruction().getKind();
		try {
			s.getExpression().accept(this);
		} catch (Exception e) {
			System.err.println(Integer.toHexString(s.getAddress()));
			throw e;
		}
		String translation = "";
		// for (int i = 0; i < phiInstructions.length; i++) {
		// if (phiInstructions[i] != null) {
		// translation += phiInstructions[i] + "\n";
		// }
		// }
		// debugging stmt print.
		translation += s.getExpression().getTranslation() + "   ;" + s.toString();
		s.setTranslation(translation);
		previousInstruction = s.getExpression().getInstruction().getKind();
	}

	@Override
	public void visit(LabelStatement labelStatement) {
		currentLabelStmt = labelStatement;
//		visitedBlocks = new TreeSet<Integer>();
		index = 0;
		localVars = new HashMap<Point, Integer>();
		phiInstructionVars = new HashMap<Point, Integer>();
		currentLabelBlock = labelStatement.getBlockStmts().getFirst();
		String parameter = "";
		String parameterAllocation = "";
		Type[] params = labelStatement.getParameters();
		for (int i = 0; i < params.length; i++) {
			if (params[i] != null) {
				// Convert numbers to chars.
				String c = String.valueOf((char) (i + 97));
				String type = params[i] == Type.POINTER || params[i] == Type.UNKNOWN ? "i8*" : "i32";
				parameter += type + " %" + c + ", ";
				parameterAllocation += "%" + c + "_addr = alloca " + type + "\n";
				parameterAllocation += "store " + type + " %" + c + ", " + type + "* %" + c + "_addr\n";
				printFakeLoad(currentLabelStmt.getName(), c + "_addr");
				parameterAllocation += "%" + index + " = load " + type + "* %" + c + "_addr\n";
				printFakeLoad(currentLabelStmt.getName(), c + "_addr");
				insert(i + 4);
			}
		}
		if (parameter.length() > 1)
			parameter = parameter.substring(0, parameter.length() - 2);

		String translation = "";
		String name = labelStatement.getName();
		String returnType = "";
		switch (labelStatement.getReturnType()) {
		case BYTE:
			returnType = "i8";
			break;
		case VOID:
			returnType = "void";
			break;
		case INTEGER:
			returnType = "i32";
			break;
		default:
			break;
		}
		translation += "define " + returnType + " @" + name + "(" + parameter + ") nounwind {\n";
		translation += "entry:\n";

		translation += parameterAllocation;

		if (name.equals("main")) {
			translation += "%" + index + " = getelementptr inbounds [" + (stackOffset) + " x i8]* @stack, i32 0, i32 "
					+ (stackOffset - 1);
		} else {
			translation += "%" + index + " = load i8** @stack_" + name;
			printFakeLoad(currentLabelStmt.getName(), "stack_" + name);
		}
		labelStatement.setTranslation(translation);
		writer.println(translation);
		insert(29);
		// sdata pointer.
		if (sdataOffset != -1) {
			String sdata = "%" + index + " = getelementptr inbounds [" + (sdataOffset) + " x i8]* @sdata, i32 0, i32 0";
			writer.println(sdata);
			insert(28);
		}

		for (LabelBlockStatement stmt : labelStatement.getBlockStmts()) {
			stmt.accept(this);
		}
		// Second run is required because of PHI instructions caused by back
		// jump loops.
		// In this case the necessary local variables are not set yet. Therefore
		// they are inserted in the second run.
		for (LabelBlockStatement stmt : labelStatement.getBlockStmts()) {
			translation = stmt.getTranslation();
			while (translation.contains("%null")) {
				Point regAndBlock = stmt.getBackJumpCases().removeFirst();
				translation = translation.replaceFirst("%null", "%" + phiInstructionVars.get(regAndBlock));
			}
			writer.println(translation);

			for (ExpressionStatement expStmt : stmt.getExpStmts()) {
				translation = expStmt.getTranslation();
				writer.println(translation);
			}
		}

		writer.println("}\n");
		previousInstruction = null;
	}

	@Override
	public void visit(LabelBlockStatement blockStatement) {
		currentLabelBlock = blockStatement;
		String translation = "";
		// Handle first instruction
		if (previousInstruction != null) {
			switch (previousInstruction) {
			case BNE:
			case BEQ:
			case J:
				// case BREAK:
				break;

			default:
				translation += "br label %label-" + blockStatement.getLabelNum() + "\n";
				break;
			}
		}
		// Skip label insertion for the entry block.
		if (blockStatement.getLabelNum() != 0) {
			translation += "\nlabel-" + blockStatement.getLabelNum() + ":";
		}

		// Handle phi instructions.
		for (Integer reg : blockStatement.getPredecessorMap().keySet()) {
			// The predecessors of the current block which
			// for PHI node have to be considered.
			Set<Integer> preds = blockStatement.getPredecessors(reg);
			if (preds != null && preds.size() > 1) {
				// Insert phi instruction
				String args = "";
				for (Iterator<Integer> iterator = preds.iterator(); iterator.hasNext();) {
					Integer label = (Integer) iterator.next();

					// Check if the direct predecessor changed the registers
					// content.
					Integer localVar = getLocalVar(reg, label);
					if (localVar == null && currentLabelBlock.getLabelNum() != label) {
						// Register is mapped to a predecessor.
						LabelBlockStatement block = currentLabelStmt.getBlockStmtForLabelNum(label);
						
						boolean backEdge = false;
						for (DefaultEdge e : currentLabelStmt.getCFG().outgoingEdgesOf(block)) {
							if (currentLabelStmt.getBackEdges().contains(e)) {
								backEdge = true;
								break;
							}
						}
						if (!backEdge) {
							localVar = findVirtualRegister(reg, block);
						}
						
					}

					if (localVar == null) {
						// Local variable is not set yet, because of a back jump
						// loop.
						phiInstructionVars.put(new Point(reg, label), -1);
						blockStatement.addBackJump(new Point(reg, label));
					}
					args += "[ %" + localVar + " , %label-" + label + " ]";
					if (iterator.hasNext()) {
						args += ", ";
					}
				}
				args = args.replace("label-0", "entry");
				Type type = blockStatement.getPhiType(reg);
				translation += "\n%" + index + " = phi "
						+ (type == Type.JUMP ? currentLabelStmt.getReturnType().getText() : type.getText()) + " "
						+ args;
				// blockStatement.addPhiInstruction(instruction);
				insert(reg);
			}
		}
		blockStatement.setTranslation(translation);

		for (ExpressionStatement expStmt : blockStatement.getExpStmts()) {
			expStmt.accept(this);
		}
	}

	/**
	 * Finds the virtual register mapped to a predecessor of the given block.
	 * 
	 * @param block
	 * @param register
	 * @param hits 
	 * @return virtual register
	 */
	private Integer findVirtualRegister(int register, LabelBlockStatement block) {
		Integer res = null;
		Set<DefaultEdge> incEdges = currentLabelStmt.getCFG().incomingEdgesOf(block);
		for (DefaultEdge defaultEdge : incEdges) {
			if (currentLabelStmt.isBackEdge(defaultEdge)) {
				continue;
			}
			LabelBlockStatement pred = currentLabelStmt.getCFG().getEdgeSource(defaultEdge);
			res = getLocalVar(register, pred.getLabelNum());
			if (res == null) {
				res = findVirtualRegister(register, pred);
			}
		}
		return res;
	}

	/**
	 * Maps a register with the correct predecessor label to the current local
	 * variable.
	 * 
	 * @param register
	 */
	private void insert(int register) {
		Point p = new Point(register, currentLabelBlock.getLabelNum());
		localVars.put(p, index++);
		if (phiInstructionVars.containsKey(p)) {
			phiInstructionVars.put(p, index - 1);
		}

	}

	private void insert(String register) {
		try {
			insert(Integer.parseInt(register));
		} catch (Exception e) {
			System.err.println(
					"The register was not found in the localVar map at address " + Integer.toHexString(currentAddress));
		}

	}

	/**
	 * Returns the local variable..
	 */
	private Integer getLocalVar(int register, int labelBlock) {
		Integer localVar = localVars.get(new Point(register, labelBlock));

		return localVar;
	}

	/**
	 * Returns the target label number for a given address. If no label is
	 * found, -1 is returned.
	 * 
	 * @param address
	 * @return
	 */
	private int getLabelForAddress(int address) {
		int res = -1;
		for (LabelBlockStatement block : currentLabelStmt.getBlockStmts()) {
			if (block.getAddress() == address) {
				return block.getLabelNum();
			}
		}
		return res;
	}

	@Override
	public void visit(AtomicExpression atomicExpression) {
		String res = "";
		if (atomicExpression.getInstruction().getKind() == TokenKind.BREAK) {
			res = "call void @exit(i32 -1) noreturn nounwind \nunreachable";
			index++;
		}
		atomicExpression.setTranslation(res);
	}

	private void printFakeLoad(String functionName, String var) {
		fakeLoadWriter.println("func:" + functionName + " var:" + var);
	}
}
