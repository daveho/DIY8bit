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

  parameter RESET_ASSERTED  = 1'b0;

  parameter FIFO_EMPTY      = 1'b0;
  parameter FIFO_NOT_EMPTY  = 1'b1;

  always @(posedge clk)
    begin
      // active-low reset signal from host
      nrst <= nrst_in;

      // FIFO active-low empty flag
      nef <= nef_in;
    end

  ////////////////////////////////////////////////////////////////////////
  // Shared register for command data
  ////////////////////////////////////////////////////////////////////////

  wire cmdreg_data_avail;

  // for reading data
  wire [7:0] cmdreg_data_recv;
  reg cmdreg_rd;

  // for writing data
  reg [7:0] cmdreg_data_send;
  reg cmdreg_wr;

  shared_reg cmdreg(.clk(clk),
                    .nrst(nrst),
                    .has_data(cmdreg_data_avail),
                    .rd(cmdreg_rd),
                    .rd_data(cmdreg_data_recv),
                    .wr(cmdreg_wr),
                    .wr_data(cmdreg_data_send));

  ////////////////////////////////////////////////////////////////////////
  // Read data from FIFO when it is available
  ////////////////////////////////////////////////////////////////////////

  reg [15:0] read_tick;

  parameter READ_MIN_TICK        = 16'd0;
  parameter READ_TICK_WAIT_END   = 16'd4; // at 25 ns
  parameter READ_TICK_LATCH_DATA = 16'd6; // at 37.5 ns
  parameter READ_TICK_END_READ   = 16'd8; // at 50 ns

  reg [1:0] read_state;

  // states for data read state machine
  parameter RD_READY           = 2'd0;
  parameter RD_WAIT_FOR_DATA   = 2'd1;
  parameter RD_DATA_READY      = 2'd2;
  parameter RD_DONE_WITH_READ  = 2'd3;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          // In reset
          read_tick <= READ_MIN_TICK;
          read_state <= RD_READY;
          cmdreg_wr <= 1'b0;
          cmdreg_data_send <= 8'd0;
          disp_cmd_rd <= 1'b1;
        end
      else
        begin
          case (read_state)
            RD_READY:
              begin
                if (tick == MIN_TICK && nef == FIFO_NOT_EMPTY && cmdreg_data_avail == 1'b0)
                  begin
                    // data is available, assert FIFO -RD signal
                    // and go to RD_WAIT_FOR_DATA state
                    disp_cmd_rd <= 1'b0;
                    read_state <= RD_WAIT_FOR_DATA;
                    read_tick <= READ_MIN_TICK; // start tick counter for timing
                  end
              end

            RD_WAIT_FOR_DATA:
              begin
                if (read_tick == READ_TICK_WAIT_END)
                  begin
                    // 25ns have elapsed since FIFO -RD signal was asserted;
                    // go to RD_DATA_READY state (in which we will actually grab
                    // the data when the tick counter has advanced a bit more)
                    read_state <= RD_DATA_READY;
                  end
                read_tick <= read_tick + 1; // advance tick counter
              end

            RD_DATA_READY:
              begin
                if (read_tick == READ_TICK_LATCH_DATA)
                  begin
                    // It's now been 37.5ns, which should be fine for a
                    // FIFO with 25ns access time, so latch the data,
                    // end the read and go to the RD_DONE_WITH_READ state
                    cmdreg_wr <= 1'b1;               // begin write to shared reg
                    cmdreg_data_send <= disp_cmd_in; // put FIFO data in shared reg
                    read_state <= RD_DONE_WITH_READ;
                  end
                read_tick <= read_tick + 1; // advance tick counter
              end

            RD_DONE_WITH_READ:
              begin
                if (read_tick == READ_TICK_END_READ)
                  begin
                    // We can now de-assert the FIFO -RD signal and
                    // return to the RD_READY
                    disp_cmd_rd <= 1'b1;
                    read_state <= RD_READY;
                    read_tick <= READ_MIN_TICK;

                    // let the shared reg know that the write is done
                    // (technically, we could have done this earlier)
                    cmdreg_wr <= 1'b0;
                  end
                else
                  begin
                    read_tick <= read_tick + 1; // advance tick counter
                  end
              end
          endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Process commands read from FIFO
  ////////////////////////////////////////////////////////////////////////

  reg [7:0] disp_cmd;

  parameter CMDPROC_READY   = 1'b0;
  parameter CMDPROC_PROCESS = 1'b1;

  reg cmdproc_state;

  // Blue value for generated pixels
  //reg [3:0] bluegen;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          cmdproc_state <= CMDPROC_READY;
          disp_cmd <= 8'd0;
          //bluegen <= 4'b1010;
        end
      else
        begin
          case (cmdproc_state)

            CMDPROC_READY:
              if (cmdreg_data_avail == 1'b1)
                begin
                  // begin signaling to the shared reg that we're
                  // reading the data (the data should already be available
                  // in the receive register)
                  disp_cmd <= cmdreg_data_recv;
                  cmdreg_rd <= 1'b1;
                  cmdproc_state <= CMDPROC_PROCESS;
                end

             CMDPROC_PROCESS:
               begin
                 // do something with the command data
                 //bluegen <= disp_cmd[3:0];

                 cmdreg_rd <= 1'b0; // finish read
                 cmdproc_state <= CMDPROC_READY;
               end

          endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Tick counting from 0 to 3 in order to generate 39.75 MHz timing
  // from the 159 MHz PLL clock.
  ////////////////////////////////////////////////////////////////////////

  reg [15:0] tick;

  parameter MIN_TICK  = 16'd0;
  parameter MAX_TICK  = 16'd3;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          tick <= MIN_TICK;
        end
      else
        begin
          tick <= (tick == MAX_TICK) ? MIN_TICK : tick + 1;
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
      if (nrst == RESET_ASSERTED)
        begin
          hsync <= 1'b0;
          hcount <= 16'd0;
        end
      else
        begin
          if (tick == MIN_TICK)
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
      if (nrst == RESET_ASSERTED)
        begin
          vsync <= 1'b0;
          vcount <= 16'd0;
        end
      else
        begin
          if (tick == MIN_TICK && hcount == H_BACK_PORCH_END)
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
      if (nrst == RESET_ASSERTED)
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;
        end
      else
        begin
          if (tick == MIN_TICK)
            begin
              if (hcount < 800 && vcount < 600)
                begin
                  // generate a series of horizontal gradients where
                  // the base color is generated from bits 8:6 of vcount
                  red <= (hcount[8:5] & {4{vcount[8]}});
                  green <= (hcount[8:5] & {4{vcount[7]}});
                  //blue <= (hcount[8:5] & {4{vcount[6]}});
                  //blue <= bluegen;
                  blue <= disp_cmd[3:0];
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
