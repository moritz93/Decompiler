package semantics.expression;

import main.Visitor;
import parser.Token;
import semantics.Type;

/**
 * Represents the memory expressions.
 * @author Mo
 *
 */
public class BinaryExpression extends Expression {

	/**
	 * The register to be loaded from or to be saved to.
	 */
	Expression firstArg;
	
	/**
	 * The offset according to the register.
	 */
	Expression secondArg;
	
	public BinaryExpression(Token instruction, Type type, Expression e1, Expression e2) {
		super(instruction, type);
		firstArg = e1;
		secondArg = e2;
	}

	@Override
	public String toString() {
		return instruction.getText() + " " + firstArg.toString() + ", " + secondArg.toString();
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	public Expression getE1() {
		return firstArg;
	}

	public Expression getE2() {
		return secondArg;
	}
	
	@Override
	public void setAllTypesToValue() {
		if (firstArg.getType() == Type.UNKNOWN) {
			firstArg.setType(Type.INTEGER);
		}
		if (secondArg.getType() == Type.UNKNOWN) {
			secondArg.setType(Type.INTEGER);
		}
	}
}
