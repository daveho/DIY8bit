;;**********************************************************************
;; ROM monitor for DIY 6809 computer
;;**********************************************************************

	INCLUDE "iodev.asm"

;;**********************************************************************
;; Constants
;;**********************************************************************

;; Character values
CR EQU $0D
NL EQU $0A
SPACE EQU $20
TAB EQU $09
COLON EQU $3A

;; 3.6864 MHz crystal: E clock is 921.6 kHz, divide by 96 to get 9600 bps
ACIA_CLKDIV EQU 6

;; Compute initial value for ACIA control register
;; Note that even though the rx/tx clock is generated by
;; the 82C54 counter/timer, the ACIA /16 divisor is used,
;; because with the /1 divisor, there is no automatic
;; synchronization of the rx/tx data and clocks.
ACIA_INIT EQU (ACIA_CTRL_CLKDIV_16 | ACIA_CTRL_SEL_8N1 | ACIA_CTRL_XMIT_RTS_LOW_TX_INT_DIS | ACIA_CTRL_RX_INT_DIS)

;; Number of characters that can be stored in the command buffer
;; (actual buffer is 1 larger to allow room for the nul terminator.)
;; This size is chosen to allow ihex records with 32 data bytes to
;; be read (these will be 75 bytes).
MONTIOR_MAXCMDLEN equ 99

;; Intel hex record types.
IHEX_DATA EQU 0
IHEX_EOF EQU 1
IHEX_ERROR EQU 99

;;**********************************************************************
;; Variables (RAM area)
;;
;; Since the goal is to generate a ROM image, this
;; part is discarded.  It's very useful, however, to have
;; the assembler determine the addresses of variables
;; and determine the overall amount of memory needed for
;; them.
;;**********************************************************************

	ORG $0000

;; Leave the first 16 bytes unused
vunused RZB 16

;; Command buffer used by the monitor
vmonbuf RZB (MONTIOR_MAXCMDLEN+1)

;; Stores the length of the command read into the command
;; buffer most recently (not including nul terminator)
vmoncmdlen RZB 1

;; Current address used in the monitor
vmonaddr RZB 2

;;**********************************************************************
;; Code
;;
;; Everything from $8000 onward is part of the ROM image.
;;**********************************************************************

	;; The first 4K of the upper 32K is not used because it
	;; is reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; The actual code begins at $9000
	ORG $9000

entry
	;; put system stack at top of RAM
	lds #$7FFE

	;; Initialize the i82c55a device
	jsr i82c55a_init

	;; Initialize the i82c54 device
	jsr i82c54_init

	;; Initialize the ACIA
	jsr acia_init

	;; Welcome message
	ldx #ALL_YOUR_BASE
	jsr acia_send_string

	; Set initial monitor address to 0
	ldd #0
	std vmonaddr

main_loop
	; Print current address as part of prompt
	ldd vmonaddr
	jsr mon_print_hex_d
	ldx #MONITOR_PROMPT
	jsr acia_send_string

	jsr mon_read_command          ; read user command
	jsr mon_exec_command          ; attempt to execute the command

	jmp main_loop                 ; repeat main loop

;;------------------------------------------------------------------
;; Monitor routines
;;------------------------------------------------------------------

;; Read a line of text into the monitor command buffer.
;; Clobbers A, B, and X.
mon_read_command
	; X points to where next character will be stored
	ldx #vmonbuf

1
	jsr acia_recv                    ; read a character
	jsr acia_send                    ; echo the character
	cmpa #NL                         ; was it a newline?
	beq 3F                           ; if so, we're done

	cmpa #CR                         ; was it a CR? (we ignore these)
	beq 2F

	cmpx #(vmonbuf+MONTIOR_MAXCMDLEN) ; buf size exceeded?
	beq 2F

	sta ,X+                          ; store the character in the buffer

2
	jmp 1B                           ; continue reading characters

3
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
;	leax vmonaddr
;	jsr acia_send_string
;	leax CRLF
;	jsr acia_send_string

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
	leax vmonbuf

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

	; TODO: read data and load it into memory
	jmp 99f

66
	lda #IHEX_ERROR

99
	leas 4,S                      ; restore stack pointer

	rts

;;------------------------------------------------------------------
;; Monitor command routines
;;
;; For all monitor command handler routines, the X register
;; is set to point to the first character of the argument
;; to the command.  For example, if the command was
;;
;;    w cafe
;;
;; then X will be pointing to the 'c' character.
;;------------------------------------------------------------------

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

;; Command handler for 'u' (upload ihex) command.
mon_u_cmd
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
	leax INVALID_RECORD
	jsr acia_send_string
	jmp 99f

80
	leax UPLOAD_COMPLETE
	jsr acia_send_string

99
	rts

;;------------------------------------------------------------------
;; Delay subroutines
;;------------------------------------------------------------------

;; Delay routine: clobbers A and X.
delay
	lda #0
1
	jsr delay_inner
	deca
	cmpa #$ff
	blo 1B
	rts

;; Inner delay subroutine: clobbers X.
delay_inner
	ldx #0
1
	leax 1, x
	cmpx #$fff
	blo 1B
	rts

;;------------------------------------------------------------------
;; Hardware device routines
;;------------------------------------------------------------------

i82c55a_init
	; For now, set both groups to mode 0, and configure all ports
	; as output.
	lda #(I82C55A_CTRL_MODESET|I82C55A_CTRL_GROUPA_MODE0|I82C55A_CTRL_GROUPA_PORTA_OUT|I82C55A_CTRL_GROUPA_PORTC_UPPER_OUT|I82C55A_CTRL_GROUPB_MODE0|I82C55A_CTRL_GROUPB_PORTB_OUT|I82C55A_CTRL_GROUPB_PORTC_LOWER_OUT)
	sta PORT_I82C55A_CTRL
	rts

i82c54_init
	; Counter 0 generates the rx/tx clock signal for the ACIA.
	lda #(I82C54_CTRL_SEL_CNT0|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_3|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #ACIA_CLKDIV
	sta PORT_I82C54_CNT0
	lda #0
	sta PORT_I82C54_CNT0

	; Counter 1 is used to generate a timer interrupt.
	; We use mode 2 (rate generator), using a count of 0, which
	; is effectively 65536, thus the timer interrupt occurs as
	; infrequently as possible.
	lda #(I82C54_CTRL_SEL_CNT1|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_2|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #0
	sta PORT_I82C54_CNT1
	lda #0
	sta PORT_I82C54_CNT1

	; Counter 2: mode 3, arbitrarily divide by 6
	lda #(I82C54_CTRL_SEL_CNT2|I82C54_CTRL_RW_LSB_MSB|I82C54_CTRL_MODE_3|I82C54_CTRL_BCD_DIS)
	sta PORT_I82C54_CTRL
	lda #6
	sta PORT_I82C54_CNT2
	lda #0
	sta PORT_I82C54_CNT2

	rts

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

;; Wait to receive a character, returning
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

;;**********************************************************************
;; Constant data
;;**********************************************************************

;; This is printed on startup
ALL_YOUR_BASE FCB "All your base are belong to us",CR,NL,0

HEX_DIGITS FCB "0123456789ABCDEF"

;; CRLF string
CRLF FCB CR,NL,0

;; ROM monitor prompt
MONITOR_PROMPT FCB "> ",0

;; Monitor error message
MONITOR_ERR_MSG FCB "?",CR,NL,0

;; Monitor identification message (printed when '?' command is entered)
MONITOR_IDENT_MSG FCB "6809 ROM monitor, 2019-2020 by daveho hacks",CR,NL,0

;; Monitor command codes.
;; This must be NUL-terminated.
MONITOR_COMMANDS FCB "?earwu",0

;; Handler routines for monitor commands.
;; Order should match MONITOR_COMMANDS.
MONITOR_DISPATCH_TABLE
	FDB mon_ques_cmd
	FDB mon_e_cmd
	FDB mon_a_cmd
	FDB mon_r_cmd
	FDB mon_w_cmd
	FDB mon_u_cmd

INVALID_RECORD FCB "Invalid record",CR,NL,0

UPLOAD_COMPLETE FCB "Upload complete",CR,NL,0

;;**********************************************************************
;; Interrupt vectors
;;**********************************************************************

	;; reset vector
	ORG $FFFE
	FDB entry

;; vim:ft=asm6809:
;; vim:ts=4:
