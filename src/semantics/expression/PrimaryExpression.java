package semantics.expression;

import main.Visitor;
import parser.Token;
import parser.TokenKind;
import semantics.Type;

/**
 * The basic expression representing a number, hexadecimal-value or an address (label).
 * @author Mo
 *
 */
public class PrimaryExpression extends Expression {
	
	private boolean isRegister;
	private Token label;
	
	public PrimaryExpression(Token value, Type type, boolean isRegister, Token label) {
		super(value, type);
		this.isRegister = isRegister;
		this.label = label;
	}

	@Override
	public String toString() {
		String s = instruction.getText();
		if (instruction.getKind() == TokenKind.HEXA) {
			s = "0x" + s;
		}
		if (label != null) {
			s += " <" + label.getText() +">";
		}
		
		return s;
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	public boolean isRegister() {
		return isRegister;
	}
	
	public boolean isFunctionCall() {
		return label != null;
	}
	
	public Token getLabel() {
		return label;
	}

	@Override
	public void setAllTypesToValue() {		
	}
	
}
