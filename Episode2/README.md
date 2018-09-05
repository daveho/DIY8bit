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

## Digital logic ICs

Having a variety of digital logic ICs is essential for experimentation.  I would recommend getting 74HCT series parts.  Make sure you through hole parts, not surface mount!  If you are in the USA, [Unicorn Electronics](https://www.unicornelectronics.com/) is a great place to find these, including some of the more obscure/obsolete ones.

Ebay is not a bad place to look as well, and if you're patient you can get some good deals.

Here are several lists.

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

These are logic gates with more than 2 inputs per gate.  Surprisingly useful.

### Other combinational logic ICs

* 74HCT138 (3 to 8 decoder)
* 74HCT153 or 74HCT253 (dual 4 input multiplexer)
* 74HCT157 or 74HCT257 (quad 2 input multiplexer)

There are probably others that I'm forgetting.

### Flip flops, registers, latches

* 74HCT74 (dual D-type flip flop: absolute must have)
* 74HCT175
* 74HCT374 or 74HCT574 (note that the '574 version is more pleasant to work with)
