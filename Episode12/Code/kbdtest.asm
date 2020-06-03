;; Keyboard test program: just reads scan codes from the FIFO
;; and prints their values

	INCLUDE "offtab.asm"

PORT_KBCTRL_DATA     EQU $8080
PORT_KBCTRL_STATUS   EQU $8081

	ORG $1000

entry
	lda PORT_KBCTRL_STATUS        ; read FIFO status flags
	anda $01                      ; see if bit 0 (empty flag) is set
	bne entry                     ; if empty flag is 1, FIFO is empty
	lda PORT_KBCTRL_DATA          ; read scan code from the FIFO
	ldx OFFTAB_MON_PRINT_HEX      ; get address of mon_parse_hex routine
	jsr ,X                        ; print hex representation of scan code
	jmp entry

;; vim:ft=asm6809:
;; vim:ts=4:
