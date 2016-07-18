package semantics.expression;

import main.Visitor;
import parser.Token;
import semantics.Type;

/**
 * Represents arithmetic and branch as well as comparison expressions.
 * @author Mo
 *
 */
public class TernaryExpression extends Expression {

	/**
	 * The first operand.
	 */
	private Expression e1;
	
	/**
	 * The second operand.
	 */
	private Expression e2;
	
	/**
	 * The third operand.
	 */
	private Expression e3;
	
	public TernaryExpression(Token instruction, Type type, Expression e1, Expression e2, Expression e3) {
		super(instruction, type);
		this.e1 = e1;
		this.e2 = e2;
		this.e3 = e3;
	}

	@Override
	public String toString() {
		return instruction.getText() + " " + e1.toString() + "," + e2.toString() + "," + e3.toString();
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	public Expression getE1() {
		return e1;
	}

	public Expression getE2() {
		return e2;
	}

	public Expression getE3() {
		return e3;
	}

	@Override
	public void setAllTypesToValue() {
		if (e1.getType() == Type.UNKNOWN) {
			e1.setType(Type.INTEGER);
		}
		if (e2.getType() == Type.UNKNOWN) {
			e2.setType(Type.INTEGER);
		}
		if (e3.getType() == Type.UNKNOWN) {
			e3.setType(Type.INTEGER);
		}
		
	}
}
