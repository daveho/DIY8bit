// A shared flag that can be independently set and cleared by
// different processes. Useful for mediating access to a resource
// shared by two processes.

module shared_flag(input clk,
                   input nrst,
                   input set,    // if 1, set flag to 1
                   input clear,  // if 0, set flag to 0
                   output reg value);

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          value <= 1'b0;
        end

      else
        begin
          if (set == 1'b1)
            value <= 1'b1;
          else if (clear == 1'b1)
            value <= 1'b0;
        end
    end

endmodule
