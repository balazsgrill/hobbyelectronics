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

	int i;
	for(i =0;i<cnt;i++){
			int address = mcp2200_get_address(i);
			printf("Device at %d\n", address);

			int conID = mcp2200_connect(i);
			if (conID >= 0){
				printf("Open success!\n");
				mcp2200_disconnect(conID);
			}else{
				printf("Cannot open\n");
			}
	}

	mcp2200_close();
	return 0;
}
