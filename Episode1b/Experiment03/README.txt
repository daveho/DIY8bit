Experiment 3 is an attempt to use Block RAM(s) to store a row
of pixel on/off values, and have the pixel generator use it
to generate pixels. Eventually, this could become the basis
for text character output, we would just need to fill the buffer
with one row of rendered character data.  For now, we'll just
hard code on/off (i.e., foreground/background) colors, but
eventually attribute and palette data could be used to for
color text output.
