EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 12100 9350
encoding utf-8
Sheet 7 7
Title "Display"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3950 3600 0    50   ~ 0
VSYNC
Text Label 3950 3700 0    50   ~ 0
HSYNC
Text Label 3550 3200 0    50   ~ 0
B3
Text Label 3550 3300 0    50   ~ 0
B2
Text Label 3550 3400 0    50   ~ 0
B1
Text Label 3550 3500 0    50   ~ 0
B0
Text Label 3550 2800 0    50   ~ 0
G3
Text Label 3550 2900 0    50   ~ 0
G2
Text Label 3550 3000 0    50   ~ 0
G1
Text Label 3550 3100 0    50   ~ 0
G0
$Comp
L device:R R603
U 1 1 60B91E95
P 6300 1000
F 0 "R603" V 6250 750 50  0000 C CNN
F 1 "1k" V 6300 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1000 50  0001 C CNN
F 3 "" H 6300 1000 50  0001 C CNN
	1    6300 1000
	0    1    1    0   
$EndComp
$Comp
L device:R R601
U 1 1 60B9099B
P 6300 850
F 0 "R601" V 6250 600 50  0000 C CNN
F 1 "430" V 6300 850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 850 50  0001 C CNN
F 3 "" H 6300 850 50  0001 C CNN
	1    6300 850 
	0    1    1    0   
$EndComp
$Comp
L device:R R604
U 1 1 60B957A6
P 6850 1000
F 0 "R604" V 6800 750 50  0000 C CNN
F 1 "24" V 6850 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1000 50  0001 C CNN
F 3 "" H 6850 1000 50  0001 C CNN
	1    6850 1000
	0    1    1    0   
$EndComp
$Comp
L device:R R602
U 1 1 60B95854
P 6850 850
F 0 "R602" V 6800 600 50  0000 C CNN
F 1 "82" V 6850 850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 850 50  0001 C CNN
F 3 "" H 6850 850 50  0001 C CNN
	1    6850 850 
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 850  7000 850 
Wire Wire Line
	7300 1000 7000 1000
Wire Wire Line
	6450 850  6700 850 
Wire Wire Line
	6450 1000 6700 1000
$Comp
L device:R R607
U 1 1 60B9BD07
P 6300 1300
F 0 "R607" V 6250 1050 50  0000 C CNN
F 1 "3k9" V 6300 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1300 50  0001 C CNN
F 3 "" H 6300 1300 50  0001 C CNN
	1    6300 1300
	0    1    1    0   
$EndComp
$Comp
L device:R R605
U 1 1 60B9BD11
P 6300 1150
F 0 "R605" V 6250 900 50  0000 C CNN
F 1 "2k" V 6300 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1150 50  0001 C CNN
F 3 "" H 6300 1150 50  0001 C CNN
	1    6300 1150
	0    1    1    0   
$EndComp
$Comp
L device:R R608
U 1 1 60B9BD1B
P 6850 1300
F 0 "R608" V 6800 1050 50  0000 C CNN
F 1 "200" V 6850 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1300 50  0001 C CNN
F 3 "" H 6850 1300 50  0001 C CNN
	1    6850 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1150 7000 1150
Wire Wire Line
	7300 1300 7000 1300
Wire Wire Line
	6450 1150 6700 1150
Wire Wire Line
	6450 1300 6700 1300
$Comp
L device:R R606
U 1 1 60B9BD25
P 6850 1150
F 0 "R606" V 6800 900 50  0000 C CNN
F 1 "50" V 6850 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1150 50  0001 C CNN
F 3 "" H 6850 1150 50  0001 C CNN
	1    6850 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 850  7300 1000
Wire Wire Line
	7300 1000 7300 1150
Connection ~ 7300 1000
Wire Wire Line
	7300 1150 7300 1300
Connection ~ 7300 1150
Connection ~ 7300 1300
$Comp
L device:R R611
U 1 1 60B9F981
P 6300 1700
F 0 "R611" V 6250 1450 50  0000 C CNN
F 1 "1k" V 6300 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1700 50  0001 C CNN
F 3 "" H 6300 1700 50  0001 C CNN
	1    6300 1700
	0    1    1    0   
$EndComp
$Comp
L device:R R609
U 1 1 60B9F98B
P 6300 1550
F 0 "R609" V 6250 1300 50  0000 C CNN
F 1 "430" V 6300 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1550 50  0001 C CNN
F 3 "" H 6300 1550 50  0001 C CNN
	1    6300 1550
	0    1    1    0   
$EndComp
$Comp
L device:R R612
U 1 1 60B9F995
P 6850 1700
F 0 "R612" V 6800 1450 50  0000 C CNN
F 1 "24" V 6850 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1700 50  0001 C CNN
F 3 "" H 6850 1700 50  0001 C CNN
	1    6850 1700
	0    1    1    0   
$EndComp
$Comp
L device:R R610
U 1 1 60B9F99F
P 6850 1550
F 0 "R610" V 6800 1300 50  0000 C CNN
F 1 "82" V 6850 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1550 50  0001 C CNN
F 3 "" H 6850 1550 50  0001 C CNN
	1    6850 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1550 7000 1550
Wire Wire Line
	7300 1700 7000 1700
Wire Wire Line
	6450 1550 6700 1550
