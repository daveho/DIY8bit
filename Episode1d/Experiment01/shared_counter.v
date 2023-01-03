// A 9-bit counter that two processes may write to. Note that
// if both processes try to write simultaneously, 
// the process controlling wrdata1/wr1 will have priority,
// so the processes should have some out-of-band protocol
// for determining which process writes at any given time.

module shared_counter(input clk,
                      input nrst,

                      input [8:0] wrdata1,
                      input wr1,            // if 1, wrdata1 is stored

                      input [8:0] wrdata2,
                      input wr2,            // if 1, wrdata2 is stored

                      output reg [8:0] value);

  reg [7:0] data;

  reg [1:0] state;

  localparam IDLE   = 2'd0;
  localparam WRITE1 = 2'd1;
  localparam WRITE2 = 2'd2;

  always @(posedge clk)
    begin

      if (nrst == 1'b0)
        begin
          value <= 8'b0;
          state <= IDLE;
        end

      else
        begin
          case (state)

            IDLE:
              begin
                if (wr1 == 1'b1)
                  begin
                    data <= wrdata1;
                    state <= WRITE1;
                  end
                else if (wr2 == 1'b1)
                  begin
                    data <= wrdata2;
                    state <= WRITE2;
                  end
              end

            WRITE1:
              begin
                if (wr1 == 1'b0)
                  begin
                    value <= data;
                    state <= IDLE;
                  end
              end

            WRITE2:
              begin
                if (wr2 == 1'b0)
                  begin
                    value <= data;
                    state <= IDLE;
                  end
              end


          endcase // state
        end

    end

endmodule
