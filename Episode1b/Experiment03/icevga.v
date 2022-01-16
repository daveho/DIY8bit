// ice40 vga device

// Modularization of Experiment05 code from Episode 1A.

module icevga (input wire nrst_in,
               input wire [7:0] disp_cmd_in, // command data from FIFO
               input wire nef_in,            // active-low empty flag from FIFO
               output disp_cmd_rd,           // active-low read strobe output to FIFO
               input wire ext_osc,
               output wire vsync,
               output wire hsync,
               output reg [3:0] red,
               output reg [3:0] green,
               output reg [3:0] blue);

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
  // Line buffer
  ////////////////////////////////////////////////////////////////////////

  // set to 1 to write a 16-bit word to the linebuf
  reg linebuf_wr;
  // 16-bit word to write to the line buffer
  reg [15:0] linebuf_wr_data;
  // address of word to write to linebuf
  reg [7:0] linebuf_wr_addr;

  // set to 1 to read a 16-bit word from the linebuf
  reg linebuf_rd;
  // data of 16-bit word read from linebuf
  wire [15:0] linebuf_rd_data;
  // address of word to read from linebuf
  reg [7:0] linebuf_rd_addr;

  // Directly-instantiated 256x16 block RAM for the line pixel buffer.
  // Note that in read mode 0 and write mode 0, where 16 bit words are
  // accessed, only the low 8 bits of the read and write addresses
  // are used. (Which makes sense for a memory with 256 16-bit words.)
  //
  // See:
  //   https://www.latticesemi.com/-/media/LatticeSemi/Documents/ApplicationNotes/MO/MemoryUsageGuideforiCE40Devices.ashx?document_id=47775
  //   https://github.com/FPGAwars/toolchain-verilator/blob/master/build-data/share/SB_RAM40_4K.v
  //
  SB_RAM40_4K #(.WRITE_MODE(0), .READ_MODE(0))
              linebuf(.RDATA(linebuf_rd_data),
                      .RADDR({3'b000, linebuf_rd_addr}),
                      .RCLK(clk),
                      .RCLKE(linebuf_rd),
                      .RE(1'b1),
                      .WADDR({3'b000, linebuf_wr_addr}),
                      .WCLK(clk),
                      .WCLKE(linebuf_wr),
                      .WDATA(linebuf_wr_data),
                      .WE(1'b1),
                      .MASK(16'd0));

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
  // Process commands read from FIFO
  ////////////////////////////////////////////////////////////////////////

  parameter CMDPROC_READY   = 1'b0;
  parameter CMDPROC_PROCESS = 1'b1;

  reg cmdproc_state;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          cmdproc_state <= CMDPROC_READY;

          linebuf_wr_addr <= 8'd0;
          linebuf_wr <= 1'b0;
        end
      else
        begin
          case (cmdproc_state)

            CMDPROC_READY:
              if (cmdreg_data_avail == 1'b1)
                begin
                  // write a word to the line buffer; will be clocked into
                  // the block RAM on the next positive clock edge
                  linebuf_wr_data <= {8'b0, cmdreg_data_recv};
                  linebuf_wr <= 1'b1;

                  // signal to the shared reg that we're
                  // reading the data (the data should already be available
                  // in the receive register)
                  cmdreg_rd <= 1'b1;
                  cmdproc_state <= CMDPROC_PROCESS;
                end

             CMDPROC_PROCESS:
               begin
                 // the write to the line buffer should be finished now
                 linebuf_wr <= 1'b0;

                 // advance address in block RAM
                 linebuf_wr_addr <= linebuf_wr_addr + 1;

                 cmdreg_rd <= 1'b0; // finish read
                 cmdproc_state <= CMDPROC_READY;
               end

          endcase
        end
    end

  ////////////////////////////////////////////////////////////////////////
  // Tick counting from 0 to 2 in order to generate 40 MHz timing
  // from the 120 MHz PLL clock.
  ////////////////////////////////////////////////////////////////////////

  reg [15:0] tick;

  parameter MIN_TICK  = 16'd0;
  parameter MAX_TICK  = 16'd2;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          tick <= MIN_TICK;
        end
      else
        begin
          tick <= (tick == MAX_TICK) ? MIN_TICK : tick + 1;
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
                    (tick == MAX_TICK),
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
                    (tick == MAX_TICK) & (hcount == 16'd0),
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

  reg [3:0] pixcount;
  reg [15:0] pixbuf;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;

          pixcount <= 4'd0;
          pixbuf <= 16'd0;

          linebuf_rd_addr <= 8'd0;
          linebuf_rd <= 1'b1;
        end
      else
        begin
          if (tick == MIN_TICK & linebuf_rd)
            begin
              // data should be available on BRAM read port now
              pixbuf <= linebuf_rd_data;
              // advance read address
              linebuf_rd_addr <= linebuf_rd_addr + 1;
              // can finish read now
              linebuf_rd <= 1'b0;
            end

          if (tick == MAX_TICK)
            begin
              if (hvis & vvis)
                // In visible region
                begin
                  if (pixbuf[15])
                    begin
                      // display foreground pixel
                      red <= FG_RED;
                      green <= FG_GREEN;
                      blue <= FG_BLUE;
                    end
                  else
                    begin
                      // display background pixel
                      red <= BG_RED;
                      green <= BG_GREEN;
                      blue <= BG_BLUE;
                    end

                  // advance to next pixel
                  pixbuf <= pixbuf << 1;
                  pixcount <= pixcount + 1;

                  if (pixcount == 4'b1111 & hcount != H_VISIBLE_END)
                    begin
                      // At end of block of 16 pixels, and there is at least one
                      // more block of 16 pixels to generate. Initiate fetch of
                      // word containing next 16 pixel values.
                      linebuf_rd <= 1'd1;
                    end
                end
              else
                begin
                  // Not in visible region.
                  // If we're close to the beginning of the next line,
                  // we'll initiate a read from the linebuf (even if
                  // it's not necessary.)
                  if (hcount == H_BACK_PORCH_END)
                    begin
                      linebuf_rd_addr <= 8'd0;
                      linebuf_rd <= 1'b1;
                    end
                end
            end
        end
    end

endmodule
