;; MC6850 Asynchronous Communications Interface Adapter (ACIA)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Constants for the control register:
;; in general, these can be combined using bitwise OR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Counter divide select bits (0..1): reset and clock divisor
ACIA_CTRL_RESET                         EQU 0b00000011
ACIA_CTRL_CLKDIV_1                      EQU 0b00000000
ACIA_CTRL_CLKDIV_16                     EQU 0b00000001
ACIA_CTRL_CLKDIV_64                     EQU 0b00000010

;; Word select bits (2..4): number of data bits, parity,
;; and number of stop bits.  The chance of using a setting
;; other than 8N1 is approximately 0%, but all of the possible
;; settings are included here for completeness.
ACIA_CTRL_SEL_7E2                       EQU 0b00000000
ACIA_CTRL_SEL_7O2                       EQU 0b00000100
ACIA_CTRL_SEL_7E1                       EQU 0b00001000
ACIA_CTRL_SEL_7O1                       EQU 0b00001100
ACIA_CTRL_SEL_8N2                       EQU 0b00010000
ACIA_CTRL_SEL_8N1                       EQU 0b00010100
ACIA_CTRL_SEL_8E1                       EQU 0b00011000
ACIA_CTRL_SEL_8O1                       EQU 0b00011100

;; Transmitter control bits (5..6): transmit data register empty interrupt
;; configuration, control -RTS output, break transmission.
ACIA_CTRL_XMIT_RTS_LOW_TX_INT_DIS       EQU 0b00000000
ACIA_CTRL_XMIT_RTS_LOW_TX_INT_EN        EQU 0b00100000
ACIA_CTRL_XMIT_RTS_HIGH_TX_INT_DIS      EQU 0b01000000
ACIA_CTRL_XMIT_RTS_LOW_BREAK_TX_INT_DIS EQU 0b01100000

;; Receive interrupt enable bit (7): if 1, interrupts are
;; generated on receive data register full, overrun, or
;; de-assertion of the -DCD input.
ACIA_CTRL_RX_INT_EN                     EQU 0b10000000
ACIA_CTRL_RX_INT_DIS                    EQU 0b00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Constants for status register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Receive data register full (bit 0)
ACIA_STATUS_RDRF                        EQU 0b00000001

;; Transmit data register empty (bit 1)
ACIA_STATUS_TDRE                        EQU 0b00000010

;; Data carrier detect (bit 2)
ACIA_STATUS_DCD                         EQU 0b00000100

;; Clear to send (bit 3)
ACIA_STATUS_CTS                         EQU 0b00001000

;; Framing error (bit 4)
ACIA_STATUS_FE                          EQU 0b00010000

;; Receiver overrun (bit 5)
ACIA_STATUS_OVRN                        EQU 0b00100000

;; Parity error (bit 6)
ACIA_STATUS_PE                          EQU 0b01000000

;; Interrupt request (bit 7)
ACIA_STATUS_IRQ                         EQU 0b10000000

;; vim:ft=asm6809:
