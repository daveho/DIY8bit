# DIY 8-bit Computer, Episode 1D

The goal of this episode is to fully implement the display controller.
Desired features:

* 100 column by 37 row text mode
* 8x16 font (specifically, the [DOS ISO8 font](https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_dos_iso8))
* independent foreground and background colors for each displayed character,
  with a 256 color palette chosen from 4096 possible colors (RGB 444 truecolor)

## Status

In the [previous](../Episode1c) I was able to get character rendering to
work. However, it didn't support a full framebuffer, and there was
no support for character foreground and background colors, nor was there
a full framebuffer.

I'm just getting started on implementing the desired features
listed above.

## Experiments

* [Experiment 1](Experiment01): put the font data in SPRAM so that
  more block RAM is available for the framebuffer
