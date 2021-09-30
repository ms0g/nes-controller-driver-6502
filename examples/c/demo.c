/*	example c code for nes controller driver */	
 
 
#include "nes-cnt-drv-6502.h"

// GLOBAL VARIABLES
unsigned char pad1;

void main (void) {
	
	while (1){
		pad1=pad_trigger(PAD1); // read the first controller
		
		if (pad1 & LEFT_BUTTON_MASK){
			;
		} else if (pad1 & RIGHT_BUTTON_MASK){
			;
		}
		if (pad1 & UP_BUTTON_MASK){
			;
		}
		else if (pad1 & DOWN_BUTTON_MASK){
			;
		}
		
	}
}
	