Wire Wire Line
	6450 1700 6700 1700
$Comp
L device:R R615
U 1 1 60B9F9AF
P 6300 2000
F 0 "R615" V 6250 1750 50  0000 C CNN
F 1 "3k9" V 6300 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 2000 50  0001 C CNN
F 3 "" H 6300 2000 50  0001 C CNN
	1    6300 2000
	0    1    1    0   
$EndComp
$Comp
L device:R R613
U 1 1 60B9F9B9
P 6300 1850
F 0 "R613" V 6250 1600 50  0000 C CNN
F 1 "2k" V 6300 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 1850 50  0001 C CNN
F 3 "" H 6300 1850 50  0001 C CNN
	1    6300 1850
	0    1    1    0   
$EndComp
$Comp
L device:R R616
U 1 1 60B9F9C3
P 6850 2000
F 0 "R616" V 6800 1750 50  0000 C CNN
F 1 "200" V 6850 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 2000 50  0001 C CNN
F 3 "" H 6850 2000 50  0001 C CNN
	1    6850 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1850 7000 1850
Wire Wire Line
	7300 2000 7000 2000
Wire Wire Line
	6450 1850 6700 1850
Wire Wire Line
	6450 2000 6700 2000
$Comp
L device:R R614
U 1 1 60B9F9D1
P 6850 1850
F 0 "R614" V 6800 1600 50  0000 C CNN
F 1 "50" V 6850 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1550 7300 1700
Wire Wire Line
	7300 1700 7300 1850
Connection ~ 7300 1700
Wire Wire Line
	7300 1850 7300 2000
Connection ~ 7300 1850
Connection ~ 7300 2000
$Comp
L device:R R619
U 1 1 60BA3632
P 6300 2400
F 0 "R619" V 6250 2150 50  0000 C CNN
F 1 "1k" V 6300 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 2400 50  0001 C CNN
F 3 "" H 6300 2400 50  0001 C CNN
	1    6300 2400
	0    1    1    0   
$EndComp
$Comp
L device:R R617
U 1 1 60BA363C
P 6300 2250
F 0 "R617" V 6250 2000 50  0000 C CNN
F 1 "430" V 6300 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 2250 50  0001 C CNN
F 3 "" H 6300 2250 50  0001 C CNN
	1    6300 2250
	0    1    1    0   
$EndComp
$Comp
L device:R R620
U 1 1 60BA3646
P 6850 2400
F 0 "R620" V 6800 2150 50  0000 C CNN
F 1 "24" V 6850 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 2400 50  0001 C CNN
F 3 "" H 6850 2400 50  0001 C CNN
	1    6850 2400
	0    1    1    0   
$EndComp
$Comp
L device:R R618
U 1 1 60BA3650
P 6850 2250
F 0 "R618" V 6800 2000 50  0000 C CNN
F 1 "82" V 6850 2250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 2250 50  0001 C CNN
F 3 "" H 6850 2250 50  0001 C CNN
	1    6850 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2250 7000 2250
Wire Wire Line
	7300 2400 7000 2400
Wire Wire Line
	6450 2250 6700 2250
Wire Wire Line
	6450 2400 6700 2400
$Comp
L device:R R623
U 1 1 60BA3660
P 6300 2700
F 0 "R623" V 6250 2450 50  0000 C CNN
F 1 "3k9" V 6300 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 2700 50  0001 C CNN
F 3 "" H 6300 2700 50  0001 C CNN
	1    6300 2700
	0    1    1    0   
$EndComp
$Comp
L device:R R621
U 1 1 60BA366A
P 6300 2550
F 0 "R621" V 6250 2300 50  0000 C CNN
F 1 "2k" V 6300 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6230 2550 50  0001 C CNN
F 3 "" H 6300 2550 50  0001 C CNN
	1    6300 2550
	0    1    1    0   
$EndComp
$Comp
L device:R R624
U 1 1 60BA3674
P 6850 2700
F 0 "R624" V 6800 2450 50  0000 C CNN
F 1 "200" V 6850 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 2700 50  0001 C CNN
F 3 "" H 6850 2700 50  0001 C CNN
	1    6850 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2550 7000 2550
Wire Wire Line
	7300 2700 7000 2700
Wire Wire Line
	6450 2550 6700 2550
Wire Wire Line
	6450 2700 6700 2700
$Comp
L device:R R622
U 1 1 60BA3682
P 6850 2550
F 0 "R622" V 6800 2300 50  0000 C CNN
F 1 "50" V 6850 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6780 2550 50  0001 C CNN
F 3 "" H 6850 2550 50  0001 C CNN
	1    6850 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2250 7300 2400
Wire Wire Line
	7300 2400 7300 2550
Connection ~ 7300 2400
Wire Wire Line
	7300 2550 7300 2700
Connection ~ 7300 2550
Wire Wire Line
	5650 1000 6150 1000
Wire Wire Line
	5650 1150 6150 1150
Wire Wire Line
	5650 1300 6150 1300
Wire Wire Line
	5650 850  6150 850 
