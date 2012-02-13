binary something hexfile;

use test;

program application (
	startAddr = 0;
	memwidth = 8;
	pointersize = 12;
	mem 0x00..0xeff;
) {
	lib	pic18.platform;
	lib microchip.PIC18F14K50.DIO;
	link{
		main();
	}
}at 0;
include configuration at 0;
