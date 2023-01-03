// Shared 8 bit register, such that it should be possible
// to write to it from one always block, and read from it
// from another always block.  This is basically a 1-byte FIFO.

// Writers should not try to write unless has_data=0,
// and readers should not try to read unless has_data=1.

module shared_reg (input clk,

                   // active-low reset
                   input nrst,

                   // 1 if there is data written by a write, 0 if not
                   output reg has_data,

                   input rd,                 // when register is "empty" and rd=1,
                   output reg [7:0] rd_data, // internal register data copied to rd_data

                   input wr,                 // when register is "full" and wr=1,
                   input [7:0] wr_data);     // wr_data is copied to internal register

  reg [1:0] state;

  parameter EMPTY        = 2'd0;
  parameter FINISH_WRITE = 2'd1;
  parameter FULL         = 2'd2;
  parameter FINISH_READ  = 2'd3;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // register starts out empty
          has_data <= 1'b0;
          rd_data <= 8'd0;
          state <= EMPTY;
        end
      else
        begin
          case (state)

            EMPTY:
              if (wr == 1'b1)
                begin
                  rd_data <= wr_data;
                  state <= FINISH_WRITE;
                end

            FINISH_WRITE:
              if (wr == 1'b0)
                begin
                  has_data <= 1'b1;
                  state <= FULL;
                end

            FULL:
              if (rd == 1'b1)
                begin
                  state <= FINISH_READ;
                end

            FINISH_READ:
              if (rd == 1'b0)
                begin
                  has_data <= 1'b0;
                  state <= EMPTY;
                end

          endcase // state
        end
    end

endmodule