Text Notes 6350 650  0    50   ~ 0
Resistor DAC
Text Label 5700 850  0    50   ~ 0
R3
Text Label 5700 1000 0    50   ~ 0
R2
Text Label 5700 1150 0    50   ~ 0
R1
Text Label 5700 1300 0    50   ~ 0
R0
Text Label 5700 1550 0    50   ~ 0
G3
Text Label 5700 1700 0    50   ~ 0
G2
Text Label 5700 1850 0    50   ~ 0
G1
Text Label 5700 2000 0    50   ~ 0
G0
Text Label 5700 2250 0    50   ~ 0
B3
Text Label 5700 2400 0    50   ~ 0
B2
Text Label 5700 2550 0    50   ~ 0
B1
Text Label 5700 2700 0    50   ~ 0
B0
Wire Wire Line
	1800 1500 1650 1500
Wire Wire Line
	1650 1500 1650 1150
Wire Wire Line
	1650 1150 1400 1150
Wire Wire Line
	1400 1150 1400 1300
$Comp
L power:GND #PWR0191
U 1 1 60BED77C
P 1400 1300
F 0 "#PWR0191" H 1400 1050 50  0001 C CNN
F 1 "GND" H 1405 1127 50  0000 C CNN
F 2 "" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
	1    1400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2100 4800 2100
Wire Wire Line
	4800 2100 4800 2250
$Comp
L power:GND #PWR0192
U 1 1 60BF23D5
P 4800 2250
F 0 "#PWR0192" H 4800 2000 50  0001 C CNN
F 1 "GND" H 4805 2077 50  0000 C CNN
F 2 "" H 4800 2250 50  0001 C CNN
F 3 "" H 4800 2250 50  0001 C CNN
	1    4800 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0193
U 1 1 60BF690E
P 750 2350
F 0 "#PWR0193" H 750 2100 50  0001 C CNN
F 1 "GND" H 755 2177 50  0000 C CNN
F 2 "" H 750 2350 50  0001 C CNN
F 3 "" H 750 2350 50  0001 C CNN
	1    750  2350
	1    0    0    -1  
$EndComp
Text Label 7400 1300 0    50   ~ 0
RED
Text Label 7400 2000 0    50   ~ 0
GREEN
Text Label 7400 2700 0    50   ~ 0
BLUE
Wire Wire Line
	7300 2000 8200 2000
Connection ~ 7300 2700
Text Label 3550 2700 0    50   ~ 0
R0
Text Label 3550 2600 0    50   ~ 0
R1
Text Label 3550 2500 0    50   ~ 0
R2
Text Label 3550 2400 0    50   ~ 0
R3
Wire Wire Line
	3450 2400 3750 2400
Wire Wire Line
	3450 2500 3750 2500
Wire Wire Line
	3450 2600 3750 2600
Wire Wire Line
	3450 2700 3750 2700
Entry Bus Bus
	3850 700  3950 600 
Entry Bus Bus
	5450 600  5550 700 
Wire Bus Line
	5450 600  3950 600 
Entry Wire Line
	5550 750  5650 850 
Entry Wire Line
	5550 900  5650 1000
Entry Wire Line
	5550 1050 5650 1150
Entry Wire Line
	5550 1200 5650 1300
Entry Wire Line
	3750 2400 3850 2300
Entry Wire Line
	3750 2500 3850 2400
Entry Wire Line
	3750 2600 3850 2500
Entry Wire Line
	3750 2700 3850 2600
Wire Wire Line
	3450 2800 3850 2800
Wire Wire Line
	3450 2900 3850 2900
Wire Wire Line
	3450 3000 3850 3000
Wire Wire Line
	3450 3100 3850 3100
Wire Bus Line
	4050 700  5350 700 
Entry Bus Bus
	3950 800  4050 700 
Entry Wire Line
	3850 2800 3950 2700
Entry Wire Line
	3850 2900 3950 2800
Entry Wire Line
	3850 3000 3950 2900
Entry Wire Line
	3850 3100 3950 3000
Entry Bus Bus
	5350 700  5450 800 
Wire Wire Line
	5550 1550 6150 1550
Wire Wire Line
	5550 1700 6150 1700
Wire Wire Line
	5550 1850 6150 1850
Wire Wire Line
	5550 2000 6150 2000
Entry Wire Line
	5450 1450 5550 1550
Entry Wire Line
	5450 1600 5550 1700
Entry Wire Line
	5450 1750 5550 1850
Entry Wire Line
	5450 1900 5550 2000
Wire Wire Line
	3450 3200 3950 3200
Wire Wire Line
	3450 3300 3950 3300
Wire Wire Line
	3450 3400 3950 3400
Wire Wire Line
	3450 3500 3950 3500
Entry Wire Line
	3950 3200 4050 3100
Entry Wire Line
	3950 3300 4050 3200
Entry Wire Line
	3950 3400 4050 3300
Entry Wire Line
	3950 3500 4050 3400
Entry Bus Bus
	4050 900  4150 800 
Wire Bus Line
	4150 800  5250 800 
Entry Bus Bus
	5250 800  5350 900 
Wire Wire Line
	5450 2250 6150 2250
Wire Wire Line
	5450 2400 6150 2400
Wire Wire Line
	5450 2550 6150 2550
Wire Wire Line
	5450 2700 6150 2700
Entry Wire Line
	5350 2150 5450 2250
Entry Wire Line
	5350 2300 5450 2400
Entry Wire Line
	5350 2450 5450 2550
Entry Wire Line
	5350 2600 5450 2700
$Comp
L Upduino_3.0:Upduino_3.0 U601
U 1 1 60BB2F09
P 2650 1300
F 0 "U601" H 2625 1365 50  0000 C CNN
F 1 "Upduino_3.0" H 2625 1274 50  0000 C CNN
F 2 "HardwareDesign:DIP-48_W17.78mm" H 2650 1250 50  0001 C CNN
F 3 "" H 2650 1250 50  0001 C CNN
	1    2650 1300
	1    0    0    -1  
$EndComp
Text Notes 1850 1000 0    50   ~ 0
Warning! The signal names for package pins\n41 and 42 were reversed on the silkscreen.\nPin 41 is the 12 MHz clock output, and\npin 42 is the third ground pin.
Wire Wire Line
	3450 2200 3650 2200
Wire Wire Line
	3650 2200 3650 1900
Wire Wire Line
	3650 1900 3450 1900
Text Label 1300 2300 0    50   ~ 0
VCC_3.3
Wire Wire Line
	2650 5250 2800 5250
Wire Wire Line
	2800 5250 2800 4900
$Comp
L power:VCC #PWR?
U 1 1 60E4C22F
P 2800 4900
F 0 "#PWR?" H 2800 4750 50  0001 C CNN
F 1 "VCC" H 2817 5073 50  0000 C CNN
F 2 "" H 2800 4900 50  0001 C CNN
F 3 "" H 2800 4900 50  0001 C CNN
	1    2800 4900
	1    0    0    -1  
$EndComp
Text Label 7550 6300 0    50   ~ 0
VCC_3.3
Wire Wire Line
	7950 6300 7500 6300
Text Label 7550 4900 0    50   ~ 0
VCC_3.3
Wire Wire Line
	7950 4900 7500 4900
$Comp
L power:GND #PWR?
U 1 1 61018F31
P 9100 5900
F 0 "#PWR?" H 9100 5650 50  0001 C CNN
F 1 "GND" H 9105 5727 50  0000 C CNN
F 2 "" H 9100 5900 50  0001 C CNN
F 3 "" H 9100 5900 50  0001 C CNN
	1    9100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 5000 9100 5900
Wire Wire Line
	8950 5000 9100 5000
$Comp
L power:GND #PWR?
U 1 1 61005E85
P 9050 7350
F 0 "#PWR?" H 9050 7100 50  0001 C CNN
F 1 "GND" H 9055 7177 50  0000 C CNN
F 2 "" H 9050 7350 50  0001 C CNN
F 3 "" H 9050 7350 50  0001 C CNN
	1    9050 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 6400 9050 7350
Wire Wire Line
	8950 6400 9050 6400
$Comp
L power:GND #PWR?
U 1 1 60FF3FDE
P 7800 7350
F 0 "#PWR?" H 7800 7100 50  0001 C CNN
F 1 "GND" H 7805 7177 50  0000 C CNN
F 2 "" H 7800 7350 50  0001 C CNN
F 3 "" H 7800 7350 50  0001 C CNN
	1    7800 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 7200 7800 7350
Wire Wire Line
	7950 7200 7800 7200
$Comp
L power:GND #PWR?
U 1 1 60FF109C
P 7800 5900
F 0 "#PWR?" H 7800 5650 50  0001 C CNN
F 1 "GND" H 7805 5727 50  0000 C CNN
F 2 "" H 7800 5900 50  0001 C CNN
F 3 "" H 7800 5900 50  0001 C CNN
	1    7800 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 5800 7800 5900
Wire Wire Line
	7950 5800 7800 5800
$Comp
L power:VCC #PWR?
U 1 1 60E4CC91
P 5200 5800
F 0 "#PWR?" H 5200 5650 50  0001 C CNN
F 1 "VCC" H 5217 5973 50  0000 C CNN
F 2 "" H 5200 5800 50  0001 C CNN
F 3 "" H 5200 5800 50  0001 C CNN
	1    5200 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5950 5200 5800
Wire Wire Line
	4950 5950 5200 5950
Wire Wire Line
	4950 7950 4950 8300
$Comp
L power:GND #PWR?
U 1 1 60E386FC
P 4950 8300
F 0 "#PWR?" H 4950 8050 50  0001 C CNN
F 1 "GND" H 4955 8127 50  0000 C CNN
F 2 "" H 4950 8300 50  0001 C CNN
F 3 "" H 4950 8300 50  0001 C CNN
	1    4950 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 7100 6500 7100
Wire Wire Line
	7950 7000 6400 7000
Wire Wire Line
	7950 6900 6300 6900
Wire Wire Line
	7950 6800 6200 6800
Wire Wire Line
	7950 6700 6100 6700
Wire Wire Line
	7950 6600 6000 6600
Wire Wire Line
	7950 6500 5900 6500
Wire Wire Line
	7950 6400 5800 6400
$Comp
L power:GND #PWR?
U 1 1 60DC00A4
P 4100 7850
F 0 "#PWR?" H 4100 7600 50  0001 C CNN
F 1 "GND" H 4105 7677 50  0000 C CNN
F 2 "" H 4100 7850 50  0001 C CNN
F 3 "" H 4100 7850 50  0001 C CNN
	1    4100 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 7200 4100 7300
