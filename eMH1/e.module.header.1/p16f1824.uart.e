library p16f1824.uart;

use e.platform;
use microchip.pic16.enchanced;
use pic16.bankselect;
use microchip.PIC16F1824;

const bit TRMT = 1;

/*
 * Tries to send a byte using UART. If there is no
 * data in the TXREG buffer, the given value is put
 * into it and the method returns true. If the TXREG
 * is occupied, it returns false. 
 */
tryToSendByte(uint8 d){
	success = False;
	SELECTB(&TXSTA);
	BTFSS(&TXSTA,TRMT);
	GOTO(false);
	TXREG = d;
	success = True;
	label false;
} returns bool success;

initialize_uart(){
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
}