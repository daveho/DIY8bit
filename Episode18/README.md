# DIY 8-bit computer, Episode 18

Link to video: coming soon

In this video, I assemble and test a PCB for the memory and peripherals module
for the F68 6809 computer system.  The PCB replaces the original hand-wired
prototype version of the module, and adds support for RS-232 serial
communication using a MAX232 transceiver chip.

Coming soon: photo

The [HardwareDesign](HardwareDesign) directory has the schematics and PCB
designs.  I updated the PCB design for the memory and peripherals module
to fix the minor issue I discovered in the video where one of the clock
inputs of the 82C54 timer/counter chip was not connected.

The [Code](Code) directory has the updated code for the monitor program,
which adds a `k` command to display some sweet ASCII art.

## Serial communication headers

The PCB has two 5-pin headers for serial communication.

The monitor program is hard-coded for 9600 bps, 8N1, so that's what the
remote (communicating) device should be configured for.

### Labeling of pins

Note that the silkscreen markings for the individual pins on the two
serial communications headers (TTL serial and RS-232) are
describing a signal of the *remote* device, i.e., the device that
the 6809 system will be communicating with.  For example, the pin labeled
`Rx` should be connected to the Rx (receive) input on the remote device, and
is driven by the Tx (transmit) pin on the 6809 system's 63B50 UART.

I hope this makes sense!

### TTL serial header

The header labeled "TTL serial" uses standard TTL-level signals.

The TTL serial header may be connected to a USB serial adapter as follows:

TTL serial header pin | USB serial adapter pin
--------------------- | ----------------------
GND                   | GND
RTS                   | RTS
CTS                   | CTS
Rx                    | Rx
Tx                    | Tx

### RS-232 header

The header labeled "RS-232" uses a MAX232 chip for serial communication using
RS-232 level signals.  As with the "TTL serial" header, the silkscreen labels
for the pins refer to the remote device, not the 6809 system.

How these header pins are connected will depend on two factors:

* whether the remote device is DTE (Data Terminal Equipment) or DCE (Data
  Communication Equipment)
* whether the RS-232 cable is straight through or null modem

PCs and serial terminals are both DTE devices.

The following tables show how to write the 5-pin RS-232 header on the PCB
to a 9-pin (D-sub) serial connector.

For connection to a DTE device using a straight-through cable, or a DCE device
using a null modem cable:

RS-232 header pin | Serial connector pin
----------------- | --------------------
GND               | 5
RTS               | 7
CTS               | 8
Rx                | 2
Tx                | 3


For connection to a DCE device using a straight-through cable, or a DTE
device using a null modem cable:

RS-232 header pin | Serial connector pin
----------------- | --------------------
GND               | 5
RTS               | 8
CTS               | 7
Rx                | 3
Tx                | 2
