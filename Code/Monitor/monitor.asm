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

	; Initialize hardware VGA text display,
	; and enable interrupts (since the timer interrupt handler
	; is used to blink the cursor)
	jsr hwvga_init
	jsr mon_q_cmd

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
MONITOR_COMMANDS FCB "?earwdxsmqc",0

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
	FDB mon_c_cmd
;	FDB mon_k_cmd

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

;	INCLUDE "tms9918a_font.asm"

;;**********************************************************************
;; Table to look up reversals of text attributes.
;; Arguably wastes 256 bytes of ROM, but I'm lazy.
;;**********************************************************************

REVERSE_ATTR
	INCLUDE "revattr.asm"

;;**********************************************************************
;; System address table (a.k.a. "offset table")
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
	FDB hwvga_set_bank
	FDB hwvga_compute_addr
	FDB hwvga_map_bank
	FDB hwvga_set_font
	FDB hwvga_clear_screen
	FDB hwvga_set_attr
	FDB hwvga_copy_dumb
	FDB hwvga_write_dumb
	FDB mon_q_cmd
	FDB hwvga_move_cursor

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
