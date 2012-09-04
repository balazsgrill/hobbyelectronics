/*
 * mcp2200cli.c
 *
 *  Created on: 2012.08.27.
 *      Author: balazs.grill
 */

#include <stdio.h>
#include <sys/types.h>

#include "mcp2200.h"

int main(int argc, char** argv){

	int r = mcp2200_init();
	if (r < 0)
		return r;

	int cnt = mcp2200_list_devices(MCP2200_VENDOR_ID, MCP2200_PRODUCT_ID);
	if (cnt < 0) return cnt;

	if (cnt == 0){
		printf("No device found!");
		return 0;
	}

	if (cnt == 1){
		int address = mcp2200_get_address(0);
		printf("Opening at address 0x%x\n", address);

		int connectionID = mcp2200_connect(0);

		if (connectionID < 0){
			printf("Connection failed! Error code: %d\n", connectionID);
			return 0;
		}

		r = mcp2200_hid_configure(connectionID, 0, 0, 0, 0, 1000);
		if (r != 0){
			printf("Configure error: %d\n", r);
		}

		int i;
		for(i=0;i<=255;i++){
			uint8_t data;
			r = mcp2200_hid_read_ee(connectionID, i, &data);
			if (r != 0){
				printf("read error of %d: %d\n",i, r);
			}else{
				printf("%d: %d\n",i,data);
			}
		}

		for(i=0;i<100;i++){
			printf("Set\n");
			mcp2200_hid_set_clear_output(connectionID, 0xFFu, 0u);
			sleep(1);
			printf("Clear\n");
			mcp2200_hid_set_clear_output(connectionID, 0u, 0xFFu);
			sleep(1);
		}

	}else{
		printf("Multiple devices, couldn't choose..");
	}

	mcp2200_close();
	return 0;
}
