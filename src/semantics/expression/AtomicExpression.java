package semantics.expression;

import main.Visitor;
import parser.Token;
import semantics.Type;

public class AtomicExpression extends Expression {

	public AtomicExpression(Token instruction, Type type) {
		super(instruction, type);
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	@Override
	public String toString() {
		return instruction.getText();
	}

	@Override
	public void setAllTypesToValue() {		
	}

}
