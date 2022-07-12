// character data RAM
// This is just temporary. Eventually we will need the character
// and attribute data to be stored in the SPRAM.

module charram(input clk,

               input rd,
               input [8:0] rd_addr,
               output reg [7:0] rd_data,

               input wr,
               input [8:0] wr_addr,
               input [7:0] wr_data);

  reg [7:0] font_data[511:0];

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
