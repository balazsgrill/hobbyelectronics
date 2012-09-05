/**
 * 
 */
package hu.mcp2200.api;

import hu.mcp2200.MCP2200JNI;

/**
 * @author balazs.grill
 *
 */
public final class MCP2200Manager {

	private static MCP2200Manager instance;
	
	public static MCP2200Manager getInstance() {
		if (instance == null){
			instance = new MCP2200Manager();
		}
		return instance;
	}
	
	public MCP2200Manager() {
		MCP2200JNI.getInstance();
	}
	
}
