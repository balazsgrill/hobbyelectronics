/*
 * usbtest.c
 *
 *  Created on: 2012.08.22.
 *      Author: balazs.grill
 */

#include <stdio.h>
#include <sys/types.h>

#include "libusb.h"

int main(int argc, char** argv)
{
	libusb_device **devs;
	int r;
	int i;
	ssize_t cnt;

	r = libusb_init(NULL);
	if (r < 0)
		return r;

	cnt = libusb_get_device_list(NULL, &devs);
	if (cnt < 0)
		return (int) cnt;

	for(i =0;i<cnt;i++){
		struct libusb_device_descriptor desc;

		int r = libusb_get_device_descriptor(devs[i], &desc);
		if (r < 0) {
			fprintf(stderr, "failed to get device descriptor");
			return r;
		}

		printf("%04x:%04x (bus %d, device %d)\n",
				desc.idVendor, desc.idProduct,
				libusb_get_bus_number(devs[i]), libusb_get_device_address(devs[i]));
/*
		printf("Opening device..\n");
		struct libusb_device_handle *handle;

		r = libusb_open(devs[i], &handle);
		if (r < 0) {
			printf("failed.\n");
		}else{
			printf("Success\n");


			libusb_close(handle);
		}
*/
		int j;

		for(j=0;j<desc.bNumConfigurations;j++){
			printf("\tConfiguration %d\n",j);
			struct libusb_config_descriptor *config;

			r = libusb_get_config_descriptor(devs[i], j, &config);
			if (r < 0){
				printf("\tFAILURE! %d\n",r);
			}else{
				int l;
				for(l =0;l<config->bNumInterfaces;l++){
					printf("\t\tInterface %d\n", l);
					int k;
					for(k = 0;k<config->interface[l].num_altsetting;k++){
						printf("\t\t\tAlternative %d Class 0x%02x\n", k, config->interface[l].altsetting[k].bInterfaceClass);
						int m;
						for(m = 0;m<config->interface[l].altsetting[k].bNumEndpoints;m++){
							printf("\t\t\t\tEndpoint %d Address 0x%04x Length %d\n", m, config->interface[l].altsetting[k].endpoint[m].bEndpointAddress, config->interface[l].altsetting[k].endpoint[m].bLength);
						}
					}
				}


				libusb_free_config_descriptor(config);
			}

		}
	}


	libusb_free_device_list(devs, 1);
	libusb_exit(NULL);
	return 0;
}
