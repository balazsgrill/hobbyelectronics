binary bell intelHexfile;

use microchip.PIC16F1824;
use microchip.pic16.enchanced;
use bell.main;
use bell.music.memory;

program main(
	startAddr = 0;
	memwidth = 8;
	pointerType = address;
	addressType = codeaddr;
	mem 0x20..0x7f;
	mem 0xA0..0xEF;
	mem 0x120..0x16F;
	optimize "microchip.optimize.bankselect.pic16";
){
	lib microchip.pic16.enchanced;
	lib pic16.platform;
	link{
		main();
	}
} at 0 width 2;
include bell.music at musicAddress width 2;
include bell.config at configStartAddress width 2;