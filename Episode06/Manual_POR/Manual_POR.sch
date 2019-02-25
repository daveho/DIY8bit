EESchema Schematic File Version 4
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
$Comp
L Switch:SW_Push SW1
U 1 1 5C733C0B
P 3000 3250
F 0 "SW1" H 3000 3535 50  0000 C CNN
F 1 "SW_Push" H 3000 3444 50  0000 C CNN
F 2 "" H 3000 3450 50  0001 C CNN
F 3 "" H 3000 3450 50  0001 C CNN
	1    3000 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3250 2600 3250
Wire Wire Line
	2600 3250 2600 2900
Wire Wire Line
	3200 3250 3600 3250
$Comp
L 74xx:74HC14 U1
U 1 1 5C733D3F
P 4300 3250
F 0 "U1" H 4300 3567 50  0000 C CNN
F 1 "74HC14" H 4300 3476 50  0000 C CNN
F 2 "" H 4300 3250 50  0001 C CNN
F 3 "" H 4300 3250 50  0001 C CNN
	1    4300 3250
	1    0    0    -1  
$EndComp
$Comp
L device:C C1
U 1 1 5C733D98
P 3600 2800
F 0 "C1" H 3715 2846 50  0000 L CNN
F 1 "0.1 uF" H 3715 2755 50  0000 L CNN
F 2 "" H 3638 2650 50  0001 C CNN
F 3 "" H 3600 2800 50  0001 C CNN
	1    3600 2800
	1    0    0    -1  
$EndComp
$Comp
L device:R R2
U 1 1 5C733DF0
P 3600 3650
F 0 "R2" H 3670 3696 50  0000 L CNN
F 1 "30K" H 3670 3605 50  0000 L CNN
F 2 "" V 3530 3650 50  0001 C CNN
F 3 "" H 3600 3650 50  0001 C CNN
	1    3600 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3800 3600 3900
$Comp
L power:GND #PWR?
U 1 1 5C733E84
P 3600 3900
F 0 "#PWR?" H 3600 3650 50  0001 C CNN
F 1 "GND" H 3605 3727 50  0000 C CNN
F 2 "" H 3600 3900 50  0001 C CNN
F 3 "" H 3600 3900 50  0001 C CNN
	1    3600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3500 3600 3250
Connection ~ 3600 3250
Wire Wire Line
	3600 3250 4000 3250
Wire Wire Line
	3600 2950 3600 3250
Wire Wire Line
	3600 2650 3600 2450
$Comp
L power:VCC #PWR?
U 1 1 5C733F64
P 3600 2450
F 0 "#PWR?" H 3600 2300 50  0001 C CNN
F 1 "VCC" H 3617 2623 50  0000 C CNN
F 2 "" H 3600 2450 50  0001 C CNN
F 3 "" H 3600 2450 50  0001 C CNN
	1    3600 2450
	1    0    0    -1  
$EndComp
$Comp
L device:R R1
U 1 1 5C73401E
P 2600 2750
F 0 "R1" H 2670 2796 50  0000 L CNN
F 1 "R" H 2670 2705 50  0000 L CNN
F 2 "" V 2530 2750 50  0001 C CNN
F 3 "" H 2600 2750 50  0001 C CNN
	1    2600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2600 2600 2500
$Comp
L power:VCC #PWR?
U 1 1 5C7340EC
P 2600 2500
F 0 "#PWR?" H 2600 2350 50  0001 C CNN
F 1 "VCC" H 2617 2673 50  0000 C CNN
F 2 "" H 2600 2500 50  0001 C CNN
F 3 "" H 2600 2500 50  0001 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3250 4750 3250
$Comp
L 74xx:74HC14 U1
U 2 1 5C734293
P 5200 3250
F 0 "U1" H 5200 3567 50  0000 C CNN
F 1 "74HC14" H 5200 3476 50  0000 C CNN
F 2 "" H 5200 3250 50  0001 C CNN
F 3 "" H 5200 3250 50  0001 C CNN
	2    5200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3250 6200 3250
Text Label 6000 3250 0    50   ~ 0
~RST
Wire Wire Line
	6200 2650 4750 2650
Wire Wire Line
	4750 2650 4750 3250
Connection ~ 4750 3250
Wire Wire Line
	4750 3250 4900 3250
Text Label 6000 2650 0    50   ~ 0
RST
Text Notes 1900 2100 0    50   ~ 0
R1 value can be 0 (about 300 us rise time on press) or\nhigher (e.g., 2.7K yields about 1 ms rise time on press).\nBut it should be significantly less than the value of R2,\nsince it forms a voltage divider, and we want to create\na high voltage at the first inverter's input when the switch\nis pressed.
Text Notes 6400 6950 0    50   ~ 0
Manual reset generation circuit
$EndSCHEMATC
