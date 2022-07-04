Experiment 3: start to implement a command protocol. Each command
will be signified by a command byte, followed by 1 or more data
bytes. (Perhaps at some point there will be commands without
a data bytes.) For now, there is just one command, which stores
data in the pixel output register.
