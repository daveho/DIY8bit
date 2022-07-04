// ice40 vga device

// Experiment 4: allow loading of font data into block RAM.

module icevga (input wire nrst_in,
               input wire [7:0] disp_cmd_in, // command data from FIFO
               input wire nef_in,            // active-low empty flag from FIFO
               output disp_cmd_rd,           // active-low read strobe output to FIFO
               input wire ext_osc,
               output wire vsync,
               output wire hsync,
               output reg [3:0] red,
               output reg [3:0] green,
               output reg [3:0] blue,
               output reg [2:0] debug_led);

  wire pll_out;
  wire pll_locked;

  ////////////////////////////////////////////////////////////////////////
  // Instantiate PLL and distribute the clock signal
  ////////////////////////////////////////////////////////////////////////

  pll the_pll(.clock_in(ext_osc),
              .clock_out(pll_out),
              .locked(pll_locked));

  // Use global clock buffer to distribute the PLL output
  wire clk;
  SB_GB clk_buffer(.USER_SIGNAL_TO_GLOBAL_BUFFER(pll_out),
                   .GLOBAL_BUFFER_OUTPUT(clk));

  ////////////////////////////////////////////////////////////////////////
  // Read and latch the active-low reset signal and FIFO empty flag
  ////////////////////////////////////////////////////////////////////////

  reg nrst;
  reg nef;

  parameter RESET_ASSERTED  = 1'b0;

  always @(posedge clk)
    begin
      // active-low reset signal from host
      nrst <= nrst_in;

      // FIFO active-low empty flag
      nef <= nef_in;
    end

  ////////////////////////////////////////////////////////////////////////
  // Pixel register
  ////////////////////////////////////////////////////////////////////////

  // The bits in this register are the next 8 pixels to be generated
  // (0=background, 1=foreground)
  reg [7:0] pixreg;

  ////////////////////////////////////////////////////////////////////////
  // Shared register for command data
  ////////////////////////////////////////////////////////////////////////

  wire cmdreg_data_avail;

  // for reading data
  wire [7:0] cmdreg_data_recv;
  reg cmdreg_rd;

  // for writing data
  wire [7:0] cmdreg_data_send;
  wire cmdreg_wr;

  shared_reg cmdreg(.clk(clk),
                    .nrst(nrst),
                    .has_data(cmdreg_data_avail),
                    .rd(cmdreg_rd),
                    .rd_data(cmdreg_data_recv),
                    .wr(cmdreg_wr),
                    .wr_data(cmdreg_data_send));

  ////////////////////////////////////////////////////////////////////////
  // Read data from FIFO when it is available
  ////////////////////////////////////////////////////////////////////////

  readcommand rdcmd(.clk(clk),
                    .nrst(nrst),
                    .nef(nef),
                    .disp_cmd_rd(disp_cmd_rd),
                    .disp_cmd_in(disp_cmd_in),
                    .cmdreg_data_avail(cmdreg_data_avail),
                    .cmdreg_wr(cmdreg_wr),
                    .cmdreg_data_send(cmdreg_data_send));

  ////////////////////////////////////////////////////////////////////////
  // Font data
  ////////////////////////////////////////////////////////////////////////

  reg [7:0] font_data[4095:0]; // hopefully this gets inferred as block RAM!

  ////////////////////////////////////////////////////////////////////////
  // Process commands read from FIFO
  ////////////////////////////////////////////////////////////////////////

  parameter CMD_NONE        = 8'b00000000;
  parameter CMD_LOAD_FONT   = 8'b10000000; // the next 4906 bytes are font data
  parameter CMD_PIXDATA     = 8'b10000001; // just store byte value in pixreg

  parameter CMDPROC_READY   = 1'b0;
  parameter CMDPROC_PROCESS = 1'b1;

  reg [7:0] cmd_input_val; // most recent byte of input data from FIFO
  reg [7:0] active_cmd;    // what the active command is

  reg cmdproc_state;

  reg [11:0] font_data_addr;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          cmdproc_state <= CMDPROC_READY;
          cmd_input_val <= 8'd0;
          active_cmd <= CMD_NONE;
          font_data_addr <= 12'd0;
          pixreg <= 8'd0;

          debug_led[0] <= 1'b0;
          debug_led[1] <= 1'b0;
          debug_led[2] <= 1'b0;
        end
      else
        begin
          case (cmdproc_state)

            CMDPROC_READY:
              if (cmdreg_data_avail == 1'b1)
                begin
                  // signal to the shared reg that we're
                  // reading the data (the data should already be available
                  // in the receive register)
                  cmdreg_rd <= 1'b1;
                  cmdproc_state <= CMDPROC_PROCESS;
                  cmd_input_val <= cmdreg_data_recv;
                end

             CMDPROC_PROCESS:
               begin
                 cmdreg_rd <= 1'b0; // finish read
                 cmdproc_state <= CMDPROC_READY; // ready to get another byte from FIFO

                 // process the byte, based on which command is currently active (if any)
                 case (active_cmd)
                   CMD_NONE:
                     begin
                       // if the input value was a valid command, make
                       // it the active command, otherwise ignore it
                       if (cmd_input_val == CMD_PIXDATA || cmd_input_val == CMD_LOAD_FONT)
                         begin
                           active_cmd <= cmd_input_val;
                           debug_led[0] <= 1'b0;
                           debug_led[1] <= 1'b0;
                           //debug_led[2] <= 1'b1;
                           font_data_addr <= 12'd0;
                         end
                       else
                         begin
                           active_cmd <= CMD_NONE;
                           debug_led[0] <= 1'b1;
                           debug_led[1] <= 1'b0;
                           //debug_led[2] <= 1'b0;
                           if (cmd_input_val == 8'h05) // this is the *data* value written by the Arduino
                             debug_led[2] <= 1'b1;
                         end
                     end

                   CMD_PIXDATA:
                     begin
                       // store the input value in pixreg
                       pixreg <= cmd_input_val;
                       active_cmd <= CMD_NONE;
                       debug_led[0] <= 1'b0;
                       debug_led[1] <= 1'b1;
                       //debug_led[2] <= 1'b0;
                     end

                   CMD_LOAD_FONT:
                     begin
                       // put the byte in the next location in the font data memory
                       font_data[font_data_addr] <= cmd_input_val;

                       // advance to next address in the font data memory
                       font_data_addr <= font_data_addr + 1;

                       // check whether all font data has been loaded
                       if (font_data_addr == 12'd4095)
                         active_cmd <= CMD_NONE;
                     end

                   // TODO: other commands
/*
                   default:
                     begin
                       debug_led[2] <= 1'b1;
                     end
*/

                 endcase

               end

          endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Horizontal timings and sync generation
  ////////////////////////////////////////////////////////////////////////

  parameter H_VISIBLE_END       = 16'd799;
  parameter H_FRONT_PORCH_END   = 16'd839;
  parameter H_SYNC_PULSE_END    = 16'd967;
  parameter H_BACK_PORCH_END    = 16'd1055;

  wire [15:0] hcount;
  wire hvis;

  syncgen hsync_gen(clk,
                    nrst,
                    1'b1,
                    hcount,
                    hsync,
                    hvis,
                    H_VISIBLE_END,
                    H_FRONT_PORCH_END,
                    H_SYNC_PULSE_END,
                    H_BACK_PORCH_END);

  ////////////////////////////////////////////////////////////////////////
  // Vertical timings and sync generation
  ////////////////////////////////////////////////////////////////////////

  parameter V_VISIBLE_END     = 16'd599;
  parameter V_FRONT_PORCH_END = 16'd600;
  parameter V_SYNC_PULSE_END  = 16'd604;
  parameter V_BACK_PORCH_END  = 16'd627;

  wire [15:0] vcount;
  wire vvis;

  syncgen vsync_gen(clk,
                    nrst,
                    (hcount == 16'd0),
                    vcount,
                    vsync,
                    vvis,
                    V_VISIBLE_END,
                    V_FRONT_PORCH_END,
                    V_SYNC_PULSE_END,
                    V_BACK_PORCH_END);

  ////////////////////////////////////////////////////////////////////////
  // Pixel color generation
  ////////////////////////////////////////////////////////////////////////

  // yellow foreground
  localparam FG_RED   = 4'b1111;
  localparam FG_GREEN = 4'b1111;
  localparam FG_BLUE  = 4'b0000;

  // dark purple background
  localparam BG_RED   = 4'b0010;
  localparam BG_GREEN = 4'b0000;
  localparam BG_BLUE  = 4'b1000;

  reg [2:0] pixcount;
  reg [7:0] pixgen;

  reg [1:0] pixgen_state;

  localparam PIXGEN_VIS       = 2'b00; // in visible region
  localparam PIXGEN_LINE_END  = 2'b01; // past end of visible part of line
  localparam PIXGEN_FRAME_END = 2'b10; // past end of visible part of frame

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;

          pixgen <= 8'd0;
          pixcount <= 3'd0;

          pixgen_state <= PIXGEN_VIS;
        end
      else
        begin
              case (pixgen_state)

                PIXGEN_VIS:
                  begin

                    if (hcount == H_VISIBLE_END)
                      begin
                        // reached end of visible part of line
                        pixgen_state <= PIXGEN_LINE_END;
                        red <= 4'h0;
                        green <= 4'h0;
                        blue <= 4'h0;
                        pixcount <= 3'd0;
                      end
                    else
                      begin
                        // In visible part of line

                        // For now, just generate fixed foreground/background colors
                        if (pixgen[7])
                          begin
                            // display foreground color
                            red <= FG_RED;
                            green <= FG_GREEN;
                            blue <= FG_BLUE;
                          end
                        else
                          begin
                            // display background color
                            red <= BG_RED;
                            green <= BG_GREEN;
                            blue <= BG_BLUE;
                          end

                        // update pixel count, fetch next 8 pixels if necessary
                        if (pixcount == 3'b111)
                          begin
                            // we've reached the end of a block of 8 pixels, so
                            // fetch the next 8 pixels
                            pixgen <= pixreg;
                            pixcount <= 3'd0;
                          end
                        else
                          begin
                            // continue in current block of 8 pixels
                            pixgen <= pixgen << 1;
                            pixcount <= pixcount + 1;
                          end
                      end
                  end

                PIXGEN_LINE_END:
                  begin
                    if (hcount == H_BACK_PORCH_END)
                      begin
                        if (vcount == V_VISIBLE_END)
                          begin
                            // Next line is not a visible line
                            pixgen_state <= PIXGEN_FRAME_END;
                          end
                        else
                          begin
                            // Next line is a visible line
                            pixgen_state <= PIXGEN_VIS;

                            // Read the next block of 8 pixels
                            pixgen <= pixreg;
                            pixcount <= 3'd0;
                          end
                      end
                  end

                PIXGEN_FRAME_END:
                  begin
                    if (hcount == H_BACK_PORCH_END & vcount == V_BACK_PORCH_END)
                      begin
                        // reached end of frame, next tick will be the
                        // beginning of the visible part of the first line
                        pixgen_state <= PIXGEN_VIS;

                        // Read first block of 8 pixels, and prepare to read the
                        // second block of 8 pixels
                        pixgen <= pixreg;
                        pixcount <= 3'd0;
                      end
                  end

              endcase
        end
    end

endmodule
