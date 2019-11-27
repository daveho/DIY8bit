EESchema Schematic File Version 4
LIBS:CircuitWithPeriphs-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
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
Text Notes 7100 6750 0    50   ~ 0
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
	2250 2400 1950 2400
Wire Wire Line
	2250 2500 1950 2500
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
Wire Wire Line
	2250 1900 1950 1900
Wire Wire Line
	2250 2000 1950 2000
Wire Wire Line
	2250 2100 1950 2100
Wire Wire Line
	2250 1600 1950 1600
Text HLabel 1950 1600 0    50   Input ~ 0
RST
Text HLabel 1950 1900 0    50   Input ~ 0
~82C55A_CS
Text HLabel 1950 2000 0    50   Input ~ 0
~RMEM
Text HLabel 1950 2100 0    50   Input ~ 0
~WMEM
Text HLabel 1950 2400 0    50   Input ~ 0
A0
Text HLabel 1950 2500 0    50   Input ~ 0
A1
Text HLabel 1950 2800 0    50   BiDi ~ 0
D0
Text HLabel 1950 2900 0    50   BiDi ~ 0
D1
Text HLabel 1950 3000 0    50   BiDi ~ 0
D2
Text HLabel 1950 3100 0    50   BiDi ~ 0
D3
Text HLabel 1950 3200 0    50   BiDi ~ 0
D4
Text HLabel 1950 3300 0    50   BiDi ~ 0
D5
Text HLabel 1950 3400 0    50   BiDi ~ 0
D6
Text HLabel 1950 3500 0    50   BiDi ~ 0
D7
$Comp
L device:C C301
U 1 1 5DDF2305
P 1150 6750
F 0 "C301" H 1265 6796 50  0000 L CNN
F 1 "C" H 1265 6705 50  0000 L CNN
F 2 "" H 1188 6600 50  0001 C CNN
F 3 "" H 1150 6750 50  0001 C CNN
	1    1150 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6600 1150 6450
Wire Wire Line
	1150 6450 1500 6450
Wire Wire Line
	1500 6450 1500 6350
Wire Wire Line
	1150 6900 1150 7000
Wire Wire Line
	1150 7000 1500 7000
Wire Wire Line
	1500 7000 1500 7100
$Comp
L power:VCC #PWR?
U 1 1 5DDF2BD6
P 1500 6350
F 0 "#PWR?" H 1500 6200 50  0001 C CNN
F 1 "VCC" H 1517 6523 50  0000 C CNN
F 2 "" H 1500 6350 50  0001 C CNN
F 3 "" H 1500 6350 50  0001 C CNN
	1    1500 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDF3131
P 1500 7100
F 0 "#PWR?" H 1500 6850 50  0001 C CNN
F 1 "GND" H 1505 6927 50  0000 C CNN
F 2 "" H 1500 7100 50  0001 C CNN
F 3 "" H 1500 7100 50  0001 C CNN
	1    1500 7100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
