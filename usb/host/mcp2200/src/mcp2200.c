/*
 * mcp2200.c
 *
 *  Created on: 2012.09.04.
 *      Author: balazs.grill
 */

#include "mcp2200.h"
#include <stdio.h>
#include <sys/types.h>

#define MCP2200_MAX_DEVICE_NUM 10
#define MCP2200_USE_CONFIGURATION 0
#define MCP2200_HID_INTERFACE 2
#define MCP2200_HID_REPORT_SIZE 16
#define MCP2200_HID_TRANSFER_TIMEOUT 5000

#define MCP2200_HID_COMMAND_SET_CLEAR_OUTPUT 	0x08u
#define MCP2200_HID_COMMAND_CONFIGURE 			0x10u
#define MCP2200_HID_COMMAND_READ_EE 			0x20u
#define MCP2200_HID_COMMAND_WRITE_EE 			0x40u
#define MCP2200_HID_COMMAND_READ_ALL 			0x80u

#define MCP2200_HID_ENDPOINT_IN 0x81
#define MCP2200_HID_ENDPOINT_OUT 0x01

static libusb_device* device_list[MCP2200_MAX_DEVICE_NUM];
static int device_list_count = -1;
static libusb_device_handle* connection_list[MCP2200_MAX_DEVICE_NUM];

static void closeDevice(int connectionID){
	libusb_close(connection_list[connectionID]);
	connection_list[connectionID] = NULL;
}

static void clearBuffer(uint8_t *buffer){
	int i;
	for (i=0;i<MCP2200_HID_REPORT_SIZE;i++) buffer[i]=0;
}

int mcp2200_hid_read_io(int connectionID, uint8_t *data){
	if (connectionID >= MCP2200_MAX_DEVICE_NUM) return MCP2200_INVALID_CONNECTION_ID;
	if (connection_list[connectionID] == NULL) return MCP2200_INVALID_CONNECTION_ID;

	uint8_t buffer[MCP2200_HID_REPORT_SIZE];
	uint8_t rbuffer[MCP2200_HID_REPORT_SIZE];
	clearBuffer(buffer);
	clearBuffer(rbuffer);

	buffer[0] = MCP2200_HID_COMMAND_READ_ALL;

	int t = 0;
	int r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_OUT, buffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}
	if (r != 0) return r;
	if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;

	t = 0;
	r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_IN, rbuffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}
	if (r != 0) return r;

	if (rbuffer[0] != MCP2200_HID_COMMAND_READ_ALL) return MCP2200_INVALID_RESPONSE;
	if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;

	*data = rbuffer[10];
	return 0;
}

int mcp2200_hid_read_ee(int connectionID, uint8_t address, uint8_t *data){
	if (connectionID >= MCP2200_MAX_DEVICE_NUM) return MCP2200_INVALID_CONNECTION_ID;
	if (connection_list[connectionID] == NULL) return MCP2200_INVALID_CONNECTION_ID;

	uint8_t buffer[MCP2200_HID_REPORT_SIZE];
	uint8_t rbuffer[MCP2200_HID_REPORT_SIZE];
	clearBuffer(buffer);
	clearBuffer(rbuffer);

	buffer[0] = MCP2200_HID_COMMAND_READ_EE;
	buffer[1] = address;

	int t = 0;
	int r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_OUT, buffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}
	if (r != 0) return r;

	if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;

	int i;
	for(i=0;i<MCP2200_HID_REPORT_SIZE;i++) rbuffer[i] = 255;
	r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_IN, rbuffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}
	if (r != 0) return r;

	if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;
	if (rbuffer[0] != MCP2200_HID_COMMAND_READ_EE) return MCP2200_INVALID_RESPONSE;
	if (rbuffer[1] != address) return MCP2200_INVALID_RESPONSE;

	(*data) = (rbuffer[2]);
	return 0;
}

int mcp2200_hid_write_ee(int connectionID, uint8_t address, uint8_t data){
	if (connectionID >= MCP2200_MAX_DEVICE_NUM) return MCP2200_INVALID_CONNECTION_ID;
		if (connection_list[connectionID] == NULL) return MCP2200_INVALID_CONNECTION_ID;

		uint8_t buffer[MCP2200_HID_REPORT_SIZE];
		clearBuffer(buffer);

		buffer[0] = MCP2200_HID_COMMAND_WRITE_EE;
		buffer[1] = address;
		buffer[2] = data;

		int t = 0;
		int r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_OUT, buffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

		if (r == LIBUSB_ERROR_NO_DEVICE){
			//Device is disconnected
			closeDevice(connectionID);
		}

		if (r != 0) return r;
		if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;

		return 0;
}

