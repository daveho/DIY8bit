;;**********************************************************************
;; Monitor command routines
;;**********************************************************************

;; Question command: prints an identification string
mon_ques_cmd
	ldx #MONITOR_IDENT_MSG
	jsr acia_send_string
	rts

;; 'e' (echo) command: just prints back the portion of the command
;; following the command character
mon_e_cmd
	jsr acia_send_string
	ldx #CRLF
	jsr acia_send_string
	rts

;; Command handler for 'a' (set address) command.
mon_a_cmd
	jsr mon_parse_hex_d
	std vmonaddr
	rts

;; Command handler for 'r' (read) command.
;; Parses two hex digits and prints out the hex representation
;; of that many values from memory at the current address.
;; Updates the current address by the number of bytes read.
mon_r_cmd
	jsr mon_parse_hex             ; get number of bytes to read
	tfr A, B                      ; put # bytes to read in B
	ldx vmonaddr                  ; put current monitor addr in X

	; loop to print bytes
10
	cmpb #0                       ; more bytes to read?
	beq 99f                       ; if not, we're done

	pshs B, X                     ; save B and X
	lda ,X                        ; get next byte
	jsr mon_print_hex             ; print hex representation of byte
	puls B, X                     ; restore B and X
	leax 1,X                      ; advance to next byte
	decb                          ; one less byte to read
	jmp 10b

99
	stx vmonaddr                  ; store updated address

	ldx #CRLF
	jsr acia_send_string

	rts

;; Command handler for 'w' (write) command.
;; Parses hex byte values from the command string and
;; writes them to memory at current monitor address.
;; Current monitor address is incremented by number of
;; byte values succesfully parsed.
mon_w_cmd
	ldy vmonaddr                  ; load monitor address into Y

10
	; check whether either of the next two bytes is the NUL terminator
	lda ,X                        ; check first byte
	beq 99f                       ; if NUL, we're done
	lda 1,X                       ; check second byte
	beq 99f                       ; if NUL, we're done

	; next two bytes aren't NUL, so convert to hex
	pshs Y                        ; save Y
	jsr mon_parse_hex             ; convert two hex digits to int
	puls Y                        ; restore Y
	sta ,Y+                       ; save byte value and increment Y
	jmp 10b

99
	sty vmonaddr                  ; save updated Y back to monitor addr
	rts

;; Command handler for 'd' (Download Intel hex) command.
;; Intel hex records are read until either an EOF record is
;; read, or an invalid record is read.  Only DATA and EOF
;; records are supported.
mon_d_cmd
1
	; Just keep parsing ihex records until an EOF
	; record or an invalid record is encountered
	jsr mon_read_command
	jsr mon_parse_ihex

	; Record was invalid?
	cmpa #IHEX_ERROR
	beq 66f

	; Reached the EOF record?
	cmpa #IHEX_EOF
	beq 80f

	jmp 1B

66
	ldx #INVALID_RECORD
	jsr acia_send_string
	jmp 99f

80
	ldx #UPLOAD_COMPLETE
	jsr acia_send_string

99
	rts

;; Command handler for 'x' (eXecute) command.
;; It just starts executing code at the current monitor address.
mon_x_cmd
	ldy vmonaddr
	jmp ,Y

;; Command handler for 's' (Subroutine) command.
;; It calls a subroutine at the current monitor address.
mon_s_cmd
	ldy vmonaddr
	jsr ,Y
	rts

;; Command handler for 'm' (Mask) command.
;; It sets the interrupt controller mask register to a
;; specified byte value.
mon_m_cmd
	;; Make sure neither of the first to argument bytes are NUL.
	lda ,X                        ; check first byte
	beq 99f                       ; if NUL, we're done
	lda 1,X                       ; check second byte
	beq 99f                       ; if NUL, we're done

	jsr mon_parse_hex             ; parse hex value
	sta vmaskreg                  ; store mask value to vmaskreg variable
	sta PORT_IRQCTRL              ; store mask value to mask register

99
	rts

;; Toggle bit 4 in the condition code register to enable or
;; disable handling of normal (-IRQ) interrupts.
mon_q_cmd
	tfr CC, A                     ; copy condition codes to A
	anda #0b00010000              ; check whether bit 4 is set
	beq 66F

	;; Bit 4 is currently set, meaning that -IRQ is disabled.
	;; Enable it by clearing bit 4.
	andcc #ENABLE_IRQ
	jmp 99F

66
	;; Bit 4 is currently clear, meaning that -IRQ is enabled.
	;; Disable it by setting bit 4.
	orcc #DISABLE_IRQ

99
	rts

;;; This is just for fun
;mon_k_cmd
;	jsr display_cat_picture
;	rts

;; vim:ft=asm6809:
;; vim:ts=4:
