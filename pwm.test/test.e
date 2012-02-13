library test;

use e.platform;
use microchip.pic18;
use microchip.pic18.assisted;
use microchip.PIC18F14K50;
use microchip.PIC18F14K50.DIO;
use microchip.PIC18F14K50.SPI;

reg uint8 ANSEL : 0xF7E;
reg uint8 ANSELH : 0xF7F;

wait(){
	uint8 counter;
	aCLRF(&(counter));
	label countstart;
	NOP();
	NOP();
	NOP();
	aINCFSZ(&(counter));
	GOTO(@countstart);
}

wait2(){
	uint8 counter;
	aCLRF(&(counter));
	label countstart;
	wait();
	aINCFSZ(&(counter));
	GOTO(@countstart);
}

wait3(){
	uint8 counter;
	aCLRF(&(counter));
	label countstart;
	wait2();
	aINCFSZ(&(counter));
	GOTO(@countstart);
}

initPWM(){
	CCP1CON = b00001100;
	//PSTRCON
}

main(){
	uint8 display;
	
	OSCCON = 0x50;
	
	ANSEL = 0;
	ANSELH = 0;
	TRISC = 0;
	PORTC = 0;
	LATC = 0;
	PORTB = 0;
	LATB = 0;
	TRISB = 0;
	
	display = 0xFF;
	
	label start;
	
	/* Send data to display */
	SPI_Send(RC0, RC1, display);
	
	/* Display received value */
	aINCF(&display);
	
	wait();
	GOTO(start);
}
