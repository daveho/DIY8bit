// Gunk to support bidirectional I/O on the output pins
// connected to the host data bus (via a 74LVC245 bus
// transceiver.)

module ext_data_bus(
                     input[7:0] outToBus,    // byte of data to output to bus, when outputEnable is asserted
                     output[7:0] inFromBus,  // byte of data input from bus, when outputEnable is not asserted
                     inout[7:0] phys,        // physical pins
                     input outputEnable      // 1=output to bus, 0=input from bus
                   );

  // Suggested code from Google AI for using SB_IO to
  // interface with an external pin
  /*
    SB_IO #(
      .PIN_TYPE(6'b 1010_01), // Configure as bidirectional with tristate
      .PULLUP(1'b 0)         // Optional: Disable internal pull-up resistor
    ) my_bidir_io (
      .PACKAGE_PIN(io_pin),   // Connect to the top-level port representing the physical pin
      .OUTPUT_ENABLE(oe_signal), // Control the output enable (1 for output, 0 for input)
      .D_OUT_0(data_out),    // Data to be output when oe_signal is high
      .D_IN_0(data_in)       // Data read from the pin when oe_signal is low
    );
  */

  // John Winans video about tristate I/O with ICE40 and yosys:
  //   https://www.youtube.com/watch?v=7bjqZ6kK7ws

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_0 (
    .PACKAGE_PIN(phys[0]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[0]),
    .D_IN_0(inFromBus[0])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_1 (
    .PACKAGE_PIN(phys[1]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[1]),
    .D_IN_0(inFromBus[1])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_2 (
    .PACKAGE_PIN(phys[2]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[2]),
    .D_IN_0(inFromBus[2])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_3 (
    .PACKAGE_PIN(phys[3]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[3]),
    .D_IN_0(inFromBus[3])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_4 (
    .PACKAGE_PIN(phys[4]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[4]),
    .D_IN_0(inFromBus[4])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_5 (
    .PACKAGE_PIN(phys[5]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[5]),
    .D_IN_0(inFromBus[5])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_6 (
    .PACKAGE_PIN(phys[6]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[6]),
    .D_IN_0(inFromBus[6])
  );

  SB_IO #(
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b1)
  ) ext_pin_7 (
    .PACKAGE_PIN(phys[7]),
    .OUTPUT_ENABLE(outputEnable),
    .D_OUT_0(outToBus[7]),
    .D_IN_0(inFromBus[7])
  );

endmodule
