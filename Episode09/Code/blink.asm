;; Blink demo

;;**********************************************************************
;; This is a demo program for Episode 9, using the "CircuitWithROM"
;; version of the circuit.  Because there is no RAM, we can't use
;; subroutines or variables.
;;**********************************************************************

;;**********************************************************************
;; Constants
;;**********************************************************************

;; There is a 74HCT574 mapped at $8000.  Its outputs are sent to
;; a common-anode 7 segment LED display.  Bits 0-6 control segments
;; A-F, and bit 7 controls the decimal point.  Set a bit to 0
;; to light the corresponding LED.  Set a bit to 1 to turn off the
;; corresponding LED.
OPORT EQU $8000

;; Bits controlling LED display segments.
SEG_A EQU (1<<0)
SEG_B EQU (1<<1)
SEG_C EQU (1<<2)
SEG_D EQU (1<<3)
SEG_E EQU (1<<4)
SEG_F EQU (1<<5)
SEG_G EQU (1<<6)

;;**********************************************************************
;; Program code
;;**********************************************************************

	;; Addresses from $8000 to $8FFF are reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; Addresses from $9000 to $FFFF are ROM, so that's where
	;; code and read-only data are located.
	ORG $9000

	;; Entry point for blink program
blink_entry

	;; B is a counter selecting one of the 16 possible
	;; hex digit values to display.
	ldb #0

	;; Main loop for the blink program.
main_loop
	ldx #hexfont
	lda B,X
	sta OPORT

	;; Delay loop
	ldx #0
1
	leax 1,X
	cmpx #$FFFF
	blo 1B

	;; Increment B and then mask all but low 4 bits
	incb
	andb #$0F

	jmp main_loop

	;; Bit patterns for the hex digits 0-9 and A-F
hexfont
	FCB ~(SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F)
	FCB ~(SEG_B|SEG_C)
	FCB ~(SEG_A|SEG_B|SEG_D|SEG_E|SEG_G)
	FCB ~(SEG_A|SEG_B|SEG_C|SEG_D|SEG_G)
	FCB ~(SEG_B|SEG_C|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_C|SEG_D|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_B|SEG_C)
	FCB ~(SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_B|SEG_C|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_B|SEG_C|SEG_E|SEG_F|SEG_G)
	FCB ~(SEG_C|SEG_D|SEG_E|SEG_F|SEG_G)
	FCB ~(SEG_D|SEG_E|SEG_G)
	FCB ~(SEG_B|SEG_C|SEG_D|SEG_E|SEG_G)
	FCB ~(SEG_A|SEG_D|SEG_E|SEG_F|SEG_G)
	FCB ~(SEG_A|SEG_E|SEG_F|SEG_G)

;;**********************************************************************
;; Vectors
;;**********************************************************************

	;; Reset vector: jump to blink_entry
	ORG $FFFE
	FDB blink_entry

;; vim:ft=asm6809:
