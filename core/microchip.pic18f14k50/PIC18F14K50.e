/*
 * Library for PIC18F14K50
 * 
 * Architecture: 18xxxx
 */
library microchip.PIC18F14K50;

	use e.platform;
	use microchip.pic18;

/********************
 * Special function registers
 ********************/


/*
 * UEP0
 * 
 */
reg uint8 UEP0 : 0xf53; 

/*
 * UEP1
 * 
 */
reg uint8 UEP1 : 0xf54; 

/*
 * UEP2
 * 
 */
reg uint8 UEP2 : 0xf55; 

/*
 * UEP3
 * 
 */
reg uint8 UEP3 : 0xf56; 

/*
 * UEP4
 * 
 */
reg uint8 UEP4 : 0xf57; 

/*
 * UEP5
 * 
 */
reg uint8 UEP5 : 0xf58; 

/*
 * UEP6
 * 
 */
reg uint8 UEP6 : 0xf59; 

/*
 * UEP7
 * 
 */
reg uint8 UEP7 : 0xf5a; 

/*
 * UEIE
 * 
 */
reg uint8 UEIE : 0xf5b; 

/*
 * UADDR
 * 
 */
reg uint8 UADDR : 0xf5c; 

/*
 * UFRML
 * 
 */
reg uint8 UFRML : 0xf5d; 

/*
 * UFRMH
 * 
 */
reg uint8 UFRMH : 0xf5e; 

/*
 * UEIR
 * 
 */
reg uint8 UEIR : 0xf5f; 

/*
 * UIE
 * 
 */
reg uint8 UIE : 0xf60; 

/*
 * UCFG
 * 
 */
reg uint8 UCFG : 0xf61; 

/*
 * UIR
 * 
 */
reg uint8 UIR : 0xf62; 

/*
 * USTAT
 * 
 */
reg uint8 USTAT : 0xf63; 

/*
 * UCON
 * 
 */
reg uint8 UCON : 0xf64; 

/*
 * SRCON0
 * 
 */
reg uint8 SRCON0 : 0xf68; 

/*
 * SRCON1
 * 
 */
reg uint8 SRCON1 : 0xf69; 

/*
 * CM2CON0
 * 
 */
reg uint8 CM2CON0 : 0xf6b; 

/*
 * CM2CON1
 * 
 */
reg uint8 CM2CON1 : 0xf6c; 

/*
 * CM1CON0
 * 
 */
reg uint8 CM1CON0 : 0xf6d; 

/*
 * SSPMSK
 * 
 */
reg uint8 SSPMSK : 0xf6f; 

/*
 * SLRCON
 * 
 */
reg uint8 SLRCON : 0xf76; 

/*
 * WPUA
 * 
 */
reg uint8 WPUA : 0xf77; 

/*
 * WPUB
 * 
 */
reg uint8 WPUB : 0xf78; 

/*
 * IOCA
 * 
 */
reg uint8 IOCA : 0xf79; 

/*
 * IOCB
 * 
 */
reg uint8 IOCB : 0xf7a; 

/*
 * ANSEL
 * 
 */
reg uint8 ANSEL : 0xf7e; 

/*
 * ANSELH
 * 
 */
reg uint8 ANSELH : 0xf7f; 

/*
 * PORTA
 * 
 */
reg uint8 PORTA : 0xf80; 

/*
 * PORTB
 * 
 */
reg uint8 PORTB : 0xf81; 

/*
 * PORTC
 * 
 */
reg uint8 PORTC : 0xf82; 

/*
 * LATA
 * 
 */
reg uint8 LATA : 0xf89; 

/*
 * LATB
 * 
 */
reg uint8 LATB : 0xf8a; 

/*
 * LATC
 * 
 */
reg uint8 LATC : 0xf8b; 

/*
 * TRISA
 * 
 */
reg uint8 TRISA : 0xf92; 

/*
 * TRISB
 * 
 */
