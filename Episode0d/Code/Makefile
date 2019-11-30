# Makefile for Episode D

INCLUDES = iodev.asm i82c55a.asm i82c54.asm acia.asm

%.bin : %.asm
	asm6809 -l $*.lst -B $< -o $*.bin

all : i82c55a_count.bin i82c54_test.bin acia_test.bin

i82c55a_count.bin : i82c55a_count.asm $(INCLUDES)

i82c54_test.bin : i82c54_test.asm $(INCLUDES)

acia_test.bin : acia_test.asm $(INCLUDES)

program :
	@if [ "$(IMG)" = "" ]; then \
		echo "binary missing (make program IMG=binary)"; \
	else \
		echo eeprog -f $(IMG) -p /dev/ttyUSB0 -D -v -N; \
		eeprog -f $(IMG) -p /dev/ttyUSB0 -D -v -N; \
	fi

clean :
	rm -f *.bin *.lst
