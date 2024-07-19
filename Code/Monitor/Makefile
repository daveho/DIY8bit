# Makefile for ROM monitor

# Common includes shared by the ROM monitor and the programs
COMMON_INCLUDES_BARE = iodev.asm i82c55a.asm i82c54.asm acia.asm hwvga.asm
	
COMMON_INCLUDES = $(COMMON_INCLUDES_BARE:%=../Include/%)

# Local includes used only by the monitor
LOCAL_INCLUDES = kbd_translate.asm tms9918a_font.asm revattr.asm

INCLUDES = $(COMMON_INCLUDES) $(LOCAL_INCLUDES)

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

clean:
	rm -rf *.ihx *.bin *.lst
