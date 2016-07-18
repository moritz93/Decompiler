package translation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.DirectedGraph;
import org.jgrapht.alg.DijkstraShortestPath;
import org.jgrapht.graph.EdgeReversedGraph;

import main.Visitor;
import parser.TokenKind;
import semantics.Type;
import semantics.expression.AtomicExpression;
import semantics.expression.BinaryExpression;
import semantics.expression.Expression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.EmptyStatement;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

/**
 * @author Mo The PHI instruction visitor that detects, where PHI instructions
 *         are necessary.
 */
public class PhiInstructionVisitor implements Visitor {

	/**
	 * The CFG of the current @LabelStatement. It provides the predecessors of
	 * each @LabelBlockStatement.
	 */
	private DirectedGraph<LabelBlockStatement, DefaultEdge> currentCFG;

	/**
	 * The loaded registers inside the current label block each mapped to the
	 * first @UnaryExpression where it was used.
	 */
	private HashMap<Integer, LinkedList<UnaryExpression>> loadedRegisters;

	/**
	 * All used registers along the predecessor paths. Registers are mapped to
	 * the label block where their content was modified.
	 */
	private HashMap<Integer, LinkedHashSet<LabelBlockStatement>> resultRegisters;

	/**
	 * All used registers along ONE predecessor path.
	 */
	private Set<Integer> alreadyCopedRegs;

	/**
	 * The current @LabelBlockStatement.
	 */
	private LabelBlockStatement currentLabelBlock;

	/**
	 * The current @LabelStatement.
	 */
	private LabelStatement currentLabelStmt;
	
	/**
	 * @LabelBlockStatements visited.
	 */
	private Set<LabelBlockStatement> blocksVisited;

	@Override
	public void visit(LabelStatement labelStatement) {
		currentCFG = labelStatement.getCFG();
		currentLabelStmt = labelStatement;
		for (LabelBlockStatement b : labelStatement.getBlockStmts()) {
			currentLabelBlock = b;
			b.accept(this);
		}
	}

