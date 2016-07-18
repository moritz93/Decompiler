package semantics.statement;

import java.awt.Point;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import main.Visitor;
import semantics.Type;
import semantics.expression.UnaryExpression;

public class LabelBlockStatement extends Statement {

	private final LinkedList<ExpressionStatement> expStmts;
	private final int blockEndAddress;
	
	private final int labelNum; 
	
	private final Set<Integer> writtenRegisters;
	private final Set<Integer> loadedRegisters;
	private Map<Integer, LinkedHashSet<Integer>> predecessors = new LinkedHashMap<>();
	private Map<Integer, Type> phiInstructionTypes = new HashMap<>();
//	private LinkedList<String> phiInstructions = new LinkedList<>();
	private LinkedList<Point> phiBackJumpCases = new LinkedList<>();
	
	public LabelBlockStatement(Point location, int address, int blockEndAddress, LinkedList<ExpressionStatement> expStmts, int labelNum) {
		super(location, address);
		this.blockEndAddress = blockEndAddress;
		this.expStmts = new LinkedList<>(expStmts);
		this.labelNum = labelNum;
		this.writtenRegisters = new TreeSet<>();
		this.loadedRegisters = new TreeSet<>();
		for (ExpressionStatement expStmt : expStmts) {
			int reg = ExpressionStatement.getResultRegister(expStmt.getExpression());
			if (reg != -1) {
				writtenRegisters.add(reg);
			}
			for (Integer r : ExpressionStatement.getLoadRegisters(expStmt.getExpression()).keySet()) {
				if (r != - 1) {
					loadedRegisters.add(r);
				}
			}
		}
		
	}
	
	public String toString(boolean simple) {
		String res = "\n" + "Label-" + labelNum + ":\n";
		for (ExpressionStatement expressionStatement : expStmts) {
			res += " " + expressionStatement.toString() + "\n";
		}
		return res;
	}
	
	@Override
	public String toString() {
		return getLabelNum() + "";
	}

	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}
	
	public void addExpStmt(ExpressionStatement eStmt) {
		expStmts.add(eStmt);
	}
	
	public LinkedList<ExpressionStatement> getExpStmts() {
		return expStmts;
	}

	public int getLabelNum() {
		return labelNum;
	}

	public int getBlockEndAddress() {
		return blockEndAddress;
	}

	/**
	 * Returns all registers inside this label block where their content is modified.
	 * Registers written through PHI instructions are coped, too.
	 * @return Set of integer in ascending order representing the registers.
	 */
	public Set<Integer> getWrittenRegisters() {
		TreeSet<Integer> tmp = new TreeSet<>();
		for (Integer phiReg : predecessors.keySet()) {
			if (predecessors.get(phiReg).size() > 1) {
				tmp.add(phiReg);
			}
		}
		tmp.addAll(writtenRegisters);
		return tmp;
	}
	
	/**
	 * Adds a predecessor (@LabelBlockStatement) to a register.
	 * @param key representing register
	 * @param pred given by the @LabelBlockStatement label number.
	 */
	public void addPredecessor(int key, int pred) {
		if (!predecessors.containsKey(key)) {
			predecessors.put(key, new LinkedHashSet<Integer>());			
		}
		predecessors.get(key).add(pred);
	}
	
	/**
	 * Returns the predecessors where the given register was written before.
	 * @param register
	 * @return predecessors
	 */
	public Set<Integer> getPredecessors(int register) {
		if (predecessors.containsKey(register)) {
			return predecessors.get(register);
			
		}
		return null;
	}
	
	public Map<Integer, LinkedHashSet<Integer>> getPredecessorMap() {
		return predecessors;
	}
	
	public void addPhiType(UnaryExpression e) {
		phiInstructionTypes.put(e.getRegister(), e.getType());
	}
	
	public Type getPhiType(int r) {
		return phiInstructionTypes.get(r);
	}
	
//	public void addPhiInstruction(String instruction) {
//		phiInstructions.add(instruction);
//	}
//	
//	public LinkedList<String> getPhiInstructions() {
//		return phiInstructions;
//	}
	
	public void addBackJump(Point regAndBlock) {
		phiBackJumpCases.add(regAndBlock);
	}
	
	public LinkedList<Point> getBackJumpCases() {
		return phiBackJumpCases;
	}

	public Set<Integer> getLoadedRegisters() {
		return loadedRegisters;
	}
	
	public boolean isPredecessor(int reg, int blockNum) {
		Set<Integer> blocks = predecessors.get(reg);
		if (blocks != null) {
			return predecessors.get(reg).contains(blockNum);
		}
		return false;
	}
}
