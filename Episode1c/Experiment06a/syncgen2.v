// Combined horizontal and vertical sync generation for 800x600 SVGA

module syncgen2(input clk,                 // 40 MHz dot clock input
                input nrst,                // active low reset input
                output reg [15:0] hcount,  // output horizontal pixel counter
                output hsync,              // output horizontal sync
                output reg [15:0] vcount,  // output vertical pixel counter
                output reg vsync,          // output vertical sync
                output reg vis             // 1 if current hcount/vcount is in visible region
               );

  `include "timing.vh"

  reg hsync_internal;

  // This hack seems to get horizontal placement correct on
  // my monitor
  delay hsync_delay(.clk(clk), .in(hsync_internal), .out(hsync));

  reg [15:0] vcount_internal;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          // reset asserted
          hsync_internal <= 1'b0;
          vsync <= 1'b0;

          hcount <= 16'd0;
          vcount <= 16'd0;

          vcount_internal <= V_BACK_PORCH_END - 1;

          vis <= 1'b1;
        end

      else
        begin
          if (hcount == H_VISIBLE_END)
            begin
              // visible part of line ends
              hcount <= hcount + 1;
              vis <= 1'b0;
            end

          else if (hcount == H_FRONT_PORCH_END)
            begin
              // begin hsync_internal pulse
              hsync_internal <= 1'b1;
              hcount <= hcount + 1;
            end

          else if (hcount == H_SYNC_PULSE_END)
            begin
              // end hsync_internal pulse
              hsync_internal <= 1'b0;
              hcount <= hcount + 1;
            end

          else if (hcount == H_BACK_PORCH_END)
            begin
              // new horizontal line begins
              hcount <= 16'd0;

              // I'm not sure exactly why this hack is necessary, but
              // it seems to work
              vcount <= vcount_internal - 16'd1;

              // update vcount_internal and vsync
              if (vcount_internal == V_VISIBLE_END)
                begin
                  vcount_internal <= vcount_internal + 1;
                end

              else if (vcount_internal == V_FRONT_PORCH_END)
                begin
                  // begin vsync pulse
                  vsync <= 1'b1;
                  vcount_internal <= vcount_internal + 1;
                end

              else if (vcount_internal == V_SYNC_PULSE_END)
                begin
                  // end vsync pulse
                  vsync <= 1'b0;
                  vcount_internal <= vcount_internal + 1;
                end

              else if (vcount_internal == V_BACK_PORCH_END)
                begin
                  // frame ends
                  vcount_internal <= 16'd0;
                  vis <= 1'b1;
                end

              else
                begin
                  // move on to next line in visible region
                  vcount_internal <= vcount_internal + 1;
                  vis <= 1'b1;
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
