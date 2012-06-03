binary eMH1 intelHexfile;

use main;
use microchip.PIC16F1824;
use microchip.pic16.enchanced;

program main ( 
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
}at 0;
data {
	CONFIG1_FOSC_INTOSC +
	CONFIG1_BOREN_OFF +
	CONFIG1_CLKOUTEN_ON +
	CONFIG1_CPD_OFF +
	CONFIG1_CP_OFF +
	CONFIG1_FCMEN_OFF +
	CONFIG1_IESO_OFF +
	CONFIG1_MCLRE_ON +
	CONFIG1_PWRTE_OFF +
	CONFIG1_WDTE_SWDTEN;
	
	CONFIG2_BORV_LO +
	CONFIG2_DEBUG_OFF +
	CONFIG2_LVP_ON +
	CONFIG2_PLLEN_OFF +
	CONFIG2_STVREN_ON +
	CONFIG2_VCOREV_OFF +
	CONFIG2_WRT_OFF;
} at configStartAddress;