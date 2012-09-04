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

static libusb_device* device_list[MCP2200_MAX_DEVICE_NUM];
static int device_list_count = -1;
static libusb_device_handle* connection_list[MCP2200_MAX_DEVICE_NUM];

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
		if (conID > 0){
			int r = libusb_open(device_list[index], &connection_list[conID]);
			if (r < 0) return r;
			// Set configuration
			r = libusb_set_configuration(connection_list[conID], MCP2200_USE_CONFIGURATION);
			if (r != 0){
				libusb_close(connection_list[conID]);
				connection_list[conID] = NULL;
				return r;
			}
			// Claim HID interface
			r = libusb_claim_interface(connection_list[conID], MCP2200_HID_INTERFACE);
			if (r != 0){
				libusb_close(connection_list[conID]);
				connection_list[conID] = NULL;
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
			libusb_close(connection_list[connectionID]);
			connection_list[connectionID] = NULL;
		}
	}
}
