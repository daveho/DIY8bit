;; Definitions for I/O devices

;; Constant values for register offsets, control/status bits, etc.

	INCLUDE "i82c55a.asm"
	INCLUDE "i82c54.asm"
	INCLUDE "acia.asm"
	INCLUDE "kbd.asm"
	INCLUDE "tms9918a.asm"

;; Addresses of hardware device registers

;; 82C55A peripheral interface (uses ~IODEV0)
PORT_I82C55A_BASE EQU $8000
PORT_I82C55A_A    EQU (PORT_I82C55A_BASE + I82C55A_REG_PORTA)
PORT_I82C55A_B    EQU (PORT_I82C55A_BASE + I82C55A_REG_PORTB)
PORT_I82C55A_C    EQU (PORT_I82C55A_BASE + I82C55A_REG_PORTC)
PORT_I82C55A_CTRL EQU (PORT_I82C55A_BASE + I82C55A_REG_CTRL)

;; 82C54 timer/counter (uses ~IODEV1)
PORT_I82C54_BASE EQU $8020
PORT_I82C54_CNT0 EQU (PORT_I82C54_BASE + I82C54_REG_CNT0)
PORT_I82C54_CNT1 EQU (PORT_I82C54_BASE + I82C54_REG_CNT1)
PORT_I82C54_CNT2 EQU (PORT_I82C54_BASE + I82C54_REG_CNT2)
PORT_I82C54_CTRL EQU (PORT_I82C54_BASE + I82C54_REG_CTRL)

;; MC6850 ACIA (UART) (uses ~IODEV2)
PORT_ACIA_BASE   EQU $8040
PORT_ACIA_CTRL   EQU (PORT_ACIA_BASE + 0)
PORT_ACIA_STATUS EQU (PORT_ACIA_BASE + 0)
PORT_ACIA_SEND   EQU (PORT_ACIA_BASE + 1)
PORT_ACIA_RECV   EQU (PORT_ACIA_BASE + 1)

;; Interrupt controller (uses ~IODEV3)
;; A read gets the number of the highest priority interrupt, 0 if
;; there are no active interrupt requests.
;; A write sets the bits of the mask register.
;; Each mask bit controls the same-numbered IRQ, with a 1 bit
;; masking (disabling) the IRQ, and a 0 bit unmasking (enabling)
;; the IRQ.  Bit 0 is ignored because there is no IRQ0.
PORT_IRQCTRL     EQU $8060

;; Keyboard controller (uses ~IODEV4)
;; There are two ports, one to read data, one to read FIFO status.
;; Bit 0 of status is the empty flag (0=empty, 1=not empty),
;; bit 1 of status is the full flag (0=full, 1=not full).
PORT_KBCTRL_BASE   EQU $8080
PORT_KBCTRL_DATA   EQU (PORT_KBCTRL_BASE + 0)
PORT_KBCTRL_STATUS EQU (PORT_KBCTRL_BASE + 1)

;; TMS9918A Video Display Processor (uses -IODEV5)
;; Note that A0 is connected to the MODE input, and should be
;; 0 when reading or writing VRAM, and 1 when accessing registers
;; or writing VRAM address information.
PORT_TMS9918A_BASE EQU $80A0
PORT_TMS9918A_DATA EQU (PORT_TMS9918A_BASE + 0)
PORT_TMS9918A_CTRL EQU (PORT_TMS9918A_BASE + 1)

;; vim:ft=asm6809:
;; vim:ts=4:
