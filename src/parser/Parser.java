package parser;

import java.awt.Point;
import java.util.LinkedHashMap;
import java.util.LinkedList;

import semantics.AST;
import semantics.Type;
import semantics.expression.AtomicExpression;
import semantics.expression.BinaryExpression;
import semantics.expression.Expression;
import semantics.expression.PrimaryExpression;
import semantics.expression.TernaryExpression;
import semantics.expression.UnaryExpression;
import semantics.statement.ExpressionStatement;
import semantics.statement.LabelBlockStatement;
import semantics.statement.LabelStatement;

/**
 * The parser which constructs the semantic tree with the information given by
 * the lexer.
 * 
 * @author Mo
 *
 */
public class Parser {
	private final Lexer lexer;
	private final AST semanticTree;

	/**
	 * The current token.
	 */
	private Token token;

	/**
	 * The next token after the current one.
	 */
	private Token nextToken;

	private Point errorLocation;
	
	private LinkedHashMap<LabelStatement, LinkedList<ExpressionStatement>> blocks;

	/**
	 * Initializes a new parser.
	 * 
	 * @param lexer
	 *            The lexer to use.
	 * @see Lexer
	 */
	public Parser(final AST semanticTree, final Lexer lexer) {
		this.semanticTree = semanticTree;
		this.lexer = lexer;
		blocks = new LinkedHashMap<>();
		// Initialize current token and look ahead.
		nextToken();
		nextToken();
	}

	/**
	 * Parses this translation unit, represented by @LabelStatement.
	 */
	public LinkedHashMap<LabelStatement, LinkedList<ExpressionStatement>> parseTranslationUnit() {
		while (token.getKind() != TokenKind.EOF) {
			LabelStatement stmt = parseLabelStatement();
			if (stmt == null || errorLocation != null) {
				System.err.println("Error occured. Fix code and try again.\n" + errorLocation + "\n");
				return null;
			}

			if (!expected(TokenKind.NEWLINE, TokenKind.EOF)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Newline is missing.\n" + errorLocation);
				return null;
			}
			semanticTree.addStmt(stmt);
			if (token.getKind() == TokenKind.EOF) {
				return blocks;
			}
			nextToken();
		}
		return blocks;
	}

	// -------------- Internal methods of the parser --------------
	private boolean expected(TokenKind... kind) {
		for (int i = 0; i < kind.length; i++) {
			if (nextToken.getKind() == kind[i]) {
				nextToken();
				return true;
			}
		}
		errorLocation = lexer.getCurrentLocation();
		System.err.println("Expected " + kind[0] + ", but got " + nextToken.getKind() + ".\n" + errorLocation + "\n");
		return false;

	}

	private void nextToken() {
		token = nextToken;
		nextToken = lexer.nextToken();
	}

	/**
	 * Parsing one block of statements given by a label statement.
	 * 
	 * @return The label statement parsed.
	 */
	private LabelStatement parseLabelStatement() {
		String name;
		String address;
		LabelStatement stmt;
		
		// Get the address of the label statement.
		if (token.getKind() != TokenKind.ADDRESS) {
			System.err.println("Expected statement, but got: " + token + "\n");
			errorLocation = lexer.getCurrentLocation();
			System.err.println("Error occurred in line " + errorLocation.y + ", column " + errorLocation.x + "\n");
			return null;
		}
		address = token.getText();
		
		// Get the label name of the label statement.
		if (!expected(TokenKind.LABEL)) {
			errorLocation = lexer.getCurrentLocation();
			System.err.println("Label missing.\n" + errorLocation + "\n");
			return null;
		}
		name = token.getText();
		
		// Check syntax.
		if (!expected(TokenKind.COLON)) {
			errorLocation = lexer.getCurrentLocation();
			System.err.println("Colon missing.\n" + errorLocation + "\n");
			return null;
		}
		if (!expected(TokenKind.NEWLINE)) {
			errorLocation = lexer.getCurrentLocation();
			System.err.println("Newline missing.\n" + errorLocation + "\n");
			return null;
		}
		
		// Parse the block of expression statements.
		LinkedList<ExpressionStatement> expressionStatements = parseExpressionStmts();
		stmt = new LabelStatement(lexer.getCurrentLocation(), address, name, new LinkedList<LabelBlockStatement>());
		blocks.put(stmt, expressionStatements);
		// Reset parameter counter for the next LabelStatement.
		return stmt;
	}

	private LinkedList<ExpressionStatement> parseExpressionStmts() {
		LinkedList<ExpressionStatement> stmts = new LinkedList<ExpressionStatement>();
		
		// Add all expression statements to the label statement. A block ends with EOF or a EMPTYLINE.
		while (nextToken.getKind() != TokenKind.EOF && nextToken.getKind() != TokenKind.NEWLINE) {
			if (!expected(TokenKind.ADDRESS)) {
				errorLocation = lexer.getCurrentLocation();
				System.err.println("Address missing.\n" + errorLocation + "\n");
				return null;
			}
			String address = token.getText();
			if (!expected(TokenKind.COLON)) {
				errorLocation = lexer.getCurrentLocation();
				System.err.println("Colon missing.\n" + errorLocation + "\n");
				return null;
			}
			nextToken();
			
			ExpressionStatement stmt = new ExpressionStatement(lexer.getCurrentLocation(), address, parseExpression());
			stmts.add(stmt);
			
			// After each expression has to be a newline.
			if (!expected(TokenKind.NEWLINE, TokenKind.EOF)) {
				errorLocation = lexer.getCurrentLocation();
				System.err.println("Newline missing.\n" + errorLocation + "\n");
				return null;
			}
//			if (token.getKind() == TokenKind.EOF) {
//				Translator.addressRange = stmt.getAddress();
//			}
			
		}
		
		return stmts;
	}

