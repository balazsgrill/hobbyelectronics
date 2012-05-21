library main;

use e.platform;
use microchip.pic16.enchanced;
use p16f1824.uart;
use microchip.PIC16F1824;


mainloop(){
	uint8 d;
	d = 0;
	label start;
	
	if (tryToSendByte(d)){
		d = d+1;
	}
	
	GOTO(start);
}

main(){
	/*
	 * Set up oscillator to 32Mhz
	 */
	OSCCON = 0xF2;
	OSCTUNE = 0x1F;
	
	mainloop();
}