Wire Wire Line
	4250 7200 4100 7200
$Comp
L 74LVC245:74LVC245 U604
U 1 1 60D6149F
P 8450 6750
F 0 "U604" H 8450 7465 50  0000 C CNN
F 1 "74LVC245" H 8450 7374 50  0000 C CNN
F 2 "" H 8450 6950 50  0001 C CNN
F 3 "" H 8450 6950 50  0001 C CNN
	1    8450 6750
	1    0    0    -1  
$EndComp
$Comp
L 74LVC245:74LVC245 U603
U 1 1 60D6015A
P 8450 5350
F 0 "U603" H 8450 6065 50  0000 C CNN
F 1 "74LVC245" H 8450 5974 50  0000 C CNN
F 2 "" H 8450 5550 50  0001 C CNN
F 3 "" H 8450 5550 50  0001 C CNN
	1    8450 5350
	1    0    0    -1  
$EndComp
$Comp
L memory:IDT7201 U602
U 1 1 60D58ACF
P 4950 6950
F 0 "U602" H 4950 8131 50  0000 C CNN
F 1 "IDT7201" H 4950 8040 50  0000 C CNN
F 2 "" H 4950 6950 50  0001 C CNN
F 3 "" H 4950 6950 50  0001 C CNN
	1    4950 6950
	1    0    0    -1  
$EndComp
$Comp
L ARDUINO_NANO:ARDUINO_NANO TB605
U 1 1 60EB0BB8
P 1950 6350
F 0 "TB605" H 1950 7915 50  0000 C CNN
F 1 "ARDUINO_NANO" H 1950 7824 50  0000 C CNN
F 2 "SHIELD_ARDUINO_NANO" H 1950 6350 50  0001 L BNN
F 3 "DFRobot" H 1950 6350 50  0001 L BNN
F 4 "Dev.kit: Arduino; UART; ICSP, USB B mini, pin strips" H 1950 6350 50  0001 L BNN "Field4"
F 5 "None" H 1950 6350 50  0001 L BNN "Field5"
F 6 "None" H 1950 6350 50  0001 L BNN "Field6"
F 7 "ARDUINO NANO" H 1950 6350 50  0001 L BNN "Field7"
F 8 "Unavailable" H 1950 6350 50  0001 L BNN "Field8"
	1    1950 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 7550 2900 7550
Wire Wire Line
	2900 7550 2900 7650
Wire Wire Line
	2650 7650 2900 7650
Connection ~ 2900 7650
Wire Wire Line
	2900 7650 2900 7900
$Comp
L power:GND #PWR?
U 1 1 60EC2E5C
P 2900 7900
F 0 "#PWR?" H 2900 7650 50  0001 C CNN
F 1 "GND" H 2905 7727 50  0000 C CNN
F 2 "" H 2900 7900 50  0001 C CNN
F 3 "" H 2900 7900 50  0001 C CNN
	1    2900 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6650 850  6650
Wire Wire Line
	1250 6750 850  6750
Wire Wire Line
	1250 6850 850  6850
Wire Wire Line
	1250 6950 850  6950
Wire Wire Line
	1250 7050 850  7050
Wire Wire Line
	1250 7150 850  7150
Wire Wire Line
	1250 7250 850  7250
Entry Wire Line
	750  6750 850  6650
Entry Wire Line
	750  6850 850  6750
Entry Wire Line
	750  6950 850  6850
Entry Wire Line
	750  7050 850  6950
Entry Wire Line
	750  7150 850  7050
Entry Wire Line
	750  7250 850  7150
Entry Wire Line
	750  7350 850  7250
Entry Bus Bus
	750  8400 850  8500
Entry Wire Line
	3300 6650 3400 6550
Entry Bus Bus
	3300 8500 3400 8400
Wire Bus Line
	3300 8500 850  8500
Entry Bus Bus
	3400 6050 3500 5950
Wire Wire Line
	4250 6400 3850 6400
Wire Wire Line
	4250 6500 3850 6500
Wire Wire Line
	4250 6600 3850 6600
Wire Wire Line
	4250 6700 3850 6700
Wire Wire Line
	4250 6800 3850 6800
Wire Wire Line
	4250 6900 3850 6900
Wire Wire Line
	4250 7100 3850 7100
Entry Wire Line
	3750 7000 3850 7100
Entry Wire Line
	3750 6300 3850 6400
Entry Wire Line
	3750 6400 3850 6500
Entry Wire Line
	3750 6500 3850 6600
Entry Wire Line
	3750 6600 3850 6700
Entry Wire Line
	3750 6700 3850 6800
Entry Wire Line
	3750 6800 3850 6900
Entry Wire Line
	3750 6900 3850 7000
Entry Bus Bus
	3650 5950 3750 6050
Wire Bus Line
	3650 5950 3500 5950
Wire Wire Line
	4250 7300 4100 7300
Wire Wire Line
	3600 7400 4250 7400
Wire Wire Line
	4100 7850 4100 7300
Connection ~ 4100 7300
Connection ~ 7800 5800
Wire Wire Line
	7950 5200 7800 5200
Wire Wire Line
	7800 5200 7800 5300
Wire Wire Line
	7950 5300 7800 5300
Connection ~ 7800 5300
Wire Wire Line
	7800 5300 7800 5400
Wire Wire Line
	7950 5400 7800 5400
Connection ~ 7800 5400
Wire Wire Line
	7800 5400 7800 5500
Wire Wire Line
	7950 5500 7800 5500
Connection ~ 7800 5500
Wire Wire Line
	7800 5500 7800 5600
Wire Wire Line
	7950 5600 7800 5600
Connection ~ 7800 5600
Wire Wire Line
	7800 5600 7800 5700
Wire Wire Line
	7950 5700 7800 5700
Connection ~ 7800 5700
Wire Wire Line
	7800 5700 7800 5800
Wire Wire Line
	3500 6200 4150 6200
Wire Wire Line
	4150 6200 4150 6300
Wire Wire Line
	4150 6300 4250 6300
Wire Wire Line
	3500 6200 3500 6750
Wire Wire Line
	2650 6650 3300 6650
$Comp
L Connector_Generic:Conn_01x12 J601
U 1 1 60BC9A6D
P 10350 1700
F 0 "J601" H 10430 1692 50  0000 L CNN
F 1 "Conn_01x12" H 10430 1601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 10350 1700 50  0001 C CNN
F 3 "~" H 10350 1700 50  0001 C CNN
	1    10350 1700
	1    0    0    -1  
$EndComp
Text Notes 10100 1000 0    50   ~ 0
VGA breakout
Wire Wire Line
	10150 1600 9600 1600
Wire Wire Line
	10150 1700 9600 1700
Wire Wire Line
	10150 1800 9600 1800
Wire Wire Line
	10150 1900 9600 1900
Wire Wire Line
	10150 2200 9600 2200
Wire Wire Line
	9450 1200 9450 2300
Wire Wire Line
	9450 1200 10150 1200
Wire Wire Line
	9450 2300 10150 2300
Connection ~ 9450 2300
Wire Wire Line
	9450 2300 9450 2550
$Comp
L power:GND #PWR0137
U 1 1 60BE62A3
P 9450 2550
F 0 "#PWR0137" H 9450 2300 50  0001 C CNN
F 1 "GND" H 9455 2377 50  0000 C CNN
F 2 "" H 9450 2550 50  0001 C CNN
F 3 "" H 9450 2550 50  0001 C CNN
	1    9450 2550
	1    0    0    -1  
$EndComp
Text Label 9700 1300 0    50   ~ 0
RED
Text Label 9700 1400 0    50   ~ 0
GREEN
Text Label 9700 1500 0    50   ~ 0
BLUE
Text Label 9700 1600 0    50   ~ 0
RES
Text Label 9700 1700 0    50   ~ 0
IDO
Text Label 9700 1800 0    50   ~ 0
SCL
Text Label 9700 1900 0    50   ~ 0
SDA
Text Label 9700 2000 0    50   ~ 0
VSYNC
Text Label 9700 2100 0    50   ~ 0
HSYNC
Text Label 9700 2200 0    50   ~ 0
VBUS
Text Label 9300 6300 0    50   ~ 0
VCC_3.3
Wire Wire Line
	9650 6300 8950 6300
Text Label 9050 4900 0    50   ~ 0
VCC_3.3
Wire Wire Line
	9400 4900 8950 4900
Entry Bus Bus
	9900 4200 10000 4300
Entry Wire Line
	9900 7200 10000 7100
Entry Wire Line
	9900 7100 10000 7000
Entry Wire Line
	9900 7000 10000 6900
Entry Wire Line
	9900 6900 10000 6800
Entry Wire Line
	9900 6800 10000 6700
Entry Wire Line
	9900 6700 10000 6600
Entry Wire Line
	9900 6600 10000 6500
Entry Wire Line
	9900 6500 10000 6400
Wire Wire Line
	8950 7200 9900 7200
Wire Wire Line
	8950 7100 9900 7100
Wire Wire Line
	8950 7000 9900 7000
Wire Wire Line
	8950 6900 9900 6900
Wire Wire Line
	8950 6800 9900 6800
Wire Wire Line
	8950 6700 9900 6700
Wire Wire Line
	8950 6600 9900 6600
Wire Wire Line
	8950 6500 9900 6500
Text Notes 1450 8050 0    50   ~ 0
The Arduino is just standing\nin for the host system for now
$Comp
L power:+3V3 #PWR?
U 1 1 614BB16D
P 1250 2100
F 0 "#PWR?" H 1250 1950 50  0001 C CNN
F 1 "+3V3" H 1265 2273 50  0000 C CNN
F 2 "" H 1250 2100 50  0001 C CNN
F 3 "" H 1250 2100 50  0001 C CNN
	1    1250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2300 1250 2100
Wire Wire Line
	1250 2300 1800 2300
$Comp
L power:+3V3 #PWR?
U 1 1 614F6E9B
P 9400 4800
F 0 "#PWR?" H 9400 4650 50  0001 C CNN
F 1 "+3V3" H 9415 4973 50  0000 C CNN
F 2 "" H 9400 4800 50  0001 C CNN
F 3 "" H 9400 4800 50  0001 C CNN
	1    9400 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4800 9400 4900
