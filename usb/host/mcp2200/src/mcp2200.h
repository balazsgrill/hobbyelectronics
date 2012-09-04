/*
 * mcp2200.h
 *
 *  Created on: 2012.08.27.
 *      Author: balazs.grill
 */

#ifndef MCP2200_H_
#define MCP2200_H_

#include <libusb.h>

#define MCP2200_VENDOR_ID	0x04d8
#define MCP2200_PRODUCT_ID	0x00df

/**
 * Init the MCP2200 driver
 */
extern int mcp2200_init();

/**
 * Dispose the driver and free any resources
 */
extern void mcp2200_close();

/**
 * Enumerate all connected devices
 * Return the number of device found
 */
extern int mcp2200_list_devices(int vendorID, int productID);

/**
 * Return the address of the enumerated device
 */
extern int mcp2200_get_address(int index);

/**
 * Connect to the device with the specified index
 * Returns negative on error, the connection ID otherwise.
 */
extern int mcp2200_connect(int index);

/**
 * Release the connection with the given ID
 */
extern void mcp2200_disconnect(int connectionID);

#endif /* MCP2200_H_ */
