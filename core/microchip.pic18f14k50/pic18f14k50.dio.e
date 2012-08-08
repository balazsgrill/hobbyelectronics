/*
 * PIC18F14K50 specific implementation of DIO
 */
library microchip.PIC18F14K50.DIO overrides e.dio;

use e.platform;
use e.dio;
use microchip.pic18;
use microchip.PIC18F14K50;

const uint8 channelNum = 17;

const ChannelID RA0 = 0;
const ChannelID RA1 = 1;
const ChannelID RA3 = 2;
const ChannelID RA4 = 3;
const ChannelID RA5 = 4;

const ChannelID RB4 = 5;
const ChannelID RB5 = 6;
const ChannelID RB6 = 7;
const ChannelID RB7 = 8;

const ChannelID RC0 = 9;
const ChannelID RC1 = 10;
const ChannelID RC2 = 11;
const ChannelID RC3 = 12;
const ChannelID RC4 = 13;
const ChannelID RC5 = 14;
const ChannelID RC6 = 15;
const ChannelID RC7 = 16;

type TChannelConfig = struct{
	address port,
	address latch,
	bit pin
};
type TChannelConfigTable = array [channelNum] of TChannelConfig;

const TChannelConfigTable channelConfigTable = TChannelConfigTable{
	TChannelConfig{&(PORTA),&(LATA),0}, //RA0
	TChannelConfig{&(PORTA),&(LATA),1}, //RA1
	TChannelConfig{&(PORTA),&(LATA),3}, //RA3
	TChannelConfig{&(PORTA),&(LATA),4}, //RA4
	TChannelConfig{&(PORTA),&(LATA),5}, //RA5
	
	TChannelConfig{&(PORTB),&(LATB),4}, //RB4
	TChannelConfig{&(PORTB),&(LATB),5}, //RB5
	TChannelConfig{&(PORTB),&(LATB),6}, //RB6
	TChannelConfig{&(PORTB),&(LATB),7}, //RB7
	
	TChannelConfig{&(PORTC),&(LATC),0}, //RC0
	TChannelConfig{&(PORTC),&(LATC),1}, //RC1
	TChannelConfig{&(PORTC),&(LATC),2}, //RC2
	TChannelConfig{&(PORTC),&(LATC),3}, //RC3
	TChannelConfig{&(PORTC),&(LATC),4}, //RC4
	TChannelConfig{&(PORTC),&(LATC),5}, //RC5
	TChannelConfig{&(PORTC),&(LATC),6}, //RC6
	TChannelConfig{&(PORTC),&(LATC),7}  //RC7
	
};

DIO_RawSet(address latch,const bit pin, uint8 v, bit b = 0){
	if (isliteral(v)){
		if (v){
			SELECTB(latch);
			BSF(latch,pin);
		}else{
			SELECTB(latch);
			BCF(latch,pin);
		}
	}else{
		SELECTB(&v);
		BTFSC(&(v),b);
		GOTO(true);
		//false
		SELECTB(latch);
		BCF(latch,pin);
		GOTO(done);
		label true;
		//true
		SELECTB(latch);
		BSF(latch,pin);
		label done;
	}
}

DIO_Read(ChannelID channel, uint8 v, bit b = 0){
	SELECTB(&v);
	BCF(&(v),b);
	SELECTB(channelConfigTable[channel]->port);
	BTFSC(channelConfigTable[channel]->port,channelConfigTable[channel]->pin);
	SELECTB(&v);
	BSF(&(v),b);
}

DIO_Set(ChannelID channel, uint8 v, bit b = 0){
	DIO_RawSet(
		channelConfigTable[channel]->latch,
		channelConfigTable[channel]->pin,
		v,b
	);
}


