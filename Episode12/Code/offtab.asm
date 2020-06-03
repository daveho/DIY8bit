;; Addresses of entries in the monitor program's offset table
;; Programs loaded into RAM can load values from these addresses
;; to get the actual addresses of monitor routines and data.

OFFTAB_RESET_IRQ3_FF     EQU $FE00
OFFTAB_RESET_IRQ6_FF     EQU $FE02
OFFTAB_MON_PRINT_HEX     EQU $FE04
OFFTAB_MON_PRINT_HEX_D   EQU $FE06
OFFTAB_ACIA_SEND         EQU $FE08
OFFTAB_ACIA_SEND_STRING  EQU $FE0A
OFFTAB_ACIA_RECV         EQU $FE0C
OFFTAB_DELAY             EQU $FE0E

;; vim:ft=asm6809:
;; vim:ts=4:
