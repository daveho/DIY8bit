Experiment 5 has the Arduino using 3 trimpots to read
red/green/blue intensities, which are then sent to
to the display controller via the FIFO. The command
format is:

    xxrrVVVV

xx=these bits are ignored
rr=selects one of three 4-bit registers
VVVV=a 4-bit value to store in the selected register

rr=10 is the red register
rr=01 is the green register
rr=00 is the blue register
