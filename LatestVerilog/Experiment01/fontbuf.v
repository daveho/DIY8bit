// Buffer for staging font data before the character generator
// loads it into the SPRAM. It's just a 256 x 16bit memory
// in block RAM.

module fontbuf(input clk,

               input rd,
               input [7:0] rd_addr,
               output reg [15:0] rd_data, 

               input wr,
               input [7:0] wr_addr,
               input [15:0] wr_data);

  reg [15:0] data[255:0];

  always @(posedge clk)
    begin
      if (rd)
        rd_data <= data[rd_addr];

      if (wr)
        data[wr_addr] <= wr_data;
    end

endmodule
