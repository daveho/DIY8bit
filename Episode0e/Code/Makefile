# Makefile for Episode E test programs

%.bin : %.asm
	asm6809 -B $< -o $*.bin

all : CountNoRAM.bin

program : CountNoRAM.bin
	eeprog -f CountNoRAM.bin -p /dev/ttyUSB0 -D -v -N

clean :
	rm -f *.bin
