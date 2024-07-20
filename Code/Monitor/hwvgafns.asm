;;**********************************************************************
;; Hardware VGA text mode functions
;;**********************************************************************

;; How many timer ticks occur before reversing the attributes
;; of the character at the current cursor position.
HWVGA_CURS_MAX EQU 5

hwvga_init
	lda #0
	sta hwvga_cur_font            ; default to font 0

	; default to bright green on black
	lda #HWVGA_DEFAULT_ATTR
	sta hwvga_cur_attr

	; clear display
	jsr hwvga_clear_screen

	; Initialize cursor
	lda #HWVGA_DEFAULT_ATTR
	sta hwvga_cursor_saved_attr
	lda #0
	sta hwvga_cursor_row
	sta hwvga_cursor_col
	sta hwvga_irq_count

	; Install cursor interrupt handler. Uses IRQ3, which is generated
	; by the 82C54.
	ldx #hwvga_irq_handler
	ldy #virqtab
	stx 6,y                       ; offset 6 is IRQ3 (entries are 2 bytes)

	; Unmask IRQ3 so that the cursor animation routine can run
	lda vmaskreg
	anda #~(1 << 3)
	sta vmaskreg
	sta PORT_IRQCTRL

	rts

;; Clear screen using current fg/bg colors.
;; Clobbers A, B, and X
hwvga_clear_screen
	lda #0                        ; counter (starts at 0)
	pshs A                        ; counter variable is on stack

1
	jsr hwvga_set_bank            ; Set bank

	; Increment bank (for next loop iteration)
	lda ,S
	inca
	sta ,S

	; Fill bank
	lda #$20                      ; space
	ldb hwvga_cur_attr            ; current attribute
	jsr hwvga_fill_bank

	; Done with banks 0-2?
	lda ,S
	cmpa #3
	bne 1b                        ; continue loop if not done with all banks

	leas 1,S                      ; clear stack
	rts

;; Interrupt handler to handle blinking the cursor (which,
;; like the C64, is done in software.) Uses IRQ3, which is
;; the interval timer generated by the 82C54.
hwvga_irq_handler
	lda hwvga_irq_count           ; how many vrefresh irqs have occurred?
	cmpa #HWVGA_CURS_MAX          ; less than max count?
	blt 98f                       ; if so, just incr count, and done

	; Preserve current bank, since hwvga_map_bank will change the bank,
	; and this could disturb the code that was interrupted by this
	; IRQ handler if it was expecting a specific bank to be selected.
	lda hwvga_cur_bank            ; get current bank
	pshs A                        ; push it on stack

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

	puls A                        ; retrieve saved current bank
	jsr hwvga_set_bank            ; restore saved current bank

	lda #0                        ; next count should be 0
	jmp 99f                       ; done

98
	inca                          ; increment count

99
	sta hwvga_irq_count           ; update count
	jsr reset_irq3_ff             ; reset the IRQ3 flip flop
	rts

;; Compute the VRAM address of the first byte of the character cell
;; at specified row and column.
;; Parameters:
;;   A - the row (should be in range 0-29)
;;   B - the column (should be in range 0-79)
;; Return (in X register):
;;   the VRAM address of the first byte of the character cell
hwvga_compute_addr
	lslb                          ; scale col by 2 (each ch/attr pair is 2 bytes)
	pshs B                        ; push column value
	ldb #160                      ; number of bytes per row
	mul                           ; D=row*bytes_per_row
	addb ,S                       ; add column
	bcc 99f                       ; if carry flag is clear, continue
	inca                          ; carry overflow into high byte
99
	tfr D, X                      ; copy result into X
	puls B                        ; clear stack
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

;; Set current attribute (to be used for subsequent output operations.)
;; Parameters:
;;   A - attribute to set
hwvga_set_attr
	sta hwvga_cur_attr
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

;; Dumb copy to VRAM. Won't work correctly if it needs to cross a
;; bank boundary!
;; Parameters:
;;   X - destination in VRAM window (assumes bank is already valid!)
;;   Y - data to copy
;;   D - number of bytes to copy (should be multiple of 2)
hwvga_copy_dumb
	pshs X                        ; push dest ptr to stack
	addd 0,S                      ; add number of bytes to copy (D=upper bound dest ptr)
	std 0,S                       ; set memory variable to upper bound dest ptr

	; Note that A/B/D are now available to use

	jmp 20f                       ; enter loop

10
	lda ,Y+                       ; get source byte and advance
	sta ,X+                       ; store dest byte and advance
	lda ,Y+                       ; get source byte and advance
	sta ,X+                       ; store dest byte and advance

20
	cmpx 0,S                      ; compare dest ptr to upper bound
	blt 10b                       ; if hasn't reached upper bound, continue loop

	leas 2,S                      ; clear stack
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
