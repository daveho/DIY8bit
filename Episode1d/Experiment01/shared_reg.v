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

  reg [7:0] data;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // register starts out empty
          has_data <= 1'b0;
          rd_data <= 8'd0;
          data <= 8'd0;
        end
      else
        begin
          if (has_data == 1'b0 & wr)
            begin
              data <= wr_data;
              has_data <= 1'b1;
            end

          if (has_data == 1'b1 & rd)
            begin
              rd_data <= data;
              has_data <= 1'b0;
            end
        end
    end

endmodule
