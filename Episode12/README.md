# DIY 8-bit computer, Episode 12

Link to video: coming soon

In this video, we design and test a keyboard controller which interfaces a Commodore 16 keyboard with the 6809 system.

The [CircuitWithKbdCtrl](CircuitWithInterrupts) directory has updated schematics.

The [Code](Code) directory has code for the keyboard firmware ([kbdctrl.c](Code/kbdctrl.c)), which runs on an 8051-family microcontroller (89C51 or 87C51), an updated monitor program ([monitor.asm](Code/monitor.asm)), and a quick test program to read and print keyboard scan codes ([kbdtest.asm](Code/kbdtest.asm)).

Note that the monitor program now contains an "offset table", which contains addresses of monitor routines.  Because the offset table has a well-known address, this allows programs loaded into RAM to refer to monitor routines indirectly, avoiding the need to hard-code their addresses.

The website for SDCC (used to compile the keyboard controller firmware) is here: <http://sdcc.sourceforge.net/>.
