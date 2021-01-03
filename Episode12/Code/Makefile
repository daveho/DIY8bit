# Makefile for Episode 12

# This is a bit confusing since the ".asm" suffix is used for
# both 6809 and 8051 assembly code, and ".ihx" files could
# contain either 6809 or 8051 object code.  In the future,
# it would make sense to use separate directories for 6809
# and 8051 code.

INCLUDES = iodev.asm i82c55a.asm i82c54.asm acia.asm

%.ihx : %.c
	sdcc -mmcs51 --code-size 2048 $*.c -o $*.ihx

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : Blink_LED.ihx serlcd.ihx kbdctrl.ihx monitor.bin

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

clean:
	rm -rf *.ihx *.lk *.lst *.map *.mem *.rel *.rst *.sym
