;; Definitions for 82C54 counter/timer

;; Registers
I82C54_REG_CNT0                   EQU 0
I82C54_REG_CNT1                   EQU 1
I82C54_REG_CNT2                   EQU 2
I82C54_REG_CTRL                   EQU 3

;; Control register bits

;; Select counter
I82C54_CTRL_SEL_CNT0              EQU 0b00000000
I82C54_CTRL_SEL_CNT1              EQU 0b01000000
I82C54_CTRL_SEL_CNT2              EQU 0b10000000
I82C54_CTRL_SEL_READ_BACK         EQU 0b11000000

;; Read/write
I82C54_CTRL_RW_CNT_LATCH          EQU 0b00000000 ; latch counter
I82C54_CTRL_RW_LSB                EQU 0b00010000 ; r/w LSB only
I82C54_CTRL_RW_MSB                EQU 0b00100000 ; r/w MSB only
I82C54_CTRL_RW_LSB_MSB            EQU 0b00110000 ; r/w LSB, then MSB

;; Mode
I82C54_CTRL_MODE_0                EQU 0b00000000
I82C54_CTRL_MODE_1                EQU 0b00000010
I82C54_CTRL_MODE_2                EQU 0b00000100
I82C54_CTRL_MODE_3                EQU 0b00000110
I82C54_CTRL_MODE_4                EQU 0b00001000
I82C54_CTRL_MODE_5                EQU 0b00001010

;; BCD
I82C54_CTRL_BCD_DIS               EQU 0b00000000 ; disable BCD
I82C54_CTRL_BCD_EN                EQU 0b00000001 ; enable BCD

;; vim:ft=asm6809:
;; vim:ts=4:
