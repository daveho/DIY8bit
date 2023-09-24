# Makefile for keyboard controller

%.ihx : %.c
	sdcc -mmcs51 --code-size 2048 $*.c -o $*.ihx

all : Blink_LED.ihx serlcd.ihx kbdctrl.ihx

testprog.ihx : testprog.asm offtab.asm
	asm6809 -H testprog.asm -o $@

inttest.ihx : inttest.asm offtab.asm
	asm6809 -H inttest.asm -o $@

kbdtest.ihx : kbdtest.asm offtab.asm
	asm6809 -H kbdtest.asm -o $@

clean:
	rm -rf *.ihx *.lk *.lst *.map *.mem *.rel *.rst *.sym
