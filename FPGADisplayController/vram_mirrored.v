// "Mirrored" VRAM implementation

// The motivation for this module is work around the
// limitation that the ICE40 block RAMS only have
// a single read port and a single write port.
// To allow the host system to both read and write,
// and to allow the rasterization hardware to read,
// we need 1 x write and 2 x read ports. We can fake this
// by implementing mirrored VRAM instances with identical
// contents. All host writes go to both, and each
// instance has its own read port, so that the rasterization
// hardware and the host system can independently read the
// contents of VRAM.  The UP5K used in the Upduino 3 has
// 15KB of block RAM total. We use 10 KB as VRAM (2 x 5 KB banks,
// implemented as instances of vram_5kb). This leaves enough
// room for the 4KB of block RAM we need for font memory.

module vram_mirrored( // Inputs
                      input clk,

                      // Write interface
                      input [12:0] vramWrAddr,    // host-side write address
                      input [7:0] vramWrData,     // data to write
                      input vramWr,               // 1=write to VRAM, 0=don't write

                      // Read interface
                      input [12:0] vramRdAddr,    // display-side address
                      output [7:0] vramRdData,    // data read from display side

                      // Second read interface
                      input [12:0] vramRdAddr2,   // host-side read address
                      output [7:0] vramRdData2    // data read from host side
                      );

  // VRAM data for output to the display
  vram_5kb display_vram( .clk( clk ),
                         .vramWrAddr( vramWrAddr ),
                         .vramWrData( vramWrData ),
                         .vramWr( vramWr ),
                         .vramRdAddr( vramRdAddr ),
                         .vramRdData( vramRdData ) );

  // VRAM data for output to the host system
  // (for readback of data in VRAM)
  vram_5kb host_vram( .clk( clk ),
                      .vramWrAddr( vramWrAddr ),
                      .vramWrData( vramWrData ),
                      .vramWr( vramWr ),
                      .vramRdAddr( vramRdAddr2 ),
                      .vramRdData( vramRdData2 ) );

endmodule
