library microchip.PIC18F14K50;

use e.platform;

/* 
 * Special function registers
 */
reg uint8 CM2CON1 : 0xf79;
reg uint8 CM2CON0 : 0xf7a;
reg uint8 CM1CON0 : 0xf7b;
reg uint8 PORTA : 0xf80;
reg uint8 PORTB : 0xf81;
reg uint8 PORTC : 0xf82;
reg uint8 LATA : 0xf89;
reg uint8 LATB : 0xf8a;
reg uint8 LATC : 0xf8b;
reg uint8 TRISA : 0xf92;
reg uint8 TRISB : 0xf93;
reg uint8 TRISC : 0xf94;
reg uint8 OSCTUNE : 0xf9b;
reg uint8 PIE1 : 0xf9d;
reg uint8 PIR1 : 0xf9e;
reg uint8 IPR1 : 0xf9f;
reg uint8 PIE2 : 0xfa0;
reg uint8 PIR2 : 0xfa1;
reg uint8 IPR2 : 0xfa2;
reg uint8 EECON1 : 0xfa6;
reg uint8 EECON2 : 0xfa7;
reg uint8 EEDATA : 0xfa8;
reg uint8 EEADR : 0xfa9;
reg uint8 RCSTA : 0xfab;
reg uint8 TXSTA : 0xfac;
reg uint8 TXREG : 0xfad;
reg uint8 RCREG : 0xfae;
reg uint8 SPBRG : 0xfaf;
reg uint8 SPBRGH : 0xfb0;
reg uint8 T3CON : 0xfb1;
reg uint8 TMR3 : 0xfb2;
reg uint8 TMR3L : 0xfb2;
reg uint8 TMR3H : 0xfb3;
reg uint8 CVRCON2 : 0xfb4;
reg uint8 CVRCON : 0xfb5;
reg uint8 ECCPAS1 : 0xfb6;
reg uint8 PWM1CON : 0xfb7;
reg uint8 BAUDCON : 0xfb8;
reg uint8 CCP2CON : 0xfba;
reg uint8 CCPR2 : 0xfbb;
reg uint8 CCPR2L : 0xfbb;
reg uint8 CCPR2H : 0xfbc;
reg uint8 CCP1CON : 0xfbd;
reg uint8 CCPR1 : 0xfbe;
reg uint8 CCPR1L : 0xfbe;
reg uint8 CCPR1H : 0xfbf;
reg uint8 ADCON2 : 0xfc0;
reg uint8 ADCON1 : 0xfc1;
reg uint8 ADCON0 : 0xfc2;
reg uint8 ADRES : 0xfc3;
reg uint8 ADRESL : 0xfc3;
reg uint8 ADRESH : 0xfc4;
reg uint8 SSPCON2 : 0xfc5;
reg uint8 SSPCON1 : 0xfc6;
reg uint8 SSPSTAT : 0xfc7;
reg uint8 SSPADD : 0xfc8;
reg uint8 SSPBUF : 0xfc9;
reg uint8 T2CON : 0xfca;
reg uint8 PR2 : 0xfcb;
reg uint8 TMR2 : 0xfcc;
reg uint8 T1CON : 0xfcd;
reg uint8 TMR1 : 0xfce;
reg uint8 TMR1L : 0xfce;
reg uint8 TMR1H : 0xfcf;
reg uint8 RCON : 0xfd0;
reg uint8 WDTCON : 0xfd1;
reg uint8 LVDCON : 0xfd2;
reg uint8 OSCCON : 0xfd3;
reg uint8 T0CON : 0xfd5;
reg uint8 TMR0 : 0xfd6;
reg uint8 TMR0L : 0xfd6;
reg uint8 TMR0H : 0xfd7;
reg uint8 STATUS : 0xfd8;
reg uint8 FSR2 : 0xfd9;
reg uint8 FSR2L : 0xfd9;
reg uint8 FSR2H : 0xfda;
reg uint8 PLUSW2 : 0xfdb;
reg uint8 PREINC2 : 0xfdc;
reg uint8 POSTDEC2 : 0xfdd;
reg uint8 POSTINC2 : 0xfde;
reg uint8 INDF2 : 0xfdf;
reg uint8 BSR : 0xfe0;
reg uint8 FSR1 : 0xfe1;
reg uint8 FSR1L : 0xfe1;
reg uint8 FSR1H : 0xfe2;
reg uint8 PLUSW1 : 0xfe3;
reg uint8 PREINC1 : 0xfe4;
reg uint8 POSTDEC1 : 0xfe5;
reg uint8 POSTINC1 : 0xfe6;
reg uint8 INDF1 : 0xfe7;
reg uint8 WREG : 0xfe8;
reg uint8 FSR0 : 0xfe9;
reg uint8 FSR0L : 0xfe9;
reg uint8 FSR0H : 0xfea;
reg uint8 PLUSW0 : 0xfeb;
reg uint8 PREINC0 : 0xfec;
reg uint8 POSTDEC0 : 0xfed;
reg uint8 POSTINC0 : 0xfee;
reg uint8 INDF0 : 0xfef;
reg uint8 INTCON3 : 0xff0;
reg uint8 INTCON2 : 0xff1;
reg uint8 INTCON : 0xff2;
reg uint8 PROD : 0xff3;
reg uint8 PRODL : 0xff3;
reg uint8 PRODH : 0xff4;
reg uint8 TABLAT : 0xff5;
reg uint8 TBLPTR : 0xff6;
reg uint8 TBLPTRL : 0xff6;
reg uint8 TBLPTRH : 0xff7;
reg uint8 TBLPTRU : 0xff8;
reg uint8 PCLAT : 0xff9;
reg uint8 PCL : 0xff9;
reg uint8 PCLATH : 0xffa;
reg uint8 PCLATU : 0xffb;
reg uint8 STKPTR : 0xffc;
reg uint8 TOS : 0xffd;
reg uint8 TOSL : 0xffd;
reg uint8 TOSH : 0xffe;
reg uint8 TOSU : 0xfff;

/*
 * Configuration 
 */
const uint32 CONFIG_ADDRESS = 0x300000;
 

	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * 11XX EXT RC-CLKOUT on RA6 
	 */
	const uint8 CONFIG1H_OSC__11XXEXTRCCLKOUTonRA6 = 0xc;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * 101X EXT RC-CLKOUT on RA6 
	 */
	const uint8 CONFIG1H_OSC__101XEXTRCCLKOUTonRA6 = 0xa;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * INT RC-CLKOUT on RA6,Port on RA7 
	 */
	const uint8 CONFIG1H_OSC_INTRCCLKOUTonRA6PortonRA7 = 0x9;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * INT RC-Port on RA6,Port on RA7 
	 */
	const uint8 CONFIG1H_OSC_INTRCPortonRA6PortonRA7 = 0x8;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * EXT RC-Port on RA6 
	 */
	const uint8 CONFIG1H_OSC_EXTRCPortonRA6 = 0x7;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * HS-PLL enabled freq=4xFosc1 
	 */
	const uint8 CONFIG1H_OSC_HSPLLenabledfreq4xFosc1 = 0x6;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * EC-Port on RA6 
	 */
	const uint8 CONFIG1H_OSC_ECPortonRA6 = 0x5;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * EC-CLKOUT on RA6 
	 */
	const uint8 CONFIG1H_OSC_ECCLKOUTonRA6 = 0x4;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * 0011 EXT RC-CLKOUT on RA6 
	 */
	const uint8 CONFIG1H_OSC__0011EXTRCCLKOUTonRA6 = 0x3;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * HS 
	 */
	const uint8 CONFIG1H_OSC_HS = 0x2;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * XT 
	 */
	const uint8 CONFIG1H_OSC_XT = 0x1;
	/*
	 * <b>CONFIG1H</b> 
	 * Oscillator 
	 * LP 
	 */
	const uint8 CONFIG1H_OSC_LP = 0x0;



	/*
	 * <b>CONFIG1H</b> 
	 * Fail-Safe Clock Monitor Enable 
	 * Disabled 
	 */
	const uint8 CONFIG1H_FCMEN_Disabled = 0x0;
	/*
	 * <b>CONFIG1H</b> 
	 * Fail-Safe Clock Monitor Enable 
	 * Enabled 
	 */
	const uint8 CONFIG1H_FCMEN_Enabled = 0x40;



	/*
	 * <b>CONFIG1H</b> 
	 * Internal External Switch Over Mode 
	 * Disabled 
	 */
	const uint8 CONFIG1H_IESO_Disabled = 0x0;
	/*
	 * <b>CONFIG1H</b> 
	 * Internal External Switch Over Mode 
	 * Enabled 
	 */
	const uint8 CONFIG1H_IESO_Enabled = 0x80;



	/*
	 * <b>CONFIG2L</b> 
	 * Power Up Timer 
	 * Disabled 
	 */
	const uint8 CONFIG2L_PUT_Disabled = 0x1;
	/*
	 * <b>CONFIG2L</b> 
	 * Power Up Timer 
	 * Enabled 
	 */
	const uint8 CONFIG2L_PUT_Enabled = 0x0;



	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Detect 
	 * Enabled in hardware, SBOREN disabled 
	 */
	const uint8 CONFIG2L_BODEN_EnabledinhardwareSBORENdisabled = 0x6;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Detect 
	 * Enabled while active,disabled in SLEEP,SBOREN disabled 
	 */
	const uint8 CONFIG2L_BODEN_EnabledwhileactivedisabledinSLEEPSBORENdisabled = 0x4;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Detect 
	 * Controlled with SBOREN bit 
	 */
	const uint8 CONFIG2L_BODEN_ControlledwithSBORENbit = 0x2;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Detect 
	 * Disabled in hardware, SBOREN disabled 
	 */
	const uint8 CONFIG2L_BODEN_DisabledinhardwareSBORENdisabled = 0x0;



	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Voltage 
	 * 2.0V 
	 */
	const uint8 CONFIG2L_BODENV__20V = 0x18;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Voltage 
	 * 2.7V 
	 */
	const uint8 CONFIG2L_BODENV__27V = 0x10;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Voltage 
	 * 4.2V 
	 */
	const uint8 CONFIG2L_BODENV__42V = 0x8;
	/*
	 * <b>CONFIG2L</b> 
	 * Brown Out Voltage 
	 * 4.5V 
	 */
	const uint8 CONFIG2L_BODENV__45V = 0x0;



	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Timer 
	 * Enabled 
	 */
	const uint8 CONFIG2H_WDT_Enabled = 0x1;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Timer 
	 * Disabled-Controlled by SWDTEN bit 
	 */
	const uint8 CONFIG2H_WDT_DisabledControlledbySWDTENbit = 0x0;



	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:32768 
	 */
	const uint8 CONFIG2H_WDTPS__132768 = 0x1e;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:16384 
	 */
	const uint8 CONFIG2H_WDTPS__116384 = 0x1c;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:8192 
	 */
	const uint8 CONFIG2H_WDTPS__18192 = 0x1a;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:4096 
	 */
	const uint8 CONFIG2H_WDTPS__14096 = 0x18;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:2048 
	 */
	const uint8 CONFIG2H_WDTPS__12048 = 0x16;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:1024 
	 */
	const uint8 CONFIG2H_WDTPS__11024 = 0x14;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:512 
	 */
	const uint8 CONFIG2H_WDTPS__1512 = 0x12;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:256 
	 */
	const uint8 CONFIG2H_WDTPS__1256 = 0x10;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:128 
	 */
	const uint8 CONFIG2H_WDTPS__1128 = 0xe;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:64 
	 */
	const uint8 CONFIG2H_WDTPS__164 = 0xc;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:32 
	 */
	const uint8 CONFIG2H_WDTPS__132 = 0xa;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:16 
	 */
	const uint8 CONFIG2H_WDTPS__116 = 0x8;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:8 
	 */
	const uint8 CONFIG2H_WDTPS__18 = 0x6;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:4 
	 */
	const uint8 CONFIG2H_WDTPS__14 = 0x4;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:2 
	 */
	const uint8 CONFIG2H_WDTPS__12 = 0x2;
	/*
	 * <b>CONFIG2H</b> 
	 * Watchdog Postscaler 
	 * 1:1 
	 */
	const uint8 CONFIG2H_WDTPS__11 = 0x0;



	/*
	 * <b>CONFIG3H</b> 
	 * CCP2 Mux 
	 * RC1 
	 */
	const uint8 CONFIG3H_CCP2MUX_RC1 = 0x1;
	/*
	 * <b>CONFIG3H</b> 
	 * CCP2 Mux 
	 * RB3 
	 */
	const uint8 CONFIG3H_CCP2MUX_RB3 = 0x0;



	/*
	 * <b>CONFIG3H</b> 
	 * PortB A/D Enable 
	 * PORTB<4:0> configured as analog inputs on RESET 
	 */
	const uint8 CONFIG3H_PBADEN_PORTB40configuredasanaloginputsonRESET = 0x2;
	/*
	 * <b>CONFIG3H</b> 
	 * PortB A/D Enable 
	 * PORTB<4:0> configured as digital I/O on RESET 
	 */
	const uint8 CONFIG3H_PBADEN_PORTB40configuredasdigitalIOonRESET = 0x0;



	/*
	 * <b>CONFIG3H</b> 
	 * Low Power Timer1 Osc enable 
	 * Enabled 
	 */
	const uint8 CONFIG3H_LPT1OSC_Enabled = 0x4;
	/*
	 * <b>CONFIG3H</b> 
	 * Low Power Timer1 Osc enable 
	 * Disabled 
	 */
	const uint8 CONFIG3H_LPT1OSC_Disabled = 0x0;



	/*
	 * <b>CONFIG3H</b> 
	 * Master Clear Enable 
	 * MCLR Enabled,RE3 Disabled 
	 */
	const uint8 CONFIG3H_MCLRE_MCLREnabledRE3Disabled = 0x80;
	/*
	 * <b>CONFIG3H</b> 
	 * Master Clear Enable 
	 * MCLR Disabled,RE3 Enabled 
	 */
	const uint8 CONFIG3H_MCLRE_MCLRDisabledRE3Enabled = 0x0;



	/*
	 * <b>CONFIG4L</b> 
	 * Stack Overflow Reset 
	 * Enabled 
	 */
	const uint8 CONFIG4L_STVR_Enabled = 0x1;
	/*
	 * <b>CONFIG4L</b> 
	 * Stack Overflow Reset 
	 * Disabled 
	 */
	const uint8 CONFIG4L_STVR_Disabled = 0x0;



	/*
	 * <b>CONFIG4L</b> 
	 * Low Voltage Program 
	 * Enabled 
	 */
	const uint8 CONFIG4L_LVP_Enabled = 0x4;
	/*
	 * <b>CONFIG4L</b> 
	 * Low Voltage Program 
	 * Disabled 
	 */
	const uint8 CONFIG4L_LVP_Disabled = 0x0;



	/*
	 * <b>CONFIG4L</b> 
	 * Extended CPU Enable 
	 * Enabled 
	 */
	const uint8 CONFIG4L_ENHCPU_Enabled = 0x40;
	/*
	 * <b>CONFIG4L</b> 
	 * Extended CPU Enable 
	 * Disabled 
	 */
	const uint8 CONFIG4L_ENHCPU_Disabled = 0x0;



	/*
	 * <b>CONFIG4L</b> 
	 * Background Debug 
	 * Disabled 
	 */
	const uint8 CONFIG4L_BACKBUG_Disabled = 0x80;
	/*
	 * <b>CONFIG4L</b> 
	 * Background Debug 
	 * Enabled 
	 */
	const uint8 CONFIG4L_BACKBUG_Enabled = 0x0;



	/*
	 * <b>CONFIG5L</b> 
	 * Code Protect 00800-01FFF 
	 * Disabled 
	 */
	const uint8 CONFIG5L_CP_0_Disabled = 0x1;
	/*
	 * <b>CONFIG5L</b> 
	 * Code Protect 00800-01FFF 
	 * Enabled 
	 */
	const uint8 CONFIG5L_CP_0_Enabled = 0x0;



	/*
	 * <b>CONFIG5L</b> 
	 * Code Protect 02000-03FFF 
	 * Disabled 
	 */
	const uint8 CONFIG5L_CP_1_Disabled = 0x2;
	/*
	 * <b>CONFIG5L</b> 
	 * Code Protect 02000-03FFF 
	 * Enabled 
	 */
	const uint8 CONFIG5L_CP_1_Enabled = 0x0;



	/*
	 * <b>CONFIG5H</b> 
	 * Code Protect Boot 
	 * Disabled 
	 */
	const uint8 CONFIG5H_CPB_Disabled = 0x40;
	/*
	 * <b>CONFIG5H</b> 
	 * Code Protect Boot 
	 * Enabled 
	 */
	const uint8 CONFIG5H_CPB_Enabled = 0x0;



	/*
	 * <b>CONFIG5H</b> 
	 * Data EEPROM Code Protect 
	 * Disabled 
	 */
	const uint8 CONFIG5H_CPD_Disabled = 0x80;
	/*
	 * <b>CONFIG5H</b> 
	 * Data EEPROM Code Protect 
	 * Enabled 
	 */
	const uint8 CONFIG5H_CPD_Enabled = 0x0;



	/*
	 * <b>CONFIG6L</b> 
	 * Table Write Protect 00800-01FFF 
	 * Disabled 
	 */
	const uint8 CONFIG6L_WRT_0_Disabled = 0x1;
	/*
	 * <b>CONFIG6L</b> 
	 * Table Write Protect 00800-01FFF 
	 * Enabled 
	 */
	const uint8 CONFIG6L_WRT_0_Enabled = 0x0;



	/*
	 * <b>CONFIG6L</b> 
	 * Table Write Protect 02000-03FFF 
	 * Disabled 
	 */
	const uint8 CONFIG6L_WRT_1_Disabled = 0x2;
	/*
	 * <b>CONFIG6L</b> 
	 * Table Write Protect 02000-03FFF 
	 * Enabled 
	 */
	const uint8 CONFIG6L_WRT_1_Enabled = 0x0;



	/*
	 * <b>CONFIG6H</b> 
	 * Config. Write Protect 
	 * Disabled 
	 */
	const uint8 CONFIG6H_WRTC_Disabled = 0x20;
	/*
	 * <b>CONFIG6H</b> 
	 * Config. Write Protect 
	 * Enabled 
	 */
	const uint8 CONFIG6H_WRTC_Enabled = 0x0;



	/*
	 * <b>CONFIG6H</b> 
	 * Table Write Protect Boot 
	 * Disabled 
	 */
	const uint8 CONFIG6H_WRTB_Disabled = 0x40;
	/*
	 * <b>CONFIG6H</b> 
	 * Table Write Protect Boot 
	 * Enabled 
	 */
	const uint8 CONFIG6H_WRTB_Enabled = 0x0;



	/*
	 * <b>CONFIG6H</b> 
	 * Data EEPROM Write Protect 
	 * Disabled 
	 */
	const uint8 CONFIG6H_WRTD_Disabled = 0x80;
	/*
	 * <b>CONFIG6H</b> 
	 * Data EEPROM Write Protect 
	 * Enabled 
	 */
	const uint8 CONFIG6H_WRTD_Enabled = 0x0;



	/*
	 * <b>CONFIG7L</b> 
	 * Table Read Protect 00800-01FFF 
	 * Disabled 
	 */
	const uint8 CONFIG7L_EBTR_0_Disabled = 0x1;
	/*
	 * <b>CONFIG7L</b> 
	 * Table Read Protect 00800-01FFF 
	 * Enabled 
	 */
	const uint8 CONFIG7L_EBTR_0_Enabled = 0x0;



	/*
	 * <b>CONFIG7L</b> 
	 * Table Read Protect 02000-03FFF 
	 * Disabled 
	 */
	const uint8 CONFIG7L_EBTR_1_Disabled = 0x2;
	/*
	 * <b>CONFIG7L</b> 
	 * Table Read Protect 02000-03FFF 
	 * Enabled 
	 */
	const uint8 CONFIG7L_EBTR_1_Enabled = 0x0;



	/*
	 * <b>CONFIG7H</b> 
	 * Table Read Protect Boot 
	 * Disabled 
	 */
	const uint8 CONFIG7H_EBTRB_Disabled = 0x40;
	/*
	 * <b>CONFIG7H</b> 
	 * Table Read Protect Boot 
	 * Enabled 
	 */
	const uint8 CONFIG7H_EBTRB_Enabled = 0x0;



