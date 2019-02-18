# DIY 8-bit computer, Epsiode 5

## Sources

I used the following information sources to research the material for this episode.

The [Wikipedia flip flop article](https://en.wikipedia.org/wiki/Flip-flop_(electronics)) is very good, and includes much more information about flip flops and latches than any sane person would want to know.

I got the technique for adding asynchronous set/reset to a D-type latch using 3-input NAND gates from [this article](http://en.f-alpha.net/electronics/digital-electronics/flip-flop/know-more/experiment-23-asynchronous-inputs/).

The [CPUVille article on registers](http://cpuville.com/Educational/Registers.html) was helpful, but I will warn you that the article uses terminology in a way that is inconsistent with the other sources I've seen.  For example, it labels the SR latch input that sets the Q output to false as the "S" (set) input rather than "R" (reset).  That's why I mislabeled it in the intro drawing.

## Demo circuit schematics

The [SRLatch](SRLatch), [DTypeLatch](DTypeLatch), [DTypeEdgeTriggered](DTypeEdgeTriggered), and [DTypeLatchAsyncSetReset](DTypeLatchAsyncSetReset) directories have the schematics (KiCad and PDF) for the various demo circuits.

I haven't included resistor values for the LEDs: I used 806 Ohm resistors with some fairly standard blue LEDs.  Your mileage may vary.  74HC/HCT devices can typically source about 5 mA per pin, so choose your LEDs and resistors accordingly.  High efficiency LEDs will work better because they require less current.

Ok, just for posterity, here's how I know I've chosen a reasonable resistor value for my LEDs.

The voltage drop of the LED is about 2.4V.  With Vcc=5V, that means we need to limit current for the remaining voltage, which is 5V - 2.4V = 2.6V.

With an 806 Ohm resistor, we can apply Ohm's Law as follows:

> V = IR
>
> 2.6 = I × 806
>
> I = 2.6 / 806 = 0.003225

So, the current through the LED is limited to about 3.2 mA, which is easily within what the 74HC ICs I'm using can source.
