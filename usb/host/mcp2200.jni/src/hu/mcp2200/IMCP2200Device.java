/**
 * 
 */
package hu.mcp2200;

/**
 * @author balazs.grill
 *
 */
public interface IMCP2200Device {

	public int getBus();
	
	public int getAddress();
	
	public IMCP2200Connection connect() throws MCP2200Exception;
	
}
