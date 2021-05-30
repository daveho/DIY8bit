// ice40 vga device

// Second test: try to use a PLL to generate a 240 MHz clock
// from the internal 48 MHz high-frequency clock.  Divide this
// by 128 to generate a 1.875 MHz square wave.
// (240 MHz is a useful internal frequency because it is close
// to the FPGA's maximum supported clock frequency, and can be
// divided by 6 to produce the 40 MHz SVGA 800x600 dot clock.)

module icevga (output wire sq_out);

  wire clk;
  SB_HFOSC inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

  wire pllclk;
  wire pll_is_locked;
  pll the_pll(.clock_in(clk), .clock_out(pllclk), .locked(pll_is_locked));

  reg [15:0] counter;

  always @(posedge pllclk)
    counter <= counter + 1;

  assign sq_out = counter[6];

endmodule
