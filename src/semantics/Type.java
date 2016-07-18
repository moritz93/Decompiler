package semantics;

/**
 * Representing the type of an expression.
 * @author Mo
 *
 */
public enum Type {
	BREAK("break"),
	VOID("void"),
	POINTER("i8*"),
	JUMP("<i8*"),
	VALUE("i32"),
	BIT("i1"),
	BYTE("i8"),
	SHORT("i16"),
	INTEGER("i32"),
	UNKNOWN("i32"); // Treated as VALUE. In case of LUI without address.
	
	
	
	
	private final String text;
	
	Type(final String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}
	public boolean isValue() {
		boolean res = false;
		switch (this) {
		case INTEGER:
		case SHORT:
		case BYTE:
		case VALUE:
		case BIT:
			res = true;
			break;
		default:
			break;
		}
		return res;
	}
	
	public static Type maxBitSize(Type a, Type b) {
		if (a == Type.VALUE && b == Type.VALUE) {
			return Type.INTEGER;
		} else if (a.ordinal() > b.ordinal()) {
			return a;
		}
		return b;
	}
	
	public static Type minBitSize(Type a, Type b) {
		if (a == Type.VALUE && b == Type.VALUE) {
			return Type.INTEGER;
		} else if (a.ordinal() < b.ordinal()) {
			return a;
		}
		return b;
	}
}


