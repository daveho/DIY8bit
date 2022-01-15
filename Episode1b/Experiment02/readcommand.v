// State machine for reading commands from the command FIFO.
// Commands are placed in a shared register.

module readcommand(input clk,
                   input nrst,

                   // Active-low empty flag from FIFO
                   input nef,
                   // FIFO read strobe
                   output reg disp_cmd_rd,
                   // command data from FIFO
                   input [7:0] disp_cmd_in,

                   // whether the shared register has data available
                   // (need to know whether it's empty because if it's not,
                   // we don't want to write to it)
                   input cmdreg_data_avail,
                   // shared register write input
                   output reg cmdreg_wr,
                   // to shared register data input
                   output reg [7:0] cmdreg_data_send);

  localparam RESET_ASSERTED = 1'b0;

  localparam FIFO_EMPTY      = 1'b0;
  localparam FIFO_NOT_EMPTY  = 1'b1;

  reg [15:0] read_tick;

  localparam READ_MIN_TICK        = 16'd0;
  localparam READ_TICK_WAIT_END   = 16'd3; // at 25 ns
  localparam READ_TICK_LATCH_DATA = 16'd5; // at 41.66 ns
  localparam READ_TICK_END_READ   = 16'd6; // at 50 ns

  reg [1:0] read_state;

  // states for data read state machine
  localparam RD_READY           = 2'd0;
  localparam RD_WAIT_FOR_DATA   = 2'd1;
  localparam RD_DATA_READY      = 2'd2;
  localparam RD_DONE_WITH_READ  = 2'd3;

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
                if (read_tick == READ_MIN_TICK && nef == FIFO_NOT_EMPTY && cmdreg_data_avail == 1'b0)
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

endmodule
 
