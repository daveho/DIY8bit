;;**********************************************************************
;; TMS9918A VDP routines
;;**********************************************************************

;; Initialize the VDP.
;; For now, go into text mode.
tms9918a_init
	; Write initial values to VDP register

	lda #TMS9918A_TEXTMODE_R0_INIT
	ldb #0
	jsr tms9918a_write_reg
	jsr delay

	lda #TMS9918A_TEXTMODE_R1_INIT
	ldb #1
	jsr tms9918a_write_reg
	jsr delay

	lda #TMS9918A_TEXTMODE_R2_INIT
	ldb #2
	jsr tms9918a_write_reg
	jsr delay

	lda #TMS9918A_TEXTMODE_R4_INIT
	ldb #4
	jsr tms9918a_write_reg
	jsr delay

	;lda #((TMS9918A_COLOR_WHITE<<4) | TMS9918A_COLOR_BLACK)
	lda #((TMS9918A_COLOR_WHITE<<4) | TMS9918A_COLOR_DK_BLUE)
	ldb #7
	jsr tms9918a_write_reg
	jsr delay

	; Clear the VRAM
	jsr tms9918a_clear_vram

	; Load text font into the pattern area (starting at $0000 in VRAM)
	jsr tms9918a_load_font

	; can we display some text?
	ldx #$800
	jsr tms9918a_set_addr
	ldx #ALL_YOUR_BASE
	jsr tms9918a_write_str

	rts

;; Write a byte to a TMS9918A register.
;; A=data byte, B=which register to write
tms9918a_write_reg
	sta PORT_TMS9918A_CTRL        ; value to write
	jsr tms9918a_delay
	orb #$80                      ; set MSB of byte containing reg num
	stb PORT_TMS9918A_CTRL        ; write register number
	jsr tms9918a_delay
	rts

;; Set 14-bit VRAM to access.
;; X=address, clobbers A
tms9918a_set_addr
	pshs X                        ; push MSB and LSB of VRAM address
	puls B                        ; pop VRAM addr MSB to B
	puls A                        ; pop VRAM addr LSB to A
	sta PORT_TMS9918A_CTRL        ; write LSB of address
	jsr tms9918a_delay
	orb #$40                      ; two most significant bits should be 01
	stb PORT_TMS9918A_CTRL        ; write MSB of address
	jsr tms9918a_delay
	rts

;; Clear VRAM
;; Clobbers X and A
tms9918a_clear_vram
	; Set VRAM address to 0
	ldx #0
	jsr tms9918a_set_addr

	ldx #16384                    ; X is count of # bytes to write
1
	lda #0
	sta PORT_TMS9918A_DATA        ; write 0 to VRAM
	jsr tms9918a_delay
	leax -1,X                     ; decrement X
	cmpx #0                       ; X is 0?
	bne 1b                        ; if not, continue loop

	rts

;; Load font data into VRAM.
;; Clobbers X/A.
tms9918a_load_font
	leas -2,S                     ; reserve 2 bytes on stack
	ldx #$0000                    ; load font data to address $0000 in VRAM
	jsr tms9918a_set_addr         ; set address
	ldx #(tms9918a_font+1024)     ; address at end of font data
	stx ,S                        ; store end address on stack
	ldx #tms9918a_font            ; get address of font
1
	lda ,X+                       ; get next byte of font data, incr pointer
	sta PORT_TMS9918A_DATA        ; write font byte to VRAM
	jsr tms9918a_delay
	cmpx ,S                       ; has pointer reached end of font data?
	bne 1b                        ; if not, continue loop
	leas 2,S                      ; clear stack
	rts

;; Write a NUL-terminated string to VDP memory.
;; Assumes that the VRAM address has already been set to
;; the desired destination.
;; X=ptr to string to write
;; Clobbers A
tms9918a_write_str
1
	lda ,X+                       ; get next byte from string
	cmpa #0                       ; is NUL terminator?
	beq 99f                       ; if so, done copying the string
	sta PORT_TMS9918A_DATA        ; write byte to VRAM
	jsr tms9918a_delay            ; delay
	jmp 1b                        ; continue loop
99
	rts

tms9918a_delay
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