	private Expression parseExpression() {
		Expression e;
		switch (token.getKind()) {
		case ADDIU:
		case ADDU:
			
		case SLL:
		case SRL:
		case XOR:
		case OR:
		case ANDI:
		case DIV:
		case SUBU:
			
		case SLTI:
		case SLT:
			
		case BNE:
		case BEQ:
		
			e = parseTernaryExpression();
			break;

		case SW:
		case SB:
		case SWL:
		case SWR:
			
		case LW:
		case LHU:
		case LBU:
		case LUI:
		case LWL:
		case LWR:
		
		case MULT:
			e = parseBinaryExpression();
			break;

		case JAL:
		case J:
		case JR:
		case MFLO:
		case MFHI:
			e = parseUnaryExpression();
			break;

		case BREAK:
			e = new AtomicExpression(token, null);
			break;
			
		default:
			errorLocation = lexer.getCurrentLocation();
			System.out.println("No such instruction.\n" + errorLocation);
			return null;
		}
		return e;
	}

	/**
	 * Parse unary instruction.
	 * 
	 * @return UnaryExpression
	 * @see UnaryExpression
	 */
	private UnaryExpression parseUnaryExpression() {
		Expression e;
		Token t = token;
		switch (t.getKind()) {
		case JAL:
		case J:
			if (!expected(TokenKind.ADDRESS)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			Token address = token;
			if (!expected(TokenKind.LABEL)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Label is missing.\n" + errorLocation);
				return null;
			}
			// Check whether it is a function call or not.
			if (t.getKind() == TokenKind.JAL) {
				e = new PrimaryExpression(address, Type.VALUE, false, token);
			} else {
				e = new PrimaryExpression(address, Type.VALUE, false, null);
			}
			break;

		case JR:
		case MFLO:
		case MFHI:
			if (!expected(TokenKind.DOLLAR)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			e = parseUnaryExpression();
			break;
			
		case DOLLAR:
			if (!expected(TokenKind.NUMBER)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			// TODO type = null
			e = new PrimaryExpression(token, null, true, null);
			break;

		case NUMBER:
			if (!expected(TokenKind.LPAREN)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			nextToken();
			e = parseUnaryExpression();
			if (!expected(TokenKind.RPAREN)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			break;

		case MINUS:
			if (!expected(TokenKind.NUMBER)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Not a valid address.\n" + errorLocation);
				return null;
			}
			// Minus offset
			e = parseUnaryExpression();
			break;

		default:
			errorLocation = lexer.getCurrentLocation();
			System.out.println("Unknown UnaryExpression.\n" + errorLocation);
			return null;
		}

		return new UnaryExpression(t, null, e);
	}

	/**
	 * Parses binary expression.
	 * 
	 * @return BinaryExpression
	 * @see BinaryExpression
	 */
	private BinaryExpression parseBinaryExpression() {
		Token t = token;
		nextToken();
		UnaryExpression e1 = parseUnaryExpression();
		if (!expected(TokenKind.COMMA)) {
			errorLocation = lexer.getCurrentLocation();
			System.out.println("Comma missing.\n" + errorLocation);
			return null;
		}
		nextToken();
		Expression e2 = null;
		switch (t.getKind()) {
		case SW:
		case SB:
		case SWL:
		case SWR:
		case LWL:
		case LWR:
		case LW:
		case LBU:
		case LHU:
		case MULT:
		case DIV:
			e2 = parseUnaryExpression();
			break;

		case LUI:
			e2 = new PrimaryExpression(token, null, false, null);
			break;
							
		default:
			break;
		}
		
		// TODO type = null
		return new BinaryExpression(t, Type.POINTER, e1, e2);
	}

	/**
	 * Parses ternary expression.
	 * 
	 * @return TernaryExpression
	 * @see TernaryExpression
	 */
	private TernaryExpression parseTernaryExpression() {
		Token t = token;
		nextToken();
		Expression e1 = parseUnaryExpression();
		if (!expected(TokenKind.COMMA)) {
			errorLocation = lexer.getCurrentLocation();
			System.out.println("Comma missing.\n" + errorLocation);
			return null;
		}
		nextToken();
		Expression e2 = parseUnaryExpression();
		if (!expected(TokenKind.COMMA)) {
			errorLocation = lexer.getCurrentLocation();
			System.out.println("Comma number missing.\n" + errorLocation);
			return null;
		}
		nextToken();
		Expression e3;
		Token t1 = token;
		switch (token.getKind()) {
		case MINUS:
		case DOLLAR:
			if (!expected(TokenKind.NUMBER)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Number expected.\n" + errorLocation);
				return null;
			}
			e3 = new UnaryExpression(t1, null, new PrimaryExpression(token, Type.POINTER, true, null));
			break;

		case NUMBER:
		case HEXA:
			e3 = new PrimaryExpression(t1, Type.VALUE, false, null);
			break;
		
		case ADDRESS:
			if (!expected(TokenKind.LABEL)) {
				errorLocation = lexer.getCurrentLocation();
				System.out.println("Label expected.\n" + errorLocation);
				return null;
			}
			e3 = new PrimaryExpression(t1, Type.VALUE, false, null);
			break;

		default:
			errorLocation = lexer.getCurrentLocation();
			System.out.println("Third argument incorrect.\n" + errorLocation);
			return null;
		}
		// TODO type = null
		return new TernaryExpression(t, null, e1, e2, e3);
	}
}
