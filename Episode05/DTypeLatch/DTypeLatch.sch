EESchema Schematic File Version 4
LIBS:DTypeLatch-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6400 6950 0    50   ~ 0
D-type transparent latch demo circuit
$Comp
L Switch:SW_Push SW1
U 1 1 5C5F0B03
P 950 1800
F 0 "SW1" H 950 2085 50  0000 C CNN
F 1 "SW_Push" H 950 1994 50  0000 C CNN
F 2 "" H 950 2000 50  0001 C CNN
F 3 "" H 950 2000 50  0001 C CNN
	1    950  1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  1800 650  1800
Wire Wire Line
	650  1800 650  2700
$Comp
L power:GND #PWR?
U 1 1 5C5F0BE2
P 650 2700
F 0 "#PWR?" H 650 2450 50  0001 C CNN
F 1 "GND" H 655 2527 50  0000 C CNN
F 2 "" H 650 2700 50  0001 C CNN
F 3 "" H 650 2700 50  0001 C CNN
	1    650  2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1800 1250 1800
$Comp
L 74xx:74HC14 U1
U 1 1 5C5F0C93
P 1650 1800
F 0 "U1" H 1650 2117 50  0000 C CNN
F 1 "74HC14" H 1650 2026 50  0000 C CNN
F 2 "" H 1650 1800 50  0001 C CNN
F 3 "" H 1650 1800 50  0001 C CNN
	1    1650 1800
	1    0    0    -1  
$EndComp
$Comp
L device:C C1
U 1 1 5C5F0D10
P 1250 2250
F 0 "C1" H 1365 2296 50  0000 L CNN
F 1 "0.1uF" H 1365 2205 50  0000 L CNN
F 2 "" H 1288 2100 50  0001 C CNN
F 3 "" H 1250 2250 50  0001 C CNN
	1    1250 2250
	1    0    0    -1  
$EndComp
$Comp
L device:R R1
U 1 1 5C5F0D64
P 1250 1500
F 0 "R1" H 1320 1546 50  0000 L CNN
F 1 "30K" H 1320 1455 50  0000 L CNN
F 2 "" V 1180 1500 50  0001 C CNN
F 3 "" H 1250 1500 50  0001 C CNN
	1    1250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2100 1250 1800
Connection ~ 1250 1800
Wire Wire Line
	1250 1800 1350 1800
Wire Wire Line
	1250 1650 1250 1800
Wire Wire Line
	1250 2400 1250 2700
$Comp
L power:GND #PWR?
U 1 1 5C5F0E66
P 1250 2700
F 0 "#PWR?" H 1250 2450 50  0001 C CNN
F 1 "GND" H 1255 2527 50  0000 C CNN
F 2 "" H 1250 2700 50  0001 C CNN
F 3 "" H 1250 2700 50  0001 C CNN
	1    1250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1350 1250 1250
$Comp
L power:VCC #PWR?
U 1 1 5C5F0F08
P 1250 1250
F 0 "#PWR?" H 1250 1100 50  0001 C CNN
F 1 "VCC" H 1267 1423 50  0000 C CNN
F 2 "" H 1250 1250 50  0001 C CNN
F 3 "" H 1250 1250 50  0001 C CNN
	1    1250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1800 2050 1800
$Comp
L device:R R3
U 1 1 5C5F1103
P 2050 2050
F 0 "R3" H 2120 2096 50  0000 L CNN
F 1 "R" H 2120 2005 50  0000 L CNN
F 2 "" V 1980 2050 50  0001 C CNN
F 3 "" H 2050 2050 50  0001 C CNN
	1    2050 2050
	1    0    0    -1  
$EndComp
$Comp
L device:LED D?
U 1 1 5C5F1189
P 2050 2450
F 0 "D?" V 2088 2333 50  0000 R CNN
F 1 "LED" V 1997 2333 50  0000 R CNN
F 2 "" H 2050 2450 50  0001 C CNN
F 3 "" H 2050 2450 50  0001 C CNN
	1    2050 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 1900 2050 1800
