# DIY 8-bit computer, Episode 0B

The [CircuitWithRAM](CircuitWithRAM) directory has KiCad schematics for the updated version of the circuit, which includes address buffers, a bus tranceiver for the data bus, and a 32K static RAM chip.

The [Code](Code) directory has an example program which outputs sequential count values on a 74HCT574 output port (not shown in the circuit, but it's interfaced exactly the same way as in [Episode 9](../Episode09).  I used the [eeprog](https://github.com/daveho/eeprog) EEPROM programmer developed in [Epsiode A](../Episode0a) to write the code to the EEPROM device.

The passive backplane schematic and PCB design are here: <https://github.com/daveho/easycpu/tree/master/backplane2>
