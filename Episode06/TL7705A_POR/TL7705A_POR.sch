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
L Power_Management:TL7705 U1
U 1 1 5C715554
P 4850 3000
F 0 "U1" H 4850 3728 50  0000 C CNN
F 1 "TL7705A" H 4850 3637 50  0000 C CNN
F 2 "" H 4850 3000 50  0000 C CNN
F 3 "" H 4850 3000 50  0000 C CNN
	1    4850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2900 3250 2900
Wire Wire Line
	3250 2900 3250 2450
Wire Wire Line
	4850 2450 3250 2450
Connection ~ 3250 2450
Wire Wire Line
	3250 2450 3250 2050
$Comp
L power:VCC #PWR?
U 1 1 5C715601
P 3250 2050
F 0 "#PWR?" H 3250 1900 50  0001 C CNN
F 1 "VCC" H 3267 2223 50  0000 C CNN
F 2 "" H 3250 2050 50  0001 C CNN
F 3 "" H 3250 2050 50  0001 C CNN
	1    3250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3100 3000 3100
$Comp
L Switch:SW_Push SW1
U 1 1 5C715692
P 2700 3100
F 0 "SW1" H 2700 3385 50  0000 C CNN
F 1 "SW_Push" H 2700 3294 50  0000 C CNN
F 2 "" H 2700 3300 50  0001 C CNN
F 3 "" H 2700 3300 50  0001 C CNN
	1    2700 3100
	1    0    0    -1  
$EndComp
$Comp
L device:R R1
U 1 1 5C7156D9
P 3000 2800
F 0 "R1" H 3070 2846 50  0000 L CNN
F 1 "10K" H 3070 2755 50  0000 L CNN
F 2 "" V 2930 2800 50  0001 C CNN
F 3 "" H 3000 2800 50  0001 C CNN
	1    3000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2650 3000 2450
Wire Wire Line
	3000 2450 3250 2450
Wire Wire Line
	3000 2950 3000 3100
Connection ~ 3000 3100
Wire Wire Line
	3000 3100 2900 3100
Wire Wire Line
	2500 3100 2400 3100
Wire Wire Line
	2400 3100 2400 3800
$Comp
L power:GND #PWR?
U 1 1 5C7158DB
P 2400 3800
F 0 "#PWR?" H 2400 3550 50  0001 C CNN
F 1 "GND" H 2405 3627 50  0000 C CNN
F 2 "" H 2400 3800 50  0001 C CNN
F 3 "" H 2400 3800 50  0001 C CNN
	1    2400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3550 4850 3800
$Comp
L power:GND #PWR?
U 1 1 5C7159DD
P 4850 3800
F 0 "#PWR?" H 4850 3550 50  0001 C CNN
F 1 "GND" H 4855 3627 50  0000 C CNN
F 2 "" H 4850 3800 50  0001 C CNN
F 3 "" H 4850 3800 50  0001 C CNN
	1    4850 3800
	1    0    0    -1  
$EndComp
$Comp
L device:CP C2
U 1 1 5C715B43
P 3950 3550
F 0 "C2" H 4068 3596 50  0000 L CNN
F 1 "1 uF" H 4068 3505 50  0000 L CNN
F 2 "" H 3988 3400 50  0001 C CNN
F 3 "" H 3950 3550 50  0001 C CNN
	1    3950 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3250 3950 3250
Wire Wire Line
	3950 3250 3950 3400
Wire Wire Line
	3950 3700 3950 3800
$Comp
L power:GND #PWR?
U 1 1 5C715D65
P 3950 3800
F 0 "#PWR?" H 3950 3550 50  0001 C CNN
F 1 "GND" H 3955 3627 50  0000 C CNN
F 2 "" H 3950 3800 50  0001 C CNN
F 3 "" H 3950 3800 50  0001 C CNN
	1    3950 3800
	1    0    0    -1  
$EndComp
$Comp
L device:C C1
U 1 1 5C715F38
P 3450 3550
F 0 "C1" H 3565 3596 50  0000 L CNN
F 1 "0.1 uF" H 3565 3505 50  0000 L CNN
F 2 "" H 3488 3400 50  0001 C CNN
F 3 "" H 3450 3550 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2750 3450 2750
Wire Wire Line
	3450 2750 3450 3400
Wire Wire Line
	3450 3700 3450 3800
$Comp
L power:GND #PWR?
U 1 1 5C7161FD
P 3450 3800
F 0 "#PWR?" H 3450 3550 50  0001 C CNN
F 1 "GND" H 3455 3627 50  0000 C CNN
F 2 "" H 3450 3800 50  0001 C CNN
F 3 "" H 3450 3800 50  0001 C CNN
	1    3450 3800
	1    0    0    -1  
$EndComp
$Comp
L device:R R2
U 1 1 5C71663C
P 6000 2300
F 0 "R2" H 6070 2346 50  0000 L CNN
F 1 "10K" H 6070 2255 50  0000 L CNN
F 2 "" V 5930 2300 50  0001 C CNN
F 3 "" H 6000 2300 50  0001 C CNN
	1    6000 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2050 6000 2150
$Comp
L power:VCC #PWR?
U 1 1 5C71683D
P 6000 2050
F 0 "#PWR?" H 6000 1900 50  0001 C CNN
F 1 "VCC" H 6017 2223 50  0000 C CNN
F 2 "" H 6000 2050 50  0001 C CNN
F 3 "" H 6000 2050 50  0001 C CNN
	1    6000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3200 6000 3200
Wire Wire Line
	6000 2450 6000 3200
Connection ~ 6000 3200
Wire Wire Line
	6000 3200 6800 3200
Text Label 6600 3200 0    50   ~ 0
~RST
$Comp
L device:R R3
U 1 1 5C716BAD
P 5750 3550
F 0 "R3" H 5820 3596 50  0000 L CNN
F 1 "10K" H 5820 3505 50  0000 L CNN
F 2 "" V 5680 3550 50  0001 C CNN
F 3 "" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2800 5750 2800
Text Label 6600 2800 0    50   ~ 0
RST
Wire Wire Line
	5750 3700 5750 3800
$Comp
L power:GND #PWR?
U 1 1 5C71701A
P 5750 3800
F 0 "#PWR?" H 5750 3550 50  0001 C CNN
F 1 "GND" H 5755 3627 50  0000 C CNN
F 2 "" H 5750 3800 50  0001 C CNN
F 3 "" H 5750 3800 50  0001 C CNN
	1    5750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3400 5750 2800
Connection ~ 5750 2800
Wire Wire Line
	5750 2800 6800 2800
Text Notes 3650 4450 0    50   ~ 0
This circuit is almost exactly the one presented in\nthe datasheet.  I added a pushbutton switch to\nallow manual reset generation.
Text Notes 6400 6950 0    50   ~ 0
TL7705A power-on reset circuit
$EndSCHEMATC