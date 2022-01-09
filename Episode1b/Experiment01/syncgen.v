// Generate horizontal or vertical timing count and sync
// Intended for modes like 800x600 SVGA, where the sync pulses are positive
// The "vis" output is equal to 1 while in the visible region

module syncgen(input clk,
               input nrst,
               input [15:0] tick,
               output reg [15:0] count,
               output reg sync,
               output reg vis,
               input [15:0] vis_end,
               input [15:0] front_porch_end,
               input [15:0] sync_pulse_end,
               input [15:0] back_porch_end);

  localparam RESET_ASSERTED = 1'b0;
  localparam MIN_TICK = 16'd0;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          sync <= 1'b0;
          count <= 16'd0;
          vis <= 1'b1;
        end
      else
        begin
          if (tick == MIN_TICK)
            begin
              case (count)
                vis_end:
                  begin
                    vis <= 1'b0;
                    count <= count + 1;
                  end
                front_porch_end:
                  begin
                    sync <= 1'b1; // sync pulse begins
                    count <= count + 1;
                  end
                sync_pulse_end:
                  begin
                    sync <= 1'b0; // sync pulse ends
                    count <= count + 1;
                  end
                back_porch_end:
                  begin
                    count <= 16'd0; // next line or frame begins
                    vis <= 1'b1;
                  end
                default:
                  begin
                    count <= count + 1;
                  end
              endcase
            end
        end
    end

endmodule
