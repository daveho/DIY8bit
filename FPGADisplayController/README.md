# FPGA Display Controller

This directory contains the Verilog code for the 80x30 VGA
text display. (The schematic for the module is in the main
schematic, as the "FPGADisplayController" sheet.) It uses the
[Upduino 3](https://tinyvision.ai/products/fpga-development-board-upduino-v3-1)
development board.

To build and upload the design, run the commands

```text
apio verify
apio build
apio upload
```

I wrote a blog post about working with the Upduino 3 on Linux:

<https://daveho.github.io/2021/02/07/upduino3-getting-started-on-linux.html>
