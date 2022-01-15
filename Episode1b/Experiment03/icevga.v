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

  reg [7:0] disp_cmd;

  parameter CMDPROC_READY   = 1'b0;
  parameter CMDPROC_PROCESS = 1'b1;

  reg cmdproc_state;

  // RGB values for generated pixels
/*
  reg [3:0] values [0:3];
*/
/*
  reg [7:0] linebuf_addr;
  reg [15:0] pixel_data;
*/

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          cmdproc_state <= CMDPROC_READY;
          disp_cmd <= 8'd0;
/*
          linebuf_addr <= 8'd0;
          pixel_data <= 16'd0;
*/
        end
      else
        begin
          case (cmdproc_state)

            CMDPROC_READY:
              if (cmdreg_data_avail == 1'b1)
                begin
                  // begin signaling to the shared reg that we're
                  // reading the data (the data should already be available
                  // in the receive register)
                  disp_cmd <= cmdreg_data_recv;
/*
                  pixel_data <= {8'd0, cmdreg_data_recv[7:0]};
*/
                  cmdreg_rd <= 1'b1;
                  cmdproc_state <= CMDPROC_PROCESS;
                end

             CMDPROC_PROCESS:
               begin
                 // do something with the command data
/*
                 values[disp_cmd[5:4]] <= disp_cmd[3:0];
                 linebuf[linebuf_addr] <= {8'd0, disp_cmd[7:0]};
                 linebuf[linebuf_addr] <= pixel_data;
                 linebuf_addr <= linebuf_addr + 1;
*/

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
                    (tick == MIN_TICK),
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
                    (tick == MIN_TICK) & (hcount == 16'd0),
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

  // This should map to one 256x16bit block ram:
  // each 16 bit word controls 16 pixels
  reg [15:0] linebuf [0:255];

/*
  // which word in the linebuf is selected by the current column
  wire [5:0] word_offset_in_linebuf;
  assign word_offset_in_linebuf = hcount[9:4];

  // which pixel in the current word is selected by the current column
  wire [3:0] pixel_offset_in_word;
  assign pixel_offset_in_word = hcount[3:0];
*/

  reg [15:0] wordcount;
  reg [3:0] pixcount;
  reg [15:0] next_pixels;

  always @(posedge clk)
    begin
      if (nrst == RESET_ASSERTED)
        begin
          red <= 4'h0;
          green <= 4'h0;
          blue <= 4'h0;
          wordcount <= 16'd0;
          pixcount <= 4'd0;
          next_pixels <= 16'd0;
        end
      else
        begin
          if (tick == MIN_TICK)
            begin
              if (hvis & vvis)
                begin
/*
                  // R/G/B values are generated based on commands
                  // received from the FIFO
                  red <= values[2'b10];
                  green <= values[2'b01];
                  blue <= values[2'b00];
*/
/*
                  if ( (linebuf[word_offset_in_linebuf] >> pixel_offset_in_word)[0] )
                    begin
                      // foreground pixel
                      red <= FG_RED;
                      green <= FG_GREEN;
                      blue <= FG_BLUE;
                    end
                  else
                    begin
                      // background pixel
                      red <= BG_RED;
                      green <= BG_GREEN;
                      blue <= BG_BLUE;
                    end
*/
                  if (next_pixels[15])
                    begin
                      // foreground pixel
                      red <= FG_RED;
                      green <= FG_GREEN;
                      blue <= FG_BLUE;
                    end
                  else
                    begin
                      // background pixel
                      red <= BG_RED;
                      green <= BG_GREEN;
                      blue <= BG_BLUE;
                    end

                  if (pixcount == 4'b1111)
                    begin
                      next_pixels <= linebuf[wordcount[7:0]]; // fetch next 16 pixels
                      wordcount <= wordcount + 1;             // advance to next word to fetch
                      pixcount <= 4'd0;                       // reset pixel count
                    end
                  else
                    begin
                      next_pixels <= (next_pixels << 1);      // shift pixels
                      pixcount <= pixcount + 1;               // advance to next pixel in word
                    end

                end
              else
                begin
                  // output black when not in visible region
                  red <= 4'h0;
                  green <= 4'h0;
                  blue <= 4'h0;

                  if (hcount == H_SYNC_PULSE_END)
                    begin
                      wordcount <= 16'd1;
                      pixcount <= 4'd0;
                      next_pixels <= linebuf[8'd0];
                    end
                end
            end
        end
    end

endmodule
