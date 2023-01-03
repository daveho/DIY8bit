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
               output reg [5:0] debug_led);

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

  // shared register for load font process (lfreg)

  wire lfreg_data_avail;
  wire [7:0] lfreg_data_recv;
  reg lfreg_rd;
  reg [7:0] lfreg_data_send;
  reg lfreg_wr;

  shared_reg lfreg(.clk(clk),
                   .nrst(nrst),
                   .has_data(lfreg_data_avail),
                   .rd(lfreg_rd),
                   .rd_data(lfreg_data_recv),
                   .wr(lfreg_wr),
                   .wr_data(lfreg_data_send));

  // shared register for load chdata process (chdreg)

  wire chdreg_data_avail;
  wire [7:0] chdreg_data_recv;
  reg chdreg_rd;
  reg [7:0] chdreg_data_send;
  reg chdreg_wr;

  shared_reg chdreg(.clk(clk),
                   .nrst(nrst),
                   .has_data(chdreg_data_avail),
                   .rd(chdreg_rd),
                   .rd_data(chdreg_data_recv),
                   .wr(chdreg_wr),
                   .wr_data(chdreg_data_send));

  // command byte values
  parameter CMD_NONE        = 8'd0;
  parameter CMD_LOAD_FONT   = 8'd128;
  parameter CMD_LOAD_CHDATA = 8'd130;

  //----------------------------------------------------------------------
  // process to read bytes of data from the command FIFO,
  // determine which command they belong to, and dispatch them
  // to the appropriate process via its shared register
  //----------------------------------------------------------------------

  // command reader states
  parameter CMDREADER_READY                = 3'd0;
  parameter CMDREADER_RECV_BYTE            = 3'd1;
  parameter CMDREADER_HANDLE_BYTE          = 3'd2;
  parameter CMDREADER_LOAD_FONT_DISPATCH   = 3'd3;
  parameter CMDREADER_LOAD_CHDATA_DISPATCH = 3'd4;

  reg [2:0] cmdreader_state;
  reg [7:0] cmdreader_received_byte;
  reg [7:0] cmdreader_active_cmd;
  reg [15:0] cmdreader_data_count; // how many bytes of data read so far for active command

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          cmdreg_rd <= 1'b0;

          lfreg_data_send <= 8'd0;
          lfreg_wr <= 1'b0;

          chdreg_data_send <= 8'd0;
          chdreg_wr <= 1'b0;

          cmdreader_state <= CMDREADER_READY;
          cmdreader_received_byte <= 8'd0;
          cmdreader_active_cmd <= CMD_NONE;
          cmdreader_data_count <= 16'd0;

          debug_led[2] <= 1'b0;
          debug_led[3] <= 1'b0;
        end

      else
        begin
          case (cmdreader_state)

            CMDREADER_READY:
              begin
                if (cmdreg_data_avail == 1'b1)
                  begin
                    // let shared reg know we are reading the byte
                    cmdreg_rd <= 1'b1;

                    // next state will read the byte
                    cmdreader_state <= CMDREADER_RECV_BYTE;
                  end
              end // CMDREADER_READY

            CMDREADER_RECV_BYTE:
              begin
                // read the byte
                cmdreader_received_byte <= cmdreg_data_recv;

                // let shared reg know byte has been read
                cmdreg_rd <= 1'b0;

                // the CMDREADER_HANDLE_BYTE state will figure out what to do
                // with the byte (which could involve an delay
                // depending on what needs to be done with the byte)
                cmdreader_state <= CMDREADER_HANDLE_BYTE;
              end // CMDREADER_RECV_BYTE

            CMDREADER_HANDLE_BYTE:
              // In this state, we figure out what to do with the most-recently
              // received data byte. If there is no active command, then the
              // received data byte becomes the active command (assuming it is
              // a valid command.) If there is a valid command, then the byte
              // is dispatched to the appropriate shared register, for asynchronous
              // processing by a different state machine. Note that it might not
              // be possible to do the dispatch until a later clock cycle.

              begin
                case (cmdreader_active_cmd)
                  CMD_NONE:
                    begin
                      if (cmdreader_received_byte == CMD_LOAD_FONT | cmdreader_received_byte == CMD_LOAD_CHDATA)
                        begin
                          // valid command
                          cmdreader_active_cmd <= cmdreader_received_byte;

                          debug_led[3] <= 1'b1;
                        end
                      else
                        // invalid command
                        debug_led[2] <= 1'b1;

                      // ready to receive another data byte
                      cmdreader_state <= CMDREADER_READY;
                      cmdreader_data_count <= 16'd0;
                    end

                  CMD_LOAD_FONT:
                    begin
                      // if lfreg is empty, we can transfer the received byte
                      if (lfreg_data_avail == 1'b0)
                        begin
                          // dispatch the received byte to the load font data process
                          lfreg_data_send <= cmdreader_received_byte;
                          lfreg_wr <= 1'b1;
                          cmdreader_data_count <= cmdreader_data_count + 1;
                          cmdreader_state <= CMDREADER_LOAD_FONT_DISPATCH;
                        end
                    end

                  CMD_LOAD_CHDATA:
                    begin
                      // if chdreg is empty, we can transfer the received byte
                      if (chdreg_data_avail == 1'b0)
                        begin
                          // dispatch the received byte to the load character data process
                          chdreg_data_send <= cmdreader_received_byte;
                          chdreg_wr <= 1'b1;
                          cmdreader_data_count <= cmdreader_data_count + 1;
                          cmdreader_state <= CMDREADER_LOAD_CHDATA_DISPATCH;
                        end
                    end
                endcase // cmdreader_active_cmd
              end // CMDREADER_HANDLE_BYTE

            CMDREADER_LOAD_FONT_DISPATCH:
              begin
                // end write to lfreg
                lfreg_wr <= 1'b0;

                if (cmdreader_data_count == 16'd512)
                  // all of the data for this command has been received
                  cmdreader_active_cmd <= CMD_NONE;

                cmdreader_state <= CMDREADER_READY;
              end

            CMDREADER_LOAD_CHDATA_DISPATCH:
              begin
                // end write to chdreg
                chdreg_wr <= 1'b0;

                if (cmdreader_data_count == 16'd512)
                  // all of the data for this command has been received
                  cmdreader_active_cmd <= CMD_NONE;

                cmdreader_state <= CMDREADER_READY;
              end

          endcase // cmdreader_state
        end
    end

  //----------------------------------------------------------------------
  // process to handle data from CMD_LOAD_FONT commands
  //----------------------------------------------------------------------

  // states
  parameter LF_RECV_BYTE1      = 3'd0;
  parameter LF_READ_BYTE1      = 3'd1;
  parameter LF_RECV_BYTE2      = 3'd2;
  parameter LF_READ_BYTE2      = 3'd3;
  parameter LF_END_WRITE       = 3'd4;
  parameter LF_END_TRANSACTION = 3'd5;

  reg [8:0] lf_count; // how many *bytes* of font data have been processed
  reg [2:0] lf_state; // current state
  reg [7:0] lf_firstbyte; // first byte of pair of font bytes

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          lfreg_rd <= 1'b0;
          lf_count <= 9'd0;
          lf_state <= LF_RECV_BYTE1;
          lf_firstbyte <= 8'd0;

          fontbuf_count_wrdata1 <= 8'd0;
          fontbuf_count_wr1 <= 1'b0;

          debug_led[0] <= 1'b0;
          debug_led[1] <= 1'b0;
        end

      else
        begin
          case (lf_state)

            LF_RECV_BYTE1:
              begin
                // Note that we should not try to put data in the font buffer
                // if its count is non-zero, since that would imply that the
                // character generator is using it. But i the font buffer
                // count *is* 0, then it should be safe to proceed.
                if (lfreg_data_avail & fontbuf_count_value == 9'd0)
                  begin
                    // start to read first byte
                    lfreg_rd <= 1'b1;
                    lf_state <= LF_READ_BYTE1;
                    debug_led[0] <= 1'b1;
                  end
              end // LF_RECV_BYTE1

            LF_READ_BYTE1:
              begin
                // grab data
                lf_firstbyte <= lfreg_data_recv;

                // end read of the data byte
                lfreg_rd <= 1'b0;

                // one more byte has been received
                lf_count <= lf_count + 1;

                // wait for second byte
                lf_state <= LF_RECV_BYTE2;
              end // LF_READ_BYTE1

            LF_RECV_BYTE2:
              begin
                if (lfreg_data_avail)
                  begin
                    // start to read second byte
                    lfreg_rd <= 1'b1;
                    lf_state <= LF_READ_BYTE2;
                  end
              end // LF_RECV_BYTE2

            LF_READ_BYTE2:
              begin
                // now we can initiate a write to the font buffer
                fontbuf_wr_addr <= lf_count[8:1];
                fontbuf_wr_data <= { lf_firstbyte, lfreg_data_recv };
                fontbuf_wr <= 1'b1;

                // end read of the data byte
                lfreg_rd <= 1'b0;

                // one more byte has been received
                lf_count <= lf_count + 1;

                // go to next state
                lf_state <= LF_END_WRITE;
              end // LF_READ_BYTE2

            LF_END_WRITE:
              begin
                // end write to fontbuf
                fontbuf_wr <= 1'b0;

                // if we haven't yet received all of the data in this chunk,
                // expect more data (note that lf_count will wrap around to 0
                // when 512 bytes of data have been received)
                if (lf_count != 9'd0)
                  begin
                    // get ready to receive more data
                    lf_state <= LF_RECV_BYTE1;
                  end
                else
                  begin
                    // write the the count of how many 16-bit font words
                    // are now in the font buffer
                    fontbuf_count_wrdata1 <= 9'd256;
                    fontbuf_count_wr1 <= 1'b1;
                    lf_state <= LF_END_TRANSACTION;
                  end
              end // LF_END_WRITE

            LF_END_TRANSACTION:
              begin
                // end write to the shared counter: this will let the
                // character generator know that data is available in
                // the font buffer
                fontbuf_count_wr1 <= 1'b0;

                // now we are ready to receive byte 1 of a new chunk
                // of font data
                lf_state <= LF_RECV_BYTE1;

                debug_led[1] <= 1'b1;
              end // LF_END_TRANSACTION

          endcase // lf_state
        end
    end

  //----------------------------------------------------------------------
  // process to handle data from CMD_LOAD_CHDATA commands
  //----------------------------------------------------------------------

  reg [8:0] chd_count; // how many *bytes* of character data have been processed
  reg [1:0] chd_state; // current state

  // states
  parameter CHD_RECV_BYTE  = 2'd0;
  parameter CHD_READ_BYTE  = 2'd1;
  parameter CHD_WRITE_BYTE = 2'd2;

  always @(posedge clk)
    begin
      if (nrst == 1'b0)
        begin
          chd_count <= 9'd0;
          chd_state <= CHD_RECV_BYTE;
        end

      else
        begin

          case (chd_state)

            CHD_RECV_BYTE:
              begin
                if (chdreg_data_avail)
                  begin
                    // grab the data byte
                    chdreg_rd <= 1'b1;
                    chd_state <= CHD_READ_BYTE;
                  end
              end

            CHD_READ_BYTE:
              begin
                // initiate write to character data memory
                ch_data_wr_addr <= chd_count;
                ch_data_wr_data <= chdreg_data_recv;
                ch_data_wr <= 1'b1;

                // end read from chdreg
                chdreg_rd <= 1'b0;

                // one more byte of character data has been received
                chd_count <= chd_count + 1;

                // go to next state
                chd_state <= CHD_WRITE_BYTE;
              end

            CHD_WRITE_BYTE:
              begin
                // end write to character data memory
                ch_data_wr <= 1'b0;

                // prepare to receive more data
                chd_state <= CHD_READ_BYTE;
              end

          endcase // chd_state

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

          fontbuf_count_wrdata2 <= 8'd0;
          fontbuf_count_wr2 <= 1'b0;

          debug_led[4] <= 1'b0;
          debug_led[5] <= 1'b0;
        end
      else
        begin
          if (vcount > V_VISIBLE_END & vcount != V_BACK_PORCH_END)
            begin
              // We're not in the vertical visible region, so we can
              // transfer data from the font load buffer to the
              // SPRAM if necessary

              if (font_load_active == 1'b0)
                begin
                  if (fontbuf_count_value != 9'd0)
                    begin
                      // Font data is available in the font load buffer!
                      // Prepare to load it.
                      font_load_active <= 1'b1;
                      font_load_count <= fontbuf_count_value;
                      font_load_state <= FONT_LOAD_READ_WORD;
                      fontbuf_rd_addr <= 8'd0;

                      debug_led[4] <= 1'b1; // white: started loading font buffer into SPRAM
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

                        debug_led[5] <= 1'b1; // orange: finished loading font buffer into SPRAM
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
