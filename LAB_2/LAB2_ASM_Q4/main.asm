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

            mov.w   #6h,R4;
            mov.w   #9h,R5;
            cmp R4,R5;
            jhs Greater

            jlo Less

Greater:
            mov.w   #1,&2000h;
            mov.w   #2,&2002h;
            mov.w   #3,&2004h;
            mov.w   #4,&2006h;
            mov.w   #5,&2008h;
            dec R4;
            jmp $;

Less:
            mov.w   #10,&2000h;
            mov.w   #9,&2002h;
            mov.w   #8,&2004h;
            mov.w   #7,&2006h;
            mov.w   #6,&2008h;
            dec R4;
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
            
