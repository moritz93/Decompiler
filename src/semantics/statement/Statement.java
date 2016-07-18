package semantics.statement;

import java.awt.Point;

import main.Visitor;

/**
 * Represents a statement which can be a label or an instruction (e.g. ADDIU).
 * @author Mo
 *
 */
public abstract class Statement {

	/**
	 * Location of statement
	 */
	protected Point location;
	
	/**
	 * The memory address of the statement each instruction of a SimpleScalar code has.
	 */
	protected int address;
	
	/**
	 * The LLVM translation of the SimpleScalar statement.
	 */
	protected String translation;
	
	public Statement(Point location, String address) {
		this.location = location;
		this.address = Integer.parseInt(address, 16);
	}
	
	public Statement(Point location, int address) {
		this.location = location;
		this.address = address;
	}

	public Point getLocation(){
		return location;
	}
	
	@Override
	public abstract String toString();
	
	public abstract void accept(Visitor v);
	
	public void setTranslation(String code) {
		translation = code;
	}
	
	public String getTranslation() {
		return translation;
	}
	
	public int getAddress() {
		return address;
	}
}
