package semantics.statement;

import java.awt.Point;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Set;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.DirectedGraph;
import org.jgrapht.graph.ListenableDirectedGraph;

import main.Visitor;
import semantics.Type;

/**
 * Represents a label declaration.
 * @author Mo
 *
 */
public class LabelStatement extends Statement {
	
	/**
	 * The name of the declared label.
	 */
	private String name;
	
	/**
	 * The LabelStatement's parameters set by the @TypeVisitor.
	 */
	private Type[] parameters;
	
	/**
	 * The function's return type;
	 */
	private Type returnType = Type.VOID;
	
	/**
	 * The list of all LabelBlockStatements included in this section.
	 */
	private LinkedList<LabelBlockStatement> stmts;
	
	/**
	 * The control flow graph of the label statement.
	 */
	private ListenableDirectedGraph<LabelBlockStatement, DefaultEdge> cfg;
	
	/**
	 * The CFG's back edges providing cycle detection.
	 */
	private Set<DefaultEdge> backEdges;
	
	/**
	 * Constructor of a label statement.
	 * @param name The name of the label.
	 */
	public LabelStatement(Point location, String address, String name, LinkedList<LabelBlockStatement> stmts) {
		super(location, address);
		this.name = name;
		this.stmts = stmts;
	}

	public String getName() {
		return name;
	}

	/**
	 * Prints all instructions of the subroutine.
	 * @param treeRepresentation
	 * @return
	 */
	public String toString(boolean treeRepresentation) {
		String block = "";
		for (LabelBlockStatement labelBlockStatement : stmts) {
			block += labelBlockStatement.toString(true);
		}
		return Integer.toHexString(address) + " <" + name + " " + returnType + Arrays.toString(parameters)+">:" + block;
	}
	
	/**
	 * Prints the name of the subroutine.
	 */
	@Override
	public String toString() {
		return getName();
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

	public LinkedList<LabelBlockStatement> getBlockStmts() {
		return stmts;
	}
	
	public void addBlockStatement(LabelBlockStatement block) {
		stmts.add(block);
	}
	
	public DirectedGraph<LabelBlockStatement, DefaultEdge> getCFG() {
		return cfg;
	}
	
	public void setCFG(ListenableDirectedGraph<LabelBlockStatement, DefaultEdge> cfg) {
		this.cfg = cfg;
	}
	
	/**
	 * Returns the unique predecessor if possible.
	 * @param labelBlock
	 * @return The unique predecessor or -1 if not possible.
	 */
	public int getUniquePredecessor(int labelBlock) {
		for (LabelBlockStatement block : cfg.vertexSet()) {
			if (block.getLabelNum() == labelBlock) {
				if (cfg.inDegreeOf(block) == 1) {
					Set<DefaultEdge> e = cfg.incomingEdgesOf(block);
					return cfg.getEdgeSource(e.iterator().next()).getLabelNum();
				}
			}
		}
		return -1;  
	}
	
	/**
	 * Sets the LabelStatements parameters. Called by @TypeVisitor.
	 * @param parameters
	 */
	public void setParameters(Type[] parameters) {
		if (parameters.length <= 4) {
			this.parameters = parameters;
		} else {
			System.err.println("Parameter list is too long.");
		}
	}
	
	/**
	 * 
	 * @return The LabelStatement's parameters.
	 */
	public Type[] getParameters() {
		return parameters;
	}

	public void setReturnType(Type type) {
		returnType = type;
	}
	
	public Type getReturnType() {
		return returnType;
	}
	
	public LabelBlockStatement getBlockStmtForLabelNum(int num) {
		for (LabelBlockStatement block : stmts) {
			if (block.getLabelNum() == num) {
				return block;
			}
		}
		return null;
	} 
	
	public boolean isBackEdge(DefaultEdge edge) {
		return backEdges.contains(edge);
	}
	
	public void addBackEdge(DefaultEdge e) {
		backEdges.add(e);
	}
	
	public void setDefaultEdges(Set<DefaultEdge> edges) {
		backEdges = edges;
	}

	public Set<DefaultEdge> getBackEdges() {
		return backEdges;
	}
}