Connection ~ 2050 1800
Wire Wire Line
	2050 1800 2450 1800
Wire Wire Line
	2050 2300 2050 2200
Wire Wire Line
	2050 2600 2050 2700
$Comp
L power:GND #PWR?
U 1 1 5C5F14BC
P 2050 2700
F 0 "#PWR?" H 2050 2450 50  0001 C CNN
F 1 "GND" H 2055 2527 50  0000 C CNN
F 2 "" H 2050 2700 50  0001 C CNN
F 3 "" H 2050 2700 50  0001 C CNN
	1    2050 2700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5C5F1B8C
P 3100 1800
F 0 "SW2" H 3100 2085 50  0000 C CNN
F 1 "SW_Push" H 3100 1994 50  0000 C CNN
F 2 "" H 3100 2000 50  0001 C CNN
F 3 "" H 3100 2000 50  0001 C CNN
	1    3100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1800 2800 1800
Wire Wire Line
	2800 1800 2800 2700
$Comp
L power:GND #PWR?
U 1 1 5C5F1B95
P 2800 2700
F 0 "#PWR?" H 2800 2450 50  0001 C CNN
F 1 "GND" H 2805 2527 50  0000 C CNN
F 2 "" H 2800 2700 50  0001 C CNN
F 3 "" H 2800 2700 50  0001 C CNN
	1    2800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1800 3400 1800
$Comp
L 74xx:74HC14 U1
U 1 1 5C5F1B9C
P 3800 1800
F 0 "U1" H 3800 2117 50  0000 C CNN
F 1 "74HC14" H 3800 2026 50  0000 C CNN
F 2 "" H 3800 1800 50  0001 C CNN
F 3 "" H 3800 1800 50  0001 C CNN
	1    3800 1800
	1    0    0    -1  
$EndComp
$Comp
L device:C C2
U 1 1 5C5F1BA3
P 3400 2250
F 0 "C2" H 3515 2296 50  0000 L CNN
F 1 "0.1uF" H 3515 2205 50  0000 L CNN
F 2 "" H 3438 2100 50  0001 C CNN
F 3 "" H 3400 2250 50  0001 C CNN
	1    3400 2250
	1    0    0    -1  
$EndComp
$Comp
L device:R R2
U 1 1 5C5F1BAA
P 3400 1500
F 0 "R2" H 3470 1546 50  0000 L CNN
F 1 "30K" H 3470 1455 50  0000 L CNN
F 2 "" V 3330 1500 50  0001 C CNN
F 3 "" H 3400 1500 50  0001 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2100 3400 1800
Connection ~ 3400 1800
Wire Wire Line
	3400 1800 3500 1800
Wire Wire Line
	3400 1650 3400 1800
Wire Wire Line
	3400 2400 3400 2700
$Comp
L power:GND #PWR?
U 1 1 5C5F1BB6
P 3400 2700
F 0 "#PWR?" H 3400 2450 50  0001 C CNN
F 1 "GND" H 3405 2527 50  0000 C CNN
F 2 "" H 3400 2700 50  0001 C CNN
F 3 "" H 3400 2700 50  0001 C CNN
	1    3400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1350 3400 1250
$Comp
L power:VCC #PWR?
U 1 1 5C5F1BBD
P 3400 1250
F 0 "#PWR?" H 3400 1100 50  0001 C CNN
F 1 "VCC" H 3417 1423 50  0000 C CNN
F 2 "" H 3400 1250 50  0001 C CNN
F 3 "" H 3400 1250 50  0001 C CNN
	1    3400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1800 4200 1800
$Comp
L device:R R4
U 1 1 5C5F1BC4
P 4200 2050
F 0 "R4" H 4270 2096 50  0000 L CNN
F 1 "R" H 4270 2005 50  0000 L CNN
F 2 "" V 4130 2050 50  0001 C CNN
F 3 "" H 4200 2050 50  0001 C CNN
	1    4200 2050
	1    0    0    -1  
