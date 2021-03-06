# DIY 8-bit computer, Episode 0D

Link to video: <https://youtu.be/YS9_oOxCDp8>

In this episode we add a ZIF socket to the backplane (to allow
easy insertion and removal of the EEPROM during firmware development),
and add three peripheral devices (prototyped on a breadboard):

* An 82C55A peripheral interface (24 pins of digital I/O)
* An 82C54 timer/counter (for UART frequency generation and, eventually,
  a timer interrupt)
* A 63B50 ACIA (UART)

The ACIA chip is interfaced with an FT232RL breakout to allow serial
communications with the host PC via USB.

Code is in the [Code](Code) directory, and schematics are in the
[CircuitWithPeriphs](CircuitWithPeriphs) directory.

The top-level schematic shows the division into circuit modules, which
are separate PCBs on the passive backplane.

Link to passive backplane design: <https://github.com/daveho/easycpu/tree/master/backplane2>

The USB to serial breakout module I use is this one (this is a random
AliExpress link): [FT232RL breakout module at AliExpress](https://www.aliexpress.com/item/32481520135.html?spm=a2g0o.productlist.0.0.4b60167cbK8WUB&algo_pvid=3afa4b8a-bc32-4eb2-8a0c-f9376003cf0a&algo_expid=3afa4b8a-bc32-4eb2-8a0c-f9376003cf0a-0&btsid=68c0a29e-85d7-4c57-8f76-9afcbfc6fa93&ws_ab_test=searchweb0_0,searchweb201602_2,searchweb201603_55)

I learned how to interface an ACIA to a FT232RL breakout from [Grant
Searle's minimal 6809 system](https://searle.x10host.com/6809/Simple6809.html).

Since one signal (R/-W) was added to the backplane, here is an updated
diagram showing how signals are assigned to the backplane connectors:

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
