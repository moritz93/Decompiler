package translation;

public class LLVMcodeGenerator {
		
	/**
	 * Returns a store statement.
	 * @param source
	 * @param destination
	 * @return
	 */
	public static String storeStmt(int source, String type, int destination) {
		return "store " + type + " %" + source + ", " + type + "* %" + destination;
	}
	
	/**
	 * Stores value 0 to the given destination.
	 * @param type
	 * @param destination
	 * @return
	 */
	public static String storeStmtZero(String type, int destination) {
		return "store " + type + " 0, " + type + "* %" + destination;
	}
	
	/**
	 * 
	 * @param source
	 * @param type
	 * @param destination
	 * @return
	 */
	public static String storeToGlobalStmt(int source, String type, String destination) {
		return "store " + type + " %" + source + ", " + type + "* " + destination;
	}
	
	/**
	 * Returns a load statement.
	 * @param source
	 * @return
	 */
	public static String loadStmt(int index, String type, int source) {
		return "%" + index +  " = load " + type + " %" + source;//TODO + ", align 4";
	}
	
	/**
	 * Returns a load from global statement.
	 * @param source
	 * @return
	 */
	public static String loadGlobalStmt(int index, String source) {
		return "%" + index +  " = load i32* @" + source + ", align 4" ;
	}
	
	/**
	 * Returns a getelementptr statement considering whether it's a global or local address which is loaded.
	 * @param index
	 * @param type
	 * @param address
	 * @param offset
	 * @return
	 */
	public static String getElementPtr(int index, String type, String register, String offset, String oType) {
		return "%" + index +  " = getelementptr inbounds " + type + " %" + register + ", " + oType + " " + offset;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param register
	 * @param offset
	 * @param oType
	 * @return
	 */
	public static String getElementPtrReg(int index, String type, String register, String offset, String oType) {
		return "%" + index +  " = getelementptr inbounds " + type + " %" + register + ", " + oType + " " + (offset.equals("0") ? offset : "%" + offset);
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param register
	 * @param start
	 * @param end
	 * @return
	 */
	public static String getElementPtr(int index, String type, int register, String start, String end) {
		return "%" + index +  " = getelementptr inbounds " + type + " %" + register + ", i32 " + start + ", i32 " + end;
	}
	
	/**
	 * 
	 * @param index
	 * @param sourceType
	 * @param source
	 * @param destinationType
	 * @return
	 */
	public static String castStmt(int index, String sourceType, int source, String destinationType) {
		return "%" + index +  " = bitcast " + sourceType + " %" + source + " to " + destinationType;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String addStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = add nsw " + type + " " +  (op1.equals("-10") ? "0" : "%" + op1) + ", " + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String addStmtReg(int index, String type, String op1, String op2) {
		return "%" + index +  " = add nsw " + type + " " + (op1.equals("-10") ? "0" : "%" + op1) + ", " + (op2.equals("-10") ? "0" : "%" + op2);
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String shiftLeftStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = shl " + type + " %" + op1 + ", " + Integer.parseInt(op2, 16);
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String shiftRightStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = lshr " + type + " %" + op1 + ", " + Integer.parseInt(op2, 16);
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String mulStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = mul " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String orStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = or " + type + " %" + op1 + ", " + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String xorStmtReg(int index, String type, String op1, String op2) {
		return "%" + index +  " = xor " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String andStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = and " + type + " %" + op1 + ", " + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String divStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = sdiv " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String remStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = srem " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String subStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = sub " + type + " %" + op1 + ", %" + op2;
	}
	/**
	 * 
	 * @param index
	 * @param type
	 * @param register
	 * @param value
	 * @return res
	 */
	public static String andStmtReg(int index, String type, String op1, String op2) {
		return "%" + index +  " = and " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param reg1
	 * @param reg2
	 * @return
	 */
	public static String orStmtReg(int index, String type, int op1, int op2) {
		return "%" + index +  " = or " + type + " %" + op1 + ", %" + op2;
	}
	
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String orStmtReg(int index, String type, String op1, String op2) {
		return orStmtReg(index, type, Integer.parseInt(op1), Integer.parseInt(op2));
	}
	/**
	 * 
	 * @param index
	 * @param type
	 * @param op1
	 * @param op2
	 * @return
	 */
	public static String SLTIStmt(int index, String type, String op1, String op2) {
		return "%" + index +  " = shl " + type + " %" + op1 + ", " + Integer.parseInt(op2, 16);
	}
	
	/**
	 * 
	 * @param index
	 * @param sourceType
	 * @param source
	 * @param destType
	 * @return
	 */
	public static String zExtStmt(int index, String sourceType, String source, String destType) {
		return "%" + index + " = zext " + sourceType + " %" + source + " to " + destType;
	}
	
	/**
	 * 
	 * @param index
	 * @param sourceType
	 * @param source
	 * @param destType
	 * @return
	 */
	public static String truncStmt(int index, String sourceType, String source, String destType) {
		return "%" + index + " = trunc " + sourceType + " %" + source + " to " + destType;
	}
	
}
