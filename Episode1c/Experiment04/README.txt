Experiment 4: add support for loading font data and
character data into block RAM.

The font is the "IBM DOS ISO8" font, downloaded from here:

  https://int10h.org/oldschool-pc-fonts/fontlist/

The specific font:

  https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_dos_iso8

I downloaded the font as a Windows ".FON" file (which is available in the
v1.01 download), used FontForge to convert it to BDF, and then used gbdfed
to convert it to "hex" format ("Bm437IBMISO8-16.hex"). From there I
converted it to initialized Arduino code using a Ruby script.

For posterity, I chose this font because

- it's 8x16

- it looks fairly nice, with single-pixel-wide lines rather than
  the ugly doubled pixels of the original IBM PC fonts

- it uses code page 437, the IBM PC character encoding, so you
  get the various graphic characters supported by the original
  IBM PC
