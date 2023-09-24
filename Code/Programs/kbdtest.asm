;; Keyboard test program: just reads scan codes from the FIFO
;; and prints their values

	INCLUDE "../Include/offtab.asm"

PORT_KBCTRL_DATA     EQU $8080
PORT_KBCTRL_STATUS   EQU $8081

CR EQU $0D
NL EQU $0A

	ORG $1000

entry
	lda PORT_KBCTRL_STATUS
	anda #$01
	cmpa #$00
	beq entry

	lda PORT_KBCTRL_DATA
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,Y

	ldx #end_of_line
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,Y

	jmp entry

end_of_line
	FCB CR,NL,0

;; vim:ft=asm6809:
;; vim:ts=4:
