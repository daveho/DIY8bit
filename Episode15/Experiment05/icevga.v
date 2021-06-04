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

  // tick counting from 0 to 5 in order to generate 40 MHz timing
  // from the 240 MHz PLL clock
  reg [2:0] tick;
/*
  always @(posedge clk)
    begin
      if (tick == 3'b101)
        tick <= 3'b000;
      else
        tick <= tick + 1;
    end
*/

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

  // states for hsync generation
  parameter H_STATE_SYNC        = 2'b00;
  parameter H_STATE_FRONT_PORCH = 2'b01;
  parameter H_STATE_VISIBLE     = 2'b10;
  parameter H_STATE_BACK_PORCH  = 2'b11;

  reg [1:0] hstate;
  reg [10:0] hcount;

  always @(posedge clk)
    begin
/*
      if (tick == 3'b000)
        begin
          case (hstate)
            H_STATE_SYNC:
              begin
                if (hcount == h_sync_pulse-1)
                  begin
                    hstate <= H_STATE_FRONT_PORCH;
                    hsync <= 1'b0; // end of sync pulse
                  end

                hcount <= hcount + 1;
              end

            H_STATE_FRONT_PORCH:
              begin
                if (hcount == (h_sync_pulse+h_front_porch)-1)
                  hstate <= H_STATE_VISIBLE;

                hcount <= hcount + 1;
              end

            H_STATE_VISIBLE:
              begin
                if (hcount == (h_sync_pulse+h_front_porch+h_visible)-1)
                  hstate <= H_STATE_BACK_PORCH;

                hcount <= hcount + 1;
              end

            H_STATE_BACK_PORCH:
              begin
                if (hcount == h_total-1)
                  begin
                    hstate <= H_STATE_SYNC;
                    hcount <= 11'd0;
                    hsync <= 1'b1; // begin next sync pulse
                  end
                else
                  hcount <= hcount + 1;
              end
          endcase
        end
      else if (tick == 3'b101)
        tick <= 3'b000;
      else
        tick <= tick + 1;
*/
      if (tick == 3'b000)
        begin
          tick <= tick + 1;

          if (hcount == 11'd99)
            begin
              hsync <= ~hsync;
              hcount <= 11'd0;
            end
          else
            begin
              hcount <= hcount + 1;
            end

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
