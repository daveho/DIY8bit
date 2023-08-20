# Makefile for Episode 13

# Updated ROM monitor with better keyboard support

INCLUDES = iodev.asm i82c55a.asm i82c54.asm acia.asm kbd_translate.asm \
	tms9918a_font.asm

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : monitor.bin

# Because monitor.asm uses the first 32K of addresses for variables
# in RAM (which aren't part of the ROM image), we strip the first
# 32K of the assembled image to leave just the code/data to be
# stored in the EEPROM.
monitor.bin : monitor.asm $(INCLUDES)
	asm6809 -l monitor.lst -B monitor.asm -o monitor_temp.bin
	dd if=monitor_temp.bin of=$@ bs=1024 skip=32
	rm -f monitor_temp.bin

testprog.ihx : testprog.asm offtab.asm
	asm6809 -H testprog.asm -o $@

inttest.ihx : inttest.asm offtab.asm
	asm6809 -H inttest.asm -o $@

kbdtest.ihx : kbdtest.asm offtab.asm
	asm6809 -H kbdtest.asm -o $@

kbd_translate.asm : translate.txt build_kbd_table.rb
	./build_kbd_table.rb < translate.txt > $@

tms9918a_font.asm : tms9918a_font.txt
	./mk_tms9918a_font.rb

# synth program
synth.ihx : synth.asm synthkeys.txt gen_synthfreq.rb
	./gen_synthfreq.rb < synthkeys.txt > freqreg_vals.asm
	asm6809 -H synth.asm -o $@

clean:
	rm -rf *.ihx *.bin *.lst
