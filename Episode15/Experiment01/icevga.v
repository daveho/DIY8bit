// ice40 vga device

// Initial test: generate a square wave from the internal
// high-frequency oscillator (SB_HFOSC module).  The frequency appears
// to be 48 MHz.  Dividing by 8 yields a 6 MHz square
// wave.

module icevga (output wire sq_out);

   wire clk;
   SB_HFOSC inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

  reg [15:0] counter;

  always @(posedge clk)
    counter <= counter + 1;

  assign sq_out = counter[2];

endmodule
