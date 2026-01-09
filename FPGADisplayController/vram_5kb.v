// VRAM module allowing for 5 KB of memory with
// independent read and write ports, mapped into an
// 8 KB address space. The upper 1 KB of VRAM is
// mirrored four times in the upper 4 KB of the
// 8 KB address space.

module vram_5kb( // Inputs
                 input clk,
    
                 // Write interface
                 input [12:0] vramWrAddr,    // host-side write address
                 input [7:0] vramWrData,     // data to write
                 input vramWr,               // 1=write to VRAM, 0=don't write
    
                 // Read interface
                 input [12:0] vramRdAddr,    // address to read from
                 output [7:0] vramRdData     // data read from VRAM
                 );

  // VRAM lower (4KB) and upper (1KB) banks.
  // We want yosys to infer these as block RAM.
  reg [7:0] vramDataLower[4095:0];
  reg [7:0] vramDataUpper[1023:0];

  // Initial contents of VRAM (picture of Ingo)
  initial begin
    `include "init_vram_lower.vh"
    `include "init_vram_upper.vh"
  end

  // register for byte read from video memory
  reg [7:0] vramRdDataReg;

  always @( posedge clk ) begin

    // Write to lower bank?
    if ( vramWr == 1'b1 & vramWrAddr[12] == 1'b0 ) begin
      vramDataLower[vramWrAddr[11:0]] <= vramWrData;
    end

    // Write to upper bank?
    if ( vramWr == 1'b1 & vramWrAddr[12] == 1'b1 ) begin
      vramDataUpper[vramWrAddr[9:0]] <= vramWrData;
    end

    // Copy read data to vramRdDataReg, selecting from lower or upper
    // bank using high bit of vramRdAddr
    if ( vramRdAddr[12] == 1'b0 ) begin
      vramRdDataReg <= vramDataLower[vramRdAddr[11:0]];
    end else begin
      vramRdDataReg <= vramDataUpper[vramRdAddr[9:0]];
    end

  end

  // drive outputs from read data register
  assign vramRdData = vramRdDataReg;

endmodule
