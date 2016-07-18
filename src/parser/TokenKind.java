package parser;

/**
 * All token kinds a SimpleScalar code can consist of.
 * @author Mo
 *
 */
public enum TokenKind {

	EOF("<end of file>"),
	ERROR("<error>"),
	NEWLINE("<newline>"),
	
	NUMBER("<number>"),
	LABEL("<label>"),
	ADDRESS("<address>"),

	// Symbols
	DOLLAR("$"),
	MINUS("-"),
	PLUS("+"),
	LPAREN("("),
	RPAREN(")"),
	LARROW("<"),
	RARROW(">"),
	COMMA(","),
	COLON(":"),
	HEXA("0x<hexcode>"),
	UNDERSCORE("__"),
	
	
	// Ternary operators
	ADDIU("addiu"),
	ADDU("addu"),
	SLL("sll"),
	SRL("srl"),
	XOR("xor"),
	OR("or"),
	ANDI("andi"),
	MULT("mult"),
	DIV("div"),
	SUBU("subu"),
	SLTI("slti"),
	SLT("slt"),
	BNE("bne"),
	BEQ("beq"),
	
	// Jump and branch
	JAL("jal"),
	J("j"),
	JR("jr"),
	
	// Memory/Binary operators
	SW("sw"),
	SB("sb"),
	SWL("swl"),
	SWR("swr"),
	LW("lw"),
	LUI("lui"),
	LBU("lbu"),
	LHU("lhu"),
	LWL("lwl"),
	LWR("lwr"),
	
	// Special instructions
	MFLO("mflo"),
	MFHI("mfhi"),
	BREAK("break");
	
	private final String text;
	
	TokenKind(final String text) {
		this.text = text;
	}
	
	/**
	 * Returns the textual representation of this token type.
	 * @return The textual representation of this token type.
	 */
	@Override
	public String toString() {
		return text;
	}

	public String getText() {
		return text;
	}
	
	public boolean isLoadInstruction() {
		switch (this) {
		case LW: case LWR: case LWL: case LHU: case LBU: case LUI:
			return true;

		default:
			break;
		}
		return false;
	}
	
	public boolean isImmediateInstruction() {
		switch (this) {
		case ADDIU: case ANDI: case SLTI:
			return true;
		default:
			break;
		}
		return false;
	}
	
	public boolean isBranchInstruction() {
		switch (this) {
		case BNE: case BEQ:
			return true;
		default:
			break;
		}
		return false;
	}
	
	public boolean isSetInstruction() {
		switch (this) {
		case SLTI: case SLT:
			return true;
		default:
			break;
		}
		return false;
	}
}