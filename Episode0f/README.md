# DIY 8-bit computer, Episode 0F

Link to video: <https://youtu.be/e-CLhZKH1Es>

In this episode we cover 6809 assembly language, and develop a
ROM monitor that allows basic interaction with the 6809 system,
including downloading programs to RAM and executing them.

The ROM monitor program and a test program (which outputs increasing
count values on port A of the 82c55a) are in the [Code](Code) directory.

A **fixed** version of the schematic, which corrects mistakes in the
interfacing of the 6850 ACIA chip and the FT232RL breakout, is in
the [CircuitWithPeriphs](CircuitWithPeriphs) directory.  If you built
the earlier version of the circuit from [Episode D](../Episode0d)
you will need to fix it in order for serial communications to work!
