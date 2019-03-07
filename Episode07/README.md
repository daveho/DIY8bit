# DIY 8-bit computer, Epsiode 7

## Free run

In this episode we build and test a *free run* circuit using the 6809 CPU.  The [Freerun](Freerun) directory has the schematic (KiCad and PDF versions).

Rather than interfacing the 6809 with actual memory devices (such as RAM and ROM), the data bus lines (D0..D7) are tied high or low to force a specific pattern of 0 or 1 values to be read when the CPU fetches a value from the bus—specifically, the value &#36;12 (&#36; means base 16, so &#36;12 is 1×16 + 2×1, meaning 18 decimal).  The address lines, which normally are used to select which device is accessed, are essentially ignored.  From the CPU's perspective, it is as though the entire 64K address space is filled with bytes containing the data value &#36;12.

When interpreted as an instruction, &#36;12 is opcode of the NOP instruction.  So, in this circuit, the CPU executes NOP instructions endlessly.  After fetching the reset vector on startup (which will be address $1212, think about it), the CPU starts fetching and executing instructions at the reset vector address.  Each instruction fetch increments the program counter by the number of bytes corresponding to the length of the fetched instruction.  NOP is a one byte instruction, so the program counter increments by 1 for each NOP.

We can gain some confidence that the CPU is working correctly by observing the address values asserted on the address lines (A0..A15) incrementing by one over and over as instructions are fetched.

## Parts, equipment

Parts needed:

* A way of generating a power-on reset signal (see [Episode 6](https://youtu.be/seTUE1D20fE)); I used an ADM708 chip (clone of the MAX708)
* A 6809 CPU: I used a HD68B09 since I have a few of these.  MC6809 and HD6309 CPUs should also work fine.
* A crystal oscillator with a frequency between 2 and 4 MHz.
* Two 22 pF capacitors
* 8 pull-up/pull-down resistors: exact value isn't too important, I used 4.7K

Recommended equipment:

1. A multimeter with a frequency function.  In the video I use a Zotek ZT102, but Aneng models such as the AN8002 and AN8008 are also excellent.
2. A logic analyzer.  The super cheap 8 channel 24 MHz ones that are clones of the Saleae Logic are great, and can be had for less than &#36;10 US.  Search eBay, Aliexpress, Banggood, etc. for "8ch 24mhz logic analyzer".  Use Sigrok/Pulseview as the software; this is ethically more sound than using the Saleae software, which is really only meant to be used with actual Saleae hardware.  Also, Sigrok is open source, and we like open source software.
