// Horizontal count module: based on HCntCtrl.pld (the GAL used to control
// the horizontal timing in the HW_VGA project)

module hcount(input nrst,
              input clk,
              output hCountEnd,
              output hBeginPulse,
              output hEndPulse,
              output hVisEnd,
              output hBeginActive,
              output hEndActive);

  `include "timing.vh"

  reg [11:0] count;

  always @(posedge clk) begin
    if ( nrst == 1'b0 ) begin
      // in reset, clear the counter
      count <= 12'd0;
    end else begin
      // not in reset, either advance count by 1 or reset to 0 (if at end of scanline)
      if ( hCountEnd )
        count <= 12'd0;
      else
        count <= count + 12'd1;
    end
  end

  // Timing outputs
  assign hCountEnd = (count == H_COUNT_END);
  assign hBeginPulse = (count == H_BEGIN_PULSE);
  assign hEndPulse = (count == H_END_PULSE);
  assign hVisEnd = (count == H_VIS_END);
  assign hBeginActive = (count == H_BEGIN_ACTIVE);
  assign hEndActive = (count == H_END_ACTIVE);

endmodule
