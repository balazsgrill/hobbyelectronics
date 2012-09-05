package hu.mcp2200.jnitest;

import static org.junit.Assert.*;
import hu.mcp2200.MCP2200JNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class MCP2200JNITest {

	@Before
	public void setUp() throws Exception {
		assertEquals(0, MCP2200JNI.getInstance().init());
	}

	@After
	public void tearDown() throws Exception {
		MCP2200JNI.getInstance().close();
	}

	@Test
	public void test() {
		int count = MCP2200JNI.getInstance().list_devices(MCP2200JNI.VENDOR_ID, MCP2200JNI.VENDOR_ID);
		assertEquals(1, count);
		
		int connectionID = MCP2200JNI.getInstance().connect(0);
		assertTrue(connectionID >= 0);
		
		
		
		MCP2200JNI.getInstance().disconnect(connectionID);
	}

}
