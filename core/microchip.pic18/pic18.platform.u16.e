library pic18.platform.u16;

use e.platform;
use microchip.pic18;

add_u16_u8(var uint16 dest, uint8 v){
	if (isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,0);
	}
	SELECTB(&dest);
	ADDWF(&dest);
	MOVLW(0);
	SELECTB((&dest)+1);
	ADDWFC((&dest)+1);
}

add_u16_u16(var uint16 dest, uint16 v){
	if (isliteral(v)){
		MOVLW(v);
	}else{
		SELECTB(&v);
		MOVF(&v,0);
	}
	SELECTB(&dest);
	ADDWF(&dest);
	if (isliteral(v)){
		MOVLW(v/256);
	}else{
		SELECTB(&v);
		MOVF((&v)+1,0);
	}
	SELECTB(&dest+1);
	ADDWFC(&dest+1);
}

set_u16_u8(var uint16 dest, uint8 v){
	SELECTB(&dest+1);
	CLRF((&dest)+1);
	if (isliteral(v)){
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

set_u16_u16(var uint16 dest, uint16 v){
	if (isliteral(v)){
		if (v%0xFF == 0){
			SELECTB(&dest);
			CLRF(&dest);
		}else{
			if (v%0xFF == 0xFF){
				SELECTB(&dest);
				SETF(&dest);
			}else{
				MOVLW(v%0xFF);
				SELECTB(&dest);
				MOVWF(&dest);
			}
		}
		if (v/0xFF == 0){
			SELECTB(&dest+1);
			CLRF(&dest+1);
		}else{
			if (v/0xFF == 0xFF){
				SELECTB(&dest+1);
				SETF(&dest+1);
			}else{
				MOVLW(v/0xFF);
				SELECTB(&dest+1);
				MOVWF(&dest+1);
			}
		}
	}else{
		MOVFF(&v,&dest);
		MOVFF((&v)+1,(&dest)+1);
	}
}
