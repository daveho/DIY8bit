	ORG $8000
	FILL $FF, 4096

	ORG $9000

entry
	;; output a pattern to the '574 output port in the low
	;; I/O address range
	lda #$55
	sta $8000

loop
	nop
	nop
	nop
	nop
	nop
	nop
	jmp loop


	;; reset vector
	ORG $FFFE
	FDB entry

;; vim:ft=asm6809:
