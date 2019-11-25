# Makefile for Episode :w

%.bin : %.asm
	asm6809 -B $< -o $*.bin

all : loop.bin

program : loop.bin
	eeprog -f loop.bin -p /dev/ttyUSB0 -D -v -N

clean :
	rm -f *.bin
