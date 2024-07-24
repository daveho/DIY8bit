FONT_SRCS =  \
	Bm437_IBM_DOS_ISO8.FON \
	Bm437_IBM_VGA_8x16.FON \
	Bm437_ACM_VGA_8x16.FON \
	Bm437_ATI_8x16.FON \
	Bm437_IGS_VGA_8x16.FON \
	Bm437_PhoenixVGA_8x16.FON \
	Bm437_CompaqThin_8x16.FON \
	Bm437_Verite_8x16.FON \
	Bm437_ToshibaSat_8x16.FON \
	Bm437_ToshibaT300_8x16.FON \
	Bm437_ToshibaTxL1_8x16.FON \
	Bm437_ToshibaTxL2_8x16.FON \
	Bm437_OlivettiThin_8x16.FON \
	Bm437_TridentEarly_8x16.FON \
	Bm437_Trident_8x16.FON \
	Bm437_Tandy2K.FON

font_rom.bin : $(FONT_SRCS)
	for f in $(FONT_SRCS); do monobit-convert $$f | ./yaff2unifont.rb > $$(basename $$f .FON).hex; done
	rm -f $@
	touch $@
	for h in $(FONT_SRCS:%.FON=%.hex); do ./convert_hex.rb < $$h >> $@; done
	rm -f *.hex
