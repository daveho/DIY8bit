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

;	lda #1
;	ldb #$01
;	jsr check_bank
;	lda #2
;	ldb #$8x
;	jsr check_bank
;	lda #3
;	ldb #$27
;	jsr check_bank
;
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
	;; Set the VRAM bank
	sta HWVGA_BANKREG
	sta testbank               ; record which bank is being checked
	stb testval                ; save initial test value

	;; Print message to indicate which bank is being checked
	ldx #verifybankmsg
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y
	lda testbank
	ldy OFFTAB_MON_PRINT_HEX
	jsr ,y
	ldx #eol
	ldy OFFTAB_ACIA_SEND_STRING
	jsr ,y

	;; Restore test value to B
	ldb testval

	;; Use X register as pointer
	ldx #HWVGA_VRAM
1
	cmpx #HWVGA_VRAM_END       ; reached end of bank?
	beq 97f                    ; if so, success! (and we're done)
	stx testaddr               ; record which address is being checked
	lda ,x+                    ; load next data value from VRAM
	cmpa B                     ; compare to expected value
	beq 4f                     ; if they're equal, continue
	jmp 98f                    ; failed: testbank and testaddr have info
	                           ;   about the failure
4
	incb                       ; increment expected byte value
	jmp 1b                     ; continue loop

	;; Success case
97
	lda #1
	jmp 99f

	;; Failure case
98
	lda #0
	jmp 99f

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

1
	jmp 1b

;; Variables for in-progress test
testbank FCB 0                 ; which bank is being checked
testval  FCB 0                 ; initial byte value
testaddr FDB 0                 ; which address is being checked

;foobar FCB "foobar",CR,NL,0
startmsg FCB "Testing VRAM...",CR,NL,0
initbankmsg FCB "Initializing test data in bank ",0
verifybankmsg FCB "Verifying test data in bank ",0
successmsg FCB "All VRAM tests passed!",CR,NL,0
failmsg FCB "VRAM test failed",CR,NL,0
failbankmsg FCB "Bank=",0
failaddrmsg FCB "Address=",0
eol FCB CR,NL,0

;; vim:ft=asm6809:
;; vim:ts=4:
