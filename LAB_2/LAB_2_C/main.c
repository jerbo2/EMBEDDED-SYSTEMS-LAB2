#include <msp430.h> 

// declare global variable
float global_var = 10;

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	// declare local variable
	int local_var = 10;

	// declare hex numbers for logic ops
	unsigned char hex_one = 0x98;
	unsigned char hex_two = 0x11;

	//declare unsigned chars to hold the results
	unsigned char and_result;
	unsigned char xor_result;

	// increment local and decrement global
	local_var += 1;
	global_var -= 1;

	// perform logic ops
	and_result = hex_one & hex_two;
	xor_result = hex_one ^ hex_two;

	return 0;
}
