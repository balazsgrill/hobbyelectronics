/**
 * 
 */
package hu.mcp2200;

/**
 * @author balazs.grill
 *
 */
public final class MCP2200JNI {

	public static final int VENDOR_ID = 0x04d8;
	public static final int PRODUCT_ID = 0x00df;
	
	private static MCP2200JNI instance;
	
	public static MCP2200JNI getInstance() {
		if (instance == null){
			instance = new MCP2200JNI();
		}
		return instance;
	}
	
	private MCP2200JNI() {
		System.loadLibrary("mcp2200-jni");
	}
	
	public native int init();
	
	public native void close();
	
	public native int list_devices(int vendorID, int productID);
	
	public native int get_address(int index);
	
	public native int connect(int index);
	
	public native void disconnect(int connectionID);
	
	public native int hid_set_clear_output(int connectionID, int set_bmap, int clr_bmap);
	
	public native int hid_configure(int connectionID,
			int IO_bmap,
			int config_alt_pins,
			int IO_default_pins,
			int config_alt_options,
			int baudRate
			);
	
	public native int hid_write_ee(int connectionID, int address, int data);
	
	public native int hid_read_ee(int connectionID, int address);
	
	public native int hid_read_io(int connectionID);
	
}
