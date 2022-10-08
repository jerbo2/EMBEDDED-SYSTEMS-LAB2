;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

			mov.b #0000, R4;
			mov.b #0111, R5;
			mov.b #0001, R6;

			mov.b #0AFh, R9;
			mov.b #0, R10;

			and R6, R4;
			and R6, R5;

			cmp R4, R6;
			jeq R4_LSB_Set;
			jge R4_LSB_Not_Set;
			jmp $;

R4_LSB_Set:
			cmp R5, R6;
			jeq Both_LSB_Set;
			jl Only_R4;
			jmp $;

Both_LSB_Set:
			mov.w #0FF0h, R9;
			jmp $;


Only_R4:
			inv R9;
			mov.b R9, R10;
			jmp $;

R4_LSB_Not_Set:
			cmp R5, R6;
			jeq Only_R5;
			jmp $;

Only_R5:
			mov.b R9, R10;
			inv R10;
			jmp $;




;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
