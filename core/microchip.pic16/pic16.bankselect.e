library pic16.bankselect;

use microchip.pic16;
use microchip.pic16.enchanced;

/*
 * Optimizer: microchip.optimize.bankselect.pic16
 */
annotation bankSelectOptimization;

SELECTB(address f){
	#bankSelectOptimization;
	<b000000001:9 f:5:7>
}