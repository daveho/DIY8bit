;;**********************************************************************
;; Hardware VGA text mode variables
;;**********************************************************************

;; Currently-selected VRAM bank (0-3)
hwvga_cur_bank RZB 1

;; Current font bits in hwvga bank register.
;; Any time the bank is changed, these bits should be OR-ed
;; into the value that is written to the bank register.
hwvga_cur_font RZB 1

;; Current cursor row (should be in range 0-29)
hwvga_cursor_row RZB 1

;; Current cursor column (should be in range 0-79)
hwvga_cursor_col RZB 1

;; Current attribute for output operations
hwvga_cur_attr RZB 1

;; Saved attribute of the character cell where the cursor is currently
;; positioned. Will be restored if the cursor is moved.
;; (The cursor is rendered in software, so the current attribute
;; of the character cell might not be "correct" if the cursor is in
;; its inverted display state.)
hwvga_cursor_saved_attr RZB 1

;; Count of how many times the vertical refresh interrupt has
;; occurred, for animating the cursor
hwvga_irq_count RZB 1

;; vim:ft=asm6809:
;; vim:ts=4:
