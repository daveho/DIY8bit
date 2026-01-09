// VGA output module (based on the Output module from the HW_VGA project)

module vga_output( // Inputs
                   input clk,
                   input bgRed,
                   input bgGreen,
                   input bgBlue,
                   input bgIntense,
                   input fgRed,
                   input fgGreen,
                   input fgBlue,
                   input fgIntense,
                   input pixel,
                   input hSync,
                   input vSync,
                   input nVis, // active-low visibility signal
                   // Outputs
                   output redOut,
                   output greenOut,
                   output blueOut,
                   output intenseOut,
                   output hSyncOut,
                   output vSyncOut );

  // output registers
  reg redOutReg, greenOutReg, blueOutReg, intenseOutReg, hSyncOutReg, vSyncOutReg;

  // This module just synchronizes selected color, sync,
  // and visibility signals using registers. Reset behavior is
  // managed by the modules that generate the "raw" signals
  // (e.g., the sync module, the pixel generator module, etc.)
  always @( posedge clk ) begin
    if ( nVis == 1'b1 ) begin
      // -VIS is not asserted, so output black
      redOutReg <= 1'b0;
      greenOutReg <= 1'b0;
      blueOutReg <= 1'b0;
      intenseOutReg <= 1'b0;
    end else if ( pixel == 1'b1 ) begin
      // foreground pixel color
      redOutReg <= fgRed;
      greenOutReg <= fgGreen;
      blueOutReg <= fgBlue;
      intenseOutReg <= fgIntense;
    end else begin
      // background pixel color
      redOutReg <= bgRed;
      greenOutReg <= bgGreen;
      blueOutReg <= bgBlue;
      intenseOutReg <= bgIntense;
    end

    // sync signals
    hSyncOutReg = hSync;
    vSyncOutReg = vSync;
  end

  // drive output registers to module outputs
  assign redOut = redOutReg;
  assign greenOut = greenOutReg;
  assign blueOut = blueOutReg;
  assign intenseOut = intenseOutReg;
  assign hSyncOut = hSyncOutReg;
  assign vSyncOut = vSyncOutReg;

endmodule
