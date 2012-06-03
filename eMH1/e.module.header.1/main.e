library main;

use e.platform;
use microchip.pic16.enchanced;
use p16f1824.uart;
use microchip.PIC16F1824;


mainloop(){
	uint8 d;
	d = 0;
	label start;
	
	if (tryToSendByte(5)){
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
	ANSELA = 0;
	ANSELC = 0;
	
	TRISA = 0;
	TRISC = 0;
	LATC = 0xFF;
	LATA = 0xFF;
	PORTA = 0xFF;
	PORTC = 0xFF;
	
	initialize_uart();
	
	mainloop();
}