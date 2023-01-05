;; Definitions for TMS9918A VDP

TMS9918A_TEXTMODE_R0_INIT EQU $00
TMS9918A_TEXTMODE_R1_INIT EQU $F0 ;; 16K VRAM, enable display, enable int, M1=1, M2=0, reserved=0, size=0, mag=0
TMS9918A_TEXTMODE_R2_INIT EQU $02 ;; start name table at $800 in VRAM
TMS9918A_TEXTMODE_R4_INIT EQU $00 ;; start pattern table at $000 in VRAM

;; vim:ft=asm6809:
;; vim:ts=4:
