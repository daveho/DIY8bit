# Makefile for programs

# These are assembled to .ihx (Intel Hex) files,
# and can be loaded by the ROM monitor into RAM
# using the "d" (download) command.

# These are the usual includes needed by programs
INCLUDES = ../Include/offtab.asm ../Include/iodev.asm

%.ihx : %.asm
	asm6809 -H $*.asm -o $*.ihx

all : testprog.ihx inttest.ihx kbdtest.ihx synth.ihx vram_test.ihx

testprog.ihx : testprog.asm $(INCLUDES)

inttest.ihx : inttest.asm $(INCLUDES)

kbdtest.ihx : kbdtest.asm $(INCLUDES)

# synth program
synth.ihx : synth.asm freqreg_vals.asm $(INCLUDES)

freqreg_vals.asm : gen_synthfreq.rb synthkeys.txt
	./gen_synthfreq.rb < synthkeys.txt > freqreg_vals.asm

vram_test.ihx : vram_test.asm $(INCLUDES)

clean:
	rm -rf *.ihx *.bin *.lst freqreg_vals.asm
