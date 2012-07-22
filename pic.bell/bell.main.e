library bell.main;

use e.platform;
use microchip.PIC16F1824;
use microchip.pic16.enchanced;
use pic16.bankselect;
use bell.music.memory;

main(){
	/*0*/ GOTO(init);
	/*1*/ NOP();
	/*2*/ NOP();
	/*3*/ NOP();
	/*4*/ label interrupt;
	toggleRC2();
	PIR1 = 0;
	PIR2 = 0;
	PIR3 = 0;
	tmr2_tape_step();
	RETFIE();
	
	label init;
	OSCCON = b01111011;
	ANSELA = 0;
	ANSELC = 0;
	
	TRISC = 0;//0xFB;
	TRISA = 0;
	PORTC = 0xFF;
	PORTA = 0xFF;
	
	INTCON = b11000000;
	PIE1 = b10;
	T2CON = 0x75;//0x7F;
	PR2 = 0;//0xAF;
	TMR2 = 0;
	
	tape_init();
	
	loop();
	
}

loop(){
	label start;
	GOTO(start);
}

