/**
 * 
 */
package hu.mcp2200;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import hu.mcp2200.impl.MCP2200Device;

/**
 * @author balazs.grill
 *
 */
public final class MCP2200Manager {
	
	private MCP2200Manager() {}
	
	public static Collection<IMCP2200Device> detectDevices(){
		int count = MCP2200JNI.getInstance().list_devices(MCP2200JNI.VENDOR_ID, MCP2200JNI.PRODUCT_ID);
		List<IMCP2200Device> devices = new ArrayList<IMCP2200Device>(count);
		for(int i=0;i<count;i++){
			devices.add(new MCP2200Device(i));
		}
		return Collections.unmodifiableList(devices);
	}
	
}
