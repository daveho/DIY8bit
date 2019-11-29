	INCLUDE "i82c55a.asm"
	INCLUDE "i82c54.asm"

	;; Device includes need to precede the port includes
	INCLUDE "ports.asm"

;;**********************************************************************
;; Constants
;;**********************************************************************

;; 3.6864 MHz crystal: E clock is 921.6 kHz, divide by 96
ACIA_CLKDIV EQU 6

;;**********************************************************************
;; Variables
;;**********************************************************************
count_var EQU $1000

;;**********************************************************************
;; Code
;;**********************************************************************

	;; The first 4K of the upper 32K is not used because it
	;; is reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; The actual code begins at $9000
	ORG $9000

entry
	;; put system stack at top of RAM
	lds #$7FFE

	;; Initialize the i82c55a device
	jsr i82c55a_init

	;; Initialize the i82c54 device
	jsr i82c54_init

	;; clear count variable
	lda #0
	sta count_var

main_loop
	lda count_var                 ; load count variable
	sta PORT_I82C55A_A            ; store to i82c55a port A register

	inca                          ; increment count
	sta count_var                 ; store updated value to count

	jsr delay                     ; delay
	jmp main_loop                 ; repeat main loop

;; Delay routine: clobbers A and X.
delay
	lda #0
1
	jsr delay_inner
	deca
	cmpa #$ff
	blo 1B
	rts

;; Inner delay subroutine: clobbers X.
delay_inner
	ldx #0
1
	leax 1, x
	cmpx #$fff
	blo 1B
	rts

i82c55a_init
	; For now, set both groups to mode 0, and configure all ports
	; as output.
	lda #(I82C55A_CTRL_MODESET|I82C55A_CTRL_GROUPA_MODE0|I82C55A_CTRL_GROUPA_PORTA_OUT|I82C55A_CTRL_GROUPA_PORTC_UPPER_OUT|I82C55A_CTRL_GROUPB_MODE0|I82C55A_CTRL_GROUPB_PORTB_OUT|I82C55A_CTRL_GROUPB_PORTC_LOWER_OUT)
	sta PORT_I82C55A_CTRL
	rts

i82c54_init
	; Counter 0 generates the rx/tx clock signal for the ACIA.
	lda #(I82C54_CTRL_SEL_CNT0|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_3|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #ACIA_CLKDIV
	sta PORT_I82C54_CNT0
	lda #0
	sta PORT_I82C54_CNT0

	; Counter 1 is used to generate a timer interrupt.
	; We use mode 2 (rate generator), using a count of 0, which
	; is effectively 65536, thus the timer interrupt occurs as
	; infrequently as possible.
	lda #(I82C54_CTRL_SEL_CNT1|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_2|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #0
	sta PORT_I82C54_CNT1
	lda #0
	sta PORT_I82C54_CNT1

	; Counter 2: mode 3, arbitrarily divide by 6
	lda #(I82C54_CTRL_SEL_CNT2|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_3|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #6
	sta PORT_I82C54_CNT2
	lda #0
	sta PORT_I82C54_CNT2

	rts

;;**********************************************************************
;; Interrupt vectors
;;**********************************************************************

	;; reset vector
	ORG $FFFE
	FDB entry

;; vim:ft=asm6809:
;; vim:ts=4:
