# Makefile for Episode 9 blink program

%.bin : %.asm
	asm6809 -B $< -o $*.bin

all : blink.bin
