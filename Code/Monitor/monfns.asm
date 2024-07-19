;;**********************************************************************
;; Monitor functions
;;**********************************************************************

;; Initialize monitor I/O routines.
mon_init
	; Initialize the global variable which keeps track of whether
	; the last character read was an end of line (eol) character.
	; This helps us accept any of \n, \r, and \r\n as valid end
	; of line inputs in mon_read_command.
	lda #0
	sta vlasteol
	rts

;; Routine to read a single character from either the ACIA or the keyboard.
;; Returns character read in A. Clobbers B.
mon_recv
	jsr acia_poll                 ; poll the ACIA
	cmpb #0                       ; check whether B=0
	bne 99f                       ; if B != 0, character was read, we're done
	jsr kbd_poll                  ; poll the keyboard
	cmpb #0                       ; check whether B=0
	bne 99f                       ; if B != 0, character was read, we're done
	jmp mon_recv                  ; no character was available, continue loop

99
	rts

;; Read a line of text into the monitor command buffer.
;; Any of \r, \n, or \r\n may be used to delimit the end of the command.
;; Clobbers A, B, and X.
mon_read_command
	; X points to where next character will be stored
	ldx #vmonbuf

1
	jsr mon_recv                     ; read a character
	cmpa #NL                         ; was it a newline?
	beq 20F                          ; handle end of line character
	cmpa #CR                         ; was it a carriage return?
	beq 20F                          ; handle end of line character

	jsr acia_send                    ; echo the character

	cmpx #(vmonbuf+MONTIOR_MAXCMDLEN) ; buf size exceeded?
	beq 2F

	sta ,X+                          ; store the character in the buffer
	lda #0                           ; character read was not eol character
	sta vlasteol

2
	jmp 1B                           ; continue reading characters

20
	lda vlasteol                     ; most recent input char was \n or \r?
	bne 30F                          ; if so, we just ignore it
	jmp 40F                          ; end of line reached

30
	; Two "end of line" characters (\r or \n) were read in a row.
	; Most likely, this is because a \r\n sequence was sent.
	; The most recent eol character is ignored, and we continue
	; reading input.
	lda #0
	sta vlasteol
	jmp 1B

40
	; Most recent character read was an end of line character
	lda #1
	sta vlasteol

	; Send cursor to beginning of next line
	lda #CR
	jsr acia_send
	lda #NL
	jsr acia_send

	; Compute command length
	tfr X, D
	subd #vmonbuf
	stb vmoncmdlen

;	; Just for debugging, print the command length
;	tfr b, a
;	jsr mon_print_hex

	; Store nul terminator
	lda #0
	sta ,X+

	; Done
	rts

;; Execute the command currently stored in the command buffer.
;; Clobbers A, B, X, and Y.
mon_exec_command
	ldx #vmonbuf

	jsr mon_skip_ws            ; Seach for first non-WS byte

	; Dispatch logic
	ldy #MONITOR_COMMANDS
1
	ldb ,Y+                    ; get next defined command byte

	cmpb #0                    ; reached end of defined commands?
	beq 66F                    ; display error message and return

	cmpb ,X                    ; entered command matches? (X points to command)
	beq 20F                    ; get ready to dispatch
	jmp 1B                     ; continue matching against defined commands

20
	; Increment X to advance past the command character,
	; and skip whitespace again.  This will position X at
	; the address of the first non-WS character after
	; the command.
	leax 1,X
	jsr mon_skip_ws

	; At this point, Y is the address of the matched command
	; character in the MONITOR_COMMANDS string.
	; Subtract the base address of MONITOR_COMMANDS+1 from it to
	; recover the index of the command.  (The +1 is because there
	; was one extra increment to Y that needs to be undone.)
	tfr Y, D                   ; copy Y to D
	subd #(MONITOR_COMMANDS + 1)
	; B (the LSB of D) now contains the index.
	; Shift it left (to multiply it by 2.)
	lslb

	; Compute the address of the handler routine.
	addd #MONITOR_DISPATCH_TABLE

	; Fetch address of handler.
	; Note that this is an indirect reference because
	; D contains the address of the memory location containing
	; the address we want to dispatch to.
	tfr D, Y
	ldy ,Y

	; Dispatch to the handler!
	jsr ,Y

	jmp 99F                    ; done

66
	ldx #MONITOR_ERR_MSG
	jsr acia_send_string

99
	rts

;; In nul-terminated string pointed to by X, skip leading
;; whitespace (space and tab) characters.  X is updated
;; to point to the first non-WS character, and the value
;; of the first non-WS character is stored in A.
mon_skip_ws
1
	lda ,X+                   ; get character from buffer (advancing X)
	cmpa #SPACE               ; is a space?
	beq 1B                    ; continue searching
	cmpa #TAB                 ; is a tab?
	beq 1B                    ; continue searching

	leax -1,X                 ; adjust X to point to first non-WS character
	rts

;; Print the hex representation of byte in A.
;; Clobbers B and X, modifies A.
mon_print_hex
	leas -3,S                ; reserve 3 bytes on stack
	tfr S, X                 ; put buffer address in X
	jsr mon_fmt_hex          ; format byte as hex
	tfr S, X                 ; restore buffer address to X
	lda #0                   ; nul terminator
	sta 2,S                  ; store nul terminator
	jsr acia_send_string     ; print the string
	leas 3,S                 ; restore stack
	rts

;; Print the hex representation of the 16 bit value in D.
;; Modifies A and B (i.e., modifies D), clobbers X.
mon_print_hex_d
	leas -5,S                ; reserve 5 bytes on stack
	tfr S, X                 ; put buffer address in X
	jsr mon_fmt_hex_d        ; format value as hex
	tfr S, X                 ; restore buffer address to X
	lda #0                   ; nul terminator
	sta 4,S                  ; store the nul terminator
	jsr acia_send_string     ; print the string
	leas 5,S                 ; restore stack
	rts

;; Format the hex representation of byte in A, storing
;; the (2 byte) representation at the address specified by X.
;; Clobbers A, B, and Y.
mon_fmt_hex
	ldy #HEX_DIGITS
	tfr A, B                 ; copy A to B
	andb #$0F                ; get low 4 bits
	ldb B,Y                  ; convert to hex
	stb 1,X                  ; store in second byte of dest buffer
	lsra                     ; get high 4 bits by shifting right
	lsra
	lsra
	lsra
	lda A,Y                  ; convert to hex
	sta ,X                   ; store in first byte of dest buffer
	rts

;; Format the hex representation of the 2-byte value in D,
;; storing the (4 byte) representation at the address specified
;; by X.  Clobbers A, B, and Y, modifies X.
mon_fmt_hex_d
	pshs B                   ; save B (mon_fmt_hex clobbers it)
	jsr mon_fmt_hex          ; format MSB of value (in A)
	puls B                   ; restore B
	tfr B, A                 ; copy B (LSB) in A
	leax 2,X                 ; advance X to correct position in dest buffer
	jsr mon_fmt_hex          ; format LSB of value
	rts

;; Convert the single hex digit in A to a numeric value.
;; Result is returned in A.  Clobbers B and Y.  Does NOT touch X.
mon_hex_convert
	; If character is lower case, convert it to upper case.
	cmpa #97                 ; compare to 'a'
	blo 50F                  ; not lower case, no conversion needed
	suba #(97-65)            ; convert to upper case

50
	ldy #HEX_DIGITS          ; load Y with base addr of hex digits string
	ldb #0                   ; use B as index
51
	cmpb #16                 ; at end of hex digits string?
	beq 66F                  ; if at end, fail (input digit is invalid)
	cmpa B,Y                 ; compare hex digit to table entry
	beq 70F                  ; if equal, we found a valid entry
	incb                     ; advance to next entry
	jmp 51B                  ; continue loop

66
	lda #0                   ; return 0 for invalid input
	rts                      ; unsuccessful return

70
	tfr B, A                 ; B is the correct value, transfer to A
	rts                      ; successful return

;; Parse the 2 digit hex value whose address
;; is specified by X, putting the result in A.
;; Clobbers B and Y.  Increments X by 2.
mon_parse_hex
	; One byte is reserved on stack for a local variable
	; (the high nybble of the parsed hex value)

	leas -1,S                ; reserve 1 byte for local variable

	lda ,X+                  ; get first hex digit (high nybble)
	jsr mon_hex_convert      ; convert it
	lsla                     ; left shift the value into position
	lsla
	lsla
	lsla
	sta ,S                   ; preserve high nybble
	lda ,X+                  ; get second hex digit (low nybble)
	jsr mon_hex_convert      ; convert it
	ora ,S                   ; combine high and low nybbles

	leas 1,S                 ; deallocate space reserved for local variable

	rts

;; Parse the 4 digit hex value whose address is specified by X,
;; putting the result in D.  Increments X by 4.  Clobbers Y.
mon_parse_hex_d
	jsr mon_parse_hex        ; convert first two (most significant) hex digits
	pshs A                   ; preserve MSB
	jsr mon_parse_hex        ; convert second two (least significant) hex digits
	tfr A, B                 ; put LSB in B (which is the LSB of D)
	puls A                   ; restore MSB (in A, which is the MSB of D)
	rts                      ; done!

;; Parse the ihex record in the command buffer.
;; If it is a data record, load the data into memory
;; at the specified address.
;; Returns the record type in A.
mon_parse_ihex
	; Reserve room for 4 bytes of local variables
	; Variables are:
	;    0,S    data len
	;    1,S    record type
	;    2,S    address (two bytes)
	leas -4,S

	; Verify that the command buffer has enough data to be a valid
	; Intel hex record.  There must be at least 11 bytes.
	lda vmoncmdlen
	cmpa #11
	blo 66f

	; Load address of command buffer into X
	ldx #vmonbuf

	; Verify that ihex record starts with a colon
	lda ,X+
	cmpa #COLON
	bne 66f

	; Read byte count
	jsr mon_parse_hex
	sta 0,S

	; Read address
	jsr mon_parse_hex_d
	std 2,S

	; Read record type
	jsr mon_parse_hex
	sta 1,S

	; Record type is EOF?
	cmpa #IHEX_EOF
	beq 99f

	; Record type is data?
	cmpa #IHEX_DATA
	bne 66f                       ; record types other than data aren't supported

	; Determine how many characters are needed in the command buffer
	; in order to parse the correct amount of data
	lda 0,S                       ; retrieve the data length
	lsla                          ; multiply by 2 (2 hex digits per data byte)
	adda #9                       ; colon, data len, address, and rec type
	cmpa vmoncmdlen               ; compare min required to command length
	bhi 66f                       ; error if min required > command length

	; Load data into memory!
	ldb 0,S                       ; use B as byte count
	ldy 2,S                       ; use Y as destination address
44
	cmpb #0                       ; has byte count reached 0?
	beq 80f                       ; if so, done
	pshs B, Y                     ; preserve B and Y
	jsr mon_parse_hex             ; parse one byte of hex data
	puls B, Y                     ; restore B and Y
	sta ,Y+                       ; store byte value and increment Y
	decb                          ; decrement byte count
	jmp 44b                       ; continue loop

80
	lda #IHEX_DATA
	jmp 99f

66
	lda #IHEX_ERROR

99
	leas 4,S                      ; restore stack pointer

	rts

;; vim:ft=asm6809:
;; vim:ts=4:
