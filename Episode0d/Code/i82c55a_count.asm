	INCLUDE "ports.asm"
	INCLUDE "i82c55a.asm"

	;; The first 4K of the upper 32K is not used because it
	;; is reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; The actual code begins at $9000
	ORG $9000

;; Variables
count_var EQU $1000

entry
	;; Initialize the i82c55a device
	jsr i82c55a_init

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

	;; reset vector
	ORG $FFFE
	FDB entry

;; vim:ft=asm6809:
;; vim:ts=4:
