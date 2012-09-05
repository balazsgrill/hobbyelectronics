/*
 * mcp2200-jni.c
 *
 *  Created on: 2012.09.05.
 *      Author: balazs.grill
 */

#include "mcp2200-jni.h"
#include "mcp2200.h"

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    init
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_init
  (JNIEnv * env, jobject this){
	return mcp2200_init();
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    close
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_hu_mcp2200_MCP2200JNI_close
  (JNIEnv * env, jobject this){
	mcp2200_close();
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    list_devices
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_list_1devices
  (JNIEnv * env, jobject this, jint vendorID, jint productID){
	return mcp2200_list_devices(vendorID, productID);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    get_address
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_get_1address
  (JNIEnv * env, jobject this, jint index){
	return mcp2200_get_address(index);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    connect
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_connect
  (JNIEnv * env, jobject this, jint index){
	return mcp2200_connect(index);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    disconnect
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_hu_mcp2200_MCP2200JNI_disconnect
  (JNIEnv * env, jobject this, jint connectionID){
	mcp2200_disconnect(connectionID);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    hid_set_clear_output
 * Signature: (III)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_hid_1set_1clear_1output
  (JNIEnv * env, jobject this, jint connectionID, jint set_bmap, jint clr_bmap){
	return mcp2200_hid_set_clear_output(connectionID, (uint8_t)set_bmap, (uint8_t)clr_bmap);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    hid_configure
 * Signature: (IIIIII)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_hid_1configure
  (JNIEnv * env, jobject this, jint a1, jint a2, jint a3, jint a4, jint a5, jint a6){
	return mcp2200_hid_configure(a1,a2,a3,a4,a5,a6);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    hid_write_ee
 * Signature: (III)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_hid_1write_1ee
  (JNIEnv * env, jobject this, jint connectionID, jint address, jint data){
	return mcp2200_hid_write_ee(connectionID, (uint8_t)address, (uint8_t)data);
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    hid_read_ee
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_hid_1read_1ee
  (JNIEnv * env, jobject this, jint connectionID, jint address){
	uint8_t result = 0;
	int r = mcp2200_hid_read_ee(connectionID, (uint8_t)address, &result);
	if (r != 0) return r;
	return result;
}

/*
 * Class:     hu_mcp2200_MCP2200JNI
 * Method:    mcp2200_hid_read_io
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_hu_mcp2200_MCP2200JNI_mcp2200_1hid_1read_1io
  (JNIEnv * env, jobject this, jint connectionID){
	uint8_t result = 0;
	int r = mcp2200_hid_read_io(connectionID, &result);
	if (r != 0) return r;
	return result;
}
