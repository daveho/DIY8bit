// Third attempt at implementing a VGA text mode display
// using an ICE40 FPGA

`default_nettype none

module icevga3( // clock and reset
                input nrst,
                input ext_osc,
                // host interface
                inout[7:0] hostDataPhys,  // physical I/O pins connected to data bus
                input[12:0] hostAddr,     // VRAM address host system wants to access
                input nHostRd,            // 0 when host system wants to read from VRAM
                input nHostWr,            // 1 when host system wants to write to VRAM
                // outputs to monitor
                output redOut,
                output greenOut,
                output blueOut,
                output intenseOut,
                output hSyncOut,
                output vSyncOut );

  // Use the global clock buffer to distribute the 25.175 MHz VGA dot clock
  wire clk;
  SB_GB clk_buffer( .USER_SIGNAL_TO_GLOBAL_BUFFER( ext_osc ),
                    .GLOBAL_BUFFER_OUTPUT( clk ) );

  // hcount module and signals

  wire hCountEnd, hBeginPulse, hEndPulse, hVisEnd, hBeginActive, hEndActive;

  hcount hcount_instance( .nrst( nrst ),
                          .clk( clk ),
                          .hCountEnd( hCountEnd ),
                          .hBeginPulse( hBeginPulse ),
                          .hEndPulse( hEndPulse ),
                          .hVisEnd( hVisEnd ),
                          .hBeginActive( hBeginActive ),
                          .hEndActive( hEndActive ) );

  // vcount module and signals

  wire vCountZero, vBeginPulse, vEndPulse, vVisEnd, vCountEnd, vEndActive;
  wire [11:0] vCount;

  vcount vcount_instance( .nrst( nrst ),
                          .clk( clk ),
                          .vCountIncr( hEndPulse ), // v. count incremented at end of hsync pulse
                          .hCountEnd( hCountEnd ),
                          .vCountZero( vCountZero ),
                          .vBeginPulse( vBeginPulse ),
                          .vEndPulse( vEndPulse ),
                          .vVisEnd( vVisEnd ),
                          .vCountEnd( vCountEnd ),
                          .vEndActive( vEndActive ),
                          .vCount( vCount ) );

  // sync module and signals

  wire hSync, vSync, hVis, vVis, nVis, vActive;

  sync sync_instance( .nrst( nrst) ,
                      .clk( clk ),
                      .hBeginPulse( hBeginPulse ),
                      .hEndPulse( hEndPulse ),
                      .vBeginPulse( vBeginPulse ),
                      .vEndPulse( vEndPulse ),
                      .hCountEnd( hCountEnd ),
                      .vCountZero( vCountZero ),
                      .hVisEnd( hVisEnd ),
                      .vVisEnd( vVisEnd ),
                      .vCountEnd( vCountEnd ),
                      .vEndActive( vEndActive ),
                      .hSync( hSync ),
                      .vSync( vSync ),
                      .hVis( hVis ),
                      .vVis( vVis ),
                      .nVis( nVis ),
                      .vActive( vActive ) );

  // vga_output module and signals

  wire bgRed, bgGreen, bgBlue, bgIntense, fgRed, fgGreen, fgBlue, fgIntense, pixel;

  vga_output vga_output_instance( .clk( clk ),
                                  .bgRed( bgRed ),
                                  .bgGreen( bgGreen ),
                                  .bgBlue( bgBlue ),
                                  .bgIntense( bgIntense ),
                                  .fgRed( fgRed ),
                                  .fgGreen( fgGreen ),
                                  .fgBlue( fgBlue ),
                                  .fgIntense( fgIntense ),
                                  .pixel( pixel ),
                                  .hSync( hSync ),
                                  .vSync( vSync ),
                                  .nVis( nVis ),
                                  // the vga_output module's outputs drive the output pins
                                  // which drive the color and sync signals that ultimately
                                  // go to the VGA monitor
                                  .redOut( redOut ),
                                  .greenOut( greenOut ),
                                  .blueOut( blueOut ),
                                  .intenseOut( intenseOut ),
                                  .hSyncOut( hSyncOut ),
                                  .vSyncOut( vSyncOut ) );

  // readout module and signals

  wire [12:0] readoutAddr;
  wire [2:0] readoutCount;
  wire active;

  readout readout_instance( // Inputs
                            .nrst( nrst ),
                            .clk( clk ),
                            .vActive( vActive ),
                            .hBeginActive( hBeginActive ),
                            .hEndActive( hEndActive ),
                            .vCount( vCount[3:0] ), // only need low 4 bits of vCount
                            .vSync( vSync ),
                            .hBeginPulse( hBeginPulse ),
                            // Output
                            .readoutAddr( readoutAddr ),
                            .readoutCount( readoutCount ),
                            .active( active ) );

  // vram module and signals

  wire [7:0] vramWrData;  // data byte host system wants to write to VRAM
  wire hostWr;            // 1=host wants to write
  wire hostRd;            // 1=host wants to read
  wire [7:0] vramRdDataToDisplay;  // data byte read from VRAM for display
  wire [7:0] vramRdDataToHost;     // data byte read from VRAM for host

  // For whatever reason, yosys is unhappy if the memory address
  // sent to a block RAM is not provided by flip flops.  On each clock,
  // grab the current data on the hostAddr inputs and save them in a
  // register. This register is then used to select the address of the
  // byte the host wants to read or write.  As long as the address is
  // valid before the host initiates a read or write, this should be fine,
  // the VRAM will see the correct address by the time it matters.
  reg [12:0] hostAddrReg;
  always @( posedge clk ) begin
    hostAddrReg <= hostAddr;
  end

  vram_mirrored vram_instance( // Inputs
                               .clk( clk ),
                               .vramWrAddr( hostAddrReg ),
                               .vramWrData( vramWrData ),
                               .vramWr( hostWr ),
                               .vramRdAddr( readoutAddr ), // displayAddr=readoutAddr
                               .vramRdAddr2( hostAddrReg ),
                               // Outputs
                               .vramRdData( vramRdDataToDisplay ),
                               .vramRdData2( vramRdDataToHost ) );

  // Direct host interface control signals and data bus to direct writes
  // to VRAM
  assign hostWr = ~nHostWr;
  assign hostRd = ~nHostRd;

  // bidirectional interface to host data bus
  ext_data_bus ext_host_data_bus(
                                  .outToBus( vramRdDataToHost ),
                                  .inFromBus( vramWrData ),
                                  .phys( hostDataPhys ),
                                  .outputEnable( hostRd )
                                );

  // pixel generator module

  pixgen pixgen_instance(  // Inputs
                          .nrst( nrst ),
                          .clk( clk ),
                          .vramRdData( vramRdDataToDisplay ), // read data from display side of VRAM
                          .vCount( vCount[3:0] ),
                          .nVis( nVis ),
                          .readoutCount( readoutCount ),
                          .active( active ),
                          // Outputs
                          .bgRed( bgRed ),
                          .bgGreen( bgGreen ),
                          .bgBlue( bgBlue ),
                          .bgIntense( bgIntense ),
                          .fgRed( fgRed ),
                          .fgGreen( fgGreen ),
                          .fgBlue( fgBlue ),
                          .fgIntense( fgIntense ),
                          .pixel( pixel ) );

endmodule
