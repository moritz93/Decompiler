package semantics.statement;

import java.awt.Point;

import main.Visitor;

/**
 * Represents an empty line.
 * @author Mo
 *
 */
public class EmptyStatement extends Statement {

	public EmptyStatement(Point location) {
		super(location, null);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "\n";
	}
	
	@Override
	public void accept(Visitor v) {
		v.visit(this);
	}

}
