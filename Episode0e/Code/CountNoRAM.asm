;; Test program that doesn't require RAM: it outputs 8 bit
;; counter values to port $8000, where a 74HCT574 is mapped.
;;
;; I used this test program as part of debugging a fault
;; on the peripheral module (the D2 line was shorted to
;; ground due to a stray blob of solder.)  The fact that
;; this program didn't work when the peripheral module was
;; installed, but did work when the peripheral module was
;; *not* installed, helped to confirm that the problem was on
;; the peripheral module, and not the core module.

;;**********************************************************************
;; Constants
;;**********************************************************************

;; There is a 74HCT574 mapped at $8000.
OPORT EQU $8000

;;**********************************************************************
;; Program code
;;**********************************************************************

	;; Addresses from $8000 to $8FFF are reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; Addresses from $9000 to $FFFF are ROM, so that's where
	;; code and read-only data are located.
	ORG $9000

	;; Entry point for blink program
blink_entry

	;; Store count in B register
	ldb #0

	;; Main loop for the blink program.
main_loop
	stb OPORT                  ; Write bit pattern to output port

	;; Delay loop
	ldx #0
1
	leax 1,X
	cmpx #$FFFF
	blo 1B

	;; Increment B
	incb

	jmp main_loop

;;**********************************************************************
;; Vectors
;;**********************************************************************

	;; Reset vector: jump to blink_entry
	ORG $FFFE
	FDB blink_entry

;; vim:ft=asm6809:
