// A 9-bit counter that two processes may write to. Note that
// if both processes try to write simultaneously, the data
// written will be the bitwise-OR of the written data,
// so the processes should have some out-of-band protocol
// for determining which process writes at any given time.

module shared_counter(input clk,
                      input nrst,

                      input [8:0] wrdata1,
                      input wr1,            // if 1, wrdata1 is stored

                      input [8:0] wrdata2,
                      input wr2,            // if 1, wrdata2 is stored

                      output reg [8:0] value);

  wire data1, data2;

  // views of the incoming data controlled by the write enables
  assign data1 = {8{wr1}} & wrdata1;
  assign data2 = {8{wr2}} & wrdata2;

  always @(posedge clk)
    begin

      if (nrst == 1'b0)
        begin
          value <= 8'b0;
        end

      else
        begin
          if (wr1 | wr2)
            value <= data1 | data2;
        end

    end

endmodule
