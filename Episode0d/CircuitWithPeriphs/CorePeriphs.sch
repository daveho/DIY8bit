EESchema Schematic File Version 4
LIBS:CircuitWithPeriphs-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface:82C55A U301
U 1 1 5DDEFE9D
P 2950 2900
F 0 "U301" H 2950 4678 50  0000 C CNN
F 1 "82C55A" H 2950 4587 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 2950 3200 50  0001 C CNN
F 3 "http://jap.hu/electronic/8255.pdf" H 2950 3200 50  0001 C CNN
	1    2950 2900
	1    0    0    -1  
$EndComp
Text Notes 6350 6950 0    50   ~ 0
core peripheral devices
Wire Wire Line
	2950 1300 3200 1300
Wire Wire Line
	3200 1300 3200 1100
$Comp
L power:VCC #PWR?
U 1 1 5DDF094E
P 3200 1100
F 0 "#PWR?" H 3200 950 50  0001 C CNN
F 1 "VCC" H 3217 1273 50  0000 C CNN
F 2 "" H 3200 1100 50  0001 C CNN
F 3 "" H 3200 1100 50  0001 C CNN
	1    3200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 2950 4650
$Comp
L power:GND #PWR?
U 1 1 5DDF0EA8
P 2950 4650
F 0 "#PWR?" H 2950 4400 50  0001 C CNN
F 1 "GND" H 2955 4477 50  0000 C CNN
F 2 "" H 2950 4650 50  0001 C CNN
F 3 "" H 2950 4650 50  0001 C CNN
	1    2950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2400 850  2400
Wire Wire Line
	2250 2500 850  2500
Wire Wire Line
	2250 1900 1950 1900
Wire Wire Line
	2250 2000 850  2000
Wire Wire Line
	2250 2100 850  2100
Wire Wire Line
	2250 1600 1950 1600
Text HLabel 1950 1600 0    50   Input ~ 0
RST
Text HLabel 1950 1900 0    50   Input ~ 0
~82C55A_CS
Text HLabel 850  2000 0    50   Input ~ 0
~RMEM
Text HLabel 850  2100 0    50   Input ~ 0
~WMEM
Text HLabel 850  2400 0    50   Input ~ 0
A0
Text HLabel 850  2500 0    50   Input ~ 0
A1
Text HLabel 1450 6050 0    50   BiDi ~ 0
D0
Text HLabel 1450 6150 0    50   BiDi ~ 0
D1
Text HLabel 1450 6250 0    50   BiDi ~ 0
D2
Text HLabel 1450 6350 0    50   BiDi ~ 0
D3
Text HLabel 1450 6450 0    50   BiDi ~ 0
D4
Text HLabel 1450 6550 0    50   BiDi ~ 0
D5
Text HLabel 1450 6650 0    50   BiDi ~ 0
D6
Text HLabel 1450 6750 0    50   BiDi ~ 0
D7
$Comp
L device:C C301
U 1 1 5DDF2305
P 3800 7050
F 0 "C301" H 3915 7096 50  0000 L CNN
F 1 "C" H 3915 7005 50  0000 L CNN
F 2 "" H 3838 6900 50  0001 C CNN
F 3 "" H 3800 7050 50  0001 C CNN
	1    3800 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6900 3800 6750
Wire Wire Line
	3800 6750 4150 6750
Wire Wire Line
	4150 6750 4150 6650
Wire Wire Line
	3800 7200 3800 7300
Wire Wire Line
	3800 7300 4150 7300
Wire Wire Line
	4150 7300 4150 7400
$Comp
L power:VCC #PWR?
U 1 1 5DDF2BD6
P 4150 6650
F 0 "#PWR?" H 4150 6500 50  0001 C CNN
F 1 "VCC" H 4167 6823 50  0000 C CNN
F 2 "" H 4150 6650 50  0001 C CNN
F 3 "" H 4150 6650 50  0001 C CNN
	1    4150 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDF3131
P 4150 7400
F 0 "#PWR?" H 4150 7150 50  0001 C CNN
F 1 "GND" H 4155 7227 50  0000 C CNN
F 2 "" H 4150 7400 50  0001 C CNN
F 3 "" H 4150 7400 50  0001 C CNN
	1    4150 7400
	1    0    0    -1  
