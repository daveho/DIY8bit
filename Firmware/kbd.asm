;; Definitions for working with the C16 keyboard

;; Bits 0 and 1 in the keyboard controller status register are
;; the FIFO empty and full flags (both are active low, so 0=true, 1=false)

KBD_STATUS_FIFO_NOT_EMPTY       EQU $01
KBD_STATUS_FIFO_NOT_FULL        EQU $02

;; Interpreting scan codes

KBD_SCAN_PRESS                  EQU $40  ; if bit 6 is set, scan code is a press
KBD_SCAN_COL_MASK               EQU $38  ; bits 3-5 contain the column number
KBD_SCAN_ROW_MASK               EQU $07  ; bits 0-2 contain the row number

;; Bits for key modifiers (shift and control), stored in the vmodkey variable.
;; When set, the modifier is pressed, when unset, the modifier is not pressed.
KBD_SHIFT_MOD                   EQU $01
KBD_CTRL_MOD                    EQU $02

;; Scan codes
;; Shift is column 3, row 1
;; Control is column 2, row 0
KBD_SCAN_SHIFT_RELEASE          EQU ((3 << 3) | 1)
KBD_SCAN_SHIFT_PRESS            EQU (KBD_SCAN_PRESS | KBD_SCAN_SHIFT_RELEASE)
KBD_SCAN_CTRL_RELEASE           EQU ((2 << 3) | 0)
KBD_SCAN_CTRL_PRESS             EQU (KBD_SCAN_PRESS | KBD_SCAN_CTRL_RELEASE)

;; vim:ft=asm6809:
;; vim:ts=4:
