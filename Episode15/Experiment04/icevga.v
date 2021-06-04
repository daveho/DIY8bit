// ice40 vga device

// Fourth test: use a PLL to convert the 12 MHz external clock signal
// into an internal 240 MHz clock signal distributed using the
// global clock buffer, dividing the 240 MHz clock by 128 to produce
// a 1.875 MHz square wave.

module icevga (input wire ext_osc,
               output wire sq_out);

  wire pll_out;
  wire pll_locked;

  // Instantiate PLL
  pll the_pll(.clock_in(ext_osc),
              .clock_out(pll_out),
              .locked(pll_locked));

  // Use global clock buffer to distribute the PLL output
  wire clk;
  SB_GB clk_buffer(.USER_SIGNAL_TO_GLOBAL_BUFFER(pll_out),
                   .GLOBAL_BUFFER_OUTPUT(clk));

  reg [15:0] counter;

  always @(posedge clk)
    counter <= counter + 1;

  // This should divide the 240 MHz PLL output by 128,
  // so we should see a 1.875 MHz square wave.
  assign sq_out = counter[6];

endmodule
