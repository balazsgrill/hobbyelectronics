binary configuration;

use microchip.PIC18F14K50;

data {
		0;
		CONFIG1H_FCMEN_Disabled+CONFIG1H_IESO_Disabled+CONFIG1H_OSC_INTRCPortonRA6PortonRA7;
		CONFIG2L_BODENV__20V+CONFIG2L_BODEN_DisabledinhardwareSBORENdisabled+CONFIG2L_PUT_Disabled;
		CONFIG2H_WDTPS__18192+CONFIG2H_WDT_DisabledControlledbySWDTENbit;
		0;
		CONFIG3H_CCP2MUX_RB3+CONFIG3H_LPT1OSC_Disabled+CONFIG3H_MCLRE_MCLRDisabledRE3Enabled+CONFIG3H_PBADEN_PORTB40configuredasdigitalIOonRESET;
		CONFIG4L_BACKBUG_Disabled+CONFIG4L_ENHCPU_Disabled+CONFIG4L_LVP_Disabled+CONFIG4L_STVR_Disabled;
		0;
		CONFIG5L_CP_0_Disabled+CONFIG5L_CP_1_Disabled;
		CONFIG5H_CPB_Disabled+CONFIG5H_CPD_Disabled;
		CONFIG6L_WRT_0_Disabled+CONFIG6L_WRT_1_Disabled;
		0;
		CONFIG7L_EBTR_0_Disabled+CONFIG7L_EBTR_1_Disabled;
		CONFIG7H_EBTRB_Disabled;
	} at CONFIG_ADDRESS;