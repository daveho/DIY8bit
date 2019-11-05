# Makefile for Episode 9 blink program

%.bin : %.asm
	asm6809 -B $< -o $*.bin

all : blink.bin

program : blink.bin
	eeprog -f blink.bin -p /dev/ttyUSB0 -D -v -N

clean :
	rm -f *.bin
