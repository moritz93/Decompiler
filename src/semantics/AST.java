package semantics;

import java.util.LinkedList;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.DirectedGraph;
import org.jgrapht.graph.DefaultDirectedGraph;

import semantics.statement.LabelStatement;

/**
 * The class containing all parsed statements.
 * @author Mo
 *
 */
public class AST {

	/**
	 * The list containing the statements.
	 */
	private LinkedList<LabelStatement> stmts;
	
	/**
	 * The control flow graph of the whole program.
	 */
	private final DirectedGraph<LabelStatement, DefaultEdge> cfg;

	
	public AST() {
		stmts = new LinkedList<LabelStatement>();
		cfg = new DefaultDirectedGraph<LabelStatement, DefaultEdge>(DefaultEdge.class);
	}
	
	/**
	 * To be used by the parser to add parsed statements.
	 * @param stmt The statement to add to the SemanticTree.
	 */
	public void addStmt(LabelStatement stmt) {
		stmts.add(stmt);
	}
	
	@Override
	public String toString() {
		String string = "";
		for (LabelStatement statement : stmts) {
			string += statement.toString(true) + "\n";
		}
		return string;
	}
	
	public LinkedList<LabelStatement> getLabelStmts() {
		return stmts;
	}
	
	public DirectedGraph<LabelStatement, DefaultEdge> getCFG() {
		return cfg;
	}
}
