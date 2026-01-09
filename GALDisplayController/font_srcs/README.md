# Font sources

All of the fonts are from [The Ultimate Oldschool PC Font Pack](https://int10h.org/oldschool-pc-fonts/).

I used the outstanding [Monobit](https://github.com/robhagemans/monobit) tool
to convert the fonts I wanted from Windows bitmap format to GNU Unifont (`.hex`) format.
For some reason, Monobit doesn't actually seem to be able to convert directly to
Unifont, so instead I translated Monobit's "yaff" output to Unifont using a
Ruby script.

Since my font ROM has room for 16 fonts, here is a list of the
fonts that I incorporated into the font ROM.

Font number | File                  | Link
----------- | --------------------- | -----------
0           | `Bm437_IBM_DOS_ISO8.FON` | [IBM DOS ISO 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_dos_iso8)
1           | `Bm437_IBM_VGA_8x16.FON` | [IBM VGA 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_vga_8x16)
2           | `Bm437_ACM_VGA_8x16.FON` | [ACM VGA 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?acm_vga_8x16)
3           | `Bm437_ATI_8x16.FON` | [ATI 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?ati_8x16)
4           | `Bm437_IGS_VGA_8x16.FON` | [IGS VGA 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?igs_vga_8x16)
5           | `Bm437_PhoenixVGA_8x16.FON` | [PhoenixVGA 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?phoenixvga_8x16)
6           | `Bm437_CompaqThin_8x16.FON` | [CompaqThin 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?compaqthin_8x16)
7           | `Bm437_Verite_8x16.FON` | [Verite 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?verite_8x16)
8           | `Bm437_ToshibaSat_8x16.FON` | [ToshibaSat 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?toshibasat_8x16)
9           | `Bm437_ToshibaT300_8x16.FON` | [ToshibaT300 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?toshibat300_8x16)
10          | `Bm437_ToshibaTxL1_8x16.FON` | [ToshibaTxL1 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?toshibatxl1_8x16)
11          | `Bm437_ToshibaTxL2_8x16.FON` | [ToshibaTxL2 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?toshibatxl2_8x16)
12          | `Bm437_OlivettiThin_8x16.FON` | [OlivettiThin 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?olivettithin_8x16)
13          | `Bm437_TridentEarly_8x16.FON` | [TridentEarly 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?tridentearly_8x16)
14          | `Bm437_Trident_8x16.FON` | [Trident 8x16](https://int10h.org/oldschool-pc-fonts/fontlist/font?trident_8x16)
15          | `Bm437_Tandy2K.FON` | [Tandy 2K](https://int10h.org/oldschool-pc-fonts/fontlist/font?tandy2k)

## Creating the font ROM image

To create the font ROM image, run the following command:

```bash
make
```

Note that you need Monobit to be installed (`pip install monobit`).

To program the font ROM image to a 27SF512 flash memory chip:

```bash
minipro --device 'SST27SF512@DIP28' -w font_rom.bin
```

To program the font ROM image to a W27C512 flash memory chip:

```bash
minipro --device 'W27C512@DIP28' -w font_rom.bin
```

The above commands assume you are using the open-source
[Minipro](https://gitlab.com/DavidGriffith/minipro) software.

In theory, if resistor R601 is installed, it should be possible to have 8 fonts
in a 32K EPROM (e.g., a 27C256), but I haven't tried this.
