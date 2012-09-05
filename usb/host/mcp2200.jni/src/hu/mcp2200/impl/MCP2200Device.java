/**
 * 
 */
package hu.mcp2200.impl;

import hu.mcp2200.IMCP2200Connection;
import hu.mcp2200.IMCP2200Device;
import hu.mcp2200.MCP2200Exception;
import hu.mcp2200.MCP2200JNI;

/**
 * @author balazs.grill
 *
 */
public class MCP2200Device implements IMCP2200Device {

	private final int index;
	private final int address;
	
	public MCP2200Device(int index) {
		this.index = index;
		address = MCP2200JNI.getInstance().get_address(index);
	}
	
	/* (non-Javadoc)
	 * @see hu.mcp2200.api.IMCP2200Device#getBus()
	 */
	@Override
	public int getBus() {
		return address&0xFF;
	}

	/* (non-Javadoc)
	 * @see hu.mcp2200.api.IMCP2200Device#getAddress()
	 */
	@Override
	public int getAddress() {
		return address/256;
	}

	/* (non-Javadoc)
	 * @see hu.mcp2200.api.IMCP2200Device#connect()
	 */
	@Override
	public IMCP2200Connection connect() throws MCP2200Exception {
		return new MCP2200Connection(index);
	}

}
