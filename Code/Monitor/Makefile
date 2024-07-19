# Makefile for ROM monitor

include depend.mak

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

kbd_translate.asm : translate.txt build_kbd_table.rb
	./build_kbd_table.rb < translate.txt > $@

tms9918a_font.asm : tms9918a_font.txt
	./mk_tms9918a_font.rb

depend.mak :
	./mkdeps.rb INCLUDES < monitor.asm > depend.mak

.PHONY: depend
depend :
	./mkdeps.rb INCLUDES < monitor.asm > depend.mak

clean:
	rm -rf *.ihx *.bin *.lst depend.mak
