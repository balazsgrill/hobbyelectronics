library pic18.platform.u8;

use e.platform;
use microchip.pic18;

/*
 * dest += v
 */
add_u8(var uint8 dest, uint8 v){
	if(isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,0);
	}
	SELECTB(&v);
	ADDWF(&dest);
}

subtract_u8(var uint8 dest, uint8 v){
	if(isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,0);
	}
	SELECTB(&dest);
	SUBWF(&dest);
}

set_bool(var bool dest, bool v){
	if(isliteral(v)){
		if (v == 0){
			SELECTB(&dest);
			CLRF(&dest);
		}else{
			if (v == 0xFF){
				SELECTB(&dest);
				SETF(&dest);
			}else{
				MOVLW(v);
				SELECTB(&dest);
				MOVWF(&dest);
			}
		}
	}else{
		MOVFF(&v,&dest);
	}
}

/*
 * dest = v
 */
set_u8(var uint8 dest, uint8 v){
	if(isliteral(v)){
		if (v == 0){
			SELECTB(&dest);
			CLRF(&dest);
		}else{
			if (v == 0xFF){
				SELECTB(&dest);
				SETF(&dest);
			}else{
				MOVLW(v);
				SELECTB(&dest);
				MOVWF(&dest);
			}
		}
	}else{
		MOVFF(&v,&dest);
	}
}

branch_u8(var uint8 condition, const uint16 true, const uint16 false){
	SELECTB(&condition);
	MOVF(&condition); //Set Zero bit
	BZ(2);//Branch if zero (jump to false)
	GOTO(true);
	GOTO(false);
}

branch_u8bit(u8bit condition, const uint16 true, const uint16 false){
	SELECTB(condition->a);
	BTFSC(condition->a,condition->d);
	GOTO(true);
	GOTO(false);
}

branch_bool(var bool condition, const uint16 true, const uint16 false){
	SELECTB(&condition);
	BTFSC(&condition,0);
	GOTO(true);
	GOTO(false);
}

/*
 * dest = (d1 == d2)
 */
isequal_u8(uint8 d1, uint8 d2){
	if (isliteral(d1)){
		MOVLW(d1);
		//d2 garanteed to be variable
		SELECTB(&d2);
		CPFSEQ(&d2);
	}else{
		if (isliteral(d2)){
			MOVLW(d2);
		}else{
			SELECTB(&d2);
			MOVF(&d2,0);
		}
		SELECTB(&d1);
		CPFSEQ(&d1);
	}
	//Skipped if equal
	GOTO(notequal);
	set_u8(result,1);
	GOTO(end);
	label notequal;
	set_u8(result,0);
	GOTO(end);
	label end;
} returns bool result;

