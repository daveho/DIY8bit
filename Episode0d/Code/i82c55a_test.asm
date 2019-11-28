	INCLUDE "ports.asm"
	INCLUDE "i82c55a.asm"

	;; The first 4K of the upper 32K is not used because it
	;; is reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; The actual code begins at $9000
	ORG $9000

;; Variables
dir EQU $7000
bitval EQU $7001
count EQU $7002

entry
	;; put system stack at top of RAM
	lds #$7FFE

	;; Initialize the i82c55a device
	jsr i82c55a_init

	;; Initialize variables
	lda #1
	sta dir
	sta bitval
	lda #0
	sta count

loop
	lda #$55
	sta PORT_I82C55A_A
	sta PORT_I82C55A_B
	jmp loop

;;loop
;;	lda dir
;;	bne right
;;	lsla
;;	jmp show
;;
;;right
;;	lsra
;;
;;show
;;	lda bitval
;;	sta I82C55A_REG_PORTA
;;	sta I82C55A_REG_PORTB
;;
;;	lda count
;;	inca
;;	cmpa #15
;;	beq reverse
;;	sta count
;;	jmp loop
;;
;;reverse
;;	lda #0
;;	sta count
;;	lda dir
;;	eora #1
;;	sta dir
;;	jmp loop

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
