package parser;

/**
 * Represents a single token.
 * It contains the location and the text of a single token.
 * @author Mo
 */
public class Token {

	/**
	 * The origin text input.
	 */
	private final String text;
	
	/**
	 * The location of the text in the file.
	 */
	private final int row;
	
	/**
	 * The location of the text in the file.
	 */
	private final int column;
	
	/**
	 * The token's kind.
	 */
	private final TokenKind kind;

	
	/**
	 * Constructor
	 * @param text - origin input
	 * @param location (row and column)
	 */
    public Token(String text, int column, int row, TokenKind kind) {
    	this.text = text;
    	this.column = column;
    	this.row = row;
    	this.kind = kind;
    }
    
    public Token(int column, int row, final TokenKind kind) {
    	this(kind.getText(), column, row, kind);
	}
    
    @Override
	public String toString() {
		return text;
	}

	public String getText() {
		return text;
	}

	public int getRow() {
		return row;
	}

	public int getColumn() {
		return column;
	}

	public TokenKind getKind() {
		return kind;
	}
}
