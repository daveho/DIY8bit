// ice40 vga device

// Experiment 1: put the font data in SPRAM, to free up block RAM
// for the framebuffer.

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
  // Horizontal and vertical count and sync generation
  ////////////////////////////////////////////////////////////////////////

  `include "timing.vh"

  wire [15:0] hcount;
  wire [15:0] vcount;
  wire vis;

  syncgen2 hv_sync_gen(.clk(clk),
                       .nrst(nrst),
                       .hcount(hcount),
                       .hsync(hsync),
                       .vcount(vcount),
                       .vsync(vsync),
                       .vis(vis));

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
  // Font data load buffer
  ////////////////////////////////////////////////////////////////////////

  // The idea is that the command processor will put font data in
  // a temporary buffer (in block RAM), so that the character
  // generator can transfer it into the SPRAM when it is not
  // generating characters

  // these are used by the command processor to set the count
  // of available font data words
  reg [8:0] fontbuf_count_wrdata1;
  reg fontbuf_count_wr1;

  // these are used by the character generator to clear the count
  // of available font data words once the data has been loaded
  // into SPRAM
  reg [8:0] fontbuf_count_wrdata2;
  reg fontbuf_count_wr2;

  wire [8:0] fontbuf_count_value;

  // shared counter so the command processor and the character
  // generator can communicate about how much data is in the
  // font data load buffer
  shared_counter fontbuf_avail_words(.clk(clk),
                                     .nrst(nrst),

                                     .wrdata1(fontbuf_count_wrdata1),
                                     .wr1(fontbuf_count_wr1),

                                     .wrdata2(fontbuf_count_wrdata2),
                                     .wr2(fontbuf_count_wr2),

                                     .value(fontbuf_count_value));

/*
  // use a shared_flag to indicate whether or not the font load buffer
  // has data waiting to be loaded

  reg fontbuf_data_avail_set;
  reg fontbuf_data_avail_clear;
  wire fontbuf_data_avail_value;

  shared_flag fontbuf_data_avail(.clk(clk),
                                 .nrst(nrst),
                                 .set(fontbuf_data_avail_set),
                                 .clear(fontbuf_data_avail_clear),
                                 .value(fontbuf_data_avail_value));
*/

  // control signals for the font load buffer memory

  reg fontbuf_rd;
  reg [7:0] fontbuf_rd_addr;
  wire [15:0] fontbuf_rd_data;

  reg fontbuf_wr;
  reg [7:0] fontbuf_wr_addr;
  reg [15:0] fontbuf_wr_data;

  fontbuf font_load_buf(.clk(clk),
                        .rd(fontbuf_rd),
                        .rd_addr(fontbuf_rd_addr),
                        .rd_data(fontbuf_rd_data),
                        .wr(fontbuf_wr),
                        .wr_addr(fontbuf_wr_addr),
                        .wr_data(fontbuf_wr_data));

  ////////////////////////////////////////////////////////////////////////
  // Font data
  ////////////////////////////////////////////////////////////////////////

  // FIXME: eventually font data will go in SPRAM

/*
  reg font_data_rd;
  reg [11:0] font_data_rd_addr;
  wire [7:0] font_data_rd_data;

  reg font_data_wr;
  reg [11:0] font_data_wr_addr;
  reg [7:0] font_data_wr_data;

  fontram font_data(.clk(clk),
                    .rd(font_data_rd),
                    .rd_addr(font_data_rd_addr),
                    .rd_data(font_data_rd_data),
                    .wr(font_data_wr),
                    .wr_addr(font_data_wr_addr),
                    .wr_data(font_data_wr_data));
*/

  reg [13:0] font_data_spram_addr;
  reg [15:0] font_data_spram_wr_data;
  reg font_data_spram_wren; // 1=write, 0=read
  reg font_data_spram_cs;
  wire [15:0] font_data_spram_rd_data;

  wire [3:0] font_data_spram_wr_mask;
  assign font_data_spram_wr_mask = 4'b1111;

  SB_SPRAM256KA font_data_spram(.ADDRESS(font_data_spram_addr),
                                .DATAIN(font_data_spram_wr_data),
                                .MASKWREN(font_data_spram_wr_mask),
                                .WREN(font_data_spram_wren),
                                .CHIPSELECT(font_data_spram_cs),
                                .CLOCK(clk),
                                .STANDBY(1'b0),
                                .SLEEP(1'b0),
                                .POWEROFF(1'b1),
                                .DATAOUT(font_data_spram_rd_data));

  ////////////////////////////////////////////////////////////////////////
  // Character data
  ////////////////////////////////////////////////////////////////////////

  // for now, just store 512 characters of character data;
  // this would be sufficient for 5 lines of text (in 100x37 text mode)

  reg ch_data_rd;
  reg [8:0] ch_data_rd_addr;
  wire [7:0] ch_data_rd_data;

  reg ch_data_wr;
  reg [8:0] ch_data_wr_addr;
  reg [7:0] ch_data_wr_data;

  charram ch_data(.clk(clk),
                  .rd(ch_data_rd),
                  .rd_addr(ch_data_rd_addr),
                  .rd_data(ch_data_rd_data),
                  .wr(ch_data_wr),
                  .wr_addr(ch_data_wr_addr),
                  .wr_data(ch_data_wr_data));

  ////////////////////////////////////////////////////////////////////////
  // Process commands read from FIFO
  ////////////////////////////////////////////////////////////////////////

  // command bytes (stored in active_cmd)
  parameter CMD_NONE        = 8'b00000000;
  parameter CMD_LOAD_FONT   = 8'b10000000; // the next 4906 bytes are font data
  parameter CMD_LOAD_CHDATA = 8'b10000010; // the next 512 bytes are character data

  // states receiving and processing bytes (stored in cmdproc_state)
  parameter CMDPROC_READY             = 3'd0; // ready to receive another data byte from command FIFO
  parameter CMDPROC_PROCESS           = 3'd1; // process data byte for current command
  parameter CMDPROC_FONT_STORE_BEGIN  = 3'd2; // begin storing word in font load buffer
  parameter CMDPROC_FONT_STORE_END    = 3'd3; // end storing word in font load buffer
  parameter CMDPROC_FONT_STORE_FINISH = 3'd4; // finish storing data in font buffer
  parameter CMDPROC_CHDATA_END        = 3'd5; // end processing of received character data

  reg [7:0] cmd_input_val; // most recent byte of input data from FIFO
  reg [7:0] active_cmd;    // what the active command is

  reg [2:0] cmdproc_state;

  reg [11:0] data_addr;

  // font bytes are received in pairs
  reg [7:0] font_word_byte1;
  reg [7:0] font_word_byte2;

  reg [2:0] font_load_nchunks;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          cmdproc_state <= CMDPROC_READY;
          cmd_input_val <= 8'd0;
          active_cmd <= CMD_NONE;
          data_addr <= 12'd0;

/*
          font_data_wr_addr <= 12'd0;
          font_data_wr <= 1'b0;
          font_data_wr_data <= 8'd0;
*/

          ch_data_wr_addr <= 9'd0;
          ch_data_wr <= 1'b0;
          ch_data_wr_data <= 8'd0;

          font_load_nchunks <= 3'd0;

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

                 // process the byte, based on which command is currently active (if any)
                 case (active_cmd)
                   CMD_NONE:
                     begin
                       // if the input value was a valid command, make
                       // it the active command, otherwise ignore it
                       if (cmd_input_val == CMD_LOAD_FONT ||
                           cmd_input_val == CMD_LOAD_CHDATA)
                         begin
                           // Valid command, so enter sub-state machine for that command
                           active_cmd <= cmd_input_val;
                           //debug_led[0] <= 1'b0;
                           //debug_led[1] <= 1'b0;
                           //debug_led[2] <= 1'b1;
                           data_addr <= 12'd0;
                         end
                       else
                         begin
                           // Invalid command, ignore
                           active_cmd <= CMD_NONE;
                           debug_led[0] <= 1'b1;
                           //debug_led[1] <= 1'b0;
                         end

                       // ready to get another byte from FIFO
                       cmdproc_state <= CMDPROC_READY;
                     end

                   CMD_LOAD_FONT:
                     begin
                       debug_led[1] <= 1'b1;

                       if (font_load_nchunks == 3'b111)
                         // this is the 8th chunk of 512 bytes, meaning a complete
                         // font will in theory have been received when all of the
                         // data in this chunk arrives and is loaded into SPRAM
                         // by the character generator
                         debug_led[2] <= 1'b1;

                       if (data_addr[0] == 1'b0)
                         font_word_byte1 <= cmd_input_val;
                       else
                         begin
                           font_word_byte2 <= cmd_input_val;
                           // now that the second byte of the font word
                           // has been received, we can put the word in the
                           // font load buffer
                           cmdproc_state <= CMDPROC_FONT_STORE_BEGIN;
                         end

                       data_addr <= data_addr + 1;
/*
                       // put the byte in the next location in the font data memory
                       font_data_wr_addr <= data_addr;
                       font_data_wr_data <= cmd_input_val;
                       font_data_wr <= 1'b1;

                       // advance to next address in the font data memory
                       data_addr <= data_addr + 1;

                       // write will finish on next clock cycle
                       cmdproc_state <= CMDPROC_END_FONT_WR;

                       // check whether all font data has been loaded,
                       // if so, we can continue processing other commands
                       if (data_addr == 12'd4095)
                         active_cmd <= CMD_NONE;
*/
                     end

                   CMD_LOAD_CHDATA:
                     begin
                       // put the byte in the next location in the character memory
                       ch_data_wr_addr <= data_addr[8:0];
                       ch_data_wr_data <= cmd_input_val;
                       ch_data_wr <= 1'b1;

                       // advance to next address in the character data memory
                       data_addr <= data_addr + 1;

                       // write will finish on next clock cycle
                       cmdproc_state <= CMDPROC_CHDATA_END;

                       // check whether all character data has been loaded
                       if (data_addr[8:0] == 9'd511)
                         active_cmd <= CMD_NONE;
                     end

                 endcase

               end

             CMDPROC_FONT_STORE_BEGIN:
               begin
                 // Only write to the font load buffer if we're sure that the
                 // character generator is not reading from it! The character
                 // generator will only check the font buffer if it's *not* in
                 // the vertical visible region, so if we *are* in the vertical visible
                 // region but not on the last line, we should be completely safe.
                 if (vcount < V_VISIBLE_END - 1)
                   begin
                     // begin writing the word of font data into the font load buffer
                     fontbuf_wr <= 1'b1;
                     fontbuf_wr_addr <= data_addr[7:1];
                     fontbuf_wr_data <= {font_word_byte1, font_word_byte2};
                     cmdproc_state <= CMDPROC_FONT_STORE_END;
                   end
               end

             CMDPROC_FONT_STORE_END:
               begin
                 // finish writing font data word to font load buffer
                 fontbuf_wr <= 1'b0;

                 // ready to receive another byte from FIFO
                 cmdproc_state <= CMDPROC_READY;

                 // if we've received 512 bytes of font data, then we're
                 // done with the CMD_LOAD_FONT command; note that we need
                 // to let the character generator know that there is data
                 // in the font load buffer
                 if (data_addr == 12'd512)
                   begin
                     // let the character generator know that there is font
                     // data available
                     fontbuf_count_wr1 <= 1'b1;
                     fontbuf_count_wrdata1 <= 9'd256;

                     debug_led[1] <= 1'b1;

                     // we stil need one additional clock cycle to finish the
                     // write to the shared counter
                     cmdproc_state <= CMDPROC_FONT_STORE_FINISH;
                   end
               end

             CMDPROC_FONT_STORE_FINISH:
               begin
                 // finish write to share counter
                 fontbuf_count_wr1 <= 1'b0;

                 // done with the CMD_LOAD_FONT command; can now process the
                 // next command
                 active_cmd <= CMD_NONE;
                 cmdproc_state <= CMDPROC_READY;

                 font_load_nchunks <= font_load_nchunks + 1;
               end


             CMDPROC_CHDATA_END:
               begin
                 // finsh writing byte of character data
                 ch_data_wr <= 1'b0;

                 // ready to get another byte from FIFO
                 cmdproc_state <= CMDPROC_READY;
               end

          endcase
        end
    end

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

  // character pixel data to generate next
  reg [7:0] ch_pixel_data;

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

                    if (hcount == H_VISIBLE_END+1)
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
                            pixgen <= ch_pixel_data;
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
                            pixgen <=  ch_pixel_data;
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
                        pixgen <= ch_pixel_data;
                        pixcount <= 3'd0;
                      end
                  end

              endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Character generator
  ////////////////////////////////////////////////////////////////////////

  reg [7:0] ch_col;
  reg [7:0] ch_row;

  reg font_load_active;      // 1 if the character generator is loading font data to SPRAM
  reg [10:0] font_load_addr; // where to store next font data word in SPRAM
  reg [8:0] font_load_count; // how many words to load
  reg [1:0] font_load_state; // state machine for loading font data to SPRAM

  parameter FONT_LOAD_READ_WORD  = 2'b00;
  parameter FONT_LOAD_WRITE_WORD = 2'b01;
  parameter FONT_LOAD_NEXT_WORD  = 2'b10;
  parameter FONT_LOAD_FINISH     = 2'b11;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          ch_row <= 8'd0;
          ch_col <= 8'd1;

          ch_pixel_data <= 8'd0;
/*
          font_data_rd <= 1'b0;
          font_data_rd_addr <= 11'b0;
*/

          font_data_spram_wren <= 1'b0;
          font_data_spram_cs <= 1'b0;
          font_data_spram_addr <= 14'd0;
          font_data_spram_wr_data <= 16'd0;

          ch_data_rd <= 1'b0;
          ch_data_rd_addr <= 9'd0;

          font_load_active <= 1'b0;
          font_load_addr <= 11'd0;
          font_load_count <= 9'd0;
          font_load_state <= FONT_LOAD_READ_WORD;
        end
      else
        begin
          if (vcount > V_VISIBLE_END & vcount != V_BACK_PORCH_END)
            begin
              // We're not in the vertical visible region, so we can
              // transfer data from the font load buffer to the
              // SPRAM if necessary

              if (!font_load_active)
                begin
                  if (fontbuf_count_value != 9'd0)
                    begin
                      // Font data is available in the font load buffer!
                      // Prepare to load it.
                      font_load_active <= 1'b1;
                      font_load_count <= fontbuf_count_value;
                      font_load_state <= FONT_LOAD_READ_WORD;
                      fontbuf_rd_addr <= 8'd0;
                    end
                end

              else
                begin
                  // Loading font data
                  case (font_load_state)

                    FONT_LOAD_READ_WORD:
                      begin
                        // read a word from the font load buffer
                        fontbuf_rd <= 1'b1;
                        font_load_state <= FONT_LOAD_WRITE_WORD;
                      end

                    FONT_LOAD_WRITE_WORD:
                      begin
                        // finish read from font load buffer,
                        // begin write to the SPRAM
                        fontbuf_rd <= 1'b0;
                        fontbuf_rd_addr <= fontbuf_rd_addr + 1;
                        font_data_spram_addr <= {3'b000, font_load_addr};
                        font_data_spram_wr_data <= fontbuf_rd_data;
                        font_data_spram_wren <= 1'b1;
                        font_data_spram_cs <= 1'b1;
                        font_load_count <= font_load_count - 1;
                        font_load_state <= FONT_LOAD_NEXT_WORD;
                      end

                    FONT_LOAD_NEXT_WORD:
                      begin
                        // finish write to SPRAM, advance to next word
                        // and check whether we're done
                        font_data_spram_wren <= 1'b0;
                        font_data_spram_cs <= 1'b0;
                        font_load_addr <= font_load_addr + 1;

                        if (font_load_count == 9'd0)
                          begin
                            // All of the data has been loaded from the font load buffer
                            // into the SPRAM. Reset the font buffer available count to 0
                            // and head to the FONT_LOAD_FINISH state
                            fontbuf_count_wrdata2 <= 9'd0;
                            fontbuf_count_wr2 <= 1'b1;
                            font_load_state <= FONT_LOAD_FINISH;
                          end

                        else
                          begin
                            // There is more data to transfer from the font load buffer
                            // to the SPRAM. We should actually be able to start the
                            // read now (since fontbuf_rd_addr should be set to the correct
                            // value) and jump to the FONT_LOAD_WRITE_WORD state.
                            fontbuf_rd <= 1'b1;
                            font_load_state <= FONT_LOAD_WRITE_WORD;
                          end
                      end

                    FONT_LOAD_FINISH:
                      begin
                        // end write to the shared font buffer counter
                        fontbuf_count_wr2 <= 1'b0;

                        // it should now be safe to set font_load_active to 0
                        // (since in theory we've set the load buffer count to 0)
                        font_load_active <= 1'b0;
                      end

                  endcase // font_load_state
                end
            end

          else
            // in visible region (or on last line of vertical back porch), so
            // generate character pixel data

            begin
              if (hcount == H_BACK_PORCH_END - 8)
                begin
                  // get ready to generate pixels for another row of characters
                  ch_col <= 8'd0;
                  if (vcount == V_BACK_PORCH_END)
                    ch_row <= 8'd0;
                  else
                    ch_row <= vcount[11:4];
                end
              else if (hcount[2:0] == 3'b001)
                begin
                  // initiate read of character data
                  ch_data_rd_addr <= { ch_row[1:0], ch_col[6:0] };
                  ch_data_rd <= 1'b1;
                end

              else if (hcount[2:0] == 3'b011)
                begin
                  // complete read of character data
                  ch_data_rd <= 1'b0;

                  // initiate read of font pixel data
/*
                  font_data_rd_addr <= { ch_data_rd_data, vcount[3:0] };
                  font_data_rd <= 1'b1;
*/
                  // note that we're addressing a 16 bit word of font
                  // data here, so we don't use the low bit of vcount
                  // in the address
                  font_data_spram_addr <= { 3'b000, ch_data_rd_data, vcount[3:1] };
                  font_data_spram_wren <= 1'b0;
                  font_data_spram_cs <= 1'b1;
                end

              else if (hcount[2:0] == 3'b101)
                begin
                  // complete read of font pixel data
/*
                  font_data_rd <= 1'b0;
*/
                  font_data_spram_cs <= 1'b0;

                  // communicate the pixel data to the pixel generator
                  if (vcount[0] == 1'b0)
                    ch_pixel_data <= font_data_spram_rd_data[7:0];
                  else
                    ch_pixel_data <= font_data_spram_rd_data[15:8];

                  // advance ch_col
                  ch_col <= ch_col + 1;
                end
            end
        end
    end

endmodule
