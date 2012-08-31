/*
 * mcp2200cli.c
 *
 *  Created on: 2012.08.27.
 *      Author: balazs.grill
 */

#include <stdio.h>
#include <sys/types.h>

#include <libusb.h>
#include "mcp2200.h"

int main(int argc, char** argv){

	libusb_device **devs;

	int r = libusb_init(NULL);
	if (r < 0)
		return r;

	int cnt = libusb_get_device_list(NULL, &devs);
	if (cnt < 0)
		return (int) cnt;

	int i;
	for(i =0;i<cnt;i++){
			struct libusb_device_descriptor desc;

			int r = libusb_get_device_descriptor(devs[i], &desc);
			if (r < 0) {
				fprintf(stderr, "failed to get device descriptor");
				return r;
			}

			if (MCP2200_VENDOR_ID == desc.idVendor && MCP2200_PRODUCT_ID == desc.idProduct){
				printf("%04x:%04x (bus %d, device %d)\n",
						desc.idVendor, desc.idProduct,
						libusb_get_bus_number(devs[i]), libusb_get_device_address(devs[i]));
			}

	}

	libusb_free_device_list(devs, 1);
	libusb_exit(NULL);
	return 0;
}
