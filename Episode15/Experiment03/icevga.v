// ice40 vga device

// Third test: generate a square wave using the external
// oscillator, hopefully avoiding all of the jitter we get
// using the internal high frequency oscillator.  The
// 12 MHz output pin should be connected to GPIO 20.

module icevga (input wire ext_osc,
               output wire sq_out);

  // Use global clock buffer to distribute the external
  // clock signal
  wire clk;
  SB_GB clk_buffer(.USER_SIGNAL_TO_GLOBAL_BUFFER(ext_osc),
                   .GLOBAL_BUFFER_OUTPUT(clk));

  reg [15:0] counter;

  always @(posedge clk)
    counter <= counter + 1;

  // This should divide the 12 MHz oscillator frequency by 2,
  // so we should see a 6 MHz square wave.
  assign sq_out = counter[0];

endmodule
