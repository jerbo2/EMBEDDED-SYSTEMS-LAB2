#include <msp430.h> 


int sum(int a, int b);

int main(void){
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int b_one = 0xF001;
	int b_two = 0x8000;

	int addition_result = 0;

	addition_result = sum(b_one,b_two);

	while(1)

	return 0;
}

int sum(int a, int b){
    int result = a + b;
    return result;
}

