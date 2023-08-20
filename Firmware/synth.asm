;; Experimental YM2149F synth program
;; Idea is to allow the keyboard to be used
;; to play notes

;; Variables (placed at address $0800, just above
;; monitor variables)



;; Code

	ORG $1000


;; Data

freqreg_vals
	INCLUDE "freqreg_vals.asm"

;; vim:ft=asm6809:
