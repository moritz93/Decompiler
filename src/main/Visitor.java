package main;

import semantics.expression.AtomicExpression;
import semantics.expression.BinaryExpression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.EmptyStatement;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

public interface Visitor {

	public void visit(LabelStatement labelStatement);
	public void visit(LabelBlockStatement blockStatement);
	public void visit (ExpressionStatement s);
	
	public void visit (TernaryExpression e);
	public void visit (BinaryExpression e);
	public void visit (UnaryExpression e);
	public void visit (PrimaryExpression e);
	
	public void visit (EmptyStatement s);
	public void visit(AtomicExpression atomicExpression);
	
	
}
