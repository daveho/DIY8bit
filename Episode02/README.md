# DIY 8-bit computer, Epsiode 2

At some point I will probably do a video on what equipment and supplies you will need, but for now I'll just list the things that I think are essential for experimenting with digital circuits.

## Basic prototyping supplies

* Breadboards
* 5V power supply (e.g., switching power supply)
* [Barrel jack to screw terminal adapter](https://www.amazon.com/JacobsParts-Female-Screw-Connector-Electronics/dp/B01N5TW5EQ)
* Jumper wires (either Dupont M/M or 22 AWG solid core)
* LEDs
* Resistors (some useful values are 220 Ω, 330 Ω, 1K Ω, 2.7K Ω, 4.7K Ω, 10K Ω)
* Pushbutton switches
* Multimeter: the ANENG multimeters (such as the [AN8008](https://www.amazon.com/ANENG-AN8008-Multimeter-Resistance-Capacitance/dp/B076GZK62B)) are quite good

## Digital logic ICs

Having a variety of digital logic ICs is essential for experimentation.  I would recommend getting 74HCT series parts.  Make sure you get through hole parts (DIP/DIL package), not surface mount!  If you are in the USA, [Unicorn Electronics](https://www.unicornelectronics.com/) is a great place to find these, including some of the more obscure/obsolete ones.  It's also an excellent place to find datasheets.

Ebay is not a bad place to look as well, and if you're patient you can get some good deals.

Here are several lists.  I would consider 5 to be the useful minimum quantity of any part.  More is better.

### Basic logic gates

You should definitely have these basic logic gates:

* 74HCT00
* 74HCT02
* 74HCT04
* 74HCT08
* 74HCT32

You could get some 74HCT86 (quad XOR) too, I suppose.

### Obscure but useful logic gates

* 74HCT10
* 74HCT11
* 74HCT20
* 74HCT21
* 74HCT27
* 74HCT30

These are logic gates with more than 2 inputs per gate.  Surprisingly useful.  I have found *all* of these useful at one time or another.

### Other combinational logic ICs

* 74HCT138 (3 to 8 decoder)
* 74HCT153 or 74HCT253 (dual 4 input multiplexer)
* 74HCT157 or 74HCT257 (quad 2 input multiplexer)
* 74HCT147 (10 to 4 priority encoder)

There are probably others that I'm forgetting.

### Flip flops, registers, latches

* 74HCT74 (dual D-type flip flop: absolute must have)
* 74HCT175
* 74HCT374 or 74HCT574 ('574 is more pleasant to work with)
* 74HCT373 or 74HCT573 ('573 is more pleasant to work with)

### Buffers and transceivers

* 74HCT244 or 74HCT541 ('541 is more pleasant to work with)
* 74HCT125 (quad buffer gate)
* 74HCT365 (hex buffer gate)
* 74HCT245 (transceiver, but can also be used as buffer)
* 74HCT540 (like the '541, but inverting)

### Counters

* 74HCT161
* 74HCT163 (is fully synchronous, including reset)
* 74HCT191
* 74HCT193
* 74HCT393

### Shift registers

* 74HCT165 (parallel input, serial output)
* 74HCT595 (serial input, parallel output)

Note that the HCT versions of these ICs are fairly hard to find: for example, Unicorn Electronics doesn't stock them.  Depending on how you plan to use them, the HC variants (74HC165 and 74HC595) could be useful.  I use a 74HC165 in my circuit for scanning the keyboard matrix.  But if you can find the HCT versions, that's better.

## Other active components

Having some oscillator modules is quite useful.  Ones that produce a frequency that can be divided to get a baud rate are very useful: see [Crystal oscillator frequencies](https://en.wikipedia.org/wiki/Crystal_oscillator_frequencies).  I have also found 4 MHz and 8 MHz oscillators useful.
