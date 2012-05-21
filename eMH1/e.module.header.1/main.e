library main;

use e.platform;
use microchip.pic16.enchanced;
use pic16.bankselect;
use microchip.PIC16F1824;

const bit TRMT = 1;

tryToSendByte(uint8 d){
	success = False;
	SELECTB(&TXSTA);
	BTFSS(&TXSTA,TRMT);
	GOTO(false);
	TXREG = d;
	success = True;
	label false;
} returns bool success;

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
	
	
	//Set up baud rate
	SPBRGL = 25;
	SPBRGH = 0;
	
	//BRG16 = 0
	BAUDCON = 0x0;
	
	//TXEN = 1
	//SYNC = 0
	//BRGH = 0
	TXSTA = 0x20;
	
	//SPEN = 1
	RCSTA = 0x80;
	
	mainloop();
}