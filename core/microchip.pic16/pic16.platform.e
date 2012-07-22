library pic16.platform overrides e.platform;

use e.platform;
use microchip.pic16;
use microchip.pic16.enchanced;
use pic16.bankselect;

subtract_u8(var uint8 d, uint8 v){
	if (isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,W);	
	}
	SELECTB(&d);
	SUBWF(&d,F);
}

add_u8(var uint8 d, uint8 v){
	if (isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,W);	
	}
	SELECTB(&d);
	ADDWF(&d,F);
}

add_u16(var uint16 d, uint16 v){
	if (isliteral(v)){
		MOVLW(v&&0xFF);
	}else{
		SELECTB(&v);
		MOVF(&v,W);	
	}
	SELECTB(&d);
	ADDWF(&d);
	if (isliteral(v)){
		MOVLW(v/0xFF);
	}else{
		SELECTB(&v+1);
		MOVF(&v+1,W);	
	}
	SELECTB(&d+1);
	ADDWFC(&d+1);
}

set_u16(var uint16 d, uint16 v){
	if (isliteral(v)){
		if (0 == v){
			SELECTB(&d);
			CLRF(&d);
			SELECTB((&d) + 1);
			CLRF((&d) + 1);
		}else{
			MOVLW(v && 0xFF);
			SELECTB(&d);
			MOVWF(&d);
			MOVLW(v / 255);
			SELECTB((&d)+1);
			MOVWF((&d)+1);
		}
	}else{
		SELECTB(&v);
		MOVF(&v,W);
		SELECTB(&d);
		MOVWF(&d);
		SELECTB((&v)+1);
		MOVF((&v)+1,W);
		SELECTB((&d)+1);
		MOVWF((&d)+1);
	}
}

set_u8 (var uint8 d, uint8 v){
	if (isliteral(v)){
		if (0 == v){
			SELECTB(&d);
			CLRF(&d);
		}else{
			MOVLW(v);
			SELECTB(&d);
			MOVWF(&d);
		}
	}else{
		SELECTB(&v);
		MOVF(&v,W);
		SELECTB(&d);
		MOVWF(&d);
	}
}

equals_u8(uint8 d1, uint8 d2){
	if (isliteral(d1)){
		// d2 cannot be literal
		MOVLW(d1);
		SELECTB(&d2);
		SUBWF(&d2,W);
	}else{
		if (isliteral(d2)){
			MOVLW(d2);	
		}else{
			SELECTB(&d2);
			MOVF(&d2,W);	
		}
		SELECTB(&d1);
		SUBWF(&d1,W);
	}
	//no need to select bank before using status
	//we can select bank for result in advance
	SELECTB(&result);
	BCF(&result,0);
	BTFSS(&STATUS,Z);
	//This is skipped if ZERO (d1 and d2 equals):
	GOTO(false);
	BSF(&result,0);
	label false;
} returns bool result;

checkEqual_u16(uint16 d1, uint16 d2, const bool not){
	uint16 d;
	if (isliteral(d2) && d2==0){
		d = d1;
	}else{
		d = d1-d2; //Simply subtract
	}
	//Put first byte into W
	SELECTB(&d);
	MOVF(&d,W);
	//no need to select bank before using status
	//we can select bank for result in advance
	SELECTB(&result);
	if (not){
		BSF(&result,0);
	}else{
		BCF(&result,0);
	}
	BTFSS(&STATUS,Z);
	//This is skipped if ZERO (d1 and d2 equals):
	GOTO(false);
	
	//PUT second byte into w
	SELECTB(&d+1);
	MOVF(&d+1,W);
	SELECTB(&result);
	BCF(&result,0);
	BTFSS(&STATUS,Z);
	//This is skipped if ZERO (d1 and d2 equals):
	GOTO(false);
	
	//They're equal
	if (not){
		BSF(&result,0);
	}else{
		BCF(&result,0);
	}
	label false;
}returns bool result; 

equals_u16(uint16 d1, uint16 d2){}returns checkEqual_u16(d1,d2,0):bool;
notequals_u16(uint16 d1, uint16 d2){}returns checkEqual_u16(d1,d2,1):bool;

subtract_u16(var uint16 d, uint16 v){
	if (isliteral(v)){
		MOVLW(v&&0xFF);
	}else{
		SELECTB(&v);
		MOVF(&v,W);	
	}
	SELECTB(&d);
	SUBWF(&d);
	if (isliteral(v)){
		MOVLW(v/0xFF);
	}else{
		SELECTB(&v+1);
		MOVF(&v+1,W);	
	}
	SELECTB(&d+1);
	SUBWFB(&d+1);
}

branch_bool(var bool condition, const codeaddr true, const codeaddr false){
	SELECTB(&condition);
	BTFSC(&condition, 0);
	GOTO(true);
	GOTO(false);
}

/*
 * Left-shift uint16
 */
lshift_u16(var uint16 d){
	SELECTB((&d)+1);
	LSLF((&d)+1);
	SELECTB(&d);
	LSLF(&d);
	SELECTB((&d)+1);
	BTFSC(&STATUS,C);
	BSF((&d)+1,0);
}

bittest(var uint16 v, const uint8 bit){
	
}returns bool result;

mul_u16(var uint16 d, uint16 v){
	uint16 c;
	uint16 result;
	c = d;
	result = 0;
	if (isliteral(v)){
		if (v&&1 == 1){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&2 == 2){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&4 == 4){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&8 == 8){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&16 == 16){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&32 == 32){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&64 == 64){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&128 == 128){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&256 == 256){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&512 == 512){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&1024 == 1024){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&2048 == 2048){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&4096 == 4096){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&8192 == 8192){
			result = result+c;
		}
		lshift_u16(c);
		if (v&&16384 == 16384){
			result = result+c;
		}
		lshift_u16(c);
	}else{
		error "TODO: Multiplying is not yet supported with variable second argument";
	}
	d = result;
}

operator MUL{
	mul_u16
}

operator UC_GOTO{
	GOTO
}

operator BRANCH{
	branch_bool
}

operator EQUALS{
	equals_u8,
	equals_u16
}

operator NOTEQUALS{
	notequals_u16
}

operator ADD{
	add_u8,
	add_u16
}

operator SUBTRACT{
	subtract_u8,
	subtract_u16
}

operator SET{
	set_u8,
	set_u16
}