$EndComp
$Comp
L intel:82C54 U302
U 1 1 5DE12B9A
P 5750 2300
F 0 "U302" H 5750 3478 50  0000 C CNN
F 1 "82C54" H 5750 3387 50  0000 C CNN
F 2 "Housings_DIP:DIP-24_W15.24mm" H 5800 2550 50  0001 C CNN
F 3 "http://download.intel.com/design/archives/periphrl/docs/23124406.pdf" H 5300 3200 50  0001 C CNN
	1    5750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2800 1950 2800
Wire Wire Line
	2250 2900 1950 2900
Wire Wire Line
	2250 3000 1950 3000
Wire Wire Line
	2250 3100 1950 3100
Wire Wire Line
	2250 3200 1950 3200
Wire Wire Line
	2250 3300 1950 3300
Wire Wire Line
	2250 3400 1950 3400
Wire Wire Line
	2250 3500 1950 3500
Text Label 2050 2800 0    50   ~ 0
D0
Text Label 2050 2900 0    50   ~ 0
D1
Text Label 2050 3000 0    50   ~ 0
D2
Text Label 2050 3100 0    50   ~ 0
D3
Text Label 2050 3200 0    50   ~ 0
D4
Text Label 2050 3300 0    50   ~ 0
D5
Text Label 2050 3400 0    50   ~ 0
D6
Text Label 2050 3500 0    50   ~ 0
D7
Wire Wire Line
	1750 6050 1450 6050
Wire Wire Line
	1750 6150 1450 6150
Wire Wire Line
	1750 6250 1450 6250
Wire Wire Line
	1750 6350 1450 6350
Wire Wire Line
	1750 6450 1450 6450
Wire Wire Line
	1750 6550 1450 6550
Wire Wire Line
	1750 6650 1450 6650
Wire Wire Line
	1750 6750 1450 6750
Text Label 1550 6050 0    50   ~ 0
D0
Text Label 1550 6150 0    50   ~ 0
D1
Text Label 1550 6250 0    50   ~ 0
D2
Text Label 1550 6350 0    50   ~ 0
D3
Text Label 1550 6450 0    50   ~ 0
D4
Text Label 1550 6550 0    50   ~ 0
D5
Text Label 1550 6650 0    50   ~ 0
D6
Text Label 1550 6750 0    50   ~ 0
D7
Entry Wire Line
	1850 2900 1950 2800
Entry Wire Line
	1850 3000 1950 2900
Entry Wire Line
	1850 3100 1950 3000
Entry Wire Line
	1850 3200 1950 3100
Entry Wire Line
	1850 3300 1950 3200
Entry Wire Line
	1850 3400 1950 3300
Entry Wire Line
	1850 3500 1950 3400
Entry Wire Line
	1850 3600 1950 3500
Entry Wire Line
	1750 6050 1850 5950
Entry Wire Line
	1750 6150 1850 6050
Entry Wire Line
	1750 6250 1850 6150
Entry Wire Line
	1750 6350 1850 6250
Entry Wire Line
	1750 6450 1850 6350
Entry Wire Line
	1750 6550 1850 6450
Entry Wire Line
	1750 6650 1850 6550
Entry Wire Line
	1750 6750 1850 6650
Wire Wire Line
	5150 1600 4850 1600
Wire Wire Line
	5150 1700 4850 1700
Wire Wire Line
	5150 1800 4850 1800
Wire Wire Line
	5150 1900 4850 1900
Wire Wire Line
	5150 2000 4850 2000
Wire Wire Line
	5150 2100 4850 2100
Wire Wire Line
	5150 2200 4850 2200
Wire Wire Line
	5150 2300 4850 2300
Text Label 4950 1600 0    50   ~ 0
D0
Text Label 4950 1700 0    50   ~ 0
D1
Text Label 4950 1800 0    50   ~ 0
D2
Text Label 4950 1900 0    50   ~ 0
D3
Text Label 4950 2000 0    50   ~ 0
D4
Text Label 4950 2100 0    50   ~ 0
D5
Text Label 4950 2200 0    50   ~ 0
D6
Text Label 4950 2300 0    50   ~ 0
D7
Entry Wire Line
	4750 1700 4850 1600
Entry Wire Line
	4750 1800 4850 1700
Entry Wire Line
	4750 1900 4850 1800
Entry Wire Line
	4750 2000 4850 1900
Entry Wire Line
	4750 2100 4850 2000
Entry Wire Line
	4750 2200 4850 2100
Entry Wire Line
	4750 2300 4850 2200
