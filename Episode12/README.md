# DIY 8-bit computer, Episode 12

Link to video: <https://youtu.be/yMzNDNwyb3E>

In this video, we design and test a keyboard controller which interfaces a Commodore 16 keyboard with the 6809 system.

The [CircuitWithKbdCtrl](CircuitWithKbdCtrl) directory has updated schematics.

The [Code](Code) directory has code for the keyboard firmware ([kbdctrl.c](Code/kbdctrl.c)), which runs on an 8051-family microcontroller (89C51 or 87C51), an updated monitor program ([monitor.asm](Code/monitor.asm)), and a quick test program to read and print keyboard scan codes ([kbdtest.asm](Code/kbdtest.asm)).

Note that the monitor program now contains an "offset table", which contains addresses of monitor routines.  Because the offset table has a well-known address, this allows programs loaded into RAM to refer to monitor routines indirectly, avoiding the need to hard-code their addresses.

The website for SDCC (used to compile the keyboard controller firmware) is here: <http://sdcc.sourceforge.net/>.

Just for the record, here are the current backplane connector pin assignments (as viewed from above the backplane):

    ~ denotes an active-low signal
    
        front       back
         side       side
              +---+
              |o o|
           D0 |o o| ~IRQ
           D1 |o o| PC0
           D2 |o o| PC1
           D3 |o o| PC2
           D4 |o o| PC3
           D5 |o o| PC4
           D6 |o o| PC5
           D7 |o o| PC6
           A8 |o o| PC7
           A9 |o o| TIRQ
          A10 |o o|
          A11 |o o|
          A12 |o o|
          A13 |o o|
          A14 |o o|
          A15 |o o|
           A0 |o o|
           A1 |o o|
           A2 |o o|
           A3 |o o|
           A4 |o o|
           A5 |o o|
           A6 |o o| ~IODEV0
           A7 |o o| ~IODEV1
              |o o| ~IODEV2
              |o o| ~IODEV3
              |o o| ~IODEV4
              |o o| ~IODEV5
              |o o| ~IODEV6
              |o o| ~IODEV7
              |o o| ~IODEV8
         R/~W |o o| ~IODEV9
       ~ROMEN |o o| ~IODEV10
            E |o o| ~IODEV11
        ~RMEM |o o| ~IODEV12
        ~WMEM |o o| ~IODEV13
         ~RST |o o| ~IODEV14
          RST |o o| ~IODEV15
          +5V |o o| GND
              +---+
