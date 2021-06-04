/**
 * PLL configuration
 *
 * This Verilog module was generated automatically
 * using the icepll tool from the IceStorm project.
 * Use at your own risk.
 *
 * Given input frequency:        12.000 MHz
 * Requested output frequency:  240.000 MHz
 * Achieved output frequency:   240.000 MHz
 */

module pll(
	input  clock_in,
	output clock_out,
	output locked
	);

  wire pll_out;

SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0000),		// DIVR =  0
		.DIVF(7'b1001111),	// DIVF = 79
		.DIVQ(3'b010),		// DIVQ =  2
		.FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
	) uut (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.REFERENCECLK(clock_in),
		//.PLLOUTCORE(clock_out)
		.PLLOUTCORE(pll_out)
		);

  // Use global clock buffer for PLL output.
  // See: https://mjoldfield.com/atelier/2018/02/ice40-blinky-icestick.html
  SB_GB global_clock_buffer(.USER_SIGNAL_TO_GLOBAL_BUFFER(pll_out),
                            .GLOBAL_BUFFER_OUTPUT(clock_out));

endmodule