$EndComp
$Comp
L device:LED D?
U 1 1 5C5F1BCB
P 4200 2450
F 0 "D?" V 4238 2333 50  0000 R CNN
F 1 "LED" V 4147 2333 50  0000 R CNN
F 2 "" H 4200 2450 50  0001 C CNN
F 3 "" H 4200 2450 50  0001 C CNN
	1    4200 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 1900 4200 1800
Connection ~ 4200 1800
Wire Wire Line
	4200 1800 4600 1800
Wire Wire Line
	4200 2300 4200 2200
Wire Wire Line
	4200 2600 4200 2700
$Comp
L power:GND #PWR?
U 1 1 5C5F1BD7
P 4200 2700
F 0 "#PWR?" H 4200 2450 50  0001 C CNN
F 1 "GND" H 4205 2527 50  0000 C CNN
F 2 "" H 4200 2700 50  0001 C CNN
F 3 "" H 4200 2700 50  0001 C CNN
	1    4200 2700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U3
U 1 1 5C5F2268
P 7600 4100
F 0 "U3" H 7600 4425 50  0000 C CNN
F 1 "74HC00" H 7600 4334 50  0000 C CNN
F 2 "" H 7600 4100 50  0001 C CNN
F 3 "" H 7600 4100 50  0001 C CNN
	1    7600 4100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U3
U 2 1 5C5F22D8
P 7600 5100
F 0 "U3" H 7600 5425 50  0000 C CNN
F 1 "74HC00" H 7600 5334 50  0000 C CNN
F 2 "" H 7600 5100 50  0001 C CNN
F 3 "" H 7600 5100 50  0001 C CNN
	2    7600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4100 8150 4100
Wire Wire Line
	7900 5100 8150 5100
Wire Wire Line
	8150 4100 8150 4250
Connection ~ 8150 4100
Wire Wire Line
	8150 4250 7050 4900
Wire Wire Line
	7300 5000 7050 5000
Wire Wire Line
	7050 5000 7050 4900
Wire Wire Line
	8150 5100 8150 4950
Connection ~ 8150 5100
Wire Wire Line
	8150 4950 7050 4300
Wire Wire Line
	7300 4200 7050 4200
Wire Wire Line
	7050 4200 7050 4300
Wire Wire Line
	7300 4000 6600 4000
Wire Wire Line
	7300 5200 6600 5200
$Comp
L 74xx:74HC00 U2
U 4 1 5C5F5879
P 5250 4700
F 0 "U2" V 5204 4888 50  0000 L CNN
F 1 "74HC00" V 5295 4888 50  0000 L CNN
F 2 "" H 5250 4700 50  0001 C CNN
F 3 "" H 5250 4700 50  0001 C CNN
	4    5250 4700
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC00 U2
U 1 1 5C5F5E20
P 6300 4000
F 0 "U2" H 6300 4325 50  0000 C CNN
F 1 "74HC00" H 6300 4234 50  0000 C CNN
F 2 "" H 6300 4000 50  0001 C CNN
F 3 "" H 6300 4000 50  0001 C CNN
	1    6300 4000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U2
U 2 1 5C5F5E85
P 6300 5200
F 0 "U2" H 6300 5525 50  0000 C CNN
F 1 "74HC00" H 6300 5434 50  0000 C CNN
F 2 "" H 6300 5200 50  0001 C CNN
F 3 "" H 6300 5200 50  0001 C CNN
	2    6300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5300 5250 5300
Wire Wire Line
	5250 5300 5250 5000
Wire Wire Line
	6000 4100 5850 4100
Wire Wire Line
	6000 5100 5850 5100
Wire Wire Line
	5850 5100 5850 4100
Connection ~ 5850 4100
Wire Wire Line
	5150 4400 5150 4300
Wire Wire Line
	5150 4300 5250 4300
Wire Wire Line
	5250 4300 5250 3900
Wire Wire Line
	5350 4400 5350 4300
Wire Wire Line
	5350 4300 5250 4300
Connection ~ 5250 4300
Wire Wire Line
	6000 3900 5250 3900
Connection ~ 5250 3900
Text Label 5000 3900 0    50   ~ 0
D
Text Label 5000 4100 0    50   ~ 0
EN
Wire Wire Line
	2450 3900 2450 1800
Wire Wire Line
	2450 3900 5250 3900
Wire Wire Line
	4600 4100 4600 1800
Wire Wire Line
	4600 4100 5850 4100
$Comp
L device:R R5
U 1 1 5C5F2A33
P 9000 5350
F 0 "R5" H 9070 5396 50  0000 L CNN
F 1 "R" H 9070 5305 50  0000 L CNN
F 2 "" V 8930 5350 50  0001 C CNN
F 3 "" H 9000 5350 50  0001 C CNN
	1    9000 5350
	1    0    0    -1  
$EndComp
$Comp
L device:LED D3
U 1 1 5C5F2A3A
P 9000 5750
F 0 "D3" V 9038 5633 50  0000 R CNN
F 1 "LED" V 8947 5633 50  0000 R CNN
F 2 "" H 9000 5750 50  0001 C CNN
F 3 "" H 9000 5750 50  0001 C CNN
	1    9000 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9000 5600 9000 5500
Wire Wire Line
	9000 5900 9000 6000
$Comp
L power:GND #PWR?
U 1 1 5C5F2A43
P 9000 6000
F 0 "#PWR?" H 9000 5750 50  0001 C CNN
F 1 "GND" H 9005 5827 50  0000 C CNN
F 2 "" H 9000 6000 50  0001 C CNN
F 3 "" H 9000 6000 50  0001 C CNN
	1    9000 6000
	1    0    0    -1  
$EndComp
$Comp
L device:R R6
U 1 1 5C5F359B
P 9500 5350
F 0 "R6" H 9570 5396 50  0000 L CNN
F 1 "R" H 9570 5305 50  0000 L CNN
F 2 "" V 9430 5350 50  0001 C CNN
F 3 "" H 9500 5350 50  0001 C CNN
	1    9500 5350
	1    0    0    -1  
$EndComp
$Comp
L device:LED D4
U 1 1 5C5F35A2
P 9500 5750
F 0 "D4" V 9538 5633 50  0000 R CNN
F 1 "LED" V 9447 5633 50  0000 R CNN
F 2 "" H 9500 5750 50  0001 C CNN
F 3 "" H 9500 5750 50  0001 C CNN
	1    9500 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9500 5600 9500 5500
Wire Wire Line
	9500 5900 9500 6000
$Comp
L power:GND #PWR?
U 1 1 5C5F35AB
P 9500 6000
F 0 "#PWR?" H 9500 5750 50  0001 C CNN
F 1 "GND" H 9505 5827 50  0000 C CNN
F 2 "" H 9500 6000 50  0001 C CNN
F 3 "" H 9500 6000 50  0001 C CNN
	1    9500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4100 9000 5200
Wire Wire Line
	8150 4100 9000 4100
Wire Wire Line
	9500 5100 9500 5200
Wire Wire Line
	8150 5100 9500 5100
$Comp
L 74xx:74HC00 U2
U 3 1 5C5F5D5A
P 2050 7400
F 0 "U2" H 2050 7725 50  0000 C CNN
F 1 "74HC00" H 2050 7634 50  0000 C CNN
F 2 "" H 2050 7400 50  0001 C CNN
F 3 "" H 2050 7400 50  0001 C CNN
	3    2050 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U3
U 3 1 5C5F5EDC
P 2950 7400
F 0 "U3" H 2950 7725 50  0000 C CNN
F 1 "74HC00" H 2950 7634 50  0000 C CNN
F 2 "" H 2950 7400 50  0001 C CNN
F 3 "" H 2950 7400 50  0001 C CNN
	3    2950 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U3
