# Makefile for Episode F

INCLUDES = iodev.asm i82c55a.asm i82c54.asm acia.asm

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

program : monitor.bin
	minipro -p AT28C256 -w monitor.bin

testprog.ihx : testprog.asm
	asm6809 -H testprog.asm -o $@

clean :
	rm -f *.bin *.lst
