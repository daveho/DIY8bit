;;**********************************************************************
;; i82c55a routines
;;**********************************************************************

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

;; vim:ft=asm6809:
;; vim:ts=4:
