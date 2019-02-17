EESchema Schematic File Version 4
LIBS:RC_POR-cache
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
Wire Wire Line
	3500 4300 3500 4550
$Comp
L power:GND #PWR?
U 1 1 5C683F69
P 3500 4550
F 0 "#PWR?" H 3500 4300 50  0001 C CNN
F 1 "GND" H 3505 4377 50  0000 C CNN
F 2 "" H 3500 4550 50  0001 C CNN
F 3 "" H 3500 4550 50  0001 C CNN
	1    3500 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 1 1 5C684013
P 4250 3650
F 0 "U1" H 4250 3967 50  0000 C CNN
F 1 "74HC14" H 4250 3876 50  0000 C CNN
F 2 "" H 4250 3650 50  0001 C CNN
F 3 "" H 4250 3650 50  0001 C CNN
	1    4250 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 2 1 5C6840A2
P 5200 3650
F 0 "U1" H 5200 3967 50  0000 C CNN
F 1 "74HC14" H 5200 3876 50  0000 C CNN
F 2 "" H 5200 3650 50  0001 C CNN
F 3 "" H 5200 3650 50  0001 C CNN
	2    5200 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4000 3500 3650
Wire Wire Line
	3500 3650 3950 3650
Wire Wire Line
	4550 3650 4750 3650
Wire Wire Line
	5500 3650 5950 3650
Text Label 5750 3650 0    50   ~ 0
~RST
Wire Wire Line
	5950 3150 4750 3150
Wire Wire Line
	4750 3150 4750 3650
Connection ~ 4750 3650
Wire Wire Line
	4750 3650 4900 3650
Text Label 5750 3150 0    50   ~ 0
RST
$Comp
L device:R R1
U 1 1 5C6841D7
P 3500 3050
F 0 "R1" H 3570 3096 50  0000 L CNN
F 1 "50K" H 3570 3005 50  0000 L CNN
F 2 "" V 3430 3050 50  0001 C CNN
F 3 "" H 3500 3050 50  0001 C CNN
	1    3500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3200 3500 3350
Connection ~ 3500 3650
Wire Wire Line
	3500 2900 3500 2700
$Comp
L power:VCC #PWR?
U 1 1 5C6843BE
P 3500 2550
F 0 "#PWR?" H 3500 2400 50  0001 C CNN
F 1 "VCC" H 3517 2723 50  0000 C CNN
F 2 "" H 3500 2550 50  0001 C CNN
F 3 "" H 3500 2550 50  0001 C CNN
	1    3500 2550
	1    0    0    -1  
$EndComp
$Comp
L device:D D1
U 1 1 5C68446C
P 2950 3050
F 0 "D1" V 2904 3129 50  0000 L CNN
F 1 "1N4001" V 2995 3129 50  0000 L CNN
F 2 "" H 2950 3050 50  0001 C CNN
F 3 "" H 2950 3050 50  0001 C CNN
	1    2950 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 3200 2950 3350
Wire Wire Line
	2950 3350 3500 3350
Connection ~ 3500 3350
Wire Wire Line
	3500 3350 3500 3650
Wire Wire Line
	2950 2900 2950 2700
Wire Wire Line
	2950 2700 3500 2700
Connection ~ 3500 2700
Wire Wire Line
	3500 2700 3500 2550
Text Notes 6400 6950 0    50   ~ 0
RC power on reset circuit
Text Notes 2400 5250 0    50   ~ 0
The resistor and capacitor values are chosen with the goal\nthat the RC time constant is about 50 ms.  You can use either\na polarized or non-polarized capacitor, but if you use a\npolarized capacitor, make sure it's wired with its negative\nterminal connected to ground.
Text Notes 1700 3200 0    50   ~ 0
Make sure this diode has\na reasonably small forward\nvoltage, and also that it can\npass enough current to\ndischarge the capacitor.
$Comp
L device:CP C1
U 1 1 5C69625F
P 3500 4150
F 0 "C1" H 3618 4196 50  0000 L CNN
F 1 "1 uF" H 3618 4105 50  0000 L CNN
F 2 "" H 3538 4000 50  0001 C CNN
F 3 "" H 3500 4150 50  0001 C CNN
	1    3500 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
