package semantics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.TreeMap;
import java.util.TreeSet;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.traverse.DepthFirstIterator;

import main.Visitor;
import parser.TokenKind;
import semantics.expression.AtomicExpression;
import semantics.expression.BinaryExpression;
import semantics.expression.Expression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.EmptyStatement;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

public class TypeVisitor implements Visitor {

	// private Set<Integer> pointers;
	// private Stack<Set<Integer>> pointerStack;

	/**
	 * Maps all functions by its name to all registers potentially passed by the
	 * caller. Updated before each JAL instruction.
	 */
	private HashMap<String, Type[]> potentiallyPassedParams;

	/**
	 * All statements that use registers containing an upper immediate value.
	 */
	private Map<Integer, LinkedList<ExpressionStatement>> uiStmts;
	private Stack<Map<Integer, LinkedList<ExpressionStatement>>> uiStmtStack;

	/**
	 * The registers which contain an upper immediate.
	 */
	private Map<Integer, Set<Integer>> uiRegs;
	private Stack<Map<Integer, Set<Integer>>> uiRegStack;

	/**
	 * The current @ExpressionStatement.
	 */
	private ExpressionStatement currentStmt;

	/**
	 * A set of all already visited @LabelBlockStatements.
	 */
	private TreeSet<Integer> alreadyVisited;

	/**
	 * The current instruction's branch target.
	 */
	private int branchAddress;

	/**
	 * Register to type mapping.
	 */
	private Map<Integer, Type> registerTypes;
	private Stack<Map<Integer, Type>> registerTypeStack;

	/**
	 * Visits every instruction to determine its @Type.
	 */
	public TypeVisitor() {
		potentiallyPassedParams = new HashMap<String, Type[]>();

	}

	@Override
	public void visit(BinaryExpression e) {
		TokenKind t = e.getInstruction().getKind();
		e.getE1().accept(this);
		e.getE2().accept(this);

		int register;
		UnaryExpression regExp;

		switch (t) {
		case LW:
		case LBU:
		case LHU:
		case LWR:
		case LWL:
		case SWL:
		case SWR:
		case SW:
		case SB:
			e.setType(Type.POINTER);
			// Assumption: When the address is not pointing to the stack it's
			// pointing to the global memory.
			regExp = ((UnaryExpression) ((UnaryExpression) e.getE2()).getExpression());
			if (e.getE2().getInstruction().getKind() == TokenKind.MINUS) {
				regExp = (UnaryExpression) regExp.getExpression();
			}
			regExp.setType(Type.POINTER);
			register = regExp.getRegister();
			registerTypes.put(register, Type.POINTER);

			int uiReg = isUIReg(register);
			if (uiReg != -1) {
				// Backtrack all instructions that used LUI address and update
				// their type to POINTER.
				Iterator<ExpressionStatement> iterator = uiStmts.get(uiReg).descendingIterator();
				while (iterator.hasNext()) {
					ExpressionStatement expStmt = (ExpressionStatement) iterator.next();
					// Update expression to type POINTER
					Expression tmp = expStmt.getExpression();
					tmp.setType(Type.POINTER);
					int resultReg = ExpressionStatement.getResultRegister(tmp);
					if (registerTypes.get(resultReg) == Type.UNKNOWN) {
						registerTypes.put(resultReg, Type.POINTER);
					}
					switch (tmp.getInstruction().getKind()) {
					case ADDU:
					case ADDIU:
						((TernaryExpression) tmp).getE1().setType(Type.POINTER);
						break;
					case LUI:
						((BinaryExpression) tmp).getE1().setType(Type.POINTER);
					default:
						break;
					}
					for (UnaryExpression exp : ExpressionStatement.getLoadRegisters(tmp).values()) {
						int loadReg = exp.getRegister();
						if (exp.getType() == Type.UNKNOWN) {
							exp.setType(Type.POINTER);
							if (registerTypes.get(loadReg) == Type.UNKNOWN) {
								registerTypes.put(loadReg, Type.POINTER);
							}
						}
					}
				}
				uiRegs.remove(uiReg);
				uiStmts.remove(uiReg);
			}

			register = ((UnaryExpression) e.getE1()).getRegister();
			if (t.isLoadInstruction()) {
				removeUIReg(register);
				switch (t) {
				case LW:
					registerTypes.put(register, Type.INTEGER);
					e.getE1().setType(Type.INTEGER);
					break;
				case LHU:
					registerTypes.put(register, Type.SHORT);
					e.getE1().setType(Type.SHORT);
					break;
				case LBU:
					registerTypes.put(register, Type.BYTE);
					e.getE1().setType(Type.BYTE);
					break;

				default:
					break;
				}
			} else {
				if (registerTypes.containsKey(register)) {
					e.getE1().setType(registerTypes.get(register));
				}
			}
			break;

		case LUI:
			register = ((UnaryExpression) e.getE1()).getRegister();
			e.setType(Type.UNKNOWN);
			e.getE1().setType(Type.UNKNOWN);
			registerTypes.put(register, Type.UNKNOWN);
			uiStmts.put(register, new LinkedList<ExpressionStatement>());
			uiStmts.get(register).add(currentStmt);
			uiRegs.put(register, new TreeSet<Integer>());
			uiRegs.get(register).add(register);
			break;

		case MULT:
			Type type;
			register = ((UnaryExpression) e.getE1()).getRegister();
			type = registerTypes.get(register);
			e.getE1().setType(type != null ? type : Type.INTEGER);
			register = ((UnaryExpression) e.getE2()).getRegister();
			type = registerTypes.get(register);
			e.getE2().setType(type != null ? type : Type.INTEGER);

			break;
		default:
			break;
		}
	}

