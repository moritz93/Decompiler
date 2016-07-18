package translation;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.DirectedGraph;
import org.jgrapht.graph.ListenableDirectedGraph;

import main.Visitor;
import parser.Lexer;
import parser.Parser;
import parser.TokenKind;
import semantics.AST;
import semantics.Type;
import semantics.TypeVisitor;
import semantics.expression.Expression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

public class Translator {

	private final Lexer lexer;
	private final Parser parser;
	private final AST tree;
	private int stackAllocation;
	
	/**
	 * The size of the .data section.
	 * -1 if not used.
	 */
	private int dataAllocation = -1;
	
	/**
	 * The size of the .sdata section.
	 * -1 if not used.
	 */
	private int sdataAllocation = -1;
	
	/**
	 * The address where the .data segment starts.
	 */
	public static final long dataSegmentStart= 0x10000000;

	public Translator(Reader r) {
		lexer = new Lexer(r);
		tree = new AST();
		parser = new Parser(tree, lexer);
	}

	/**
	 * Sets parameters and their types of all functions.
	 */
	public void setFunctionParameters() {
		final ParameterPassingVisitor ppVisitor = new ParameterPassingVisitor(tree.getLabelStmts());
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(ppVisitor);
		}
	}

	/**
	 * Type cast of @ExpressionStatement.
	 */
	public void setTypes() {
		final TypeVisitor typeVisitor = new TypeVisitor();
		// Find main function.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(typeVisitor);
		}
		// Handle @Type.UNKNOWN
		// Type setting does not follow CFG in respect of translating also unused code.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			Type[] params = stmt.getParameters();
			Type[] potentiallyPassed = typeVisitor.getPotentiallyPassedParams(stmt.getName());
			for (int i = 0; i < params.length; i++) {
				if ( potentiallyPassed != null && (params[i] == Type.UNKNOWN || params[i] == Type.VALUE)) {
					params[i] = potentiallyPassed[i];
				}
			}
		}
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(typeVisitor);
		}
		// Prints the whole tree after type setting.
//		System.out.println(tree);
	}

	/**
	 * Builds the abstract syntax tree @AST.
	 */
	public void buildTree() {
		// Temporary save the block representation to insert the label blocks.
		LinkedHashMap<LabelStatement, LinkedList<ExpressionStatement>> blocks = parser.parseTranslationUnit();

		// Add all LabelStatements to the global CFG.
		for (LabelStatement stmt : blocks.keySet()) {
			tree.getCFG().addVertex(stmt);
		}

		Map<LabelStatement, LinkedList<Integer>> labels = getLabels(blocks);
		insertLabelBlocksIntoAST(labels, blocks);
		// System.out.println(tree);
	}

	/**
	 * Inserts the label blocks to the @AST
	 * 
	 * @param labels
	 * @param blocks
	 */
	private void insertLabelBlocksIntoAST(Map<LabelStatement, LinkedList<Integer>> labelMap,
			LinkedHashMap<LabelStatement, LinkedList<ExpressionStatement>> blocks) {
		for (LabelStatement stmt : tree.getLabelStmts()) {
			LinkedList<Integer> labels = labelMap.get(stmt);
			LinkedList<ExpressionStatement> tmp = new LinkedList<>();
			int startAddress = stmt.getAddress();
			int currentBlock = 0;
			for (Iterator<ExpressionStatement> iter = blocks.get(stmt).iterator(); iter.hasNext();) {
				ExpressionStatement expStatement = (ExpressionStatement) iter.next();
				int address = expStatement.getAddress();
				int labelIndex = labels.indexOf(address);

				if (labelIndex != -1 || !iter.hasNext()) {
					if (!iter.hasNext()) {
						tmp.add(expStatement);
					}
					LabelBlockStatement block = new LabelBlockStatement(
							startAddress == stmt.getAddress() ? stmt.getLocation() : tmp.getFirst().getLocation(),
							startAddress, address, tmp, currentBlock);
					stmt.addBlockStatement(block);
					startAddress = expStatement.getAddress();
					currentBlock = labelIndex + 1;
					tmp = new LinkedList<>();
				}
				tmp.add(expStatement);
			}
		}
		
		
//		for (LabelStatement stmt : tree.getLabelStmts()) {
//			LinkedList<ExpressionStatement> tmp = new LinkedList<>();
//			int startAddress = stmt.getAddress();
//			int currentBlock = -1;
//			int offset = 0;
//			for (Iterator<ExpressionStatement> iter = blocks.get(stmt).iterator(); iter.hasNext();) {
//				ExpressionStatement expStatement = (ExpressionStatement) iter.next();
//				int address = expStatement.getAddress();
//				int labelIndex = labels.indexOf(address);
//
//				if (labelIndex != -1 || !iter.hasNext()) {
//					if (currentBlock == -1 && labelIndex != -1) {
//						// First label of block.
//						offset = labelIndex - 1;
//					}
//					if (!iter.hasNext()) {
//						tmp.add(expStatement);
//					}
//					LabelBlockStatement block = new LabelBlockStatement(
//							startAddress == stmt.getAddress() ? stmt.getLocation() : tmp.getFirst().getLocation(),
//							startAddress, address, tmp, currentBlock + 1);
//					stmt.addBlockStatement(block);
//					startAddress = expStatement.getAddress();
//					currentBlock = labelIndex - offset;
//					tmp = new LinkedList<>();
//				}
//				tmp.add(expStatement);
//			}
//		}
	}

	/**
	 * Returns all labels.
	 * 
	 * @return A LinkedList of all label addresses.
	 */
	private HashMap<LabelStatement, LinkedList<Integer>> getLabels(LinkedHashMap<LabelStatement, LinkedList<ExpressionStatement>> blocks) {
		// The list containing all labels.
		HashMap<LabelStatement , LinkedList<Integer>> resMap = new HashMap<>();
		
		// Check label positions here.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			LinkedList<Integer> res = new LinkedList<Integer>();
			LinkedList<ExpressionStatement> expStmts = blocks.get(stmt);
			for (ExpressionStatement s : expStmts) {
				Expression e = s.getExpression();
				int address;

				switch (e.getInstruction().getKind()) {
				case BNE:
				case BEQ:
					address = Integer.parseInt(((TernaryExpression) e).getE3().getInstruction().getText(), 16);
					// Adds the label address to the list if not already
					// included.
					if (!res.contains(address)) {
						res.add(address);
					}

					// Insert the alternative label to the list.
					int nextAdr = s.getAddress() + 0x8;
					if (!res.contains(nextAdr)) {
						res.add(nextAdr);
					}

					break;

				case J:
					address = Integer.parseInt(((UnaryExpression) e).getExpression().getInstruction().getText(), 16);
					if (!res.contains(address)) {
						// Adds the label address to the list.
						res.add(address);
					}
					break;

				case JR:
					break;

				default:
					continue;
				}
			}
			resMap.put(stmt, res);
		}
		return resMap;
	}

	/**
	 * Constructs the Control Flow Graph for each @LabelStatement. It is later
	 * used for detecting structural non-determinism.
	 */
	public void constructCFG() {

		// Adds the nodes represented by @LabelBlockStatement to a
		// ControlFlowGraph for each subfunction.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			ListenableDirectedGraph<LabelBlockStatement, DefaultEdge> cfg = new ListenableDirectedGraph<>(
					DefaultEdge.class);
			Set<DefaultEdge> backedges = new HashSet<DefaultEdge>();
			for (LabelBlockStatement b : stmt.getBlockStmts()) {
				cfg.addVertex(b);
			}
			stmt.setDefaultEdges(backedges);
			stmt.setCFG(cfg);
		}
		// Adds the edges to the Control Flow Graph.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			DirectedGraph<LabelBlockStatement, DefaultEdge> cfg = stmt.getCFG();
			// The last instruction to detect back jumps.
			TokenKind previousInstruction = null;
			LabelBlockStatement previousBlock = null;
			for (LabelBlockStatement b : stmt.getBlockStmts()) {
				// Detect a block transition without jump.
				if (previousInstruction != null) {
					switch (previousInstruction) {
					case BEQ:
					case BNE:
					case J:
//					case BREAK:
						break;

					default:
						if (previousBlock != null) {
							cfg.addEdge(previousBlock, b);
						}
						break;
					}
				}

				for (ExpressionStatement s : b.getExpStmts()) {
					Expression e = s.getExpression();
					int jumpAddress;
					previousInstruction = e.getInstruction().getKind();
					switch (previousInstruction) {
					case BNE:
					case BEQ:
						jumpAddress = Integer.parseInt(((TernaryExpression) e).getE3().getInstruction().getText(), 16);
						for (LabelBlockStatement jumpTarget : stmt.getBlockStmts()) {
							if (jumpTarget.getAddress() == jumpAddress
									|| jumpTarget.getAddress() == s.getAddress() + 0x8) {
								DefaultEdge edge = cfg.addEdge(b, jumpTarget);
								// Check for cycle.
								if (cfg.outDegreeOf(jumpTarget) > 0 || b.equals(jumpTarget)) {
									stmt.addBackEdge(edge);
								}
							}
						}

						break;

					case J:
						jumpAddress = Integer.parseInt(((UnaryExpression) e).getExpression().getInstruction().getText(),
								16);
						for (LabelBlockStatement jumpTarget : stmt.getBlockStmts()) {
							if (jumpTarget.getAddress() == jumpAddress) {
								DefaultEdge edge = cfg.addEdge(b, jumpTarget);
								// Check for cycle.
								if (cfg.outDegreeOf(jumpTarget) > 0 || b.equals(jumpTarget)) {
									stmt.addBackEdge(edge);
								}
							}
						}
						break;

					case JAL:
						int targetAddress = Integer
								.parseInt(((UnaryExpression) e).getExpression().getInstruction().getText(), 16);
						for (LabelStatement lStmt : tree.getLabelStmts()) {
							if (lStmt.getAddress() == targetAddress) {
								tree.getCFG().addEdge(stmt, lStmt);
								break;
							}
						}
						continue;

					default:
						continue;
					}
				}
				previousBlock = b;
			}			
		}
	}

	public void handleMemoryModel(PrintWriter writer, int dataSize, int sdataSize) {
		final MemoryModelVisitor visitor = new MemoryModelVisitor(writer);
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(visitor);
		}
		stackAllocation = visitor.getStackPointerOffset();
		dataAllocation = visitor.dataUsed() ? dataSize : -1;
		sdataAllocation = visitor.sdataUsed() ? sdataSize : -1;
	}

	/**
	 * Translates the SimpleScalar code to LLVM
	 * 
	 * @param fileName
	 * 
	 * @throws UnsupportedEncodingException
	 * @throws FileNotFoundException
	 */
	public void generateCode(PrintWriter writer, PrintWriter fakeLoadWriter, List<Integer> data, List<Integer> sdata) {

		writer.println("@stack = global [" + stackAllocation + " x i8] zeroinitializer");//TODO, align 32");
		if (dataAllocation != -1) {
			// TODO debug
			String assignment = "[ " + (dataAllocation) + " x i8] [ ";
			for (Integer integer : data) {
				assignment += "i8 " + integer + ", ";
			}
			assignment = assignment.substring(0, assignment.lastIndexOf(",")) + " ]";
			writer.println("@global = global " + assignment);
		}
		if (sdataAllocation != -1) {
			String assignment = "[ " + sdataAllocation + " x i8] [ ";
			for (Integer integer : sdata) {
				assignment += "i8 " + integer + ", ";
			}
			assignment = assignment.substring(0, assignment.lastIndexOf(",")) + " ]";
			writer.println("@sdata = global " + assignment);
		}
		writer.println("@zero = common global i32 0");
		writer.println("@low = common global i32 0");
		writer.println("@high = common global i32 0");
		writer.println("@.str = private unnamed_addr constant [4 x i8] c\"%u \\00\", align 1");
		writer.println();

		HashMap<String, Type[]> map = new HashMap<>();
		HashMap<String, Type> returnTypes = new HashMap<>();
		for (LabelStatement stmt : tree.getLabelStmts()) {
			map.put(stmt.getName(), stmt.getParameters());
			returnTypes.put(stmt.getName(), stmt.getReturnType());
		}
		final Visitor codeVisitor = new CodeGenerationVisitor(stackAllocation, dataAllocation, sdataAllocation, writer,
				fakeLoadWriter, map, returnTypes);
		// Generate code.
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(codeVisitor);
		}
		
		writer.println("declare void @exit(i32) noreturn nounwind");
		writer.println("declare i32 @printf(i8* noalias, ...) nounwind");
		writer.close();
		fakeLoadWriter.close();
	}

	/**
	 * Locates the spots where a PHI instruction is needed to resolve the local
	 * variable.
	 */
	public void locatePhiInstructions() {
		final PhiInstructionVisitor phi = new PhiInstructionVisitor();
		for (LabelStatement stmt : tree.getLabelStmts()) {
			stmt.accept(phi);
		}
	}

}
