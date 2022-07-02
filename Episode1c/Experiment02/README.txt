Experiment 2: generate 8 pixels at a time from a register.
The idea here is that we're developing the text mode "backwards":
first the foreground/background pixel generation, then we can
start working on putting appropriate pixel data in the register
based on the character and font information stored in memory.
