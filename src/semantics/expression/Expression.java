package semantics.expression;

import main.Visitor;
import parser.Token;
import parser.TokenKind;
import semantics.Type;

/**
 * Represents an expression.
 * @author Mo
 *
 */
public abstract class Expression {
	
	/**
	 * Expression token. The instruction of the expression.
	 */
	protected Token instruction;
	
	/**
	 * The type of the expression, either pointer or value.
	 */
	protected Type type;
		
	/**
	 * The llvm representation of this expression. Depends on the expression's type.
	 */
	protected String translation;
	
	public Expression(Token instruction, Type type) {
		this.instruction = instruction;
		// TODO type checking
		this.type = type;
	}
	
	public abstract void accept(Visitor v);
	
	@Override
	public abstract String toString();
	
	public Token getInstruction() {
		return instruction;
	}
	
	public void setType(Type type) {
		this.type = type;
	}
	
	public void setTranslation(String code) {
		translation = code;
	}
	
	public String getTranslation() {
		return translation;
	}

	public Type getType() {
		return type;
	}
	
	public int getRegister() {
		if (!(this instanceof UnaryExpression)) {
			return -1;
		}
		UnaryExpression e = (UnaryExpression) this;
		if (e.getInstruction().getKind() == TokenKind.MINUS && e.getExpression() instanceof UnaryExpression) { 
			e = (UnaryExpression) e.getExpression();
		}
		if (e.getInstruction().getKind() == TokenKind.NUMBER && e.getExpression() instanceof UnaryExpression) {
			e = (UnaryExpression) e.getExpression();
		}
		if (e.getInstruction().getKind() == TokenKind.DOLLAR) {
			return Integer.parseInt(((PrimaryExpression) e.getExpression()).getInstruction().getText());
		}
		return -1;
	}
	
	/**
	 * Sets all of its subexpressions to type integer.
	 * This method is used in case of a LUI instruction
	 * that loads not an address.
	 */
	public abstract void setAllTypesToValue();
}
