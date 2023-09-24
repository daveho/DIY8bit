# Makefile for programs

# These are assembled to .ihx (Intel Hex) files,
# and can be loaded by the ROM monitor into RAM
# using the "d" (download) command.

# offtab.asm provides meaningful for index values into
# the offset table containing addresses of useful
# monitor routines
OFFTAB_ASM = ../Include/offtab.asm
IODEV_ASM = ../Include/iodev.asm

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : testprog.ihx inttest.ihx kbdtest.ihx synth.ihx

testprog.ihx : testprog.asm $(OFFTAB_ASM)
	asm6809 -H testprog.asm -o $@

inttest.ihx : inttest.asm $(OFFTAB_ASM)
	asm6809 -H inttest.asm -o $@

kbdtest.ihx : kbdtest.asm $(OFFTAB_ASM)
	asm6809 -H kbdtest.asm -o $@

# synth program
synth.ihx : synth.asm synthkeys.txt gen_synthfreq.rb $(OFFTAB_ASM) $(IODEV_ASM)
	./gen_synthfreq.rb < synthkeys.txt > freqreg_vals.asm
	asm6809 -H synth.asm -o $@

clean:
	rm -rf *.ihx *.bin *.lst
