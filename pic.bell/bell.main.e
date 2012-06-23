library bell.main;

use e.platform;
use microchip.PIC16F1824;
use microchip.pic16.enchanced;
use pic16.bankselect;
use bell.music.memory;

main(){
	ANSELA = 0;
	ANSELC = 0;
	
	TRISC = 0;//0xFB;
	TRISA = 0;
	PORTC = 0xFF;
	PORTA = 0xFF;
	
	tape_init();
	
	loop();
	
}

loop(){
	label start;
	tape_step();
	GOTO(start);
}

