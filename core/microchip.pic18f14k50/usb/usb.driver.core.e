library usb.driver.core;

use e.platform;
use microchip.pic18;
use microchip.PIC18F14K50;

const uint8 buffersize = 16;

type bytearray = array[buffersize] of uint8;

copy_array_to_ram(address addr, bytearray d){
	FSR1 = addr;
	
	for (uint8 idx 0;1;buffersize){
		POSTINC1 = d[idx];
	}
}