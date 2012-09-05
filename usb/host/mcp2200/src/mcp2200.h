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

#define MCP2200_INVALID_CONNECTION_ID -101
#define MCP2200_INVALID_RESPONSE -102
#define MCP2200_IO_ERROR -103

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

/**
 * Set/Clear the output pins
 */
extern int mcp2200_hid_set_clear_output(int connectionID, uint8_t set_bmap, uint8_t clr_bmap);

/**
 * Configure all settings
 */
extern int mcp2200_hid_configure(int connectionID,
		uint8_t IO_bmap,
		uint8_t config_alt_pins,
		uint8_t IO_default_pins,
		uint8_t config_alt_options,
		uint16_t baudRate
		);

/**
 * Write EEPROM
 */
extern int mcp2200_hid_write_ee(int connectionID, uint8_t address, uint8_t data);

/**
 * Read EEPROM
 */
extern int mcp2200_hid_read_ee(int connectionID, uint8_t address, uint8_t *data);

/**
 * Read IO values
 */
extern int mcp2200_hid_read_io(int connectionID, uint8_t *data);

#endif /* MCP2200_H_ */