int mcp2200_hid_configure(int connectionID,
		uint8_t IO_bmap,
		uint8_t config_alt_pins,
		uint8_t IO_default_pins,
		uint8_t config_alt_options,
		uint16_t baudRate
		){

	if (connectionID >= MCP2200_MAX_DEVICE_NUM) return MCP2200_INVALID_CONNECTION_ID;
	if (connection_list[connectionID] == NULL) return MCP2200_INVALID_CONNECTION_ID;

	uint8_t buffer[MCP2200_HID_REPORT_SIZE];
	clearBuffer(buffer);

	buffer[0] = MCP2200_HID_COMMAND_CONFIGURE;
	buffer[4] = IO_bmap;
	buffer[5] = config_alt_pins;
	buffer[6] = config_alt_options;
	buffer[7] = (uint8_t)((baudRate<<8)&0xFF);
	buffer[8] = (uint8_t)(baudRate&0xFF);

	int t = 0;
	int r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_OUT, buffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}

	if (r != 0) return r;
	if (t < MCP2200_HID_REPORT_SIZE) {
		return MCP2200_IO_ERROR;
	}

	return 0;
}

int mcp2200_hid_set_clear_output(int connectionID, uint8_t set_bmap, uint8_t clr_bmap){
	if (connectionID >= MCP2200_MAX_DEVICE_NUM) return MCP2200_INVALID_CONNECTION_ID;
	if (connection_list[connectionID] == NULL) return MCP2200_INVALID_CONNECTION_ID;

	uint8_t buffer[MCP2200_HID_REPORT_SIZE];
	clearBuffer(buffer);

	buffer[0] = MCP2200_HID_COMMAND_SET_CLEAR_OUTPUT;
	buffer[11] = set_bmap;
	buffer[12] = clr_bmap;

	int t = 0;
	int r = libusb_interrupt_transfer(connection_list[connectionID], MCP2200_HID_ENDPOINT_OUT, buffer, MCP2200_HID_REPORT_SIZE, &t, MCP2200_HID_TRANSFER_TIMEOUT);

	if (r == LIBUSB_ERROR_NO_DEVICE){
		//Device is disconnected
		closeDevice(connectionID);
	}

	if (r != 0) return r;
	if (t < MCP2200_HID_REPORT_SIZE) return MCP2200_IO_ERROR;

	return 0;
}

static void free_list(){
	if (device_list_count > 0){
		int i;
		for(i=0;i<device_list_count;i++){
			libusb_unref_device(device_list[i]);
		}
	}
	device_list_count = 0;
}

int mcp2200_init(){
	int i;
	for (i=0;i<MCP2200_MAX_DEVICE_NUM;i++){
		connection_list[i] = NULL;
	}
	return libusb_init(NULL);
}

void mcp2200_close(){
	free_list();
	libusb_exit(NULL);
}

int mcp2200_list_devices(int vendorID, int productID){
	libusb_device **devs;
	device_list_count = 0;
	free_list();
	int cnt = libusb_get_device_list(NULL, &devs);
	if (cnt < 0) return cnt;
	int i;
	for(i=0;i<cnt;i++){
		struct libusb_device_descriptor desc;

		int ok = 0;
		int r = libusb_get_device_descriptor(devs[i], &desc);
		if (r < 0) {
			fprintf(stderr, "failed to get device descriptor");
		} else{
			if (vendorID == desc.idVendor &&
					productID == desc.idProduct &&
					device_list_count < MCP2200_MAX_DEVICE_NUM){
				ok = 1;
			}
		}

		if (ok){
			device_list[device_list_count] = devs[i];
			device_list_count++;
		}else{
			libusb_unref_device(devs[i]);
		}
	}
	libusb_free_device_list(devs, 0);
	return device_list_count;
}

int mcp2200_get_address(int index){
	if (index < device_list_count){
		uint8_t bus = libusb_get_bus_number(device_list[index]);
		uint8_t address = libusb_get_device_address(device_list[index]);
		return ((int)address<<8)+(int)bus;
	}
	return -1;
}

static int findEmptyConnectionSlot(){
	int i;
	for(i = 0;i<MCP2200_MAX_DEVICE_NUM;i++){
		if (connection_list[i] == NULL) return i;
	}
	return -1;
}

int mcp2200_connect(int index){
	if (index < device_list_count){
		int conID = findEmptyConnectionSlot();
		if (conID >= 0){
			int r = libusb_open(device_list[index], &connection_list[conID]);
			if (r < 0) return r;

			// Detach kernel driver, if any.
			// The result of this call is ignored
			libusb_detach_kernel_driver(connection_list[conID], MCP2200_HID_INTERFACE);

			// Claim HID interface
			r = libusb_claim_interface(connection_list[conID], MCP2200_HID_INTERFACE);
			if (r != 0){
				closeDevice(conID);
				return r;
			}
			return conID;
		}
	}
	return -1;
}

void mcp2200_disconnect(int connectionID){
	if (connectionID < MCP2200_MAX_DEVICE_NUM){
		if (connection_list[connectionID] != NULL){
			//Release HID interface
			libusb_release_interface(connection_list[connectionID], MCP2200_HID_INTERFACE);
			//Close device
			closeDevice(connectionID);
		}
	}
}
