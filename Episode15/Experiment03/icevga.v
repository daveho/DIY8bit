// ice40 vga device

// Third test: try to generate a test pattern in 800x600 SVGA mode.
// R/G/B colors are generated using a resistor DAC, with each
// color component specified by a 4 bit value.

module icevga (output reg vsync,
               output reg hsync,
               output reg red[3:0],
               output reg green[3:0],
               output reg blue[3:0]);

  // high-frequency oscillator (48 MHz)
  wire clk;
  SB_HFOSC inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

  // PLL to increase the clock from 48 MHz to 240 MHz
  wire pllclk;
  wire pll_is_locked;
  pll the_pll(.clock_in(clk), .clock_out(pllclk),
              .locked(pll_is_locked));

  // repeatedly count from 0 to 5 in order to divide the 240 MHz
  // PLL clock by 6 to generate the 40 MHz timing we need for 800x600
  // SVGA
  reg tick[2:0];

  always @(posedge pllclk)
    begin
      if (tick >= 3'b101)
        tick <= 0;
      else
        tick <= tick + 1;
    end

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

  // vertical (line) count ranges from 0 to v_total-1
  reg vcount[9:0];

  // horizontal (column) count ranges from 0 to h_total-1
  reg hcount[10:0];

  // true when end of frame has been reached
  wire at_end_of_frame = (vcount >= (v_total - 1));

  // true when end of line has been reached
  wire at_end_of_line = (hcount >= (h_total - 1));

  // true when a visible line is being displayed
  wire v_is_visible = (vcount >= v_visible_start &&
                       vcount < (v_visible_start + v_visible));

  // true when a visible column is being displayed
  wire h_is_visible = (hcount >= h_visible_start &&
                       hcount < (h_visible_start + h_visible));

  // count lines, generate vsync
  always @(posedge pllclk)
    begin
      if (tick == 3'b000 && at_end_of_line)
        begin
          if (at_end_of_frame)
            begin
              // end of frame
              vcount <= 10'd0;
              vsync <= 1'b0;
            end
          else if (vcount < v_sync_pulse)
            begin
              // generate vsync pulse at beginning of frame
              vcount <= vcount + 1;
              vsync <= 1'b1; // vsync is positive
            end
         else
           begin
              vcount <= vcount + 1;
              vsync <= 1'b0;
           end
      end
    end

  // count columns, generate hsync
  always @(posedge pllclk)
    begin
      if (tick == 3'b000)
        begin
          if (at_end_of_line)
            begin
              // end of line
              hcount <= 11'd0;
              hsync <= 1'b0;
            end
          else if (hcount < h_sync_pulse)
            begin
              // generate hsync pulse at beginning of line
              hcount <= hcount + 1;
              hsync <= 1'b1; // hsync is positive
            end
          else
            begin
              hcount <= hcount + 1;
              hsync <= 1'b0;
            end
        end
    end

  // generate test pattern (for now, just a solid color)
  always @(posedge pllclk)
    begin
      if (tick == 3'b000 && h_is_visible && v_is_visible)
        begin
          red <= 4'h7;
          green <= 4'h1;
          blue <= 4'hE;
        end
      else
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;
        end
    end

endmodule
