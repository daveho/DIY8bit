# DIY 8-bit computer, Episode 16

Link to video: <https://youtu.be/gSi9ksZn5Jk>

In this video, I choose the name "F68" for the 6809 computer system,
and debug and test a new PCB for the CPU and glue logic module.
There are some mistakes in the PCB layout that cause some problems,
but eventually everything works.

The [HardwareDesign](HardwareDesign) directory has the updated
schematics and the PCB layout.  Note that the [CPUandGlueLogic.kicad\_pcb](CPUandGlueLogic.kicad_pcb)
file has fixes for the PCB layout issues discussed in the episode.
The [gerbers\_cpu](HardwareDesign/gerbers_cpu) subdirectory has the gerber
files for the updated (fixed) board layout. Note: do *not* populate resistor
network R101, it seems to cause problems (as noted towards the end of
the video.)

The [Mechanical](Mechanical) directory has the design for the 3D-printable clips
to more firmly attach the backplane connector (which is a 2x40 right angle female pin header)
to the PCB.