Entry Wire Line
	4750 2400 4850 2300
Text Label 950  2000 0    50   ~ 0
~RMEM
Text Label 950  2100 0    50   ~ 0
~WMEM
Entry Bus Bus
	1850 5800 1950 5700
Entry Bus Bus
	4650 5700 4750 5600
Wire Bus Line
	4650 5700 1950 5700
Wire Wire Line
	5150 2500 4850 2500
Wire Wire Line
	5150 2600 4850 2600
Text Label 4900 2500 0    50   ~ 0
~RMEM
Text Label 4900 2600 0    50   ~ 0
~WMEM
Text Label 950  2400 0    50   ~ 0
A0
Text Label 950  2500 0    50   ~ 0
A1
Wire Wire Line
	5150 2700 4850 2700
Wire Wire Line
	5150 2800 4850 2800
Text Label 4900 2700 0    50   ~ 0
A0
Text Label 4900 2800 0    50   ~ 0
A1
Wire Wire Line
	5750 1300 5950 1300
Wire Wire Line
	5950 1300 5950 1100
$Comp
L power:VCC #PWR?
U 1 1 5DE1D53F
P 5950 1100
F 0 "#PWR?" H 5950 950 50  0001 C CNN
F 1 "VCC" H 5967 1273 50  0000 C CNN
F 2 "" H 5950 1100 50  0001 C CNN
F 3 "" H 5950 1100 50  0001 C CNN
	1    5950 1100
	1    0    0    -1  
$EndComp
Text HLabel 1100 5050 0    50   Input ~ 0
~82C54_CS
Wire Wire Line
	5150 3000 4650 3000
Wire Wire Line
	4650 3000 4650 5050
Wire Wire Line
	4650 5050 1100 5050
Wire Wire Line
	5750 3300 5750 3450
$Comp
L power:GND #PWR?
U 1 1 5DE1F2AE
P 5750 3450
F 0 "#PWR?" H 5750 3200 50  0001 C CNN
F 1 "GND" H 5755 3277 50  0000 C CNN
F 2 "" H 5750 3450 50  0001 C CNN
F 3 "" H 5750 3450 50  0001 C CNN
	1    5750 3450
	1    0    0    -1  
$EndComp
$Comp
L device:C C302
U 1 1 5DE2565C
P 4450 7050
F 0 "C302" H 4565 7096 50  0000 L CNN
F 1 "C" H 4565 7005 50  0000 L CNN
F 2 "" H 4488 6900 50  0001 C CNN
F 3 "" H 4450 7050 50  0001 C CNN
	1    4450 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 6900 4450 6750
Wire Wire Line
	4450 6750 4150 6750
Connection ~ 4150 6750
Wire Wire Line
	4450 7200 4450 7300
Wire Wire Line
	4450 7300 4150 7300
Connection ~ 4150 7300
Wire Wire Line
	6350 2800 6500 2800
Wire Wire Line
	6500 2800 6500 2300
$Comp
L power:VCC #PWR?
U 1 1 5DE3C94B
P 6500 1100
F 0 "#PWR?" H 6500 950 50  0001 C CNN
F 1 "VCC" H 6517 1273 50  0000 C CNN
F 2 "" H 6500 1100 50  0001 C CNN
F 3 "" H 6500 1100 50  0001 C CNN
	1    6500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1800 6500 1800
Connection ~ 6500 1800
Wire Wire Line
	6500 1800 6500 1100
Wire Wire Line
	6350 2300 6500 2300
Connection ~ 6500 2300
Wire Wire Line
	6500 2300 6500 1800
Text HLabel 6100 700  0    50   Input ~ 0
E
Wire Wire Line
	6350 2700 6600 2700
Wire Wire Line
	6600 2700 6600 2200
Wire Wire Line
	6600 700  6100 700 
Wire Wire Line
	6350 1700 6600 1700
Connection ~ 6600 1700
Wire Wire Line
	6600 1700 6600 700 
Wire Wire Line
	6350 2200 6600 2200
Connection ~ 6600 2200
Wire Wire Line
	6600 2200 6600 1700
Wire Wire Line
	6350 1900 7000 1900
Wire Wire Line
	6350 2400 7000 2400
Wire Wire Line
	6350 2900 7000 2900
Wire Bus Line
	4750 1700 4750 5600
Wire Bus Line
	1850 2900 1850 6650
$EndSCHEMATC
