binary bell.config;

use e.platform;
use microchip.PIC16F1824;

data {
	0xC9E4:uint16;//1100 1001 1110 0100
	0xDCFF:uint16;//1101 1100 1111 1111
} at 0 width 2;