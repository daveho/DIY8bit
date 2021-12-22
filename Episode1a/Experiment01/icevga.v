// ice40 vga device

// Experiment 1: add a reset input to the test pattern generator
// from Episode15.  IceStorm/yosys do not seem to allow activation
// on edges of multiple signals (i.e., you can't do things like
// "always @(negedge nrst or posedge clk)", so we only activate
// on positive clock edges, meaning that reset is synchronous with
// respect to the clock signal. I can't see any downsides to
// synchronous reset, since the clock should always be running (and
// if it isn't, the display controller won't be doing anything
// useful anyway :-)

module icevga (input wire nrst, // active-low reset signal from host system
               input wire ext_osc,
               output reg vsync,
               output reg hsync,
               output reg [3:0] red,
               output reg [3:0] green,
               output reg [3:0] blue);

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

  // tick counting from 0 to 5 in order to generate 40 MHz timing
  // from the 240 MHz PLL clock
  reg [2:0] tick;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // in reset, keep the tick counter at 0
          tick <= 3'b000;
        end
      else
        begin
           /* update the tick counter */
           if (tick == 3'b101)
             tick <= 3'b000;
           else
             tick <= tick + 1;
        end
    end

  // horizontal timings
  parameter H_VISIBLE_END       = 16'd799;
  parameter H_FRONT_PORCH_END   = 16'd839;
  parameter H_SYNC_PULSE_END    = 16'd967;
  parameter H_BACK_PORCH_END    = 16'd1055;

  // This counter is larger than it needs to be, but I encountered very
  // strange behaviors when I made it exactly 11 bits (which could in theory
  // accommodate counts up to 2047.)
  reg [15:0] hcount;

  // hcount and hsync generation
  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // in reset, hold hcount/hsync at 0
          hcount <= 16'd0;
          hsync <= 1'b0;
        end
      else
        begin
          // generate hcount/hsync
          if (tick == 3'b000)
            begin
              case (hcount)
                H_FRONT_PORCH_END:
                  begin
                    hsync <= 1'b1; // hsync pulse begins
                    hcount <= hcount + 1;
                  end
                H_SYNC_PULSE_END:
                  begin
                    hsync <= 1'b0; // hsync pulse ends
                    hcount <= hcount + 1;
                  end
                H_BACK_PORCH_END:
                  begin
                    hcount <= 16'd0; // next line begins
                  end
                default:
                  begin
                    hcount <= hcount + 1;
                  end
              endcase
            end

        end
    end

  // vertical timings
  parameter V_VISIBLE_END     = 16'd599;
  parameter V_FRONT_PORCH_END = 16'd600;
  parameter V_SYNC_PULSE_END  = 16'd604;
  parameter V_BACK_PORCH_END  = 16'd627;

  // as with hcount, larger than it needs to be
  reg [15:0] vcount;

  // vcount and vsync generation
  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // in reset, hold vcount/vsync at 0
          vcount <= 16'd0;
          vsync <= 1'b0;
        end
      else
        begin
          // generate vcount/vsync
          if (tick == 3'b000 && hcount == H_BACK_PORCH_END)
            begin
              case (vcount)
                V_FRONT_PORCH_END:
                  begin
                    vsync <= 1'b1; // vsync pulse begins
                    vcount <= vcount + 1;
                  end
                V_SYNC_PULSE_END:
                  begin
                    vsync <= 1'b0; // vsync pulse ends
                    vcount <= vcount + 1;
                  end
                V_BACK_PORCH_END:
                  begin
                    vcount <= 16'd0; // next frame begins
                  end
                default:
                  begin
                    vcount <= vcount + 1;
                  end
              endcase
            end
        end
    end

  // pixel color generation
  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // in reset, output 0 (black) on all color outputs
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;
        end
      if (tick == 3'b000)
        begin
          if (hcount < 800 && vcount < 600)
            begin
              // generate a series of horizontal gradients where
              // the base color is generated from bits 8:6 of vcount
              red <= (hcount[8:5] & {4{vcount[8]}});
              green <= (hcount[8:5] & {4{vcount[7]}});
              blue <= (hcount[8:5] & {4{vcount[6]}});
            end
          else
            begin
              // output black when not in visible region
              red <= 4'h0;
              green <= 4'h0;
              blue <= 4'h0;
            end
        end
    end

endmodule
