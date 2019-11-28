# Makefile for Episode B count program

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : count.bin

program : count.bin
	eeprog -f count.bin -p /dev/ttyUSB0 -D -v -N

clean :
	rm -f *.bin *.lst
