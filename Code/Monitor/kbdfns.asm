;;**********************************************************************
;; Keyboard routines
;;**********************************************************************

;; Initialize keyboard. No hardware initialize is needed,
;; but variables used by the keyboard routines are initialized.
kbd_init
	lda #0                         ; clear key modifiers
	sta vmodkey                    ; store in vmodkey
	rts

;; Return an ASCII value read from the keyboard.
;; If no key is available, the B register is set to 0.
;; If a key is available, the B register is set to 1, and
;; the A register will contain the character code.
kbd_poll
	ldb #$00                      ; assume no keypress available
	lda PORT_KBCTRL_STATUS        ; read status
	anda #KBD_STATUS_FIFO_NOT_EMPTY ; check not empty flag
	cmpa #$00                     ; FIFO is empty?
	beq 99f                       ; if empty, done

	lda PORT_KBCTRL_DATA          ; read scan code

	; Check whether shift or control were pressed or released
	jsr kbd_check_mod_keys

	tfr A, B                      ; copy scan code to B
	andb #KBD_SCAN_PRESS          ; check whether press

	cmpb #$00                     ; is not press?
	beq kbd_poll                  ; if not press, try to get next scan code

	pshs X                        ; preserve value of X register

	; Unset the press bit
	anda #~KBD_SCAN_PRESS         ; unset the "pressed" bit

	ldb vmodkey                   ; check key modifiers
	andb #KBD_SHIFT_MOD           ; is shift pressed?
	bne 70f                       ; jump to "shift pressed" case if appropriate

	; Shift is not pressed, use keycode_not_shifted table
	ldx #keycode_not_shifted
	jmp 80f

70
	; Shift is pressed, use keycode_shifted table
	ldx #keycode_shifted

80
	lda A,X                       ; translate scan code to character code
	ldb #1                        ; character code is available

	puls X                        ; restore value of X register

99
	rts

;; Check whether the scan code in the A register is a press or a release
;; of a modifier key (shift or control), and if so, update vmodkey.
;; Preserves register values.
kbd_check_mod_keys
	pshs B                        ; save original B value
	tfr A, B                      ; copy scancode to B

	cmpb #KBD_SCAN_SHIFT_PRESS    ; is shift press?
	bne 2f                        ; if not, next case
	ldb vmodkey                   ; get current key mod state
	orb #KBD_SHIFT_MOD            ; set shift mod bit
	stb vmodkey                   ; store in vmodkey
	jmp 99f                       ; done

2
	cmpb #KBD_SCAN_CTRL_PRESS     ; is control press?
	bne 3f                        ; if not, next case
	ldb vmodkey                   ; get current key mod state
	orb #KBD_CTRL_MOD             ; set control mod bit
	stb vmodkey                   ; store in vmodkey
	jmp 99f                       ; done

3
	cmpb #KBD_SCAN_SHIFT_RELEASE  ; is shift release?
	bne 4f                        ; if not, next case
	ldb vmodkey                   ; get current key mode state
	andb #~KBD_SHIFT_MOD          ; clear shift mod bit
	stb vmodkey                   ; store in vmodkey
	jmp 99f                       ; done

4
	cmpb #KBD_SCAN_CTRL_RELEASE   ; is shift release?
	bne 99f                       ; if not, done
	ldb vmodkey                   ; get current key mode state
	andb #~KBD_CTRL_MOD           ; clear control mod bit
	stb vmodkey                   ; store in vmodkey

99
	puls B                        ; restore original B value
	rts

;; vim:ft=asm6809:
;; vim:ts=4:
