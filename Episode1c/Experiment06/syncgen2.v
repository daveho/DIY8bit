// Combined horizontal and vertical sync generation for 800x600 SVGA

module syncgen2(input clk,                 // 40 MHz dot clock input
                input nrst,                // active low reset input
                output reg [15:0] hcount,  // output horizontal pixel counter
                output reg hsync,          // output horizontal sync
                output reg [15:0] vcount,  // output vertical pixel counter
                output reg vsync,          // output vertical sync
                output reg vis             // 1 if current hcount/vcount is in visible region
               );

  `include "timing.vh"

  // We want hsync and vsync to "lag" by one clock.
  // That way, the pixel-generation code can look at hcount and
  // vcount as an accurate representation of which pixel will
  // be generated *next*. The hsync_next and vsync_next values
  // are computed based on the current hcount and vcount,
  // and then copied to hsync and vsync on the next clock.
  // Similarly, vis can be taken as indicating whether the
  // next clock is a pixel in the visible region.
  reg hsync_next;
  reg vsync_next;

  always @(posedge clk)
    begin

      if (nrst == 1'b0)
        begin
          // reset asserted

          hsync_next <= 1'b0;
          vsync_next <= 1'b0;

          hsync <= 1'b0;
          vsync <= 1'b0;
          hcount <= 16'd0;
          vcount <= 16'd0;

          vis <= 1'b0; // FIXME
        end

      else
        begin
          if (hcount == H_VISIBLE_END)
            begin
              // visible part of line ends
              hcount <= hcount + 1;
            end

          else if (hcount == H_FRONT_PORCH_END)
            begin
              // begin hsync pulse
              hsync <= 1'b1;
              hcount <= hcount + 1;
            end

          else if (hcount == H_SYNC_PULSE_END)
            begin
              // end hsync pulse
              hsync <= 1'b0;
              hcount <= hcount + 1;
            end

          else if (hcount == H_BACK_PORCH_END)
            begin
              // new horizontal line begins
              hcount <= 16'd0;

              // update vcount and vsync
              if (vcount == V_VISIBLE_END)
                begin
                  vcount <= vcount + 1;
                end

              else if (vcount == V_FRONT_PORCH_END)
                begin
                  // begin vsync pulse
                  vsync <= 1'b1;
                  vcount <= vcount + 1;
                end

              else if (vcount == V_SYNC_PULSE_END)
                begin
                  // end vsync pulse
                  vsync <= 1'b0;
                  vcount <= vcount + 1;
                end

              else if (vcount == V_BACK_PORCH_END)
                begin
                  // frame ends
                  vcount <= 16'd0;
                end

              else
                begin
                  // move on to next line in visible region
                  vcount <= vcount + 1;
                end

            end

          else
            begin
              // just an ordinary pixel in the horizontal visible region
              hcount <= hcount + 1;
            end
        end

    end

endmodule
