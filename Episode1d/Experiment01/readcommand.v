// State machine for reading data bytes from the command FIFO.
// The bytes read are placed in a shared register, for processing
// by the command processing state machines.

// It is assumed that the clock frequency is 40 MHz, so each clock
// cycle is 25ns. We are also assuming a 25ns rated FIFO, so
// when reading data, it should be available within 50ns (2 clock
// cycles.)

module readcommand(input clk,
                   input nrst,

                   // Active-low empty flag from FIFO
                   input nef,
                   // FIFO read strobe (active low)
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

  reg [2:0] state;

  localparam READY            = 3'd0;
  localparam READ_DELAY       = 3'd1;
  localparam READ_LATCH_DATA  = 3'd2;
  localparam WRITE_REG        = 3'd3;
  localparam WRITE_REG_FINISH = 3'd4;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          disp_cmd_rd <= 1'b1;
          state <= READY;
        end
      else
        begin
          case (state)

            READY:
              if (nef == FIFO_NOT_EMPTY & cmdreg_data_avail == 1'b0)
                begin
                  // initiate read from FIFO
                  disp_cmd_rd <= 1'b0;
                  state <= READ_DELAY;
                end

            READ_DELAY:
              begin
                // this state is just a way to give the data a little bit
                // of extra time to be valid
                state <= READ_LATCH_DATA;
              end

            READ_LATCH_DATA:
              begin
                // latch the data from the FIFO
                cmdreg_data_send <= disp_cmd_in;

                // end the read
                disp_cmd_rd <= 1'b1;

                // advance to next state
                state <= WRITE_REG;
              end

            WRITE_REG:
              begin
                // initiate write to shared reg (we've already verified
                // that it is empty)
                cmdreg_wr <= 1'b1;
                state <= WRITE_REG_FINISH;
              end

            WRITE_REG_FINISH:
              begin
                // finish write to the shared reg
                cmdreg_wr <= 1'b0;
                state <= READY;
              end

          endcase // state
        end
    end

endmodule
 
