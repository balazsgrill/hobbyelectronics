/**
 * 
 */
package hu.mcp2200;

/**
 * @author balazs.grill
 *
 */
public class MCP2200JNI {

	static{
		System.loadLibrary("mcp2200-jni");
	}
	
	private native int init();
	
	private native void close();
	
	private native int list_devices(int vendorID, int productID);
	
	private native int get_address(int index);
	
	private native int connect(int index);
	
	private native void disconnect(int connectionID);
	
	private native int hid_set_clear_output(int connectionID, int set_bmap, int clr_bmap);
	
	private native int hid_configure(int connectionID,
			int IO_bmap,
			int config_alt_pins,
			int IO_default_pins,
			int config_alt_options,
			int baudRate
			);
	
	private native int hid_write_ee(int connectionID, int address, int data);
	
	private native int hid_read_ee(int connectionID, int address);
	
	private native int mcp2200_hid_read_io(int connectionID);
	
}
