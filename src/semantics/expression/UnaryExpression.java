package semantics.expression;

import java.util.Set;
import java.util.TreeSet;

import main.Visitor;
import parser.Token;
import parser.TokenKind;
import semantics.Type;
import semantics.statement.LabelBlockStatement;

/**
 * Unary expression represents address offset, pointer ($), jump and minus operator.
 * @author Mo
 *
 */
public class UnaryExpression extends Expression {
	
	protected Expression expression;
	
	/**
	 * To determine needed PHI instructions.
	 * The set contains all predecessors, where the register's content has changed. 
	 */
	private Set<Integer> predecessors;
	
	public UnaryExpression(Token instruction, Type type, Expression e) {
		super(instruction, type);
		expression = e;
		predecessors = new TreeSet<>();
	}

	@Override
	public String toString() {
		String s;
		
		switch (instruction.getKind()) {
		case J:
		case JR:
		case JAL:
		case MFLO:
		case MFHI:
			s = " " + expression.toString();
			break;
		
		case NUMBER:
			s = "(" + expression.toString() + ")";
			break;
			
		default:
			s = expression.toString();
			break;
		}
		return instruction.getText() + s + "<" + getType() + ">";
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}
	
	public void setTranslation(String code) {
		translation = code;
	}
	
	public String getTranslation() {
		return translation;
	}

	public Expression getExpression() {
		return expression;
	}

	public Set<Integer> getPredecessors() {
		return predecessors;
	}

	public void addPredecessor(Integer predecessor) {
		predecessors.add(predecessor);
	}
	
	public boolean phiInstructionNeeded() {
		return predecessors.size() > 1;
	}
	
	public boolean isWrittenInLabelBlock(LabelBlockStatement block) {
		if (instruction.getKind() == TokenKind.DOLLAR) {
			Integer register = Integer.parseInt(((PrimaryExpression) expression).getInstruction().getText());
			return block.getWrittenRegisters().contains(register);
		}
		return false;
	}
	
	public boolean hasUniquePredecessor() {
		return predecessors.size() == 1;
	}

	@Override
	public void setAllTypesToValue() {		
	}
	
}
