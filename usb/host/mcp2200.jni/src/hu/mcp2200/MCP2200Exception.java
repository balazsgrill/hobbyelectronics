/**
 * 
 */
package hu.mcp2200;

/**
 * @author balazs.grill
 *
 */
public class MCP2200Exception extends Exception {

	public static String getMessage(int code){
		switch (code) {
		case -101:
			return "";

		default:
			return "Unknown error!";
		}
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6956010085548095780L;

	public MCP2200Exception(int code) {
		super(getMessage(code));
	}
	
}