	@Override
	public void visit(LabelBlockStatement blockStatement) {
		// Find loaded registers in the current block.
		getLoadedRegisters();
		// Find result registers in all predecessors.
		resultRegisters = new HashMap<>();
		blocksVisited = new HashSet<>();
		alreadyCopedRegs = new TreeSet<>();
		detectStructuralNonDeterminism();

		// Mark @LabelBlockStatements that need PHI instructions.
		for (Integer reg : loadedRegisters.keySet()) {
			Set<LabelBlockStatement> saveLocations = resultRegisters.get(reg);
			if (saveLocations != null) {
				if (saveLocations.size() > 1) {
					// More than 1 predecessor.
					// Find the last common vertex between all predecessors.
					List<List<DefaultEdge>> shortestPaths = new ArrayList<List<DefaultEdge>>();
					int counter = 0;
					EdgeReversedGraph<LabelBlockStatement, DefaultEdge> edgeReversedCFG = new EdgeReversedGraph<LabelBlockStatement, DefaultEdge>(
							currentCFG);
					// Find shortest paths between each predecessor.
					for (LabelBlockStatement labelBlockStatement : saveLocations) {
						if (labelBlockStatement != currentLabelBlock) {
							shortestPaths.add(counter, DijkstraShortestPath.findPathBetween(edgeReversedCFG,
									currentLabelBlock, labelBlockStatement));
							counter++;
						} else {
							// Cycle is present. Find path from predecessor and add the edge
							// which goes to that predecessor.
							List<DefaultEdge> shortestPath = null;
							DefaultEdge edgeToPred = null;
							for (DefaultEdge edge : edgeReversedCFG.outgoingEdgesOf(currentLabelBlock)) {
								LabelBlockStatement pred = edgeReversedCFG.getEdgeTarget(edge);
								List<DefaultEdge> tmp = DijkstraShortestPath.findPathBetween(edgeReversedCFG, pred, labelBlockStatement);
								if (shortestPath == null ) {
									shortestPath = tmp;
									edgeToPred = edge;
								} else if (shortestPath.size() > tmp.size()) {
									shortestPath = tmp;
									edgeToPred = edge;
								}
							}
							// Add initial edge.
							shortestPath.add(0, edgeToPred);
							shortestPaths.add(counter, shortestPath);
							counter++;
						}
						
					}
					// Get the last common vertex of all predecessors.
					LabelBlockStatement phiHolder = findLastCommonVertex(shortestPaths, edgeReversedCFG);
					// Add the predecessors to the PHI instruction holder.
					for (LabelBlockStatement labelBlockStatement : saveLocations) {
						LinkedList<UnaryExpression> tmp = loadedRegisters.get(reg);
						UnaryExpression e = tmp.getFirst();
						// Find next vertex on the way to predecessor.
						int pred;
						if (!phiHolder.equals(labelBlockStatement)) {
							// System.err.println("Current: " +
							// currentLabelBlock.getLabelNum());
							// System.err.println("Holder: " +
							// phiHolder.getLabelNum());
							// System.err.println("Pred: " +
							// labelBlockStatement.getLabelNum());
							List<DefaultEdge> edges = DijkstraShortestPath.findPathBetween(edgeReversedCFG, phiHolder,
									labelBlockStatement);
							DefaultEdge edge = edges.get(0);
							pred = edgeReversedCFG.getEdgeTarget(edge).getLabelNum();
						} else {
							pred = phiHolder.getLabelNum();
						}
						phiHolder.addPredecessor(reg, pred);
						phiHolder.addPhiType(e);
					}
					// Add phiHolder as the single predecessor of the current
					// @LabelBlockStatement.
					if (!phiHolder.equals(currentLabelBlock)) {
						currentLabelBlock.addPredecessor(reg, phiHolder.getLabelNum());
					} else {
						// Direct predecessors have to be coped in the PHI instruction
						// independent of whether the concerned register was written or not.
						for (DefaultEdge incEdge : currentCFG.incomingEdgesOf(currentLabelBlock)) {
							LabelBlockStatement block = currentCFG.getEdgeSource(incEdge);
							if (!currentLabelBlock.isPredecessor(reg, block.getLabelNum())) {
								// Block is not included yet. Add predecessor
								// with virtual register of the next predecessor.
								Integer pathSize = null;
								Integer blockNum = null;
								Set<Integer> preds = currentLabelBlock.getPredecessors(reg);
								if (preds != null) {
									for (Integer pred : preds) {
										LabelBlockStatement b = currentLabelStmt.getBlockStmtForLabelNum(pred);
										List<DefaultEdge> path = DijkstraShortestPath.findPathBetween(edgeReversedCFG, block, b);
										if (path != null) {
											if (pathSize == null) {
												pathSize = path.size();
											}
											if (path.size() <= pathSize) {
												pathSize = path.size();
												blockNum = b.getLabelNum();
											}
										}
									}
									if (pathSize != null && blockNum != null) {
										currentLabelBlock.addPredecessor(reg, block.getLabelNum());
									}
								}
							}
						}
					}
					
					
				} else {
					// Only one predecessor.
					currentLabelBlock.addPredecessor(reg, saveLocations.iterator().next().getLabelNum());
				}
			}
		}
	}

	private LabelBlockStatement findLastCommonVertex(List<List<DefaultEdge>> shortestPaths,
			EdgeReversedGraph<LabelBlockStatement, DefaultEdge> cfg) {
		LabelBlockStatement vertex = currentLabelBlock;
		boolean found = false;
		while (!found) {
			List<DefaultEdge> l = shortestPaths.get(0);
			if (l.size() < 1) {
				break;
			}
			DefaultEdge edge = l.get(0);
			// Check for all paths if there is the same Edge at the current
			// index.
			for (List<DefaultEdge> path : shortestPaths) {
				if (path.size() < 1) {
					found = true;
					break;
				}
				DefaultEdge tmp = path.remove(0);
				if (!edge.equals(tmp)) {
					found = true;
				} else {
					found = false;
				}
			}
			// If all paths contain the same edge, get the next vertex and
			// proceed.
			if (!found) {
				vertex = cfg.getEdgeTarget(edge);
			}
		}

		return vertex;
	}

