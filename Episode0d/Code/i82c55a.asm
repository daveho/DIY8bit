;; Definitions for 82C55A peripheral interface

;; 82C55A registers
I82C55A_REG_PORTA                   EQU 0
I82C55A_REG_PORTB                   EQU 1
I82C55A_REG_PORTC                   EQU 2
I82C55A_REG_CTRL                    EQU 3

;; Control word bits
;; Note that "group A" is port A and port C upper,
;; and "group B" is port B and port C lower

I82C55A_CTRL_MODESET                EQU $80     ; set mode, if clear set/reset bit

I82C55A_CTRL_GROUPA_MODE0           EQU 0       ; group A: set mode 0
I82C55A_CTRL_GROUPA_MODE1           EQU $20     ; group A: set mode 1
I82C55A_CTRL_GROUPA_MODE2           EQU $40     ; group A: set mode 2
I82C55A_CTRL_GROUPA_PORTA_IN        EQU $10     ; group A: configure port A for input
I82C55A_CTRL_GROUPA_PORTA_OUT       EQU 0       ; group A: configure port A for output
I82C55A_CTRL_GROUPA_PORTC_UPPER_IN  EQU $08     ; group A: configure port C upper for input
I82C55A_CTRL_GROUPA_PORTC_UPPER_OUT EQU 0       ; group A: configure port C upper for output

I82C55A_CTRL_GROUPB_MODE0           EQU 0       ; group B: set mode 0
I82C55A_CTRL_GROUPB_MODE1           EQU $04     ; group B: set mode 1
I82C55A_CTRL_GROUPB_PORTB_IN        EQU $02     ; group B: configure port B for input
I82C55A_CTRL_GROUPB_PORTB_OUT       EQU 0       ; group B: configure port B for output
I82C55A_CTRL_GROUPB_PORTC_LOWER_IN  EQU $01     ; group B: configure port C lower for input
I82C55A_CTRL_GROUPB_PORTC_LOWER_OUT EQU 0       ; group B: configure port C lower for output

;; vim:ft=asm6809:
;; vim:ts=4:
