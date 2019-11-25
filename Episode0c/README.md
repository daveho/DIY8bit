# DIY 8-bit computer, Episode 0C

Link to video: <https://youtu.be/3QeSIQgmeU4>

The [CircuitWithRAM2](CircuitWithRAM2) has very slightly revised
schematics compared to the [previous episode](../Episode0b).
I accidentally swapped the RST and ~RST signals feeding into the the
74HCT365 hex buffer when I was wiring the core module protoboard.
This doesn't have any particular significance since there are no
consumers of these signals yet, but I find that it pays to make sure
that the schematics stay up to date with the actual hardware.

Here is a diagram of the backplane signals.  The left faces towards the
"front" of the backplane.  There is no particular significance to the
arrangement of signals, other than it is considerably easier to make
connections to the left side than the right side, so I put the most
important signals there, especially the data bus and address bus signals.
Mostly signal placement was motivated by what was most convenient for
wiring the core module.  Note that the high address lines (A8-A15)
precede the low address lines (A0-A7): this was due to a brain fart
in wiring the CPU address signals to the address buffers.

```
~ denotes an active-low signal

    front       back
     side       side
          +---+
          |o o|
       D0 |o o|
       D1 |o o|
       D2 |o o|
       D3 |o o|
       D4 |o o|
       D5 |o o|
       D6 |o o|
       D7 |o o|
       A8 |o o|
       A9 |o o|
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
          |o o| ~IODEV9
   ~ROMEN |o o| ~IODEV10
        E |o o| ~IODEV11
    ~RMEM |o o| ~IODEV12
    ~WMEM |o o| ~IODEV13
     ~RST |o o| ~IODEV14
      RST |o o| ~IODEV15
      +5V |o o| GND
          +---+
```

The [Code](Code) directory has the loop program I used to verify that the
ROM was working.  The video also shows the count program from the previous
episode running.

The 2x40 female right-angle connectors for the circuit modules came from
[Tayda Electronics](https://www.taydaelectronics.com/).  The 2x40 male
connectors on the backplane PCB were just cheap ones from Ebay.

The 10x15 cm IC-pattern protoboards I mentioned buying from Ebay no longer
seem to be available.  I think I received the last ones!
