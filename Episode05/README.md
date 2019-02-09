# DIY 8-bit computer, Epsiode 5

The [SRLatch](SRLatch), [DTypeLatch](DTypeLatch), and [DTypeEdgeTriggered](DTypeEdgeTriggered) directories have the schematics (KiCad and PDF) for each of the demo circuits.

I haven't included resistor values for the LEDs: I used 806 Ohm resistors with some fairly standard blue LEDs.  Your mileage may vary.  74HC/HCT outputs can typically source about 5 mA, so choose your LEDs and resistors accordingly.  High efficiency LEDs will work better because they require less current.

Ok, just for posterity, here's how I know I've chosen a reasonable resistor value for my LEDs.

The voltage drop of the LED is about 2.4V.  With Vcc=5V, that means we need to limit current for the remaining voltage, which is 5V - 2.4V = 2.6V.

With an 806 Ohm resistor, we can apply Ohm's Law as follows:

> V = IR
>
> 2.6 = I × 806
>
> I = 2.6 / 806 = 0.003.225

So, the current through the LED is limited to about 3.2 mA, which is well within what the 74HC ICs I'm using can source.
