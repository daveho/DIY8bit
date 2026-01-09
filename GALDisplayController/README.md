# GAL-based VGA text display

This directory has a GAL-based VGA text display controller,
including a schematic and PCB. Although the design worked
as a hand-wired prototype consisting of six boards on a
backplane, I wasn't able to get the PCB version (which uses
mostly surface mount components) working.

The good news is that an FPGA-based version of the display
fully works. The schematic is in the "FPGADisplayController"
sheet of the main schematic in the [HardwareDesign](../HardwareDesign)
directory, and the Verilog code is in the
[FPGADisplayController](../FPGADisplayController) directory.
