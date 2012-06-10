library bell.main;

use e.platform;
use microchip.PIC16F1824;
use microchip.pic16.enchanced;
use pic16.bankselect;

main(){
	ANSELA = 0;
	ANSELC = 0;
	
	TRISC = 0;//0xFB;
	TRISA = 0;
	PORTC = 0xFF;
	PORTA = 0xFF;
	loop();
	
}

setRC2(){
	SELECTB(&LATC);
	BSF(&LATC,2);
}

clrRC2(){
	SELECTB(&LATC);
	BCF(&LATC,2);
}

wait(){
	NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
	NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
	NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
}

loop(){
	label start;
	setRC2();
	wait();
	clrRC2();
	wait();
	GOTO(start);
}

