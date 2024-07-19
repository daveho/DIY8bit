;;**********************************************************************
;; ROM monitor for DIY 6809 computer
;;**********************************************************************

	INCLUDE "../Include/iodev.asm"

;;**********************************************************************
;; Constants
;;**********************************************************************

	INCLUDE "mondefs.asm"

;;**********************************************************************
;; Variables (RAM area)
;;
;; Since the goal is to generate a ROM image, this
;; part is discarded.  It's very useful, however, to have
;; the assembler determine the addresses of variables
;; and determine the overall amount of memory needed for
;; them.
;;**********************************************************************

	ORG $0000

	INCLUDE "monvars.asm"
	INCLUDE "hwvgavars.asm"

;;**********************************************************************
;; Code
;;
;; Everything from $8000 onward is part of the ROM image.
;;**********************************************************************

	;; The first 4K of the upper 32K is not used because it
	;; is reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; The actual code begins at $9000
	ORG $9000

entry
	;; put system stack at top of RAM
	lds #$7FFE

	;; Initialize the i82c55a device
	jsr i82c55a_init

	;; Initialize the i82c54 device
	jsr i82c54_init

	;; Initialize the ACIA
	jsr acia_init

	;; Initialize the interrupt controller and IRQ handling
	jsr irqctrl_init

	;; Initialize keyboard handling
	jsr kbd_init

;	; Initialize TMS9918A VDP
;	jsr tms9918a_init

	; Initialize hardware VGA text display
	jsr hwvga_init

	;; Initialize monitor I/O routines
	jsr mon_init

	;; Welcome message
	ldx #ALL_YOUR_BASE
	jsr acia_send_string

	; Set initial monitor address to 0
	ldd #0
	std vmonaddr

main_loop
	; Print current address as part of prompt
	ldd vmonaddr
	jsr mon_print_hex_d
	ldx #MONITOR_PROMPT
	jsr acia_send_string

	jsr mon_read_command          ; read user command
	jsr mon_exec_command          ; attempt to execute the command

	jmp main_loop                 ; repeat main loop

;;------------------------------------------------------------------
;; Monitor routines
;;------------------------------------------------------------------

	INCLUDE "monfns.asm"

;;------------------------------------------------------------------
;; Monitor command routines
;;
;; For all monitor command handler routines, the X register
;; is set to point to the first character of the argument
;; to the command.  For example, if the command was
;;
;;    w cafe
;;
;; then X will be pointing to the 'c' character.
;;------------------------------------------------------------------

	INCLUDE "moncmds.asm"

;;------------------------------------------------------------------
;; Delay subroutines
;;------------------------------------------------------------------

;; Delay routine: clobbers A and X.
delay
	lda #0
1
	jsr delay_inner
	deca
	cmpa #$ff
	blo 1B
	rts

;; Inner delay subroutine: clobbers X.
delay_inner
	ldx #0
1
	leax 1,X
	cmpx #$fff
	blo 1B
	rts

;;------------------------------------------------------------------
;; Hardware device routines
;;------------------------------------------------------------------

	INCLUDE "i82c55afns.asm"
	INCLUDE "aciafns.asm"

;;------------------------------------------------------------------
;; Interrupt handling
;;------------------------------------------------------------------

	INCLUDE "irqfns.asm"

;;------------------------------------------------------------------
;; Keyboard routines
;;------------------------------------------------------------------

	INCLUDE "kbdfns.asm"

;;**********************************************************************
;; TMS9918A VDP routines
;;**********************************************************************

;	INCLUDE "tms9918afns.asm"

;;**********************************************************************
;; Hardware VGA 80x30 text display routines
;;**********************************************************************

	INCLUDE "hwvgafns.asm"

;;**********************************************************************
;; A routine to display something fun in the terminal
;;**********************************************************************

display_cat_picture
	ldx #CAT_PICTURE
	jsr acia_send_string
	rts

;;**********************************************************************
;; Constant data
;;**********************************************************************

;; This is printed on startup
ALL_YOUR_BASE FCB "All your base are belong to us",CR,NL,0

HEX_DIGITS FCB "0123456789ABCDEF"

;; CRLF string
CRLF FCB CR,NL,0

;; ROM monitor prompt
MONITOR_PROMPT FCB "> ",0

;; Monitor error message
MONITOR_ERR_MSG FCB "?",CR,NL,0

;; Monitor identification message (printed when '?' command is entered)
MONITOR_IDENT_MSG FCB "6809 ROM monitor, 2019-2023 by daveho hacks",CR,NL,0

;; Monitor command codes.
;; This must be NUL-terminated.
MONITOR_COMMANDS FCB "?earwdxsmqk",0

;; Handler routines for monitor commands.
;; Order should match MONITOR_COMMANDS.
MONITOR_DISPATCH_TABLE
	FDB mon_ques_cmd
	FDB mon_e_cmd
	FDB mon_a_cmd
	FDB mon_r_cmd
	FDB mon_w_cmd
	FDB mon_d_cmd
	FDB mon_x_cmd
	FDB mon_s_cmd
	FDB mon_m_cmd
	FDB mon_q_cmd
	FDB mon_k_cmd

