# DIY 8-bit computer, Episode 11

Link to video: Coming eventually

This episode completes support for interrupts in the 6809 system.  In particular, it presents the detailed design for the interrupt controller, testing and validation of a prototype implementation, and support interrupt support in the monitor program.

The [CircuitWithInterrupts](CircuitWithInterrupts) directory has updated schematics.  Note that there are some fixes since the previous episode!

The [Code](Code) directory has code for the updated monitor program ([monitor.asm](Code/monitor.asm)), as well as a test program for interrupt handling ([inttest.asm](Code/inttest.asm)).  Note that the test program contains a hard-coded address of a function in the monitor program.  In the future it would be a good idea to have a way of "linking" test programs against symbols defined in the monitor program.
