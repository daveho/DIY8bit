# Makefile for programs

# These are assembled to .ihx (Intel Hex) files,
# and can be loaded by the ROM monitor into RAM
# using the "d" (download) command.

PROGS = testprog.ihx inttest.ihx kbdtest.ihx synth.ihx vram_test.ihx hwvga_test.ihx \
	ingo_photo.ihx

%.ihx : %.asm
	asm6809 -H $*.asm -s $*.lst -o $*.ihx

all : $(PROGS)

freqreg_vals.asm : gen_synthfreq.rb synthkeys.txt
	./gen_synthfreq.rb < synthkeys.txt > freqreg_vals.asm

.PHONY: depend
depend :
	rm -f depend.mak
	for f in $(PROGS); do ../mkdeps.rb $$f $$(basename $$f .ihx).asm >> depend.mak; echo '' >> depend.mak; done

depend.mak :
	rm -f depend.mak
	for f in $(PROGS); do ../mkdeps.rb $$f $$(basename $$f .ihx).asm >> depend.mak; echo '' >> depend.mak; done

clean:
	rm -rf *.ihx *.bin *.lst freqreg_vals.asm

include depend.mak
