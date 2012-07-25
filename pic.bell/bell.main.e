library bell.main;

use e.platform;
use microchip.PIC16F1824;
use microchip.pic16.enchanced;
use pic16.bankselect;
use bell.music.memory;

/*
 * Timer 2 interrupt request bit in PIR1
 */
const bit TMR2IF = 1;

/*
 * Timer 4 interrupt request bit in PIR3
 */
const bit TMR4IF = 1;

main(){
	/*0*/ GOTO(init);
	/*1*/ NOP();
	/*2*/ NOP();
	/*3*/ NOP();
	/*4*/ label interrupt;
	
	/*
	 * TIMER2 interrupt
	 */
	BTFSS(&PIR1, TMR2IF);
	GOTO(notimer2);
	toggleRC2();
	label notimer2;
	
	/*
	 * TIMER4 interrupt
	 */
	BTFSS(&PIR3, TMR4IF);
	GOTO(notimer4);
	CALL(func_tape_step);
	label notimer4;
	
	// clear all interrupt request
	PIR1 = 0;
	PIR2 = 0;
	PIR3 = 0;
	RETFIE();
	
	label init;
	//set 1MHz
	OSCCON = b01011011;
	ANSELA = 0;
	ANSELC = 0;
	
	TRISC = 0;//0xFB;
	TRISA = 0;
	PORTC = 0xFF;
	PORTA = 0xFF;
	
	INTCON = b11000000;
	PIE1 = b10; //Enable tmr2 interrupt
	PIE3 = b10; //Enable tmr4 interrupt
	
	T2CON = 0x75;//0x7F;
	PR2 = 0;//0xAF;
	TMR2 = 0;
	
	T4CON = 0x7F;
	PR4 = 0xFF;
	TMR4 = 0;
	
	tape_init();
	CALL(func_tape_step);
	
	loop();
	
	/*
	 * tape_step is included here to be callable
	 */
	label func_tape_step;
	tape_step();
	RETURN();
}

loop(){
	label start;
	GOTO(start);
}

