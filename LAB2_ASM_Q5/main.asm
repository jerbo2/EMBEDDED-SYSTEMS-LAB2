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

			mov.w #18d, R4;
			mov.w #19d, R5;

			cmp R5, R4;

			jl less;
			jge greater;

			jmp $;

less:
			call #less_function;
			jmp $;

less_function:

			mov.w #10d, &2000h;
			mov.w #9d, &2002h;
			mov.w #8d, &2004h;
			mov.w #7d, &2006h;
			mov.w #6d, &2008h;

			dec R4;

			ret;

greater:
			jeq equal;
			call #greater_function;
			jmp $;

equal:
			jmp $;

greater_function:
			mov.w #1d, &2000h;
			mov.w #2d, &2002h;
			mov.w #3d, &2004h;
			mov.w #4d, &2006h;
			mov.w #5d, &2008h;

			dec R4;

			ret;
                                            

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
            
