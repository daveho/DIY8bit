;;**********************************************************************
;; Monitor variables
;;**********************************************************************

;; Leave the first 16 bytes unused
vunused RZB 16

;; IRQ handler table (8 two-byte code addresses)
;; The first entry (index 0) is not used.
;; The other entries (indices 1-7) are the addresses of
;; the handler functions for IRQs 1-7.
virqtab RZB 16

;; Command buffer used by the monitor
vmonbuf RZB (MONTIOR_MAXCMDLEN+1)

;; Stores the length of the command read into the command
;; buffer most recently (not including nul terminator)
vmoncmdlen RZB 1

;; Current address used in the monitor
vmonaddr RZB 2

;; Current interrupt mask register value.
;; We store this in RAM because there is no way to read
;; the actual mask register.
vmaskreg RZB 1

;; Modifier key states
vmodkey RZB 1

;; Set to 1 if the last character read by mon_recv
;; was either \n or \r
vlasteol RZB 1

;; vim:ft=asm6809:
;; vim:ts=4:
