// Font data RAM
// The idea is that yosys should infer this as block RAM

// Reading: assert address on rd_addr and drive rd=1,
// on next clock latch data on rd_data and drive rd=0.

// Writing: assert address on wr_addr, assert data on wr_data,
// and drive wr=1. On next clock drive wr=0.

module fontram(input clk,

               input rd,
               input rd_addr[11:0],
               output reg rd_data[7:0],

               input wr,
               input wr_addr[11:0],
               input wr_data[7:0])

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