U 4 1 5C5F5F5A
P 3850 7400
F 0 "U3" H 3850 7725 50  0000 C CNN
F 1 "74HC00" H 3850 7634 50  0000 C CNN
F 2 "" H 3850 7400 50  0001 C CNN
F 3 "" H 3850 7400 50  0001 C CNN
	4    3850 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 3 1 5C5F70A9
P 1600 6500
F 0 "U1" H 1600 6817 50  0000 C CNN
F 1 "74HC14" H 1600 6726 50  0000 C CNN
F 2 "" H 1600 6500 50  0001 C CNN
F 3 "" H 1600 6500 50  0001 C CNN
	3    1600 6500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 4 1 5C5F713D
P 2500 6500
F 0 "U1" H 2500 6817 50  0000 C CNN
F 1 "74HC14" H 2500 6726 50  0000 C CNN
F 2 "" H 2500 6500 50  0001 C CNN
F 3 "" H 2500 6500 50  0001 C CNN
	4    2500 6500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 5 1 5C5F71BE
P 3400 6500
F 0 "U1" H 3400 6817 50  0000 C CNN
F 1 "74HC14" H 3400 6726 50  0000 C CNN
F 2 "" H 3400 6500 50  0001 C CNN
F 3 "" H 3400 6500 50  0001 C CNN
	5    3400 6500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 6 1 5C5F7248
P 4300 6500
F 0 "U1" H 4300 6817 50  0000 C CNN
F 1 "74HC14" H 4300 6726 50  0000 C CNN
F 2 "" H 4300 6500 50  0001 C CNN
F 3 "" H 4300 6500 50  0001 C CNN
	6    4300 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6500 1200 6500
Wire Wire Line
	1200 6500 1200 6700
$Comp
L power:GND #PWR?
U 1 1 5C5F805F
P 1200 6700
F 0 "#PWR?" H 1200 6450 50  0001 C CNN
F 1 "GND" H 1205 6527 50  0000 C CNN
F 2 "" H 1200 6700 50  0001 C CNN
F 3 "" H 1200 6700 50  0001 C CNN
	1    1200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6500 2100 6500
Wire Wire Line
	2100 6500 2100 6700
$Comp
L power:GND #PWR?
U 1 1 5C5F8106
P 2100 6700
F 0 "#PWR?" H 2100 6450 50  0001 C CNN
F 1 "GND" H 2105 6527 50  0000 C CNN
F 2 "" H 2100 6700 50  0001 C CNN
F 3 "" H 2100 6700 50  0001 C CNN
	1    2100 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6500 3000 6500
Wire Wire Line
	3000 6500 3000 6700
$Comp
L power:GND #PWR?
U 1 1 5C5F8FDF
P 3000 6700
F 0 "#PWR?" H 3000 6450 50  0001 C CNN
F 1 "GND" H 3005 6527 50  0000 C CNN
F 2 "" H 3000 6700 50  0001 C CNN
F 3 "" H 3000 6700 50  0001 C CNN
	1    3000 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6500 3900 6500
Wire Wire Line
	3900 6500 3900 6700
$Comp
L power:GND #PWR?
U 1 1 5C5F9FFA
P 3900 6700
F 0 "#PWR?" H 3900 6450 50  0001 C CNN
F 1 "GND" H 3905 6527 50  0000 C CNN
F 2 "" H 3900 6700 50  0001 C CNN
F 3 "" H 3900 6700 50  0001 C CNN
	1    3900 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7300 1600 7300
Wire Wire Line
	1600 7300 1600 7500
Wire Wire Line
	1750 7500 1600 7500
Connection ~ 1600 7500
Wire Wire Line
	1600 7500 1600 7600
$Comp
L power:GND #PWR?
U 1 1 5C5FF0FA
P 1600 7600
F 0 "#PWR?" H 1600 7350 50  0001 C CNN
F 1 "GND" H 1605 7427 50  0000 C CNN
F 2 "" H 1600 7600 50  0001 C CNN
F 3 "" H 1600 7600 50  0001 C CNN
	1    1600 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 7300 2500 7300
