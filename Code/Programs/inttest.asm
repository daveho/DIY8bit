;; Test program for interrupt handling.

	INCLUDE "../Include/offtab.asm"

;; Address of virqtab in the monitor program
virqtab EQU $0010

;; Address of port A of the 82C55A
PORTA EQU $8000

;; Count variable
countvar EQU $2000

	ORG $1000

;; This test program should be loaded using the 'd' command, and
;; then invoked from the monitor using the commands:
;;
;;   a 1000
;;   s
;;
;; When control returns to the monitor, unmask IRQ3 and enable
;; interrupt handling using the commands
;;
;;   m f7
;;   q
;;
entry
	;; set counter variable to 0
	lda #$00
	sta countvar

	;; install handler for IRQ3
	ldx #virqtab
	ldy #irq3_handler
	sty 6,X                       ; entry for IRQ3 is at offset 6

	rts

;; Interrupt handler for IRQ3, which is the periodic timer interrupt.
;; Outputs the current count value on port A of the 82C55A, increments
;; the count, and resets the edge detection flip flop (so IRQ3 will
;; be deasserted.)
irq3_handler
	lda countvar                  ; get current count value
	sta PORTA                     ; output count to port A of 82C55A
	inca                          ; increment count
	sta countvar                  ; store incremented count
	ldx OFFTAB_RESET_IRQ3_FF      ; get address of reset_irq3_ff
	jsr ,X                        ; call reset_irq3_ff
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
