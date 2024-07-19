;;**********************************************************************
;; External interrupt routines
;;**********************************************************************

;; Initialize the interrupt controller.
irqctrl_init
	lda #$FF         ; all IRQs are masked initially
	sta PORT_IRQCTRL ; store initial mask value in mask register
	sta vmaskreg     ; store initial mask value in vmaskreg variable

	;; Set the flip-flops handling the edge-triggered interrupts
	;; (IRQ3 and IRQ6) to a high (non-asserted) output.
	jsr reset_irq3_ff
	jsr reset_irq6_ff

	;; Fill in all entries in virqtab by copying entries
	;; from DEFAULT_IRQ_HANDLER_TABLE
	lda #16          ; table has 8 entries (16 bytes total)
	ldx #virqtab     ; X is the destination address
	ldy #DEFAULT_IRQ_HANDLER_TABLE ; Y is the source address
1
	ldb ,Y+          ; retrieve byte
	stb ,X+          ; store byte
	deca             ; decrease count
	bne 1B           ; if count != 0, continue loop

99
	rts

;; Main interrupt handler, called automatically in response to
;; CPU's ~IRQ input being asserted.  Determines highest-priority
;; IRQ and dispatches to appropriate handler.
irq_dispatch
	lda PORT_IRQCTRL ; read irq priority
	beq 99F          ; if irq priority=0, there is no interrupt
	cmpa #$07        ; sanity check irq priority is in valid range
	bhi 99F          ; if not, done
	lsla             ; multiply irq priority by 2 (addresses are 2 bytes)
	ldx #virqtab     ; get IRQ handler table base address
	ldy A,X          ; load IRQ handler address
	jsr ,Y           ; dispatch to handler
99
	rti              ; return to main program

;; Default IRQ handler for level-triggered interrupts (does nothing)
noop_irq_handler
	rts

;; Reset IRQ3 flip flop.
;; This should be called after handling IRQ3.
reset_irq3_ff
	lda #IRQ3_FF_SET_ASSERT
	sta PORT_I82C55A_CTRL
	lda #IRQ3_FF_SET_DEASSERT
	sta PORT_I82C55A_CTRL
	rts

;; Reset IRQ6 flip flop.
;; This should be called after handling IRQ6.
reset_irq6_ff
	lda #IRQ6_FF_SET_ASSERT
	sta PORT_I82C55A_CTRL
	lda #IRQ6_FF_SET_DEASSERT
	sta PORT_I82C55A_CTRL
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
