;; Show "photo" of Ingo on the 80x30 text display

	INCLUDE "../Include/offtab.asm"
	INCLUDE "../Include/iodev.asm"

	ORG $1000

entry
	; First bank
	ldx #HWVGA_VRAM               ; dest VRAM window addr
	lda #0                        ; VRAM bank
	jsr [OFFTAB_HWVGA_SET_BANK]   ; set the bank
	ldy #image                    ; source host addr
	ldd #2048                     ; amount of data to copy
	jsr [OFFTAB_HWVGA_COPY_DUMB]  ; copy data

	; Second bank
	ldx #HWVGA_VRAM               ; dest VRAM window addr
	lda #1                        ; VRAM bank
	jsr [OFFTAB_HWVGA_SET_BANK]   ; set the bank
	ldy #(image+2048)             ; source host addr
	ldd #2048                     ; amount of data to copy
	jsr [OFFTAB_HWVGA_COPY_DUMB]  ; copy data

	; Third bank
	ldx #HWVGA_VRAM               ; dest VRAM window addr
	lda #2                        ; VRAM bank
	jsr [OFFTAB_HWVGA_SET_BANK]   ; set the bank
	ldy #(image+4096)             ; source host addr
	ldd #704                      ; amount of data to copy
	jsr [OFFTAB_HWVGA_COPY_DUMB]  ; copy data

	rts

	ORG $1800
	INCLUDE "ingo.asm"

;; vim:ft=asm6809:
;; vim:ts=4:
