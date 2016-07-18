package translation;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Stack;
import java.util.TreeMap;
import java.util.TreeSet;

import org.jgraph.graph.DefaultEdge;
import org.jgrapht.traverse.DepthFirstIterator;

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
 * Determines all function parameters and their types. Registers $4-$7
 * 
 * @author mo
 *
 */
public class ParameterPassingVisitor implements Visitor {

	/**
	 * The @LabelStatement's function parameters and their types.
	 */
	private Type[] parameters;
	
	/**
	 * The function's return type. Limited to 32 bits.
	 */
//	private Type returnType;

	/**
	 * A mapping of all four function parameter registers to registers where
	 * their value was copied to. e.g. addiu $16, $0, $4 results in the
	 * following mapping: 4 -> [4, 16] It's needed to determine the parameter's
	 * type.
	 */
	private TreeMap<Integer, TreeSet<Integer>> parameterMap;

	/**
	 * A list of all registers which were written in that subgraph.
	 */
	private TreeSet<Integer> writtenRegs;

	/**
	 * The current register.
	 */
	private int currentRegister = -1;
	
	private int branchAddress = -1;
	TreeSet<Integer> alreadyVisited = new TreeSet<>();

	private Stack<TreeSet<Integer>> writtenRegsStack;
	private Stack<TreeMap<Integer, TreeSet<Integer>>> parameterMapStack;
	private String previousFunctionCall;
	private TokenKind previousInstruction;
	
	/**
	 * Needed to set return types correctly.
	 */
	private final LinkedList<LabelStatement> labelStmts;
	
	

	public ParameterPassingVisitor(LinkedList<LabelStatement> labelStmts) {
		this.labelStmts = labelStmts;
	}

	@Override
	public void visit(LabelStatement labelStatement) {
		alreadyVisited = new TreeSet<Integer>();
		parameters = new Type[4];
		
		writtenRegs = new TreeSet<>();
		writtenRegsStack = new Stack<TreeSet<Integer>>();
		parameterMapStack = new Stack<TreeMap<Integer, TreeSet<Integer>>>();
		// Initialize map.
		parameterMap = new TreeMap<>();
		parameterMap.put(4, new TreeSet<>());
		parameterMap.put(5, new TreeSet<>());
		parameterMap.put(6, new TreeSet<>());
		parameterMap.put(7, new TreeSet<>());
		DepthFirstIterator<LabelBlockStatement, DefaultEdge> iter = new DepthFirstIterator<>(labelStatement.getCFG());
		branchAddress = -1;
		
		while(iter.hasNext()) {
			LabelBlockStatement labelBlockStatement = iter.next();
			alreadyVisited.add(labelBlockStatement.getAddress());
			labelBlockStatement.accept(this);

			// Saving the current stage if there is more than one successor.
			if (labelStatement.getCFG().outDegreeOf(labelBlockStatement) > 1 && !alreadyVisited.contains(branchAddress)) {
				writtenRegsStack.push(new TreeSet<>(writtenRegs));
				TreeMap<Integer, TreeSet<Integer>> tmp = new TreeMap<>();
				for (Integer key : parameterMap.keySet()) {
					tmp.put(key.intValue(), new TreeSet<Integer>(parameterMap.get(key)));
				}
				parameterMapStack.push(tmp);
			}
			
			// Reset the stage for subsequent subgraphs
			// if their is no successor.
			if (iter.hasNext()) {
				if(labelStatement.getCFG().outDegreeOf(labelBlockStatement) == 0
						// Jump to an already encountered block.
						|| alreadyVisited.contains(branchAddress)
						|| (branchAddress != -1 && alreadyVisited.contains(labelBlockStatement.getAddress()+8))) {
					if (!writtenRegsStack.isEmpty() && !parameterMapStack.isEmpty()) {
						writtenRegs = writtenRegsStack.pop();
						parameterMap = parameterMapStack.pop();
					}
					
				}
			} 
			branchAddress = -1;
		}
		
		// Ensure that all parameters are on the correct position in the parameter array.
		LinkedList<Integer> nullIndex = new LinkedList<Integer>();
		for (int i = 0; i < parameters.length; i++) {
			if (parameters[i] == null) {
				nullIndex.add(i);
				continue;
			}
			if (!nullIndex.isEmpty()) {
				for (Integer integer : nullIndex) {
					parameters[integer] = Type.UNKNOWN;
				}
			}
			
		}
		parameters = Arrays.stream(parameters).filter(s -> (s != null)).toArray(Type[]::new);
		
		
		
		labelStatement.setParameters(parameters);
		
	}

	@Override
	public void visit(LabelBlockStatement blockStatement) {
		for (ExpressionStatement expStmt : blockStatement.getExpStmts()) {
			expStmt.accept(this);
		}
	}

	@Override
	public void visit(ExpressionStatement s) {
		s.getExpression().accept(this);
		previousInstruction = s.getExpression().getInstruction().getKind();
	}

	@Override
	public void visit(TernaryExpression e) {
		TokenKind kind = e.getInstruction().getKind();
		Type type = null;
		switch (kind) {
		case BEQ:
		case BNE:
			e.getE1().accept(this);
			if (addParameter(currentRegister) && parameters[currentRegister - 4] == null) {
				parameters[currentRegister - 4] = Type.VALUE;
			}
			e.getE2().accept(this);
			if (addParameter(currentRegister) && parameters[currentRegister - 4] == null) {
				parameters[currentRegister - 4] = Type.VALUE;
			}
			branchAddress = Integer.parseInt(((PrimaryExpression) e.getE3()).getInstruction().getText(), 16);
			break;
		
		case ANDI:case OR:case XOR:case DIV:
		case SLL:case SRL:case MULT: case SUBU:
		case SLTI: case SLT:
			type = Type.VALUE;
			
		default:
			// Is one of the loaded register a parameter?
			int p = -1;
			if (!kind.isImmediateInstruction()) {
				e.getE3().accept(this);
				if (addParameter(currentRegister) && parameters[currentRegister - 4] == null) {
					parameters[currentRegister - 4] = type != null ? type : Type.UNKNOWN;
				}
				if (currentRegister == 0) {
					p = 0;
				}
				for (TreeSet<Integer> set : parameterMap.values()) {
					if (set.contains(currentRegister)) {
						p = currentRegister;
						break;
					}
				}
				
				// Check for return value.
				if (previousFunctionCall != null && previousInstruction == TokenKind.JAL && currentRegister == 2) {
					// Check for return type.
					Type returnType = Type.INTEGER;
					for (LabelStatement stmt : labelStmts) {
						if (stmt.getName().equals(previousFunctionCall)) {
							stmt.setReturnType(returnType);
						}
					}
					previousFunctionCall = null;
				}
			}
			e.getE2().accept(this);
			if (addParameter(currentRegister) && parameters[currentRegister - 4] == null) {
				parameters[currentRegister - 4] = type != null ? type : Type.UNKNOWN;
			}
			if (p == 0 && parameterMap.containsValue(currentRegister)) {
				p = currentRegister;
			} else if(currentRegister != 0) {
				p = -1;
			}
			
			// Check for return value.
			if (previousFunctionCall != null && previousInstruction == TokenKind.JAL && currentRegister == 2) {
				// Check for return type.
				Type returnType = Type.INTEGER;
				for (LabelStatement stmt : labelStmts) {
					if (stmt.getName().equals(previousFunctionCall)) {
						stmt.setReturnType(returnType);
					}
				}
				previousFunctionCall = null;
			}

			e.getE1().accept(this);
			writtenRegs.add(currentRegister);
			// Is the parameter's value copied?
			for (Integer key : parameterMap.keySet()) {
				parameterMap.get(key).remove(currentRegister);
				if (p != -1 && parameterMap.get(key).contains(p)) {
					addRegToMap(key, currentRegister);
				}
			}

			break;
		}
	}

	@Override
	public void visit(BinaryExpression e) {
		e.getE2().accept(this);
		if (mapContainsParam(currentRegister) || !writtenRegs.contains(currentRegister)) {
			addParameter(currentRegister);
			for (Integer key : parameterMap.keySet()) {
				if (parameterMap.get(key).contains(currentRegister)) {
					parameters[key - 4] = Type.POINTER;
				}
			}
		}
		e.getE1().accept(this);
		if (e.getInstruction().getKind().isLoadInstruction()) {
			writtenRegs.add(currentRegister);
			for (Integer key : parameterMap.keySet()) {
				parameterMap.get(key).remove(currentRegister);
			}
		} else if (addParameter(currentRegister) && parameters[currentRegister - 4] == null) {
			parameters[currentRegister - 4] = Type.VALUE;
		} else if (previousFunctionCall != null && previousInstruction == TokenKind.JAL && currentRegister == 2) {
			// Check for return type.
			Type returnType = Type.VOID;
			switch (e.getInstruction().getKind()) {
			case SW:
				returnType = Type.INTEGER;
				break;
			case SB:
				returnType = Type.BYTE;
				break;

			default:
				break;
			}
			for (LabelStatement stmt : labelStmts) {
				if (stmt.getName().equals(previousFunctionCall)) {
					stmt.setReturnType(returnType);
				}
			}
			previousFunctionCall = null;
		}
	}

	@Override
	public void visit(UnaryExpression e) {
		switch (e.getInstruction().getKind()) {
		case NUMBER:
		case MINUS:
		case DOLLAR:
			e.getExpression().accept(this);
			break;
		
		case J:
			branchAddress = Integer.parseInt(e.getExpression().getInstruction().getText(), 16);
			break;
		
		case JAL:
			previousFunctionCall = ((PrimaryExpression) e.getExpression()).getLabel().getText();
			break;
		default:
			break;
		}

	}

	@Override
	public void visit(PrimaryExpression e) {
		if (e.isRegister()) {
			currentRegister = Integer.parseInt(e.getInstruction().getText());
		} else {
			currentRegister = -1;
		}
	}

	@Override
	public void visit(EmptyStatement s) {
		return;
	}

	@Override
	public void visit(AtomicExpression atomicExpression) {
		return;
	}

	/**
	 * Adds the register to the map.
	 * 
	 * @param key
	 *            - The function parameter register.
	 * @param reg
	 *            - The register that contains the value. Both can be the same
	 *            register.
	 */
	private void addRegToMap(int key, int reg) {
		// if (!parameterMap.containsKey(key)) {
		// parameterMap.put(key, new TreeSet<>());
		// }
		parameterMap.get(key).add(reg);
	}

	/**
	 * Adds the register to the map.
	 * 
	 * @param key
	 *            - The function parameter register.
	 */
	private void addRegToMap(int key) {
		// if (!parameterMap.containsKey(key)) {
		// parameterMap.put(key, new TreeSet<>());
		// }
		addRegToMap(key, key);
	}

	/**
	 * Checks whether the register is a function parameter register ($4-$7) or
	 * not.
	 * 
	 * @return True or false.
	 */
	public static boolean isParameterRegister(int reg) {
		return (reg < 8 && reg > 3);
	}

	/**
	 * Check's whether the register contains a parameter and adds it to the map.
	 * 
	 * @param reg
	 *            - The register to be marked as a parameter.
	 */
	private boolean addParameter(int reg) {
		boolean res = false;
		if (isParameterRegister(reg) && !writtenRegs.contains(reg)) {
			addRegToMap(reg);
			res = true;
		}
		return res;
	}

	private boolean mapContainsParam(int param) {
		for (Integer key : parameterMap.keySet()) {
			if (parameterMap.get(key).contains(param)) {
				return true;
			}
		}
		return false;
	}
	
	
}