	/**
	 * Checks the register contains an address loaded by a LUI instruction.
	 * 
	 * @param register
	 * @return The register that was initially assigned by the LUI instruction.
	 *         -1 otherwise.
	 */
	private int isUIReg(int register) {
		for (Integer ui : uiRegs.keySet()) {
			if (uiRegs.get(ui).contains(register)) {
				return ui;
			}
		}
		return -1;
	}

	/**
	 * Called when the register is not containing an address.
	 * 
	 * @param destRegister
	 */
	private void removeUIReg(int destRegister) {
		for (Integer integer : uiRegs.keySet()) {
			if (uiRegs.get(integer).remove(destRegister)) {
				if (uiRegs.get(integer).isEmpty()) {
					// for (ExpressionStatement stmt : uiStmts.get(integer)) {
					// Expression e = stmt.getExpression();
					// e.setAllTypesToValue();
					// }
					System.err.println("adflamgklfm");
					uiRegs.remove(integer);
				}
			}
		}

		for (Set<Integer> ui : uiRegs.values()) {
			ui.remove(destRegister);
		}
	}

	@Override
	public void visit(PrimaryExpression e) {
		e.setType(Type.VALUE);
		if (e.isRegister()) {
			Type t = registerTypes.get(Integer.parseInt(e.getInstruction().getText()));
			if (t == Type.POINTER) {
				e.setType(Type.POINTER);
			}
		}
	}

	@Override
	public void visit(TernaryExpression e) {
		e.getE1().accept(this);
		e.getE2().accept(this);
		e.getE3().accept(this);
		e.setType(Type.VALUE);

		int destRegister = ((UnaryExpression) e.getE1()).getRegister();
		int loadReg1 = ((UnaryExpression) e.getE2()).getRegister();
		int loadReg2 = e.getE3().getRegister();

		e.getE2().setType(registerTypes.get(loadReg1));
		if (loadReg2 != -1) {
			e.getE3().setType(registerTypes.get(loadReg2));
		}

		if (e.getInstruction().getKind().isBranchInstruction()) {
			branchAddress = Integer.parseInt(((PrimaryExpression) e.getE3()).getInstruction().getText(), 16);
			e.getE1().setType(registerTypes.get(destRegister));
		} else {
			// Check upper immediate registers.
			int uiReg = isUIReg(loadReg1);
			int uiReg2 = isUIReg(loadReg2);
			if (uiReg != -1) {
				uiStmts.get(uiReg).add(currentStmt);
				uiRegs.get(uiReg).add(destRegister);
				e.getE1().setType(Type.UNKNOWN);
			}

			if (uiReg2 != -1) {
				uiStmts.get(uiReg2).add(currentStmt);
				uiRegs.get(uiReg2).add(destRegister);
				e.getE1().setType(Type.UNKNOWN);
			}

			if (uiReg == -1 && uiReg2 == -1) {
				removeUIReg(destRegister);
			}
		}

		if (e.getE3().getType() == Type.POINTER || e.getE2().getType() == Type.POINTER) {
			e.setType(Type.POINTER);
			e.getE1().setType(Type.POINTER);
		} else if (e.getE3().getType() != null && e.getE2().getType() != null && e.getE3().getType().isValue()
				&& e.getE2().getType().isValue()) {
			if (e.getE1().getType() != Type.BIT) {
				e.getE1().setType(Type.maxBitSize(e.getE3().getType(), e.getE2().getType()));
			}
		}

		if (e.getInstruction().getKind().isSetInstruction()) {
			e.getE1().setType(Type.BIT);
		} else if (e.getInstruction().getKind() == TokenKind.SLL) {
			e.getE1().setType(Type.INTEGER);
		}
		// Insert inferred type for all instruction kinds.
		registerTypes.put(destRegister, e.getE1().getType());
	}

