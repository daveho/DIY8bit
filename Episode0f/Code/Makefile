# Makefile for Episode F

INCLUDES = iodev.asm i82c55a.asm i82c54.asm acia.asm

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : monitor.bin

monitor.bin : monitor.asm $(INCLUDES)

program : monitor.bin
	eeprog -f monitor.bin -p /dev/ttyUSB0 -D -v -N

clean :
	rm -f *.bin *.lst
