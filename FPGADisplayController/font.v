// font module (goal is to have it inferred as block RAM)

module font( input clk,
             // read interface
             input fontRdEn,
             input [11:0] fontRdAddr,
             output [7:0] fontRdData,
             // write interface (currently unused, but needed to
             // get Yosys to infer the font memory as block RAM)
             input fontWrEn,
             input [11:0] fontWrAddr,
             input [7:0] fontWrData );

  // Font data (ideally, will be inferred as 8 512B block RAMS)
  reg [7:0] fontData[4095:0];
  initial begin
    `include "init_font.vh"
  end

  // register to store current data read from font ROM
  reg [7:0] fontRdDataReg;

  always @( posedge clk ) begin
    if ( fontRdEn )
      fontRdDataReg <= fontData[fontRdAddr];
    if ( fontWrEn )
      fontData[fontWrAddr] <= fontWrData;
  end

  // contents of font read data register are driven as the
  // module's fontRdData output
  assign fontRdData = fontRdDataReg;

endmodule
