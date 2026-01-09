// Vertical count module, based on VCntCtrl.pld (vertical count control)
// from the HW_VGA project

module vcount( input nrst,
               input clk,
               input vCountIncr,  // if true, vertical count is updated (cleared or incremented)
               input hCountEnd,
               output vCountZero,
               output vBeginPulse,
               output vEndPulse,
               output vVisEnd,
               output vCountEnd,
               output vEndActive,
               output [11:0] vCount );

  `include "timing.vh"

  reg [11:0] count;

  always @(posedge clk) begin
    if ( nrst == 1'b0 ) begin
      // in reset, set the counter to its initial value
      count <= V_COUNT_INITIAL_VAL;
    end else begin
      // not in reset, either clear the counter
      // or advance the count
      if ( vCountIncr & vCountEnd )
        count <= 12'd0;
      else if ( vCountIncr & ~vCountEnd )
        count <= count + 12'd1;
    end
  end

  // Timing outputs
  assign vCountZero = ( count == V_COUNT_ZERO );
  assign vBeginPulse = ( hCountEnd & count == V_BEGIN_PULSE );
  assign vEndPulse = ( hCountEnd & count == V_END_PULSE );
  assign vVisEnd = ( count == V_VIS_END );
  assign vCountEnd = ( count == V_COUNT_END );
  assign vEndActive = ( count == V_END_ACTIVE );

  // Output the full vertical counter value.
  // Other modules will use the low 4 bits to know
  // which pixel row of the current character row is
  // being generated.
  assign vCount = count;

endmodule
