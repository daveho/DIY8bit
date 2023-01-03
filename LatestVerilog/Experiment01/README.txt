Experiment 1: Put the font data in SPRAM so that more block RAM is available
for the framebuffer. I was originally planning on putting the framebuffer
in the SPRAM, since it's much bigger than the available block RAMS.
However, a viewer (0toleranz) suggested using the SPRAM for font data
and freeing up block RAM for the framebuffer, since the character and
attribute data are updated much more often than font data. I think this
is a good suggestion.

The SPRAM is a bit tricky to use because it's single-ported, so only one
process can read from and write to it. By definition, this must be the
character generator, since it needs to read the font data. My thought is
that during the processing of the non-visible vertical area, the
character generated can check a block RAM (and associated control registers)
and see if there is font data available to be copied into the SPRAM.
