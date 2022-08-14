module delay(input clk,
             input in,
             output reg out);
/*
  reg d1;
  reg d2;
*/

  always @(posedge clk)
    begin
/*
      out <= d2;
      d2 <= d1;
      d1 <= in;
*/
      out <= in;
    end

endmodule