$Comp
L power:+3V3 #PWR?
U 1 1 61506165
P 9650 6200
F 0 "#PWR?" H 9650 6050 50  0001 C CNN
F 1 "+3V3" H 9665 6373 50  0000 C CNN
F 2 "" H 9650 6200 50  0001 C CNN
F 3 "" H 9650 6200 50  0001 C CNN
	1    9650 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 6200 9650 6300
$Comp
L power:+3V3 #PWR?
U 1 1 61518B8A
P 7500 4800
F 0 "#PWR?" H 7500 4650 50  0001 C CNN
F 1 "+3V3" H 7515 4973 50  0000 C CNN
F 2 "" H 7500 4800 50  0001 C CNN
F 3 "" H 7500 4800 50  0001 C CNN
	1    7500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4800 7500 4900
$Comp
L power:+3V3 #PWR?
U 1 1 6152CCB4
P 7500 6200
F 0 "#PWR?" H 7500 6050 50  0001 C CNN
F 1 "+3V3" H 7515 6373 50  0000 C CNN
F 2 "" H 7500 6200 50  0001 C CNN
F 3 "" H 7500 6200 50  0001 C CNN
	1    7500 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 6200 7500 6300
Text Label 950  6650 0    50   ~ 0
D0
Text Label 950  6750 0    50   ~ 0
D1
Text Label 950  6850 0    50   ~ 0
D2
Text Label 950  6950 0    50   ~ 0
D3
Text Label 950  7050 0    50   ~ 0
D4
Text Label 950  7150 0    50   ~ 0
D5
Text Label 950  7250 0    50   ~ 0
D6
Wire Wire Line
	4250 7000 3850 7000
Text Label 4050 6400 0    50   ~ 0
D0
Text Label 4050 6500 0    50   ~ 0
D1
Text Label 4050 6600 0    50   ~ 0
D2
Text Label 4050 6700 0    50   ~ 0
D3
Text Label 4050 6800 0    50   ~ 0
D4
Text Label 4050 6900 0    50   ~ 0
D5
Text Label 4050 7000 0    50   ~ 0
D6
Text Label 4050 7100 0    50   ~ 0
D7
Wire Wire Line
	3500 6750 2650 6750
Text Label 2700 6750 0    50   ~ 0
~DispCmdWR~
Wire Wire Line
	2650 6850 3600 6850
Wire Wire Line
	3600 6850 3600 7400
Text Label 2700 6850 0    50   ~ 0
~DispRST~
Text Label 6750 6400 0    50   ~ 0
DispCmdD0
Text Label 6750 6500 0    50   ~ 0
DispCmdD1
Text Label 6750 6600 0    50   ~ 0
DispCmdD2
Text Label 6750 6700 0    50   ~ 0
DispCmdD3
Text Label 6750 6800 0    50   ~ 0
DispCmdD4
Text Label 6750 6900 0    50   ~ 0
DispCmdD5
Text Label 6750 7000 0    50   ~ 0
DispCmdD6
Text Label 6750 7100 0    50   ~ 0
DispCmdD7
Text Label 9200 6800 0    50   ~ 0
DispCmdD3_3.3
Text Label 9200 6700 0    50   ~ 0
DispCmdD2_3.3
Text Label 9200 6600 0    50   ~ 0
DispCmdD1_3.3
Text Label 9200 6500 0    50   ~ 0
DispCmdD0_3.3
Text Label 9200 6900 0    50   ~ 0
DispCmdD4_3.3
Text Label 9200 7000 0    50   ~ 0
DispCmdD5_3.3
Text Label 9200 7100 0    50   ~ 0
DispCmdD6_3.3
Text Label 9200 7200 0    50   ~ 0
DispCmdD7_3.3
Wire Wire Line
	7950 5000 3600 5000
Wire Wire Line
	3600 5000 3600 6850
Connection ~ 3600 6850
Wire Wire Line
	8950 5100 9800 5100
Wire Wire Line
	9800 5100 9800 4300
Wire Wire Line
	9800 4300 550  4300
Wire Wire Line
	550  4300 550  2700
Wire Wire Line
	900  2400 900  2200
Wire Wire Line
	900  2200 750  2200
Wire Wire Line
	750  2200 750  2350
Wire Wire Line
	900  2400 1800 2400
Wire Wire Line
	550  2700 1800 2700
Wire Wire Line
	1800 3300 1000 3300
Wire Wire Line
	1800 3100 1000 3100
Wire Bus Line
	9900 4200 1000 4200
Entry Wire Line
	900  3900 1000 3800
Entry Wire Line
	900  3800 1000 3700
Entry Wire Line
	900  3700 1000 3600
Entry Wire Line
	900  3600 1000 3500
Entry Wire Line
	900  3500 1000 3400
Entry Wire Line
	900  3400 1000 3300
Entry Wire Line
	900  3300 1000 3200
Entry Wire Line
	900  3200 1000 3100
Wire Wire Line
	1800 3800 1000 3800
Wire Wire Line
	1800 3700 1000 3700
Wire Wire Line
	1800 3600 1000 3600
Wire Wire Line
	1800 3500 1000 3500
Wire Wire Line
	1800 3400 1000 3400
Wire Wire Line
	1800 3200 1000 3200
Entry Bus Bus
	900  4100 1000 4200
