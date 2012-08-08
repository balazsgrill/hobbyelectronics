library microchip.PIC18F14K50.indf;

use e.platform;
use microchip.pic18;
use microchip.PIC18F14K50;

type HWPointer = struct{
	address pointerreg,
	address valuereg
};

type HWPID = unsigned 2 bits;

const HWPID HWP0 = 0;
const HWPID HWP1 = 1;
const HWPID HWP2 = 2;

type HWPointerConfig = array [3] of HWPointer;

const HWPointerConfig pointers = HWPointerConfig{
	HWPointer{&FSR0, &INDF0},
	HWPointer{&(FSR1), &(INDF1)},
	HWPointer{&(FSR2), &(INDF2)}
};

indirect_set(var address dest, uint8 value){
	MOVFF(&(dest),&(FSR0L));
	MOVFF(&(dest)+1,&(FSR0H));
	if (isliteral(value)){
		MOVLW(value);
		SELECTB(&INDF0);
		MOVWF(&(INDF0));
	}else{
		MOVFF(&(value), &(INDF0));
	}
}

indirect_get(var address dest,var uint8 value){
	MOVFF(&(dest),&(FSR0L));
	MOVFF(&(dest)+1,&(FSR0H));
	MOVFF(&(INDF0), &(value));
}