	/**
	 * Determines all loaded registers of the current @LabelBlockStatement.
	 * 
	 * @param block
	 */
	private void getLoadedRegisters() {
		// Clear previous generation.
		loadedRegisters = new HashMap<>();
		Set<Integer> savedRegisters = new TreeSet<>();
		for (ExpressionStatement expStmt : currentLabelBlock.getExpStmts()) {
			Expression e = expStmt.getExpression();

			int safeToReg = ExpressionStatement.getResultRegister(e);
			HashMap<Integer, UnaryExpression> loadFromRegs = ExpressionStatement.getLoadRegisters(e);
			if (currentLabelStmt.getReturnType() == Type.VOID) {
				for (UnaryExpression exp : loadFromRegs.values()) {
					if (exp.getInstruction().getKind() == TokenKind.JR) {
						loadFromRegs.clear();
						break;
					}
				}
			}
			// Adds the register once to the list. But only when
			// there wasn't written to it before in this block.
			for (Integer i : loadFromRegs.keySet()) {
				if (i != -1 && !savedRegisters.contains(i)) {
					if (!loadedRegisters.containsKey(i)) {
						loadedRegisters.put(i, new LinkedList<>());
					}
					loadedRegisters.get(i).add(loadFromRegs.get(i));
				}
			}
			if (safeToReg != -1 && !savedRegisters.contains(safeToReg)) {
				savedRegisters.add(safeToReg);
			}
		}
	}

	/**
	 * Determines all registers where the content changed in different
	 * predecessor paths.
	 */
	private void detectStructuralNonDeterminism() {
		Set<Integer> alreadyCoped = new TreeSet<>(alreadyCopedRegs);
		LabelBlockStatement curBlock = currentLabelBlock;
		// Handle each predecessor block.
		for (DefaultEdge incEdge : currentCFG.incomingEdgesOf(currentLabelBlock)) {
			LabelBlockStatement pred = currentCFG.getEdgeSource(incEdge);
			// Checks for all loaded registers whether it was
			// written in the predecessor block or not.
			for (Integer loadedReg : loadedRegisters.keySet()) {
				if ((pred.getWrittenRegisters().contains(loadedReg) || (pred.getPredecessors(loadedReg) != null
						&& pred.getPredecessors(loadedReg).size() > 1 && pred.getLoadedRegisters().contains(loadedReg)))
						&& !alreadyCopedRegs.contains(loadedReg)) {
					if (!resultRegisters.containsKey(loadedReg)) {
						resultRegisters.put(loadedReg, new LinkedHashSet<>());
					}
					resultRegisters.get(loadedReg).add(pred);
					alreadyCopedRegs.add(loadedReg);
				}
			}
			currentLabelBlock = pred;
			// Do not handle back edges.
			if (!currentLabelStmt.isBackEdge(incEdge)) {
				detectStructuralNonDeterminism();	
			}
			
			alreadyCopedRegs = new TreeSet<>(alreadyCoped);
			currentLabelBlock = curBlock;
			// Check if the predecessor was already visited.
			if (blocksVisited.contains(pred)) {
				return;
			}
			blocksVisited.add(pred);
		}
	}

	@Override
	public void visit(ExpressionStatement s) {
	}

	@Override
	public void visit(BinaryExpression e) {
	}

	@Override
	public void visit(TernaryExpression e) {
	}

	@Override
	public void visit(UnaryExpression e) {
	}

	@Override
	public void visit(PrimaryExpression e) {
	}

	@Override
	public void visit(EmptyStatement s) {
	}

	@Override
	public void visit(AtomicExpression atomicExpression) {
	}
}
