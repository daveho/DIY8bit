;; Experimental YM2149F synth program
;; Idea is to allow the keyboard to be used
;; to play notes

	INCLUDE "iodev.asm"
	INCLUDE "offtab.asm"

;; Variables (placed at address $0800, just above
;; monitor variables)

	ORG $0800

; Scan code of current note (set to $FF if no note is being played)
cur_note FCB $FF

;; Code

	ORG $1000

entry
	; initialization

	; disable tone and noise output on all channels
	lda #$07
	ldb #$FF
	jsr ym2149f_write

	; set max volume level on all three channels
	; (for now, use fixed volume, so envelope is not used)
	lda #$08
	ldb #$0F
	jsr ym2149f_write
	lda #$09
	ldb #$0F
	jsr ym2149f_write
	lda #$0A
	ldb #$0F
	jsr ym2149f_write

	; main loop: read scan codes from keyboard, and as note keys
	; are pressed and released, play notes on channel A
main_loop
	; read scan code from keyboard
	ldy OFFTAB_KBD_POLL           ; index of kbd_poll in offset table
	jsr ,Y                        ; call kbd_poll
	cmpb #0                       ; B is 0?
	beq main_loop                 ; if so, no key event, so continue main loop

	; scan code is in A, copy it to B
	; (we'll keep the unmodified scan code in B)
	tfr A, B

	; check whether scan code is a press or release
	anda #(1 << 6)                ; clear all bits except bit 6
	cmpa #(1 << 6)                ; is bit 6 set?
	bne maybe_end_note            ; if not, this is a release, so maybe end cur note

	; event is a key press
	; get the rough and fine frequency values from the register values table
	tfr B, A                      ; copy scancode back to A
	anda #$3F                     ; clear bit 6
	lsla                          ; double keycode so that we can use it as
                                      ;   an index into the register values table
	ldy #freqreg_vals             ; get base address of freq values table
	leay A,Y                      ; compute address of entry for pressed key
	ldx ,Y                        ; get register values into X
	cmpx #$0000                   ; are both register values 0?
	beq main_loop                 ; this is not a note key, so continue main loop

	pshs B                        ; save scancode on stack

	; set channel A frequency
	lda #$01                      ; channel A rough frequency register
	ldb ,Y+                       ; get rough frequency value
	jsr ym2149f_write             ; set rough frequency
	lda #$00                      ; channel A fine frequency register
	ldb ,Y+                       ; get fine frequency value
	jsr ym2149f_write             ; set fine frequency

	; enable channel A tone output
	lda #$07                      ; I/O port and mixer settings register
	ldb #$FE                      ; enable channel A tone output

	puls B                        ; restore scancode from stack

	andb #$3F                     ; clear bit 6 (so that we have just the keycode)
	stb cur_note                  ; store keycode of current note

	jmp main_loop                 ; continue main loop

maybe_end_note
	cmpb cur_note                 ; is keycode same as current note?
	bne main_loop                 ; if not, nothing to do
	lda #$07                      ; I/O port and mixer settings
	ldb #$FF                      ; disable all noise and tone outputs
	jsr ym2149f_write             ; update outputs

	jmp main_loop                 ; continue main loop

;; Write a value to a YM2149F register.
;; Parameters:
;;   A - YM2149F register to write (0-15)
;;   B - data value to write to the register
ym2149f_write
	sta PORT_YM2149_ADDR
	stb PORT_YM2149_DATA
	rts

;; Data

freqreg_vals
	INCLUDE "freqreg_vals.asm"

;; vim:ft=asm6809:
