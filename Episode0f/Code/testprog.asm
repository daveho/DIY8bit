;; Test program to verify that the ROM monitor can download
;; code/data in Intel hex format into memory

;; It just outputs increasing count values to port A of
;; the 82c55a, which is mapped at address $8000

;; global variable used for counter
count EQU $2000

;; assembly so that entry point is at $1000 (in RAM)
	ORG $1000
entry
	; initialize count to 0
	lda #0
	sta count

;; Main loop
loop
	lda count                     ; get current count
	sta $8000                     ; write count value to 82c55a port A
	inca                          ; increment count value
	sta count                     ; store updated count to count var

	ldx #65535                    ; use X as delay loop counter
delay
	cmpx #0                       ; delay counter reached 0?
	beq loop                      ; if so, continue with main loop
	leax -1,X                     ; decrement X
	jmp delay                     ; continue delay loop

;; vim:ft=asm6809:
