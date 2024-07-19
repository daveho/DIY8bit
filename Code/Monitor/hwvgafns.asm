;;**********************************************************************
;; Hardware VGA text mode functions
;;**********************************************************************

hwvga_init
	lda #0
	sta hwvga_cur_font            ; default to font 0

	; Clear bank 0
	lda #0
	jsr hwvga_set_bank
	lda #$20                      ; space
	ldb #HWVGA_DEFAULT_ATTR       ; default attribute
	jsr hwvga_fill_bank

	; Clear bank 1
	lda #1
	jsr hwvga_set_bank
	lda #$20                      ; space
	ldb #HWVGA_DEFAULT_ATTR       ; default attribute
	jsr hwvga_fill_bank

	; Clear bank 2
	lda #2
	jsr hwvga_set_bank
	lda #$20                      ; space
	ldb #HWVGA_DEFAULT_ATTR       ; default attribute
	jsr hwvga_fill_bank

	; Initialize cursor
	lda #HWVGA_DEFAULT_ATTR
	sta hwvga_cursor_saved_attr
	lda #0
	sta hwvga_cursor_row
	sta hwvga_cursor_col
	sta hwvga_irq_count

	; Install cursor interrupt handler, which is invoked 60 times/sec
	; when vertical refresh interrupts occur
	ldx #hwvga_irq_handler
	ldy #virqtab
	stx 12,y

	; Unmask IRQ6 so that the cursor animation routine can run
	; FIXME: need a variable to store current IRQ mask, since we can't read it
	lda #$BF
	sta PORT_IRQCTRL

	rts

;; Default handler for vertical refresh interrupt (IRQ6).
;; Handles blinking the cursor (which, like the C64, is done
;; in software.)
hwvga_irq_handler
	lda hwvga_irq_count           ; how many vrefresh irqs have occurred?
	cmpa #30                      ; less than 30?
	blt 98f                       ; if so, just incr count, and done

	; count reached 30, so invert attribute at cursor position
	lda hwvga_cursor_row          ; get cursor row
	ldb hwvga_cursor_col          ; get cursol column
	jsr hwvga_compute_addr        ; compute VRAM address
	jsr hwvga_map_bank            ; access address within bank (and switch to that bank)
	lda 1,X                       ; get attribute
	; swap fg/bg of attribute
	ldy #REVERSE_ATTR             ; load address of attribute reversal table
	lda A,Y                       ; get reversed attribute
	sta 1,X                       ; set reversed fg/bg at cursor position
	lda #0
	sta hwvga_irq_count           ; set counter back to 0
	jmp 99f                       ; done

98
	inca                          ; increment count

99
	sta hwvga_irq_count           ; update count
	jsr reset_irq6_ff             ; reset the IRQ6 flip flop
	rts

;; Compute the VRAM address of the first byte of the character cell
;; at specified row and column.
;; Parameters:
;;   A - the row (should be in range 0-29)
;;   B - the column (should be in range 0-79)
;; Return (in X register):
;;   the VRAM address of the first byte of the character cell
;; Clobbers Y
hwvga_compute_addr
	pshs B                        ; save column
	ldb #0
	pshs B                        ; push 0 byte onto stack
	tfr S,Y                       ; Y points to 0-extended column value
	ldb #160                      ; number of bytes per row
	mul                           ; set D to row*160
	addd ,Y                       ; add column to row*160
	puls X                        ; clear 0-extended column from stack
	tfr D,X                       ; move computed address to X
	rts

;; Map the VRAM address in X to a bank.
;; Selects the appropriate bank, and adjusts the value in X
;; so that it is the correct absolute address in the VRAM
;; window to refer to the original VRAM address.
;; Clobbers A and B.
hwvga_map_bank
	tfr X,D                       ; move VRAM address to D
	ldx #0                        ; X is bank (initially assume bank 0)

1
	cmpd #2048                    ; check whether we're reached the correct bank
	ble 99f                       ; if so, exit loop
	leax 1,X                      ; add 1 to X
	subd #2048                    ; move past one bank
	jmp 1b

99
	addd #HWVGA_VRAM              ; add VRAM window base address to adjusted VRAM addr
	pshs D                        ; save computed VRAM addr
	tfr X,D                       ; move bank to A:B (bank will be in B)
	orb hwvga_cur_font            ; keep font bits the same
	stb HWVGA_BANKREG             ; set bank/font
	puls X                        ; pop computed VRAM addr into X

	rts

;; Select a bank without changing the font
;; Parameters:
;;   A - bank to set (0-3)
hwvga_set_bank
	anda #3                       ; zero out all bits other than bank
	sta hwvga_cur_bank            ; keep track of the current bank
	ora hwvga_cur_font            ; incorporate the current font bits
	sta HWVGA_BANKREG             ; store new value in bank/font register
	rts

;; Select a font without changing the bank
;; Parameters:
;;   A - font to set (0-15)
hwvga_set_font
    ; Left-shift the bank by 4 bits to put it in the correct part
    ; of the bank/font selection register bits
	lsla
	lsla
	lsla
	lsla
	sta hwvga_cur_font            ; keep track of current font bits
	ora hwvga_cur_bank            ; preserve currently-selected bank
	sta HWVGA_BANKREG             ; store new value in bank/font register
	rts

;; Fill currently-selected VRAM bank with specified character and attribute.
;; Parameters:
;;   A - fill character
;;   B - fill attribute
;; Clobbers X.
hwvga_fill_bank
	ldx #HWVGA_VRAM
1
	sta ,X+
	stb ,X+
	cmpx #HWVGA_VRAM_END
	blt 1b
	rts


;; vim:ft=asm6809:
;; vim:ts=4:
