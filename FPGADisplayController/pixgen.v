// Pixel generator module (based on HW_VGA pixel generator and PxGenCtrl.pld)

// Note that unlike HW_VGA, the pixel generator does *not*
// duplicate the readout module's state machine.
// Instead, it takes its readoutCount and active signal as inputs.

module pixgen( // Inputs
               input nrst,
               input clk,
               input [7:0] vramRdData,
               input [3:0] vCount,
               input nVis,
               input [2:0] readoutCount, // from readout module
               input active,             // from readout module
               // Outputs
               output bgRed,
               output bgGreen,
               output bgBlue,
               output bgIntense,
               output fgRed,
               output fgGreen,
               output fgBlue,
               output fgIntense,
               output pixel );

  // character and attribute registers
  reg [7:0] charReg;
  reg [7:0] attrReg;

  // output shift register
  reg [7:0] shiftReg;

  // font read interface
  wire fontRdEn;
  wire [11:0] fontRdAddr;
  wire [7:0] fontRdData;
  // font read enable is asserted continuously
  assign fontRdEn = 1'b1;

  // The data read from the font ROM is the pattern byte addressed
  // using the contents of the character register (high 8 bits)
  // and the low 4 bits of the vertical count (vCount[3:0]).
  assign fontRdAddr = { charReg[7:0], vCount[3:0] };

  // write interface to font: we don't use this
  // (but it theory it would allow the font data to be
  // modified)
  wire fontWrEn;
  wire [11:0] fontWrAddr;
  wire [7:0] fontWrData;
  assign fontWrEn = 1'b0; // not enabled
  assign fontWrAddr = 12'd0;
  assign fontWrData = 8'd0;

  font font_instance( .clk( clk ),
                      .fontRdEn( fontRdEn ),
                      .fontRdAddr( fontRdAddr ),
                      .fontRdData( fontRdData ),
                      .fontWrEn( fontWrEn ),
                      .fontWrAddr( fontWrAddr ),
                      .fontWrData( fontWrData ) );

  always @( posedge clk ) begin
    if ( nrst == 1'b0 ) begin
      // in reset
      attrReg <= 8'd0;
      charReg <= 8'd0;
      shiftReg <= 8'd0;
    end else begin
      // not in reset

      // during activity,
      //   - at readout count 4 (initiate at count 3), clock readout data into the character register
      //   - at readout count 0 (initiate at count 7), clock readout data into the attribute register
      //     and clock pattern data from the font ROM into the output shift register

      // during visibility, if readout count is not 7, shift the value in the
      // output shift register left by 1 bit

      // this logic is expressed in a somewhat peculiar way in order to
      // avoid any semblance of multiple simultaneous assignments to the same register

      if ( active & ~nVis ) begin
        // readout activity and visibility: update character register,
        // attribute register, and load or shift output shift register

        if ( readoutCount == 3'd3 ) begin
          charReg <= vramRdData;
        end else if ( readoutCount == 3'd7 ) begin
          attrReg <= vramRdData;
          shiftReg <= fontRdData;
        end

        if ( readoutCount != 3'd7 ) begin
          shiftReg <= shiftReg << 1;
        end
      end else if ( active ) begin
        // readout activity but not visibility: only update character and attribute
        // registers and load shift register

        if ( readoutCount == 3'd3 ) begin
          charReg <= vramRdData;
        end else if ( readoutCount == 3'd7 ) begin
          attrReg <= vramRdData;
          shiftReg <= fontRdData;
        end
      end else if ( ~nVis ) begin
        // visibility but no readout activity: only shift output shift register
        if ( readoutCount != 3'd7 ) begin
          shiftReg <= shiftReg << 1;
        end
      end
      
    end
  end

  // drive outputs
  assign bgRed = attrReg[0];
  assign bgGreen = attrReg[1];
  assign bgBlue = attrReg[2];
  assign bgIntense = attrReg[3];
  assign fgRed = attrReg[4];
  assign fgGreen = attrReg[5];
  assign fgBlue = attrReg[6];
  assign fgIntense = attrReg[7];
  assign pixel = shiftReg[7];

endmodule
