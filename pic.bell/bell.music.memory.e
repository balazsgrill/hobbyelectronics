library bell.music.memory;

use e.platform;
use microchip.pic16.enchanced;
use microchip.PIC16F1824;
use pic16.bankselect;
use pic16.platform;

const uint8 stepnum = 8;

tape_init(){
	counter = 0;
	index = 0;
}

uint8 counter;
uint8 index;

tape_step(){

	if (counter == 0){
		PR2 = freqs(index);
		
		counter = lengths(index);
		
		index += 1;
		if (index == stepnum){
			index = 0;
		}
		
	}else{
		counter -= 1;
	}

}

freqs(uint8 d){
	SELECTB(&d);
	MOVF(&d,W);
	CALL(dat);
	GOTO(end);
	label dat;
	BRW();
	RETLW(0x30);
	RETLW(0x30);
	RETLW(0x80);
	RETLW(0x50);
	RETLW(0x80);
	RETLW(0x50);
	RETLW(0x80);
	RETLW(0x90);
	RETLW(0xA0);
	RETLW(0xB0);
	RETLW(0xC0);
	RETLW(0xD0);
	RETLW(0xE0);
	RETLW(0xF0);
	label end;
	SELECTB(&result);
	MOVWF(&result);
}returns uint8 result;


lengths(uint8 d){
	SELECTB(&d);
	MOVF(&d,W);
	CALL(dat);
	GOTO(end);
	label dat;
	BRW();
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	RETLW(0x0F);
	label end;
	SELECTB(&result);
	MOVWF(&result);
}returns uint8 result;


toggleRC2(){
	SELECTB(&LATC);
	MOVLW(4); //Bit 2
	XORWF(&LATC);
}

setRC2(){
	SELECTB(&LATC);
	BSF(&LATC,2);
}

clrRC2(){
	SELECTB(&LATC);
	BCF(&LATC,2);
}



