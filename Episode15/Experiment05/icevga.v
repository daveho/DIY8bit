// ice40 vga device

// Fifth test: generate 800x600 VGA signal (hsync, vsync, and
// just a solid color for pixels)

module icevga (input wire ext_osc,
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
      if (tick == 3'b101)
        tick <= 3'b000;
      else
        tick <= tick + 1;
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

  // pixel color generation
  always @(posedge clk)
    begin
      if (tick == 3'b000)
        begin
          if (hcount < 800 && vcount < 600)
            begin
              // in visible region, output a pixel
              // just a solid color for now
              red <= 4'h6;
              green <= 4'h1;
              blue <= 4'hF;
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
