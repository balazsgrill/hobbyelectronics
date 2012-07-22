library bell.music.memory;

use e.platform;
use microchip.pic16.enchanced;
use microchip.PIC16F1824;
use pic16.bankselect;
use pic16.platform;

const uint16 musicAddress = 0x0800; 

uint16 index;
uint16 num_of_steps;

const uint8 stepnum = 8;
uint8 divider;

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
	result = 0x01;
}returns uint8 result;

/*
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
*/

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

tape_init(){
	//index = 0;
	acounter = 0;
	acounter2 = 0;
	//num_of_steps = read(musicAddress);
	aindex = 0;
	divider = 0;
}



uint8 acounter;
uint8 acounter2;
uint8 aindex;

tmr2_tape_step(){
	if (acounter2 == 0){
		acounter2 = divider;
		
		if (acounter == 0){
		
			uint16 dat;
	
			PR2 = freqs(aindex);
			divider = 0xFF-PR2;
		
			acounter = lengths(aindex);
		
			aindex += 1;
			if (aindex == stepnum){
				aindex = 0;
			}
		
		}else{
			acounter -= 1;
		}
	
	}else{
		acounter2 -= 1;
	}
}