reg uint8 TRISB : 0xf93; 

/*
 * TRISC
 * 
 */
reg uint8 TRISC : 0xf94; 

/*
 * OSCTUNE
 * 
 */
reg uint8 OSCTUNE : 0xf9b; 

/*
 * PIE1
 * 
 */
reg uint8 PIE1 : 0xf9d; 

/*
 * PIR1
 * 
 */
reg uint8 PIR1 : 0xf9e; 

/*
 * IPR1
 * 
 */
reg uint8 IPR1 : 0xf9f; 

/*
 * PIE2
 * 
 */
reg uint8 PIE2 : 0xfa0; 

/*
 * PIR2
 * 
 */
reg uint8 PIR2 : 0xfa1; 

/*
 * IPR2
 * 
 */
reg uint8 IPR2 : 0xfa2; 

/*
 * EECON1
 * 
 */
reg uint8 EECON1 : 0xfa6; 

/*
 * EECON2
 * 
 */
reg uint8 EECON2 : 0xfa7; 

/*
 * EEDATA
 * 
 */
reg uint8 EEDATA : 0xfa8; 

/*
 * EEADR
 * 
 */
reg uint8 EEADR : 0xfa9; 

/*
 * RCSTA
 * 
 */
reg uint8 RCSTA : 0xfab; 

/*
 * TXSTA
 * 
 */
reg uint8 TXSTA : 0xfac; 

/*
 * TXREG
 * 
 */
reg uint8 TXREG : 0xfad; 

/*
 * RCREG
 * 
 */
reg uint8 RCREG : 0xfae; 

/*
 * SPBRG
 * 
 */
reg uint8 SPBRG : 0xfaf; 

/*
 * SPBRGH
 * 
 */
reg uint8 SPBRGH : 0xfb0; 

/*
 * T3CON
 * 
 */
reg uint8 T3CON : 0xfb1; 

/*
 * TMR3
 * 
 */
reg uint16 TMR3 : 0xfb2; 

/*
 * ECCP1AS
 * 
 */
reg uint8 ECCP1AS : 0xfb6; 

/*
 * PWM1CON
 * 
 */
reg uint8 PWM1CON : 0xfb7; 

/*
 * BAUDCON
 * 
 */
reg uint8 BAUDCON : 0xfb8; 

/*
 * PSTRCON
 * 
 */
reg uint8 PSTRCON : 0xfb9; 

/*
 * REFCON0
 * 
 */
reg uint8 REFCON0 : 0xfba; 

/*
 * REFCON1
 * 
 */
reg uint8 REFCON1 : 0xfbb; 

/*
 * REFCON2
 * 
 */
reg uint8 REFCON2 : 0xfbc; 

/*
 * CCP1CON
 * 
 */
reg uint8 CCP1CON : 0xfbd; 

/*
 * CCPR1
 * 
 */
reg uint16 CCPR1 : 0xfbe; 

/*
 * ADCON2
 * 
 */
reg uint8 ADCON2 : 0xfc0; 

/*
 * ADCON1
 * 
 */
reg uint8 ADCON1 : 0xfc1; 

/*
 * ADCON0
 * 
 */
reg uint8 ADCON0 : 0xfc2; 

/*
 * ADRES
 * 
 */
reg uint16 ADRES : 0xfc3; 

/*
 * SSPCON2
 * 
 */
reg uint8 SSPCON2 : 0xfc5; 

/*
 * SSPCON1
 * 
 */
reg uint8 SSPCON1 : 0xfc6; 

/*
 * SSPSTAT
 * 
 */
reg uint8 SSPSTAT : 0xfc7; 

/*
 * SSPADD
 * 
 */
reg uint8 SSPADD : 0xfc8; 

/*
 * SSPBUF
 * 
 */
reg uint8 SSPBUF : 0xfc9; 

/*
 * T2CON
 * 
 */
reg uint8 T2CON : 0xfca; 

