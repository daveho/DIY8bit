// ice40 vga device

// This is based on Experiment02, but changing the main clock
// frequency to 120 MHz. I'm wondering whether using 240 MHz as
// the internal frequency is causing problems within the design.

// Some good news: this works perfectly at 120 MHz.
// Also, the hack were it was necessary to copy nrst to an
// output pin no longer seems to be necessary.

module icevga (input wire nrst_in,
               input wire [7:0] disp_cmd_in, // command data from FIFO
               input wire nef_in,            // active-low empty flag from FIFO
               output reg disp_cmd_rd,       // active-low read strobe output to FIFO
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

  reg nrst, nef;
  reg [7:0] disp_cmd;

  // read inputs from host and FIFO, and save them to registers
  always @(posedge clk)
    begin
      // active-low reset signal from host
      nrst <= nrst_in;

      // active-low empty flag from FIFO
      nef <= nef_in;

      // FIFO command data: even though we aren't actually strobing
      // the FIFO read input (meaning that the FIFO isn't actually outputting
      // any data, it should be safe to read because the level converter
      // is always outputting data (and pull-ups on its inputs should ensure
      // that its inputs are always at a valid logic level)
      disp_cmd <= disp_cmd_in;

      // for now, never try to read from the FIFO
      disp_cmd_rd <= 1'b1;
    end

  // tick counting from 0 to 2 in order to generate 40 MHz timing
  // from the 120 MHz PLL clock
  reg [1:0] tick;

  // maximum tick value
  parameter MAX_TICK = 2'b10;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
         tick <= 2'b00;
        end
      else
        begin
        if (tick == MAX_TICK)
          tick <= 2'b00;
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
          hsync <= 1'b0;
          hcount <= 16'd0;
        end
      else
        begin
          if (tick == 2'b00)
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
          vsync <= 1'b0;
          vcount <= 16'd0;
        end
      else
        begin
          if (tick == 2'b00 && hcount == H_BACK_PORCH_END)
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
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;
        end
      else
        begin
          if (tick == 2'b00)
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
    end

endmodule