Text Label 9200 5100 0    50   ~ 0
~DispRST_3.3~
Text Label 1100 2700 0    50   ~ 0
~DispRST_3.3~
Text Label 1100 3400 0    50   ~ 0
DispCmdD3_3.3
Text Label 1100 3300 0    50   ~ 0
DispCmdD2_3.3
Text Label 1100 3200 0    50   ~ 0
DispCmdD1_3.3
Text Label 1100 3100 0    50   ~ 0
DispCmdD0_3.3
Text Label 1100 3500 0    50   ~ 0
DispCmdD4_3.3
Text Label 1100 3600 0    50   ~ 0
DispCmdD5_3.3
Text Label 1100 3700 0    50   ~ 0
DispCmdD6_3.3
Text Label 1100 3800 0    50   ~ 0
DispCmdD7_3.3
Text Label 6750 7300 0    50   ~ 0
~EF~
Wire Wire Line
	7950 5100 7400 5100
Wire Wire Line
	7400 5100 7400 7300
Wire Wire Line
	5650 7300 7400 7300
Wire Wire Line
	8950 5200 9700 5200
Wire Wire Line
	9700 5200 9700 4400
Text Label 9200 5200 0    50   ~ 0
~EF_3.3~
Wire Wire Line
	9700 4400 650  4400
Wire Wire Line
	650  4400 650  2800
Wire Wire Line
	650  2800 1800 2800
Text Label 1100 2800 0    50   ~ 0
~EF_3.3~
Text Label 1100 2900 0    50   ~ 0
~DispCmdRD_3.3~
Wire Wire Line
	5650 6300 7300 6300
Text Label 6650 6300 0    50   ~ 0
~DispCmdRD_3.3~
Wire Wire Line
	7300 6300 7300 4500
Wire Wire Line
	7300 4500 750  4500
Wire Wire Line
	750  4500 750  2900
Wire Wire Line
	750  2900 1800 2900
Text Label 2700 6650 0    50   ~ 0
D7
Text Notes 4600 5450 0    50   ~ 0
Display command FIFO
Wire Wire Line
	7300 1300 10150 1300
Wire Wire Line
	10150 1400 8200 1400
Wire Wire Line
	8200 1400 8200 2000
Wire Wire Line
	10150 1500 8300 1500
Wire Wire Line
	8300 1500 8300 2700
Wire Wire Line
	7300 2700 8300 2700
Wire Wire Line
	10150 2000 8600 2000
Wire Wire Line
	8600 2000 8600 3600
Wire Wire Line
	8600 3600 3450 3600
Wire Wire Line
	10150 2100 8700 2100
Wire Wire Line
	8700 2100 8700 3700
Wire Wire Line
	8700 3700 3450 3700
$Comp
L device:R_Network08 RN601
U 1 1 61D2DFDD
P 6200 5900
F 0 "RN601" H 6580 5946 50  0000 L CNN
F 1 "10k" H 6580 5855 50  0000 L CNN
F 2 "Resistors_THT:R_Array_SIP9" V 6675 5900 50  0001 C CNN
F 3 "" H 6200 5900 50  0001 C CNN
	1    6200 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5700 5800 5550
$Comp
L power:VCC #PWR?
U 1 1 61C9D592
P 5800 5550
F 0 "#PWR?" H 5800 5400 50  0001 C CNN
F 1 "VCC" H 5817 5723 50  0000 C CNN
F 2 "" H 5800 5550 50  0001 C CNN
F 3 "" H 5800 5550 50  0001 C CNN
	1    5800 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 6100 5800 6400
Connection ~ 5800 6400
Wire Wire Line
	5800 6400 5650 6400
Wire Wire Line
	5900 6100 5900 6500
Connection ~ 5900 6500
Wire Wire Line
	5900 6500 5650 6500
Wire Wire Line
	6000 6100 6000 6600
Connection ~ 6000 6600
Wire Wire Line
	6000 6600 5650 6600
Wire Wire Line
	6100 6100 6100 6700
Connection ~ 6100 6700
Wire Wire Line
	6100 6700 5650 6700
Wire Wire Line
	6200 6100 6200 6800
Connection ~ 6200 6800
Wire Wire Line
	6200 6800 5650 6800
Wire Wire Line
	6300 6100 6300 6900
Connection ~ 6300 6900
Wire Wire Line
	6300 6900 5650 6900
Wire Wire Line
	6400 6100 6400 7000
Connection ~ 6400 7000
Wire Wire Line
	6400 7000 5650 7000
Wire Wire Line
	6500 6100 6500 7100
Wire Bus Line
	3400 6050 3400 8400
Wire Bus Line
	5350 900  5350 2600
Wire Bus Line
	4050 900  4050 3400
Wire Bus Line
	5450 800  5450 1900
Wire Bus Line
	3950 800  3950 3000
Wire Bus Line
	3850 700  3850 2600
Wire Bus Line
	5550 700  5550 1200
Wire Bus Line
	750  6750 750  8400
Wire Bus Line
	10000 4300 10000 7100
Wire Bus Line
	3750 6050 3750 7000
Wire Bus Line
	900  3200 900  4100
Connection ~ 6500 7100
Wire Wire Line
	6500 7100 5650 7100
Text Notes 6000 5700 0    50   ~ 0
Pull-up resistors ensure that\ninputs to U604 are at a valid\nlogic level when the FIFO is\nnot outputting data
$EndSCHEMATC
