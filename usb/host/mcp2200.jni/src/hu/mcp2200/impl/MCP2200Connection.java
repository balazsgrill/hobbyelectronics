/**
 * 
 */
package hu.mcp2200.impl;

import hu.mcp2200.IMCP2200Connection;
import hu.mcp2200.MCP2200Exception;
import hu.mcp2200.MCP2200JNI;

/**
 * @author balazs.grill
 *
 */
public class MCP2200Connection implements IMCP2200Connection {

	private final int connectionID;
	
	/**
	 * @throws MCP2200Exception 
	 * 
	 */
	public MCP2200Connection(int index) throws MCP2200Exception {
		this.connectionID = MCP2200JNI.getInstance().connect(index);
		if (this.connectionID < 0) throw new MCP2200Exception(connectionID);
	}

	/* (non-Javadoc)
	 * @see hu.mcp2200.api.IMCP2200Connection#dispose()
	 */
	@Override
	public void dispose() {
		MCP2200JNI.getInstance().disconnect(connectionID);
	}
	
}
