;;**********************************************************************
;; ACIA routines
;;**********************************************************************

;; Initialize the ACIA.  Clobbers A.
acia_init
	; reset ACIA
	lda #ACIA_CTRL_RESET
	sta PORT_ACIA_CTRL

	; initialize ACIA
	lda #ACIA_INIT
	sta PORT_ACIA_CTRL

	rts

;; Send the data byte in A.
;; Note: clobbers the B register.
acia_send
	; Busy wait until TRDE bit is set
1
	ldb PORT_ACIA_STATUS
	andb #ACIA_STATUS_TDRE
	beq 1B

	; Write the data byte
	sta PORT_ACIA_SEND
	rts

;; Send a string of characters.
;; Address of (nul-terminated) string is in X.
;; Note: clobbers A and B, and modifies X.
acia_send_string
1
	lda ,X+          ; load next byte and advance pointer
	beq 2F           ; if nul terminator reached, done
	jsr acia_send    ; send the byte
	jmp 1B           ; continue loop
2
	rts

;; Wait to receive a character from the ACIA, returning
;; the result in A.  Note: clobbers B.
acia_recv
	; Busy wait until RDRF is set
1
	ldb PORT_ACIA_STATUS
	andb #ACIA_STATUS_RDRF
	beq 1B

	; Read the data byte
	lda PORT_ACIA_RECV

	rts

;; Poll to receive a character from the ACIA.
;; If a character is not available, B is set to 0.
;; If a character is available, B is set to 1, and A
;; will contain the character read.
acia_poll
	ldb PORT_ACIA_STATUS     ; check ACIA status
	andb #ACIA_STATUS_RDRF   ; byte is ready?
	beq 99f                  ; if not, we're done (B is 0)

	; character is available, read it and set B to 1
	lda PORT_ACIA_RECV       ; read the character
	ldb #1                   ; set B to 1

99
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
