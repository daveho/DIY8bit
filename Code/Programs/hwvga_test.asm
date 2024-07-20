;; Test HWVGA routines

	INCLUDE "../Include/offtab.asm"
	INCLUDE "../Include/iodev.asm"

	ORG $1000

entry
;	lda #3
;	ldb #5
;	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
;
;	jsr [OFFTAB_HWVGA_MAP_BANK]
;	; At this point, X should contain the correct address to write
;	; to in the VRAM window in order to modify the character cell
;	; at row 3, column 5
;	lda #1                        ; smiley face
;	sta ,X
;
;
;	lda #24
;	ldb #79
;	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
;	jsr [OFFTAB_HWVGA_MAP_BANK]
;	lda #234                       ; omega
;	sta ,x
;	lda #(HWVGA_BG_MAGENTA|HWVGA_FG_BR_GREEN)
;	sta 1,x

	lda #0
	ldb #8
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf1
	ldd #28
	jsr [OFFTAB_HWVGA_COPY_DUMB]

	lda #1
	ldb #8
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf2
	ldd #28
	jsr [OFFTAB_HWVGA_COPY_DUMB]

	lda #2
	ldb #8
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf3
	ldd #28
	jsr [OFFTAB_HWVGA_COPY_DUMB]

	lda #(HWVGA_BG_BLACK | HWVGA_FG_WHITE)
	jsr [OFFTAB_HWVGA_SET_ATTR]

	lda #0
	ldb #28
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf4
	ldd #27
	jsr [OFFTAB_HWVGA_WRITE_DUMB]

	lda #1
	ldb #32
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf5
	ldd #25
	jsr [OFFTAB_HWVGA_WRITE_DUMB]

	lda #2
	ldb #36
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf6
	ldd #32
	jsr [OFFTAB_HWVGA_WRITE_DUMB]

	lda #(HWVGA_BG_BLACK | HWVGA_FG_BR_GREEN)
	jsr [OFFTAB_HWVGA_SET_ATTR]

	lda #4
	ldb #0
	jsr [OFFTAB_HWVGA_COMPUTE_ADDR]
	jsr [OFFTAB_HWVGA_MAP_BANK]
	ldy #buf7
	ldd #6
	jsr [OFFTAB_HWVGA_WRITE_DUMB]

	lda #4
	ldb #6
	jsr [OFFTAB_HWVGA_MOVE_CURSOR]

	rts

buf1
	FCB 223,$9b,223,$90,223,$90,223,$90,32,$a0,223,$0b,223,$90,223,$90,223,$90,32,$a0,223,$0b,223,$90,223,$90,223,$0b

buf2
	FCB 223,$ae,223,$a0,223,$a0,32,$a0,32,$a0,223,$ae,223,$a0,223,$a0,223,$0e,32,$a0,223,$0e,223,$a0,223,$a0,223,$0e

buf3
	FCB 223,$cd,32,$a0,32,$a0,32,$a0,32,$a0,223,$c0,223,$0d,223,$0d,223,$c0,32,$a0,223,$c0,223,$0d,223,$0d,223,$c0

buf4
	FCB "A 6809 microcomputer system"

buf5
	FCB "2016-2024 by daveho hacks"

buf6
	FCB 34,"All Your Base Are Belong To Us",34

buf7
	FCB "0000> "

;; vim:ft=asm6809:
;; vim:ts=4:
