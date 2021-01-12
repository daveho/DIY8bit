;; Definitions for working with the C16 keyboard

;; Bits 0 and 1 in the keyboard controller status register are
;; the FIFO empty and full flags (both are active low, so 0=true, 1=false)

KBD_STATUS_FIFO_NOT_EMPTY       EQU $01
KBD_STATUS_FIFO_NOT_FULL        EQU $02

;; Interpreting scan codes

KBD_SCAN_PRESS                  EQU $40  ; if bit 6 is set, scan code is a press
KBD_SCAN_COL_MASK               EQU $38  ; bits 3-5 contain the column number
KBD_SCAN_ROW_MASK               EQU $07  ; bits 0-2 contain the row number

;; vim:ft=asm6809:
;; vim:ts=4:
