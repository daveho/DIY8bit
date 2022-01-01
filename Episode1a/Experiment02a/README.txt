Experiment 2a is based on Experiment02, but changes the main
clock frequency from 240 MHz to 120 MHz. I think some of the
weird behaviors I have been seeing might be due to timing issues
inside the design.  One piece of evidence for this theory is
that the hack of copying nrst to an output (nrst_out) is no
longer necessary.
