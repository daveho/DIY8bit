// Readout module (based on Readout module from the HW_VGA project).
// Its job is to generate readout addresses to send to the VRAM
// in order to fetch character and attribute data.

module readout( // Inputs
                input nrst,
                input clk,
                input vActive,
                input hBeginActive,
                input hEndActive,
                input [3:0] vCount,
                input vSync,
                input hBeginPulse,
                // outputs
                output [12:0] readoutAddr,
                output [2:0] readoutCount,
                output active );

  // activeReg: 1 if readout activity is happening
  reg activeReg;

  // 8 cycle counter, used to time address generation.
  // The high bit is the activity "phase": 0=fetch character,
  // 1=fetch attribute. (This will be significant to the
  // pixel generator module.)
  reg [2:0] readoutCountReg;

  // row begin address register
  reg [12:0] rowBeginAddrReg;

  // readout address register
  reg [12:0] readoutAddrReg;

  always @( posedge clk ) begin
    if ( nrst == 1'b0 ) begin
      // in reset
      activeReg <= 1'b0;
      rowBeginAddrReg <= 13'd0;
      readoutAddrReg <= 13'd0;
    end else if ( vSync == 1'b0 ) begin
      // vSync pulse is being generated: clear rowBeginAddrReg
      rowBeginAddrReg <= 13'd0;
    end else begin
      // not in reset or vsync pulse

      if ( ~activeReg ) begin
        // Readout activity currently off

        // start activity?
        if ( hBeginActive & vActive ) begin
          // activity starts
          activeReg <= 1'b1;

          // start at readoutCountReg=2 to skip first readout addr increment
          readoutCountReg <= 3'd2;
        end

        // If we're in the vertical activity region, and the hsync pulse
        // begin signal is asserted (which happens outside the horizontal
        // activity period, so activeReg will be de-asserted), update either
        // the readout address register (by setting it to the current value
        // of the row begin address register) or the row begin address
        // register (by setting it to the current value of the readout
        // address register).
        if ( vActive & hBeginPulse ) begin
          if ( vCount == 4'b1111 ) begin
            // We've reached the last pixel row in the current character row,
            // so set the row begin address to the current readout address
            // (in order to start the next character row)
            rowBeginAddrReg <= readoutAddrReg;
          end else begin
            // The next pixel row will be part of the same character row,
            // so set the readout address back to the current value of the
            // row begin address register.
            readoutAddrReg <= rowBeginAddrReg;
          end
        end
      end else begin
        // Readout activity is occurring

        // increment readoutCountReg
        readoutCountReg <= readoutCountReg + 3'd1;

        // If readoutCountReg is 0 or 4, increment readout address
        // (so that the address of a character or attribute to
        // fetch is asserted when the readoutCountReg is 1 or 5.)
        if ( readoutCountReg[1:0] == 2'b00 ) begin
          readoutAddrReg <= readoutAddrReg + 13'd1;
        end

        // End activity for this scanline?
        if ( hEndActive ) begin
          activeReg <= 1'b0;
        end
      end

    end
  end

  // The readout address register's outputs drive the module's
  // readout address outputs
  assign readoutAddr = readoutAddrReg;

  // Output readoutCount and active signals so pixgen module can use them
  assign readoutCount = readoutCountReg;
  assign active = activeReg;

endmodule