Wire Wire Line
	2500 7300 2500 7500
Wire Wire Line
	2650 7500 2500 7500
Connection ~ 2500 7500
Wire Wire Line
	2500 7500 2500 7600
$Comp
L power:GND #PWR?
U 1 1 5C5FF1A7
P 2500 7600
F 0 "#PWR?" H 2500 7350 50  0001 C CNN
F 1 "GND" H 2505 7427 50  0000 C CNN
F 2 "" H 2500 7600 50  0001 C CNN
F 3 "" H 2500 7600 50  0001 C CNN
	1    2500 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 7300 3400 7300
Wire Wire Line
	3400 7300 3400 7500
Wire Wire Line
	3550 7500 3400 7500
Connection ~ 3400 7500
Wire Wire Line
	3400 7500 3400 7600
$Comp
L power:GND #PWR?
U 1 1 5C6008D9
P 3400 7600
F 0 "#PWR?" H 3400 7350 50  0001 C CNN
F 1 "GND" H 3405 7427 50  0000 C CNN
F 2 "" H 3400 7600 50  0001 C CNN
F 3 "" H 3400 7600 50  0001 C CNN
	1    3400 7600
	1    0    0    -1  
$EndComp
Text Notes 2650 6000 0    50   ~ 0
Unused gates
Wire Notes Line
	1000 7850 4700 7850
Wire Notes Line
	4700 7850 4700 5850
Wire Notes Line
	4700 5850 1000 5850
Wire Notes Line
	1000 5850 1000 7850
$Comp
L 74xx:74HC14 U1
U 7 1 5C60927E
P 1550 4950
F 0 "U1" H 1780 4996 50  0000 L CNN
F 1 "74HC14" H 1780 4905 50  0000 L CNN
F 2 "" H 1550 4950 50  0001 C CNN
F 3 "" H 1550 4950 50  0001 C CNN
	7    1550 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U2
U 5 1 5C6094A5
P 2400 4950
F 0 "U2" H 2630 4996 50  0000 L CNN
F 1 "74HC00" H 2630 4905 50  0000 L CNN
F 2 "" H 2400 4950 50  0001 C CNN
F 3 "" H 2400 4950 50  0001 C CNN
	5    2400 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U3
U 5 1 5C6095AE
P 3250 4950
F 0 "U3" H 3480 4996 50  0000 L CNN
F 1 "74HC00" H 3480 4905 50  0000 L CNN
F 2 "" H 3250 4950 50  0001 C CNN
F 3 "" H 3250 4950 50  0001 C CNN
	5    3250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4450 2400 4350
$Comp
L power:VCC #PWR?
U 1 1 5C60CD32
P 2400 4250
F 0 "#PWR?" H 2400 4100 50  0001 C CNN
F 1 "VCC" H 2417 4423 50  0000 C CNN
F 2 "" H 2400 4250 50  0001 C CNN
F 3 "" H 2400 4250 50  0001 C CNN
	1    2400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5450 2400 5550
$Comp
L power:GND #PWR?
U 1 1 5C60E8FE
P 2400 5600
F 0 "#PWR?" H 2400 5350 50  0001 C CNN
F 1 "GND" H 2405 5427 50  0000 C CNN
F 2 "" H 2400 5600 50  0001 C CNN
F 3 "" H 2400 5600 50  0001 C CNN
	1    2400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4450 1550 4350
Wire Wire Line
	1550 4350 2400 4350
Connection ~ 2400 4350
Wire Wire Line
	2400 4350 2400 4250
Wire Wire Line
	3250 4450 3250 4350
Wire Wire Line
	3250 4350 2400 4350
Wire Wire Line
	1550 5450 1550 5550
Wire Wire Line
	1550 5550 2400 5550
Connection ~ 2400 5550
Wire Wire Line
	2400 5550 2400 5600
Wire Wire Line
	3250 5450 3250 5550
Wire Wire Line
	3250 5550 2400 5550
$EndSCHEMATC
