# Makefile for Episode D

%.bin : %.asm
	asm6809 -B $< -o $*.bin

all : i82c55a_test.bin i82c55a_count.bin

program :
	@if [ "$(IMG)" = "" ]; then \
		echo "binary missing (make program IMG=binary)"; \
	else \
		echo eeprog -f $(IMG) -p /dev/ttyUSB0 -D -v -N; \
		eeprog -f $(IMG) -p /dev/ttyUSB0 -D -v -N; \
	fi

clean :
	rm -f *.bin