	@Override
	public void visit(UnaryExpression e) {
		e.getExpression().accept(this);
		TokenKind t = e.getInstruction().getKind();
		switch (t) {
		case DOLLAR:
			if (e.getExpression().getType() == Type.POINTER) {
				e.setType(Type.POINTER);
			} else {
				e.setType(Type.VALUE);
			}
			break;

		case J:
			branchAddress = Integer.parseInt(e.getExpression().getInstruction().getText(), 16);
		case JR:
			e.setType(Type.JUMP);
			break;

		case JAL:
			// Potentially passed parameters to subfunction. Safe type in case
			// of Type.UNKNOWN
			String subfunction = ((PrimaryExpression) e.getExpression()).getLabel().getText();
			ArrayList<Type> potentiallyPassed = new ArrayList<Type>();
			for (int i = 4; i < 8; i++) {
				if (registerTypes.containsKey(i)) {
					potentiallyPassed.add(registerTypes.get(i));
				}
			}
			Type[] tmp = new Type[potentiallyPassed.size()];
			potentiallyPassedParams.put(subfunction, potentiallyPassed.toArray(tmp));

			break;

		case MINUS:
		case NUMBER:
			e.getExpression().accept(this);
			e.setType(e.getExpression().getType());
			break;

		case MFHI:
		case MFLO:
			e.setType(Type.VALUE);
			e.getExpression().setType(Type.INTEGER);
			registerTypes.put(e.getExpression().getRegister(), Type.INTEGER);
			break;

		default:
			break;
		}
	}

	@Override
	public void visit(EmptyStatement s) {
		return;
	}

	@Override
	public void visit(ExpressionStatement s) {
		currentStmt = s;
		s.getExpression().accept(this);
	}

	@Override
	public void visit(LabelStatement labelStatement) {
		branchAddress = -1;
		alreadyVisited = new TreeSet<Integer>();
		registerTypes = new TreeMap<Integer, Type>();
		registerTypes.put(0, Type.INTEGER);
		registerTypes.put(29, Type.POINTER);
		registerTypeStack = new Stack<>();
		uiStmts = new HashMap<Integer, LinkedList<ExpressionStatement>>();
		uiStmtStack = new Stack<>();
		uiRegs = new HashMap<Integer, Set<Integer>>();
		uiRegStack = new Stack<>();
		Type[] params = labelStatement.getParameters();
		for (int i = 0; i < params.length; i++) {
			if (params[i] == Type.POINTER || params[i] == Type.UNKNOWN) {
				registerTypes.put(i + 4, Type.POINTER);
			} else {
				registerTypes.put(i + 4, params[i]);
			}
		}

		DepthFirstIterator<LabelBlockStatement, DefaultEdge> iter = new DepthFirstIterator<>(labelStatement.getCFG());
		while (iter.hasNext()) {
			LabelBlockStatement stmt = iter.next();
			alreadyVisited.add(stmt.getAddress());
			stmt.accept(this);

			// Saving the current stage if there is more than one successor.
			if (labelStatement.getCFG().outDegreeOf(stmt) > 1 && !alreadyVisited.contains(branchAddress)) {
				pushAll();
			}

			// Reset the stage for subsequent subgraphs
			// if their is no successor.
			if (iter.hasNext()) {
				if (labelStatement.getCFG().outDegreeOf(stmt) == 0
						// Jump to an already encountered block.
						|| alreadyVisited.contains(branchAddress)
						|| (branchAddress != -1 && alreadyVisited.contains(stmt.getAddress() + 8))) {
					popAll();
				}
			}
			branchAddress = -1;
		}

//		 for (LinkedList<ExpressionStatement> es : uiStmts.values()) {
//		 for (ExpressionStatement expressionStatement : es) {
//		 System.err.println("fasmdfamsdfkm");
//		 expressionStatement.getExpression().setAllTypesToValue();
//		 }
//		 }
	}

	@Override
	public void visit(LabelBlockStatement blockStatement) {
		for (ExpressionStatement expStmt : blockStatement.getExpStmts()) {
			expStmt.accept(this);
		}
	}

	@Override
	public void visit(AtomicExpression atomicExpression) {
		atomicExpression.setType(Type.BREAK);
	}

	private void popAll() {
		if (!uiRegStack.isEmpty() && !uiStmtStack.isEmpty()) {
			uiRegs = uiRegStack.pop();
			uiStmts = uiStmtStack.pop();
			registerTypes = registerTypeStack.pop();
		}
	}

	private void pushAll() {
		Map<Integer, Set<Integer>> uiRegs = new HashMap<Integer, Set<Integer>>();
		for (Integer integer : this.uiRegs.keySet()) {
			Set<Integer> values = new TreeSet<Integer>(this.uiRegs.get(integer));
			uiRegs.put(integer.intValue(), values);
		}
		uiRegStack.push(uiRegs);
		HashMap<Integer, LinkedList<ExpressionStatement>> uiStmts = new HashMap<Integer, LinkedList<ExpressionStatement>>();
		for (Integer integer : this.uiStmts.keySet()) {
			LinkedList<ExpressionStatement> values = new LinkedList<ExpressionStatement>(this.uiStmts.get(integer));
			uiStmts.put(integer.intValue(), values);
		}
		uiStmtStack.push(uiStmts);
		registerTypeStack.push(new TreeMap<Integer, Type>(registerTypes));
	}

	public Type[] getPotentiallyPassedParams(String functionName) {
		return potentiallyPassedParams.get(functionName);
	}
}
