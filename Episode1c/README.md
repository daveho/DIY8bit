# Episode 1C

The goal of this episode is to have the display controller display
characters as 800x600 SVGA video.

## Summary of experiments

Experiment 1: Change core FPGA clock frequency to 39.75 MHz because
an update to the IceStorm tools caused the design to not synthesize
correctly at 80 MHz.  This is ok, since pipelining should completely
obviate the need for a fast clock.

Experiment 2: Generate 8 pixels at a time from a single 8 bit register.
The idea is that this is the last stage in the video output.
(Eventually we'll need to add support for foreground/background
colors, but they can just be stored in a different register.)

Experiment 3: Begin to implement a command protocol. The basic format
is a single command byte followed by 1 or more additional data bytes.
This required quite a bit of time to get working because the
"sharedreg" module had a bug where the consumer would see a data
byte twice due to the way the data available flag was updated.
Was able to figure this out using the oscilloscope: it was clear
that the same data byte was being consumed twice.

Experiment 4: Have the host upload 8x16 VGA font data to block RAM.

Experiment 5: Have the host upload character data to block RAM, and
attempt to render it as characters. This *sort of* works. Definitely
some recognizable characters are displayed, but they're not quite in
the expected places on the screen.
