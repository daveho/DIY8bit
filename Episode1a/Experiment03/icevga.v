// ice40 vga device

// In this experiment, read commands from the FIFO, but don't
// actually do anything with them.

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

  always @(posedge clk)
    begin
      // active-low reset signal from host
      nrst <= nrst_in;

      // FIFO active-low empty flag
      nef <= nef_in;
    end

  ////////////////////////////////////////////////////////////////////////
  // Tick counting from 0 to 3 in order to generate 39.75 MHz timing
  // from the 159 MHz PLL clock. The tick counter is also useful
  // for fine-grained timing and sequencing.
  ////////////////////////////////////////////////////////////////////////

  reg [1:0] tick;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          tick <= 2'b00;
        end
      else
        begin
          // We want the maximum tick value to be 3, and
          // since the tick counter is only 2 bits, it will
          // naturally overflow from 3 back to 0. So, there
          // is no need to use special logic to test whether the
          // maximum value has been reached.
          tick <= tick + 1;
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Read data from FIFO when it is available
  ////////////////////////////////////////////////////////////////////////

  reg disp_cmd_avail;
  reg [7:0] disp_cmd;
  reg [1:0] read_state;

  // states for data read state machine
  parameter RD_READY           = 2'd0;
  parameter RD_WAIT_FOR_DATA   = 2'd1;
  parameter RD_DATA_READY      = 2'd2;
  parameter RD_DONE_WITH_READ  = 2'd3;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // In reset
          disp_cmd_avail <= 1'b0;
          disp_cmd <= 8'd0;
          read_state <= RD_READY;
        end
      else
        begin
          case (read_state)
            RD_READY:
              begin
                if (tick == 2'b00 && nef == 1'b1)
                  begin
                    // data is available, assert FIFO -RD signal
                    // and go to RD_WAIT_FOR_DATA state
                    disp_cmd_rd <= 1'b0;
                    read_state <= RD_WAIT_FOR_DATA;
                  end
              end

            RD_WAIT_FOR_DATA:
              begin
                if (tick == 2'b00)
                  begin
                    // 25ns have elapsed since FIFO -RD signal was asserted;
                    // go to RD_DATA_READY state (in which we will actually grab
                    // the data when the tick counter has advanced a bit more)
                    read_state <= RD_DATA_READY;
                  end
              end

            RD_DATA_READY:
              begin
                if (tick == 2'b10)
                  begin
                    // It's now been 37.5ns, which should be fine for a
                    // FIFO with 25ns access time, so latch the data and go to
                    // the RD_DONE_WITH_READ state
                    disp_cmd <= disp_cmd_in;
                    disp_cmd_avail <= 1'b1;
                    read_state <= RD_DONE_WITH_READ;
                  end
              end

            RD_DONE_WITH_READ:
              begin
                // We can now de-assert the FIFO -RD signal and
                // return to the RD_READY
                disp_cmd_rd <= 1'b1;
                read_state <= RD_READY;
              end
          endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Horizontal timings and sync generation
  ////////////////////////////////////////////////////////////////////////

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

  ////////////////////////////////////////////////////////////////////////
  // Vertical timings and sync generation
  ////////////////////////////////////////////////////////////////////////

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

  ////////////////////////////////////////////////////////////////////////
  // Pixel color generation
  ////////////////////////////////////////////////////////////////////////

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