;; Default interrupt handler routines.
;; This table will be copied into virqtab (in RAM) to allow
;; new interrupt handler routines to be installed.
DEFAULT_IRQ_HANDLER_TABLE
	FDB noop_irq_handler          ; not used
	FDB noop_irq_handler          ; IRQ1
	FDB noop_irq_handler          ; IRQ2
	FDB reset_irq3_ff             ; IRQ3 (edge triggered, must reset FF)
	FDB noop_irq_handler          ; IRQ4
	FDB noop_irq_handler          ; IRQ5
	FDB reset_irq6_ff             ; IRQ6 (edge triggered, must reset FF)
	FDB noop_irq_handler          ; IRQ7

INVALID_RECORD FCB "Invalid record",CR,NL,0

UPLOAD_COMPLETE FCB "Upload complete",CR,NL,0

CAT_PICTURE
	FCB CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,95,CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,92,96,42,45,46,CR,NL
	FCB 32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,32,32,32,32,32,32,32,32,41,32,32,95,96,45,46,CR,NL
	FCB 32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,46,32,32,58,32,96,46,32,46,CR,NL
	FCB 32,32,42,32,32,32,32,32,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,58,32,95,32,32,32,39,32,32,92,CR,NL
	FCB 32,32,42,32,32,32,32,32,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,59,32,42,96,32,95,46,32,32,32,96,42,45,46,95,CR,NL
	FCB 32,32,42,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,42,32,32,32,32,42,32,32,32,42,42,42,42,42,32,32,32,32,32,32,32,32,32,32,96,45,46,45,39,32,32,32,32,32,32,32,32,32,32,96,45,46,CR,NL
	FCB 32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,32,32,59,32,32,32,32,32,32,32,96,32,32,32,32,32,32,32,96,46,CR,NL
	FCB 32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,32,32,58,46,32,32,32,32,32,32,32,46,32,32,32,32,32,32,32,32,92,CR,NL
	FCB 32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,42,32,32,32,32,42,32,32,32,32,32,32,32,42,32,32,32,32,32,32,32,32,32,32,32,32,46,32,92,32,32,46,32,32,32,58,32,32,32,46,45,39,32,32,32,46,CR,NL
	FCB 32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,42,42,42,42,32,32,32,32,32,32,32,32,32,32,32,32,32,39,32,32,96,43,46,59,32,32,59,32,32,39,32,32,32,32,32,32,58,CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,58,32,32,39,32,32,124,32,32,32,32,59,32,32,32,32,32,32,32,59,45,46,CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,35,35,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,59,32,39,32,32,32,58,32,58,96,45,58,32,32,32,32,32,95,46,96,42,32,59,CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,35,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,46,42,39,32,47,32,32,46,42,39,32,59,32,46,42,96,45,32,43,39,32,32,96,42,39,CR,NL
	FCB 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,35,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,96,42,45,42,32,32,32,96,42,45,42,32,32,96,42,45,42,39,CR,NL
	FCB 32,32,32,32,35,32,35,35,35,32,32,35,32,32,32,32,35,32,32,32,35,32,32,32,35,35,35,32,32,32,32,35,35,35,CR,NL
	FCB 32,32,32,32,35,35,32,32,32,32,32,35,32,32,32,32,35,32,32,32,35,32,32,35,32,32,32,35,32,32,35,CR,NL
	FCB 32,32,32,32,35,32,32,32,32,32,32,35,32,32,32,32,35,32,32,32,35,32,32,35,35,35,35,35,32,32,32,35,35,35,CR,NL
	FCB 32,32,32,32,35,32,32,32,32,32,32,35,32,32,32,35,35,32,32,32,35,32,32,35,32,32,32,32,32,32,32,32,32,32,35,CR,NL
	FCB 32,32,32,32,35,32,32,32,32,32,32,32,35,35,35,32,35,32,32,32,35,32,32,32,35,35,35,32,32,32,32,35,35,35,CR,NL
	FCB CR,NL
	FCB 0

;;**********************************************************************
;; Scancode to ASCII code translation table: defines
;; keycode_not_shifted and keycode_shifted tables, which map
;; scancodes (without bit 6, the "pressed" bit) to ASCII
;; codes.
;;**********************************************************************

	INCLUDE "kbd_translate.asm"

;;**********************************************************************
;; TMS9918A text font
;;**********************************************************************

	INCLUDE "tms9918a_font.asm"

;;**********************************************************************
;; Table to look up reversals of text attributes.
;; Arguably wastes 256 bytes of ROM, but I'm lazy.
;;**********************************************************************

REVERSE_ATTR
	INCLUDE "revattr.asm"

;;**********************************************************************
;; System address table
;;
;; Programs loaded into RAM can use this table to locate addresses
;; of monitor functions and data.  There is no significance to the
;; order of the entries.  New entries should be added to the end.
;;
;; The include file "offtab.asm" contains symbolic names for the
;; addresses of each entry, and is the preferred way to (indirectly)
;; refer to monitor routines from other programs.
;;**********************************************************************

	ORG $FE00
	FDB reset_irq3_ff
	FDB reset_irq6_ff
	FDB mon_print_hex
	FDB mon_print_hex_d
	FDB acia_send
	FDB acia_send_string
	FDB acia_recv
	FDB delay
	FDB kbd_poll

;;**********************************************************************
;; Interrupt vectors
;;**********************************************************************

	;; IRQ vector
	ORG $FFF8
	FDB irq_dispatch

	;; reset vector
	ORG $FFFE
	FDB entry

;; vim:ft=asm6809:
;; vim:ts=4:
