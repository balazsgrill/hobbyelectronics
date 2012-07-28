library bell.music.memory;

use e.platform;
use microchip.pic16.enchanced;
use microchip.PIC16F1824;
use pic16.bankselect;
use pic16.platform;
use music;

tape_init(){
	counter = 0;
	index = 0;
}

uint8 counter;
uint8 index;

tape_step(){

toggleRC3();
	if (counter == 0){
		clrRC2();
		PR2 = table_PR(index);
		T2CON = table_TCON(index);
		TMR2 = 0;
		
		counter = table_counter(index);
		
		index += 1;
		if (index == music.length){
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

toggleRC3(){
	SELECTB(&LATC);
	MOVLW(8); //Bit 3
	XORWF(&LATC);
}

toggleRC4(){
	SELECTB(&LATC);
	MOVLW(16); //Bit 4
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



