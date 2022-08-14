// ice40 vga device

// Experiment 6: try to fix the bugs in the experiment 5 design that
// caused the characters to not appear in the correct positions.

module icevga (input wire nrst_in,
               input wire [7:0] disp_cmd_in, // command data from FIFO
               input wire nef_in,            // active-low empty flag from FIFO
               output reg disp_cmd_rd,           // active-low read strobe output to FIFO
               input wire ext_osc,
               output wire vsync,
               output wire hsync,
               output reg [3:0] red,
               output reg [3:0] green,
               output reg [3:0] blue,
               output reg [2:0] debug_led);

  wire pll_out;
  wire pll_locked;

  ////////////////////////////////////////////////////////////////////////
  // Instantiate PLL and distribute the clock signal
  ////////////////////////////////////////////////////////////////////////

  pll the_pll(.clock_in(ext_osc),
              .clock_out(pll_out),
              .locked(pll_locked));

  // Use global clock buffer to distribute the PLL output
  wire clk;
  SB_GB clk_buffer(.USER_SIGNAL_TO_GLOBAL_BUFFER(pll_out),
                   .GLOBAL_BUFFER_OUTPUT(clk));

  ////////////////////////////////////////////////////////////////////////
  // Read and latch the active-low reset signal and FIFO empty flag
  ////////////////////////////////////////////////////////////////////////

  reg nrst;
  reg nef;

  parameter RESET_ASSERTED  = 1'b0;

  always @(posedge clk)
    begin
      // active-low reset signal from host
      nrst <= nrst_in;

      // FIFO active-low empty flag
      nef <= nef_in;
    end

  `include "timing.vh"

  ////////////////////////////////////////////////////////////////////////
  // Sync generation
  ////////////////////////////////////////////////////////////////////////

  wire [15:0] hcount;
  wire [15:0] vcount;
  wire vis;

  syncgen2 hv_sync_gen(clk,
                       nrst,
                       hcount,
                       hsync,
                       vcount,
                       vsync,
                       vis);

  ////////////////////////////////////////////////////////////////////////
  // Pixel color generation
  ////////////////////////////////////////////////////////////////////////

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;

          disp_cmd_rd <= 1'b1; // don't read
          debug_led <= 3'd0;
        end
      else
        begin
          // output pixels and whatnot
          if (vis)
            begin
              //if (vcount[3:0] == 4'b0000)
              if (vcount[3:0] == 4'd2)
                begin
                  red <= 4'd0;
                  green <= 4'd15;
                  blue <= 4'd0;
                end
              else if (hcount[3:0 ] == 4'b0000)
                begin
                  red <= 4'd15;
                  green <= 4'd0;
                  blue <= 4'd15;
                end
              else
                begin
                  red <= 4'd0;
                  green <= 4'd0;
                  blue <= 4'd15;
                end
            end
          else
            begin
              red <= 4'h0;
              green <= 4'h0;
              blue <= 4'h0;
            end
        end
    end

endmodule
