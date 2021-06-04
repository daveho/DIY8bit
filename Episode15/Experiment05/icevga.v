// ice40 vga device

// Fifth test: generate 800x600 VGA signal (hsync, vsync, and
// just a solid color for pixels)

module icevga (input wire ext_osc,
               output reg hsync);

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

/*
  always @(posedge clk)
    begin
      if (tick == 3'b101)
        tick <= 3'b000;
      else
        tick <= tick + 1;
    end
*/
/*
  // 800x600 SVGA timings
  // Source: http://tinyvga.com/vga-timing/800x600@60Hz
  parameter v_front_porch   = 10'd1;
  parameter v_sync_pulse    = 10'd4;
  parameter v_back_porch    = 10'd23;
  parameter v_visible       = 10'd600;
  parameter v_visible_start = v_sync_pulse + v_front_porch;
  parameter v_total         = v_front_porch + v_sync_pulse +
                              v_back_porch + v_visible;
  parameter h_front_porch   = 11'd40;
  parameter h_sync_pulse    = 11'd128;
  parameter h_back_porch    = 11'd88;
  parameter h_visible       = 11'd800;
  parameter h_visible_start = h_sync_pulse + h_front_porch;
  parameter h_total         = h_front_porch + h_sync_pulse +
                              h_back_porch + h_visible;
*/
  // tick counting from 0 to 5 in order to generate 40 MHz timing
  // from the 240 MHz PLL clock
  reg [2:0] tick;

  // timings for horizontal sync
  parameter H_VISIBLE_END       = 16'd799;
  parameter H_FRONT_PORCH_END   = 16'd839;
  parameter H_SYNC_PULSE_END    = 16'd967;
  parameter H_BACK_PORCH_END    = 16'd1055;

  // This counter is larger than it needs to be, but I encountered very
  // strange behaviors when I made it exactly 11 bits (which could in theory
  // accommodate counts up to 2047.)
  reg [15:0] hcount;

  always @(posedge clk)
    begin
      if (tick == 3'b000)
        begin
          case (hcount)
            //16'd839:
            H_FRONT_PORCH_END:
              begin
                hsync <= 1'b1;
                hcount <= hcount + 1;
              end
            //16'd967:
            H_SYNC_PULSE_END:
              begin
                hsync <= 1'b0;
                hcount <= hcount + 1;
              end
            //16'd1055:
            H_BACK_PORCH_END:
              begin
                hcount <= 16'd0;
              end
            default:
              begin
                hcount <= hcount + 1;
              end
          endcase

/*
          if (hcount == 16'd799)
            begin
              hsync <= ~hsync;
              hcount <= 16'd0;
            end
          else
            begin
              hsync <= hsync;
              hcount <= hcount + 1;
            end
*/

          tick <= tick + 1;
        end
      else if (tick == 3'b101)
        begin
          tick <= 3'b000;
        end
      else
        begin
          tick <= tick + 1;
        end

    end

endmodule
