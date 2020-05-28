all : Blink_LED.ihx

%.ihx : %.c
	sdcc -mmcs51 --code-size 2048 $*.c -o $*.ihx

all : Blink_LED.ihx serlcd.ihx kbdctrl.ihx

clean:
	rm -rf *.ihx *.lk *.lst *.map *.mem *.rel *.rst *.sym *.asm
