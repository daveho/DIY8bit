// Shared 8 bit register, such that it should be possible
// to write to it from one always block, and read from it
// from another always block.  This is basically a 1-byte FIFO.

module shared_reg (input clk,

                   // active-low reset
                   input nrst,

                   // 1 if there is data, 0 if not
                   output reg has_data,

                   // reader sets to 1 in order to read data,
                   // when set back to 0, register is empty
                   input rd,             
                   output reg [7:0] rd_data,

                   // writer sets to 1 in order to write data:
                   // when set back to 0, register is full
                   input wr,
                   input [7:0] wr_data);

  localparam EMPTY         = 2'd0;
  localparam WRITE_STARTED = 2'd1;
  localparam FULL          = 2'd2;
  localparam READ_STARTED  = 2'd3;

  reg [1:0] state;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          has_data <= 0;
          state <= EMPTY;
        end
      else
        begin
          case (state)

            EMPTY:
              begin
                if (wr == 1'b1)
                  begin
                    rd_data <= wr_data;
                    state <= WRITE_STARTED;
                  end
              end

            WRITE_STARTED:
              begin
                if (wr == 1'b0)
                  begin
                    has_data <= 1'b1;
                    state <= FULL;
                  end
              end

            FULL:
              begin
                if (rd == 1'b1)
                  begin
                    // the data is already present on rd_data
                    state <= READ_STARTED;

                    // assume that the reader will latch the data as soon as it observes
                    // that the FIFO has data available
                    has_data <= 1'b0;
                  end
              end

            READ_STARTED:
              begin
                if (rd == 1'b0)
                  begin
                    state <= EMPTY;
                  end
              end

          endcase
        end
    end

endmodule
