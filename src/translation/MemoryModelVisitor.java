package translation;

import java.io.PrintWriter;

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

/**
 * This visitor computes the needed array size for the stack pointer representation.
 * Besides the global pointer representation is coped.
 * @author Mo
 *
 */
public class MemoryModelVisitor implements Visitor{

	private final PrintWriter writer;
	private int spOffset = 1;
	
	private boolean isFirstStackDecrement;
	private boolean sdataUsed = false;
	private boolean dataUsed = false;
	private TokenKind currentInstruction;
	
	public MemoryModelVisitor(PrintWriter writer) {
		this.writer = writer;
		currentInstruction = null;
	}
	
	@Override
	public void visit(LabelStatement labelStatement) {
		String label = labelStatement.getName();
		if (!label.equals("main")) {
			writer.println("@stack_" + label + " = common global i8* null");
		}
		isFirstStackDecrement = true;
		for (LabelBlockStatement b : labelStatement.getBlockStmts()) {
			b.accept(this);
		}
		
	}

	@Override
	public void visit(LabelBlockStatement blockStatement) {
		for (ExpressionStatement expStmt : blockStatement.getExpStmts()) {
			expStmt.accept(this);
		}		
	}

	@Override
	public void visit(ExpressionStatement s) {
		currentInstruction = s.getExpression().getInstruction().getKind();
		s.getExpression().accept(this);
	}

	@Override
	public void visit(TernaryExpression e) {
		if (isFirstStackDecrement && e.getInstruction().getKind() == TokenKind.ADDIU) {
			isFirstStackDecrement = false;
			e.getE3().accept(this);
		}
	}

	@Override
	public void visit(BinaryExpression e) {
		if (e.getInstruction().getKind() == TokenKind.LW) {
			e.getE2().accept(this);
		}
		if (e.getInstruction().getKind() == TokenKind.LUI) {
			if (e.getType() == Type.POINTER) {
				dataUsed = true;
			}
		}
	}

	@Override
	public void visit(UnaryExpression e) {	
			e.getExpression().accept(this);
	}

	@Override
	public void visit(PrimaryExpression e) {
		// Stack pointer.
		if (currentInstruction == TokenKind.ADDIU && e.getInstruction().getKind() == TokenKind.NUMBER) {
			spOffset += Integer.parseInt(e.getInstruction().getText());
		}
		// Global pointer.
		if (e.isRegister() && e.getInstruction().getText().equals("28")) {
			sdataUsed = true;
		}
			
	}

	@Override
	public void visit(EmptyStatement s) {		
	}
	
	public int getStackPointerOffset() {
		return spOffset;
	}

	public boolean sdataUsed() {
		return sdataUsed;
	}

	public boolean dataUsed() {
		return dataUsed;
	}
	
	@Override
	public void visit(AtomicExpression atomicExpression) {		
	}
}
