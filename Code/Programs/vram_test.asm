;; VRAM test program

;; The goal is to test all 4 VRAM banks.
;; There's nothing terribly sophisticated about the technique:
;; given an arbitrary starting value, we just write increasing
;; byte values into subsequent VRAM memory locations (and obviously
;; the values will wrap back to 0 after reaching 255.)
;; If we can read back the values in each bank, that's a reasonable
;; indication that the VRAM is working correctly.

	INCLUDE "../Include/offtab.asm"
	INCLUDE "../Include/iodev.asm"

CR EQU $0D
NL EQU $0A

	ORG $1000

entry
;	ldx #foobar
;	ldy OFFTAB_ACIA_SEND_STRING
;	jsr ,y

	;; Print start message
	ldx #startmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Fill banks 0-3
	lda #0
	ldb #$2d
	jsr fill_bank
	lda #1
	ldb #$01
	jsr fill_bank
	lda #2
	ldb #$8x
	jsr fill_bank
	lda #3
	ldb #$27
	jsr fill_bank

	;; Check banks 0-3 to make sure data was stored correctly

	lda #0                     ; which bank to check
	ldb #$2d                   ; expected initial data value
	jsr check_bank             ; check the bank data
	cmpa #1                    ; check succeeded?
	bne 98f                    ; if not, jump to failure case

	lda #1                     ; which bank to check
	ldb #$01                   ; expected initial data value
	jsr check_bank             ; check the bank data
	cmpa #1                    ; check succeeded?
	bne 98f                    ; if not, jump to failure case

	lda #2                     ; which bank to check
	ldb #$8x                   ; expected initial data value
	jsr check_bank             ; check the bank data
	cmpa #1                    ; check succeeded?
	bne 98f                    ; if not, jump to failure case

	lda #3                     ; which bank to check
	ldb #$27                   ; expected initial data value
	jsr check_bank             ; check the bank data
	cmpa #1                    ; check succeeded?
	bne 98f                    ; if not, jump to failure case

	;; If we got here, test was successful
	ldx #successmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	jmp 99f

	;; test failure
98
	jsr test_failed

99
	rts

;; Fill a VRAM bank with data.
;;
;; Parameters:
;;    A: which bank to fill
;;    B: initial byte value
fill_bank
	sta testbank               ; save bank number
	stb testval                ; save initial value

	;; Print message to indicate which bank is being initialized
	ldx #initbankmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda testbank
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Set the VRAM bank
	lda testbank
	sta HWVGA_BANKREG

	;; Restore initial data value
	ldb testval

	;; Use X register as pointer
	ldx #HWVGA_VRAM
1
	cmpx #HWVGA_VRAM_END       ; reached end of bank?
	beq 99f                    ; if so, done
	stb ,x+                    ; store byte to VRAM and incr. pointer
	incb                       ; increment byte value
	jmp 1b                     ; continue loop

99
	rts

;; Check previously-written data in a VRAM bank.
;;
;; Parameters:
;;    A: which bank to check
;;    B: initial byte value
;;
;; Returns (in A register): 0 on failure, 1 on success
check_bank
	;; save bank number and test value
	sta testbank
	stb testval

	;; print message about which bank is being verified
	ldx #verifybankmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda testbank
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; switch to correct bank
	lda testbank
	sta HWVGA_BANKREG

	ldx #HWVGA_VRAM               ; X is pointer to bank memory
1
	cmpx #HWVGA_VRAM_END          ; reached end of bank?
	beq 97f                       ; if so, success

	stx testaddr                  ; store test address
	lda ,x+                       ; fetch next byte from bank into A
	cmpa testval                  ; compare fetched byte with expected byte
	bne 98f                       ; if they're different, fail
	inca                          ; increment expected byte value
	sta testval                   ; store next expected byte value
	jmp 1b                        ; continue loop

97
	;; success
	lda #1
	jmp 99f

98
	;; failure
	sta actualval
	stb testval
	lda #0

99
	rts

;; Called if data isn't read back correctly
test_failed
	ldx #failmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Indicate which bank failed
	ldx #failbankmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda testbank
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Indicate which address within that bank failed
	ldx #failaddrmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	ldd testaddr
	ldy OFFTAB_MON_PRINT_HEX_D
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Indicate expected and actual value
	ldx #expectedmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda testval
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #actualmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda actualval
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	rts

;; Variables for in-progress test
testbank FCB 0                 ; which bank is being checked
testval  FCB 0                 ; initial byte value
testaddr FDB 0                 ; which address is being checked
actualval FCB 0                ; incorrect value read from VRAM

;foobar FCB "foobar",CR,NL,0
startmsg FCB "Testing VRAM...",CR,NL,0
initbankmsg FCB "Initializing test data in bank ",0
verifybankmsg FCB "Verifying test data in bank ",0
successmsg FCB "All VRAM tests passed!",CR,NL,0
failmsg FCB "VRAM test failed",CR,NL,0
failbankmsg FCB "Bank=",0
failaddrmsg FCB "Address=",0
expectedmsg FCB "Expected=",0
actualmsg FCB ", Actual=",0
eol FCB CR,NL,0

;; vim:ft=asm6809:
;; vim:ts=4:
