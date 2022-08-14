// A simple module to implement a one cycle delay

module delay(input clk,
             input in,
             output reg out);

  always @(posedge clk)
    begin
      out <= in;
    end

endmodule
