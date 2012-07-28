library music;

use e.platform;
use microchip.pic16.enchanced;
use pic16.bankselect;

const uint8 length = 2;

table_PR(uint8 index){
	SELECTB(&index);
	MOVF(&index,W);
	CALL(dat);
	GOTO(end);
	label dat;
	BRW();
	RETLW(0x27);
	RETLW(0x0);
	label end;
	SELECTB(&result);
	MOVWF(&result);
}returns uint8 result;

table_TCON(uint8 index){
	SELECTB(&index);
	MOVF(&index,W);
	CALL(dat);
	GOTO(end);
	label dat;
	BRW();
	RETLW(0x3D);
	RETLW(0x0);
	label end;
	SELECTB(&result);
	MOVWF(&result);
}returns uint8 result;
