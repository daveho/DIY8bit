// Font data RAM
// The idea is that yosys should infer this as block RAM

// Reading: assert address on rd_addr and drive rd=1,
// on next clock latch data on rd_data and drive rd=0.

// Writing: assert address on wr_addr, assert data on wr_data,
// and drive wr=1. On next clock drive wr=0.

module fontram(input clk,

               input rd,
               input [11:0] rd_addr,
               output reg [7:0] rd_data,

               input wr,
               input [11:0] wr_addr,
               input [7:0] wr_data);

  reg [7:0] font_data[4095:0];

  always @(posedge clk)
    begin
      if (rd == 1'b1)
        begin
          rd_data <= font_data[rd_addr];
        end

      if (wr == 1'b1)
        begin
          font_data[wr_addr] <= wr_data;
        end
    end

endmodule
