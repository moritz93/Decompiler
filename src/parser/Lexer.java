package parser;

import java.awt.Point;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

/**
 * The Lexer to read in the SimpleScalar code.
 * 
 * @author Mo
 *
 */
public class Lexer {

	/**
	 * The token's current location.
	 */
	private int currentRow;
	private int currentColumn;

	/**
	 * The read in character's current location.
	 */
	private int startRow;
	private int startColumn;

	private final Reader reader;

	/**
	 * The current character being parsed.
	 */
	private int c = '\f';

	/**
	 * The previous character.
	 */
	private int previous = '\f';

	private final Map<String, TokenKind> keywords = new HashMap<String, TokenKind>();

	public Lexer(final Reader reader) {

		this.reader = reader;
		currentRow = 0;
		currentColumn = 0;

		for (final TokenKind t : TokenKind.values()) {
			final String text = t.getText();
			if (Character.isJavaIdentifierStart(text.charAt(0))) {
				keywords.put(text, t);
			}
		}

	}

	private void nextChar() {
		try {
			previous = c;
			c = reader.read();
		} catch (final IOException e) {
			throw new Error(e);
		}
		currentColumn++;
	}

	private Token makeToken(final TokenKind kind) {
		nextChar();
		return new Token(currentColumn, currentRow, kind);
	}

	/**
	 * Identifies, creates and returns the next token in the input stream
	 * 
	 * @return The next token in the input stream
	 */
	public Token nextToken() {
		while (true) {
			startRow = currentRow;
			startColumn = currentColumn;
			switch (c) {
			case -1:
				return new Token(startColumn, startRow, TokenKind.EOF);

			case '\r':
			case '\n':
				
				if (previous != ':' && previous != '\n' && currentRow % 2 > 0) {
					do {
						nextChar();
					} while (c!= -1 && c != '\n');
					currentRow++;
				}
				
				currentRow++;
				currentColumn = 0;

				return makeToken(TokenKind.NEWLINE);

			case '\t':
				do {
					nextChar();
					currentColumn++;
				} while (c != '\t');
				break;
				
			case '\f':
				break;
			case ' ':
			case '_':
				break;

			case '(':
				return makeToken(TokenKind.LPAREN);
			case ')':
				return makeToken(TokenKind.RPAREN);
			case ',':
				return makeToken(TokenKind.COMMA);
			case ':':
				return makeToken(TokenKind.COLON);

			// Register
			case '$':
				return makeToken(TokenKind.DOLLAR);

			case '-':
				return makeToken(TokenKind.MINUS);

			// Label offset.
			case '+':
				return makeToken(TokenKind.PLUS);

			// Label
			case '<':
				final StringBuilder label_sb = new StringBuilder();
				nextChar();
				boolean complete = false;
				while (c != '>') {
					// Parse only label name without offset.
					if (c == '+') {
						complete = true;
					}
					if (!complete && Character.isLetterOrDigit(c)) {
						label_sb.append((char) c);
					}
					nextChar();
				}
				nextChar();
				return new Token(label_sb.toString(), startColumn, startRow, TokenKind.LABEL);

			default:
				boolean isNumber = true;
				final StringBuilder sb = new StringBuilder();
				if (!Character.isLetterOrDigit(c)) {
					return new Token(startColumn, startRow, TokenKind.ERROR);
				}
				sb.append((char) c);
				if (!Character.isDigit(c)) {
					isNumber = false;
				}
				nextChar();
				if (sb.charAt(0) == '0' && c == 'x') {
					// Hexadecimal value
					sb.delete(0, 0);
					nextChar();
					while (Character.isLetterOrDigit(c)) {
						sb.append((char) c);
						nextChar();
					}
					return new Token(sb.toString(), startColumn, startRow, TokenKind.HEXA);
				}
				while (Character.isLetterOrDigit(c)) {
					if (!Character.isDigit(c)) {
						isNumber = false;
					}
					sb.append((char) c);
					nextChar();
				}
				if (isNumber && sb.length() < 6) {
					return new Token(sb.toString(), startColumn, startRow, TokenKind.NUMBER);
				}

				final String text = sb.toString();
				final TokenKind idKind = keywords.get(text);
				return new Token(text, currentColumn, currentRow, idKind != null ? idKind : TokenKind.ADDRESS);

			}
			nextChar();
		}

	}

	public Point getCurrentLocation() {
		return new Point(currentColumn, currentRow);
	}

	/*
	 * Can be used to get rid of the encoded instruction representation.
	 * 
	 * @param filePath
	 * 
	 * @throws FileNotFoundException
	 * 
	 * @throws IOException
	 *
	 * private void formateFileInput(String filePath) throws
	 * FileNotFoundException, IOException {
	 * 
	 * // Read SimpleScalar code from file. try (BufferedReader br = new
	 * BufferedReader(new FileReader(filePath))) { StringBuilder sb = new
	 * StringBuilder(); String line = br.readLine(); while (line != null) {
	 * sb.append(line);
	 * 
	 * if (Character.isWhitespace(sb.charAt(0))) { // Deletes the 22 if
	 * (sb.length() == 22 || sb.length() == 21) { sb = new StringBuilder(); line
	 * = br.readLine(); continue; } else { sb.delete(10, 23); } } line =
	 * sb.toString();
	 * 
	 * sb = new StringBuilder(); line = br.readLine(); } } }
	 */
}
