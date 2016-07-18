package semantics.statement;

import java.awt.Point;
import java.util.HashMap;
import java.util.LinkedList;

import main.Visitor;
import parser.TokenKind;
import semantics.Type;
import semantics.expression.BinaryExpression;
import semantics.expression.Expression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;

/**
 * Representing an expression statement, i.e. an instruction (e.g. add, jump
 * etc.)
 * 
 * @author Mo
 *
 */
public class ExpressionStatement extends Statement {

	/**
	 * The statement's expression.
	 */
	private Expression expression;

	/**
	 * Used by the @CodeGenerationVisitor to cope with SSA form. Set by
	 * the @Translator.
	 */
	private LinkedList<Integer> predecessorLabels = new LinkedList<Integer>();

	/**
	 * They array which contains the registers which have to be coped with using
	 * a PHI function. A expression has a maximum of two registers to be loaded.
	 */
	private boolean[] phiFctRegisters = { false, false };

	public ExpressionStatement(Point location, String address, Expression expression) {
		super(location, address);
		this.expression = expression;
	}

	@Override
	public String toString() {
		return "" + Integer.toHexString(address) + ": " + expression.toString() + " [" + expression.getType() + "]";
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	public Expression getExpression() {
		return expression;
	}

	public Type getType() {
		return expression.getType();
	}

	public LinkedList<Integer> getPredecessors() {
		return predecessorLabels;
	}

	public boolean phiFunctionNeeded() {
		return predecessorLabels.isEmpty();
	}

	public void addPredecessor(int labelAdress) {
		predecessorLabels.add(labelAdress);
	}

	public void setPhiFctRegister(byte index) {
		phiFctRegisters[index] = true;
	}

	public boolean[] getPhiFctRegisters() {
		return phiFctRegisters;
	}

	/**
	 * Returns the result register of an expression.
	 * 
	 * @param e
	 * @return
	 */
	public static Integer getResultRegister(Expression e) {
		Integer safeToReg = -1;
		if (e instanceof TernaryExpression) {
			if (e.getInstruction().getKind() == TokenKind.BEQ || e.getInstruction().getKind() == TokenKind.BNE) {
				return -1;
			}
			safeToReg = Integer
					.parseInt(((PrimaryExpression) ((UnaryExpression) ((TernaryExpression) e).getE1()).getExpression())
							.getInstruction().getText());
		} else if (e instanceof BinaryExpression) {
			if (!e.getInstruction().getKind().isLoadInstruction()) {
				return -1;
			}
			safeToReg = Integer
					.parseInt(((PrimaryExpression) ((UnaryExpression) ((BinaryExpression) e).getE1()).getExpression())
							.getInstruction().getText());
		}
		if (e.getInstruction().getKind() == TokenKind.MFHI || e.getInstruction().getKind() == TokenKind.MFLO) {
			safeToReg = Integer.parseInt(((PrimaryExpression)((UnaryExpression)((UnaryExpression) e).getExpression()).getExpression()).getInstruction().getText());
		}

		return safeToReg == 0 ? -1 : safeToReg;
	}

	/**
	 * Returns the registers which are loaded in the instruction.
	 * 
	 * @param e
	 * @return
	 */
	public static HashMap<Integer, UnaryExpression> getLoadRegisters(Expression e) {
		try {
			
		
		HashMap<Integer, UnaryExpression> map = new HashMap<>();
		int register = -1;
		UnaryExpression exp = null;
		switch (e.getInstruction().getKind()) {
		case ADDIU:
		case SLTI:
		case SLL:
		case SRL:
		case ANDI:
			exp = ((UnaryExpression) ((TernaryExpression) e).getE2());
			register = Integer.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;

		case ADDU:
		case SLT:
		case DIV:
		case SUBU:
		case XOR:
		case OR:
			exp = ((UnaryExpression) ((TernaryExpression) e).getE2());
			register = Integer.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);

			exp = ((UnaryExpression) ((TernaryExpression) e).getE3());
			register = Integer.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;

		case BEQ:
		case BNE:
			exp = ((UnaryExpression) ((TernaryExpression) e).getE1());
			register = Integer.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			
			exp = ((UnaryExpression) ((TernaryExpression) e).getE2());
			register = Integer.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;

		case LW:
		case LBU:
		case LHU:
		case LWL:
		case LWR:
			exp = ((UnaryExpression) ((UnaryExpression) ((BinaryExpression) e).getE2())
					.getExpression());
			if (exp.getInstruction().getKind() == TokenKind.NUMBER) {
				exp = (UnaryExpression) exp.getExpression();
			}
			register = Integer
					.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;

		case SW:
		case SB:
		case SWR:
		case SWL:
			exp =  ((UnaryExpression) ((BinaryExpression) e).getE1());
			register = Integer
					.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			
			exp = (UnaryExpression) ((BinaryExpression) e).getE2();
			if (exp.getInstruction().getKind() == TokenKind.MINUS) {
				exp = (UnaryExpression) exp.getExpression();
			}
			exp = (UnaryExpression) ((UnaryExpression) exp.getExpression());
			
			register = Integer
					.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;

		case JAL:
			// Stack pointer offset.
			exp = (UnaryExpression) e;
			register = 29;
			map.put(register, exp);
			break;
		
		case JR:
			// Return register.
			exp = (UnaryExpression) e;
			register = 2;
			map.put(register, exp);
			break;
			
		case MULT:
			exp =  ((UnaryExpression) ((BinaryExpression) e).getE1());
			register = Integer
					.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			exp =  ((UnaryExpression) ((BinaryExpression) e).getE2());
			register = Integer
					.parseInt(((PrimaryExpression) exp.getExpression()).getInstruction().getText());
			map.put(register, exp);
			break;
			
		default:
			break;
		}

		return map;
		} catch (Exception e2) {
			System.err.println(e);
			throw e2;
		}
	}
	
}
