library bell.music.memory;

use e.platform;
use microchip.pic16.enchanced;
use microchip.PIC16F1824;
use pic16.bankselect;

const uint16 musicAddress = 0x0800; 

uint16 index;
uint16 num_of_steps;

setRC2(){
	SELECTB(&LATC);
	BSF(&LATC,2);
}

clrRC2(){
	SELECTB(&LATC);
	BCF(&LATC,2);
}

tape_init(){
	index = 0;
	num_of_steps = read(musicAddress);
}

wait(uint16 w){
	uint16 counter;
	
	counter = w;
	label start;
	
	counter = counter-1;
	NOP();
	NOP();
	
	if (counter != 0){
		GOTO(start);
	}
}

tape_step(){
	uint16 freq;
	uint16 time;
	
	uint16 offset;
	
	offset = index*2;
	freq = read(musicAddress+1+offset);
	time = read(musicAddress+2+offset);
	
	index = index+1;
	if (index == num_of_steps){
		index = 0;
	}
	
	uint16 time_count;
	
	time_count = time;
	label start_count;
	
		//SET output
		setRC2();
		wait(freq);
		//CLR output
		clrRC2();
		wait(freq);
	
	time_count = time_count-1;
	if(time_count != 0){
		GOTO(start_count);
	}
	
}

const bit CFGS = 6;
const bit EEPGD = 7;
const bit GIE = 0;
const bit RD = 0;

read(uint16 addr){
	EEADR = addr;
	SELECTB(&EECON1);
	BCF(&EECON1,CFGS); 	//Do not select Configuration Space
	BSF(&EECON1,EEPGD); //Select Program Memory
	BSF(&EECON1,RD); 	//Initiate read
	NOP(); 				//Executed (Figure 11-1)
	NOP(); 				//Ignored (Figure 11-1)
	result = EEDAT;
}returns uint16 result;
