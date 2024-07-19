;; Test HWVGA routines

	INCLUDE "../Include/offtab.asm"
	INCLUDE "../Include/iodev.asm"

	ORG $1000

entry
	lda #3
	ldb #5
	ldy OFFTAB_HWVGA_COMPUTE_ADDR
	jsr ,y

	rts

	ldy OFFTAB_HWVGA_MAP_BANK
	jsr ,y
	; At this point, X should contain the correct address to write
	; to in the VRAM window in order to modify the character cell
	; at row 3, column 5
	lda #1                        ; smiley face
	sta ,X
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
