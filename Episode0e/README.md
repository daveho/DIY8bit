# DIY 8-bit computer, Episode 0E

Link to video: <https://youtu.be/j3bbaLHWuI0>

In this episode, we add three peripheral chips to the second
module (the "peripheral" module).  A hardware fault results in
some debugging and (yay) a fix.

The [Code](Code) directory has the source code for the test
program that helped diagnose the problem by confirming that the
core module was working and isolating the issue to the
peripheral module.

Special guest appearance by Ingo.

The pins of Port C on the 82c55a chip are now routed onto the backplane.
This is the revised backplane connector pinout:

```
~ denotes an active-low signal

    front       back
     side       side
          +---+
          |o o|
       D0 |o o|
       D1 |o o| PC0
       D2 |o o| PC1
       D3 |o o| PC2
       D4 |o o| PC3
       D5 |o o| PC4
       D6 |o o| PC5
       D7 |o o| PC6
       A8 |o o| PC7
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
     R/~W |o o| ~IODEV9
   ~ROMEN |o o| ~IODEV10
        E |o o| ~IODEV11
    ~RMEM |o o| ~IODEV12
    ~WMEM |o o| ~IODEV13
     ~RST |o o| ~IODEV14
      RST |o o| ~IODEV15
      +5V |o o| GND
          +---+
```
