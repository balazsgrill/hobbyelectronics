library bell.music.memory;

use e.platform;
use microchip.pic16.enchanced;
use microchip.PIC16F1824;
use pic16.bankselect;
use pic16.platform;
use music;

const uint8 stepnum = 8;

tape_init(){
	counter = 0;
	index = 0;
}

uint8 counter;
uint8 index;

tape_step(){

	if (counter == 0){
		PR2 = table_PR(index);
		T2CON = table_TCON(index);
		TMR2 = 0;
		
		counter = 0xFF;
		
		index += 1;
		if (index == stepnum){
			index = 0;
		}
		
	}else{
		counter -= 1;
	}

}


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