/*
 * PR2
 * 
 */
reg uint8 PR2 : 0xfcb; 

/*
 * TMR2
 * 
 */
reg uint8 TMR2 : 0xfcc; 

/*
 * T1CON
 * 
 */
reg uint8 T1CON : 0xfcd; 

/*
 * TMR1
 * 
 */
reg uint16 TMR1 : 0xfce; 

/*
 * RCON
 * 
 */
reg uint8 RCON : 0xfd0; 

/*
 * WDTCON
 * 
 */
reg uint8 WDTCON : 0xfd1; 

/*
 * OSCCON2
 * 
 */
reg uint8 OSCCON2 : 0xfd2; 

/*
 * OSCCON
 * 
 */
reg uint8 OSCCON : 0xfd3; 

/*
 * T0CON
 * 
 */
reg uint8 T0CON : 0xfd5; 

/*
 * TMR0
 * 
 */
reg uint16 TMR0 : 0xfd6; 

/*
 * STATUS
 * 
 */
reg uint8 STATUS : 0xfd8; 

/*
 * FSR2
 * 
 */
reg uint16 FSR2 : 0xfd9; 

/*
 * PLUSW2
 * 
 */
reg uint8 PLUSW2 : 0xfdb; 

/*
 * PREINC2
 * 
 */
reg uint8 PREINC2 : 0xfdc; 

/*
 * POSTDEC2
 * 
 */
reg uint8 POSTDEC2 : 0xfdd; 

/*
 * POSTINC2
 * 
 */
reg uint8 POSTINC2 : 0xfde; 

/*
 * INDF2
 * 
 */
reg uint8 INDF2 : 0xfdf; 

/*
 * BSR
 * 
 */
reg uint8 BSR : 0xfe0; 

/*
 * FSR1
 * 
 */
reg uint16 FSR1 : 0xfe1; 

/*
 * PLUSW1
 * 
 */
reg uint8 PLUSW1 : 0xfe3; 

/*
 * PREINC1
 * 
 */
reg uint8 PREINC1 : 0xfe4; 

/*
 * POSTDEC1
 * 
 */
reg uint8 POSTDEC1 : 0xfe5; 

/*
 * POSTINC1
 * 
 */
reg uint8 POSTINC1 : 0xfe6; 

/*
 * INDF1
 * 
 */
reg uint8 INDF1 : 0xfe7; 

/*
 * WREG
 * 
 */
reg uint8 WREG : 0xfe8; 

/*
 * FSR0
 * 
 */
reg uint16 FSR0 : 0xfe9; 

/*
 * PLUSW0
 * 
 */
reg uint8 PLUSW0 : 0xfeb; 

/*
 * PREINC0
 * 
 */
reg uint8 PREINC0 : 0xfec; 

/*
 * POSTDEC0
 * 
 */
reg uint8 POSTDEC0 : 0xfed; 

/*
 * POSTINC0
 * 
 */
reg uint8 POSTINC0 : 0xfee; 

/*
 * INDF0
 * 
 */
reg uint8 INDF0 : 0xfef; 

/*
 * INTCON3
 * 
 */
reg uint8 INTCON3 : 0xff0; 

/*
 * INTCON2
 * 
 */
reg uint8 INTCON2 : 0xff1; 

/*
 * INTCON
 * 
 */
reg uint8 INTCON : 0xff2; 

/*
 * PROD
 * 
 */
reg uint16 PROD : 0xff3; 

/*
 * TABLAT
 * 
 */
reg uint8 TABLAT : 0xff5; 

/*
 * TBLPTR
 * 
 */
reg uint8 TBLPTR : 0xff6; 

/*
 * PCLAT
 * 
 */
reg uint8 PCLAT : 0xff9; 

/*
 * STKPTR
 * 
 */
reg uint8 STKPTR : 0xffc; 

/*
 * TOS
 * 
 */
reg uint8 TOS : 0xffd; 

