EESchema Schematic File Version 4
LIBS:GlueLogic-cache
EELAYER 26 0
EELAYER END
$Descr USLegal 14000 8500
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
L ya68k:MAX708 U101
U 1 1 5C75F605
P 2600 2050
F 0 "U101" H 2600 2537 60  0000 C CNN
F 1 "MAX708" H 2600 2431 60  0000 C CNN
F 2 "" H 2600 2050 60  0000 C CNN
F 3 "" H 2600 2050 60  0000 C CNN
	1    2600 2050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW101
U 1 1 5C75F6AB
P 1500 2150
F 0 "SW101" H 1500 2435 50  0000 C CNN
F 1 "SW_Push" H 1500 2344 50  0000 C CNN
F 2 "" H 1500 2350 50  0001 C CNN
F 3 "" H 1500 2350 50  0001 C CNN
	1    1500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1850 1850 1850
Wire Wire Line
	1850 1850 1850 1600
$Comp
L power:VCC #PWR?
U 1 1 5C75F779
P 1850 1600
F 0 "#PWR?" H 1850 1450 50  0001 C CNN
F 1 "VCC" H 1867 1773 50  0000 C CNN
F 2 "" H 1850 1600 50  0001 C CNN
F 3 "" H 1850 1600 50  0001 C CNN
	1    1850 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1950 1850 1950
Wire Wire Line
	1850 1950 1850 2300
Wire Wire Line
	2000 2300 1850 2300
Connection ~ 1850 2300
Wire Wire Line
	1850 2300 1850 2600
$Comp
L power:GND #PWR?
U 1 1 5C75F7FD
P 1850 2600
F 0 "#PWR?" H 1850 2350 50  0001 C CNN
F 1 "GND" H 1855 2427 50  0000 C CNN
F 2 "" H 1850 2600 50  0001 C CNN
F 3 "" H 1850 2600 50  0001 C CNN
	1    1850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2150 1700 2150
Wire Wire Line
	1300 2150 1150 2150
Wire Wire Line
	1150 2150 1150 2600
$Comp
L power:GND #PWR?
U 1 1 5C75F8DD
P 1150 2600
F 0 "#PWR?" H 1150 2350 50  0001 C CNN
F 1 "GND" H 1155 2427 50  0000 C CNN
F 2 "" H 1150 2600 50  0001 C CNN
F 3 "" H 1150 2600 50  0001 C CNN
	1    1150 2600
	1    0    0    -1  
$EndComp
$Comp
L HD6809:HD6809 U102
U 1 1 5C75F94A
P 2650 4500
F 0 "U102" H 2650 5815 50  0000 C CNN
F 1 "HD6809" H 2650 5724 50  0000 C CNN
F 2 "MODULE" H 2650 4500 50  0001 C CNN
F 3 "DOCUMENTATION" H 2650 4500 50  0001 C CNN
	1    2650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3850 3900 3850
Wire Wire Line
	3900 3850 3900 1850
Wire Wire Line
	3900 1850 3200 1850
$Comp
L device:LED D101
U 1 1 5C75FCE0
P 3550 1550
F 0 "D101" V 3588 1433 50  0000 R CNN
F 1 "LED" V 3497 1433 50  0000 R CNN
F 2 "" H 3550 1550 50  0001 C CNN
F 3 "" H 3550 1550 50  0001 C CNN
	1    3550 1550
	0    -1   -1   0   
$EndComp
$Comp
L device:R R101
U 1 1 5C75FF29
P 3550 1150
F 0 "R101" H 3620 1196 50  0000 L CNN
F 1 "R" H 3620 1105 50  0000 L CNN
F 2 "" V 3480 1150 50  0001 C CNN
F 3 "" H 3550 1150 50  0001 C CNN
	1    3550 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1300 3550 1400
Wire Wire Line
	3550 1700 3550 1950
Wire Wire Line
	3550 1950 3200 1950
Wire Wire Line
	3550 1000 3550 900 
$Comp
L power:VCC #PWR?
U 1 1 5C7602CB
P 3550 900
F 0 "#PWR?" H 3550 750 50  0001 C CNN
F 1 "VCC" H 3567 1073 50  0000 C CNN
F 2 "" H 3550 900 50  0001 C CNN
F 3 "" H 3550 900 50  0001 C CNN
	1    3550 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3550 1150 3550
Wire Wire Line
	750  3550 750  3800
$Comp
L power:GND #PWR?
U 1 1 5C7606DF
P 750 3800
F 0 "#PWR?" H 750 3550 50  0001 C CNN
F 1 "GND" H 755 3627 50  0000 C CNN
F 2 "" H 750 3800 50  0001 C CNN
F 3 "" H 750 3800 50  0001 C CNN
	1    750  3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4150 1150 4150
Wire Wire Line
	950  4150 950  3350
$Comp
L power:VCC #PWR?
U 1 1 5C7608FA
P 950 3350
F 0 "#PWR?" H 950 3200 50  0001 C CNN
F 1 "VCC" H 967 3523 50  0000 C CNN
F 2 "" H 950 3350 50  0001 C CNN
F 3 "" H 950 3350 50  0001 C CNN
	1    950  3350
	1    0    0    -1  
$EndComp
$Comp
L device:C C101
U 1 1 5C760940
P 1150 3850
F 0 "C101" H 1265 3896 50  0000 L CNN
F 1 "0.1 uF" H 1265 3805 50  0000 L CNN
F 2 "" H 1188 3700 50  0001 C CNN
F 3 "" H 1150 3850 50  0001 C CNN
	1    1150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3700 1150 3550
Connection ~ 1150 3550
Wire Wire Line
	1150 3550 750  3550
Wire Wire Line
	1150 4000 1150 4150
Connection ~ 1150 4150
Wire Wire Line
	1150 4150 950  4150
Wire Wire Line
	3400 3550 4050 3550
Wire Wire Line
	4050 3550 4050 3350
$Comp
L power:VCC #PWR?
U 1 1 5C7612ED
P 4050 3350
F 0 "#PWR?" H 4050 3200 50  0001 C CNN
F 1 "VCC" H 4067 3523 50  0000 C CNN
F 2 "" H 4050 3350 50  0001 C CNN
F 3 "" H 4050 3350 50  0001 C CNN
	1    4050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4250 4050 4250
Wire Wire Line
	4050 4250 4050 3950
Connection ~ 4050 3550
$Comp
L device:Crystal Y101
U 1 1 5C761656
P 4450 3500
F 0 "Y101" V 4404 3631 50  0000 L CNN
F 1 "Crystal" V 4495 3631 50  0000 L CNN
F 2 "" H 4450 3500 50  0001 C CNN
F 3 "" H 4450 3500 50  0001 C CNN
	1    4450 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3250 4450 3350
Wire Wire Line
	4450 3750 4450 3650
$Comp
L device:C C102
U 1 1 5C762218
P 5000 3250
F 0 "C102" V 4748 3250 50  0000 C CNN
F 1 "22 pF" V 4839 3250 50  0000 C CNN
F 2 "" H 5038 3100 50  0001 C CNN
F 3 "" H 5000 3250 50  0001 C CNN
	1    5000 3250
	0    1    1    0   
$EndComp
$Comp
L device:C C103
U 1 1 5C7622D8
P 5000 3750
F 0 "C103" V 4748 3750 50  0000 C CNN
F 1 "22 pF" V 4839 3750 50  0000 C CNN
F 2 "" H 5038 3600 50  0001 C CNN
F 3 "" H 5000 3750 50  0001 C CNN
	1    5000 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3250 4450 3250
Wire Wire Line
	4850 3750 4450 3750
Wire Wire Line
	5150 3250 5300 3250
Wire Wire Line
	5300 3250 5300 3750
Wire Wire Line
	5150 3750 5300 3750
Connection ~ 5300 3750
Wire Wire Line
	5300 3750 5300 3850
$Comp
L power:GND #PWR?
U 1 1 5C763B6F
P 5300 3850
F 0 "#PWR?" H 5300 3600 50  0001 C CNN
F 1 "GND" H 5305 3677 50  0000 C CNN
F 2 "" H 5300 3850 50  0001 C CNN
F 3 "" H 5300 3850 50  0001 C CNN
	1    5300 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3850 1600 3850
Wire Wire Line
	1600 3850 1600 3750
$Comp
L power:VCC #PWR?
U 1 1 5C7649A9
P 1600 3350
F 0 "#PWR?" H 1600 3200 50  0001 C CNN
F 1 "VCC" H 1617 3523 50  0000 C CNN
F 2 "" H 1600 3350 50  0001 C CNN
F 3 "" H 1600 3350 50  0001 C CNN
	1    1600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3750 4450 3750
Connection ~ 4450 3750
Wire Wire Line
	4450 3250 4250 3250
Wire Wire Line
	4250 3250 4250 3650
Wire Wire Line
	4250 3650 3400 3650
Connection ~ 4450 3250
Wire Wire Line
	1900 3750 1600 3750
Connection ~ 1600 3750
Wire Wire Line
	1600 3750 1600 3650
Wire Wire Line
	1900 3650 1600 3650
Connection ~ 1600 3650
Wire Wire Line
	1600 3650 1600 3350
Text Notes 4100 2900 0    50   ~ 0
Crystal frequency should be between 2 and 4 MHz.\nI used 3.6864 MHz.
Text Notes 3900 1350 0    50   ~ 0
You can omit the LED and resistor.  I add it as\na power indicator, and also a reset indicator\n(the LED turns off when reset is asserted.)\nUsing a high-efficiency LED and limiting the\ncurrent to a few mA is a good idea.
Text Notes 9350 6900 0    50   ~ 0
6809 + glue logic
Text Notes 1950 3050 0    50   ~ 0
CPU could also be MC6809 or HD6309.
Wire Wire Line
	3400 3950 4050 3950
Connection ~ 4050 3950
Wire Wire Line
	4050 3950 4050 3550
$Comp
L 74xx:74HC00 U103
U 2 1 5C83178A
P 8000 1200
F 0 "U103" H 8000 1525 50  0000 C CNN
F 1 "74HCT00" H 8000 1434 50  0000 C CNN
F 2 "" H 8000 1200 50  0001 C CNN
F 3 "" H 8000 1200 50  0001 C CNN
	2    8000 1200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U103
U 1 1 5C831929
P 8000 1800
F 0 "U103" H 8000 2125 50  0000 C CNN
F 1 "74HCT00" H 8000 2034 50  0000 C CNN
F 2 "" H 8000 1800 50  0001 C CNN
F 3 "" H 8000 1800 50  0001 C CNN
	1    8000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4150 6150 1100
Wire Wire Line
	6150 1100 7500 1100
Wire Wire Line
	7700 1700 7500 1700
Wire Wire Line
	7500 1700 7500 1100
Connection ~ 7500 1100
Wire Wire Line
	7500 1100 7700 1100
Wire Wire Line
	3400 4150 6150 4150
$Comp
L 74xx:74HC00 U103
U 4 1 5C837285
P 7050 1900
F 0 "U103" H 7050 2225 50  0000 C CNN
F 1 "74HCT00" H 7050 2134 50  0000 C CNN
F 2 "" H 7050 1900 50  0001 C CNN
F 3 "" H 7050 1900 50  0001 C CNN
	4    7050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4350 6350 4350
Wire Wire Line
	6350 4350 6350 1900
Wire Wire Line
	6350 1300 7700 1300
Wire Wire Line
	6750 1800 6650 1800
Wire Wire Line
	6650 1800 6650 1900
Wire Wire Line
	6650 2000 6750 2000
Wire Wire Line
	6350 1900 6650 1900
Connection ~ 6350 1900
Wire Wire Line
	6350 1900 6350 1300
Connection ~ 6650 1900
Wire Wire Line
	6650 1900 6650 2000
Wire Wire Line
	7350 1900 7700 1900
Wire Wire Line
	8300 1200 10450 1200
Wire Wire Line
	8300 1800 10450 1800
Text Label 10200 1200 0    50   ~ 0
~RMEM
Text Label 10200 1800 0    50   ~ 0
~WMEM
$Comp
L 74xx:74LS27 U104
U 2 1 5C840282
P 7400 2700
F 0 "U104" H 7400 3025 50  0000 C CNN
F 1 "74HCT27" H 7400 2934 50  0000 C CNN
F 2 "" H 7400 2700 50  0001 C CNN
F 3 "" H 7400 2700 50  0001 C CNN
	2    7400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5150 1550 5150
Wire Wire Line
	1900 5250 1550 5250
Wire Wire Line
	1900 5350 1550 5350
Wire Wire Line
	1900 5450 1550 5450
Text Label 1600 5150 0    50   ~ 0
A9
Text Label 1600 5250 0    50   ~ 0
A10
Text Label 1600 5350 0    50   ~ 0
A11
Text Label 1600 5450 0    50   ~ 0
A12
Wire Wire Line
	3400 5450 3750 5450
Text Label 3550 5450 0    50   ~ 0
A13
Wire Wire Line
	3400 5250 3750 5250
Wire Wire Line
	3400 5350 3750 5350
Text Label 3550 5350 0    50   ~ 0
A14
Text Label 3550 5250 0    50   ~ 0
A15
Wire Wire Line
	7100 2600 6800 2600
Wire Wire Line
	7100 2700 6800 2700
Wire Wire Line
	7100 2800 6800 2800
Text Label 6850 2600 0    50   ~ 0
A14
Text Label 6850 2700 0    50   ~ 0
A13
Text Label 6850 2800 0    50   ~ 0
A12
$Comp
L 74xx:74LS27 U104
U 1 1 5C848541
P 8450 2800
F 0 "U104" H 8450 3125 50  0000 C CNN
F 1 "74HCT27" H 8450 3034 50  0000 C CNN
F 2 "" H 8450 2800 50  0001 C CNN
F 3 "" H 8450 2800 50  0001 C CNN
	1    8450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2700 7700 2700
Wire Wire Line
	8150 2800 7950 2800
Wire Wire Line
	7950 2800 7950 2900
Wire Wire Line
	8150 2900 7950 2900
Connection ~ 7950 2900
Wire Wire Line
	7950 2900 7950 3000
$Comp
L power:GND #PWR?
U 1 1 5C84E722
P 7950 3000
F 0 "#PWR?" H 7950 2750 50  0001 C CNN
F 1 "GND" H 7955 2827 50  0000 C CNN
F 2 "" H 7950 3000 50  0001 C CNN
F 3 "" H 7950 3000 50  0001 C CNN
	1    7950 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U103
U 3 1 5C84E9CF
P 9450 2700
F 0 "U103" H 9450 3025 50  0000 C CNN
F 1 "74HCT00" H 9450 2934 50  0000 C CNN
F 2 "" H 9450 2700 50  0001 C CNN
F 3 "" H 9450 2700 50  0001 C CNN
	3    9450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2800 8850 2800
Wire Wire Line
	6800 2300 7800 2300
Text Label 6850 2300 0    50   ~ 0
A15
Text Label 10150 2300 0    50   ~ 0
~RAMEN
Wire Wire Line
	9150 2600 8950 2600
Wire Wire Line
	8950 2600 8950 2300
Connection ~ 8950 2300
Wire Wire Line
	8950 2300 10450 2300
Wire Wire Line
	9750 2700 10450 2700
Text Label 10150 2700 0    50   ~ 0
~ROMEN
$Comp
L 74xx:74LS138 U105
U 1 1 5C861960
P 8400 4250
F 0 "U105" H 8400 5028 50  0000 C CNN
F 1 "74HCT138" H 8400 4937 50  0000 C CNN
F 2 "" H 8400 4250 50  0001 C CNN
F 3 "" H 8400 4250 50  0001 C CNN
	1    8400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3950 6800 3950
Wire Wire Line
	7900 4050 6800 4050
Wire Wire Line
	7900 4150 6800 4150
Text Label 6850 3950 0    50   ~ 0
A9
Text Label 6850 4050 0    50   ~ 0
A10
Text Label 6850 4150 0    50   ~ 0
A11
Wire Wire Line
	7900 4450 7800 4450
Wire Wire Line
	7800 4450 7800 2300
Connection ~ 7800 2300
Wire Wire Line
	7800 2300 8950 2300
Wire Wire Line
	7900 4650 7800 4650
Wire Wire Line
	7800 4650 7800 5100
Wire Wire Line
	8400 4950 8400 5100
$Comp
L power:GND #PWR?
U 1 1 5C86A5A3
P 7800 5100
F 0 "#PWR?" H 7800 4850 50  0001 C CNN
F 1 "GND" H 7805 4927 50  0000 C CNN
F 2 "" H 7800 5100 50  0001 C CNN
F 3 "" H 7800 5100 50  0001 C CNN
	1    7800 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C86A634
P 8400 5100
F 0 "#PWR?" H 8400 4850 50  0001 C CNN
F 1 "GND" H 8405 4927 50  0000 C CNN
F 2 "" H 8400 5100 50  0001 C CNN
F 3 "" H 8400 5100 50  0001 C CNN
	1    8400 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4550 7700 4550
Wire Wire Line
	7700 4550 7700 3300
Wire Wire Line
	7700 3300 8850 3300
Wire Wire Line
	8850 3300 8850 2800
Connection ~ 8850 2800
Wire Wire Line
	8850 2800 8750 2800
Wire Wire Line
	8400 3650 8700 3650
Wire Wire Line
	8700 3650 8700 3550
$Comp
L power:VCC #PWR?
U 1 1 5C86F877
P 8700 3550
F 0 "#PWR?" H 8700 3400 50  0001 C CNN
F 1 "VCC" H 8717 3723 50  0000 C CNN
F 2 "" H 8700 3550 50  0001 C CNN
F 3 "" H 8700 3550 50  0001 C CNN
	1    8700 3550
	1    0    0    -1  
$EndComp
Text Label 7200 1100 0    50   ~ 0
E
Text Label 7200 1300 0    50   ~ 0
R~W
$Comp
L 74xx:74LS138 U106
U 1 1 5C872C8C
P 11700 3650
F 0 "U106" H 11700 4428 50  0000 C CNN
F 1 "74HCT138" H 11700 4337 50  0000 C CNN
F 2 "" H 11700 3650 50  0001 C CNN
F 3 "" H 11700 3650 50  0001 C CNN
	1    11700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3950 11050 3950
Wire Wire Line
	11200 3850 11050 3850
Wire Wire Line
	11050 3850 11050 3800
$Comp
L power:VCC #PWR?
U 1 1 5C87A6D8
P 11050 3800
F 0 "#PWR?" H 11050 3650 50  0001 C CNN
F 1 "VCC" H 11067 3973 50  0000 C CNN
F 2 "" H 11050 3800 50  0001 C CNN
F 3 "" H 11050 3800 50  0001 C CNN
	1    11050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5050 1550 5050
Text Label 1600 5050 0    50   ~ 0
A8
Wire Wire Line
	1900 4750 1550 4750
Wire Wire Line
	1900 4850 1550 4850
Wire Wire Line
	1900 4950 1550 4950
Text Label 1600 4750 0    50   ~ 0
A5
Text Label 1600 4850 0    50   ~ 0
A6
Text Label 1600 4950 0    50   ~ 0
A7
Wire Wire Line
	11200 4050 10950 4050
Text Label 10150 4050 0    50   ~ 0
A8
Wire Wire Line
	11700 4350 11700 4450
$Comp
L power:GND #PWR?
U 1 1 5C88980C
P 11700 4450
F 0 "#PWR?" H 11700 4200 50  0001 C CNN
F 1 "GND" H 11705 4277 50  0000 C CNN
F 2 "" H 11700 4450 50  0001 C CNN
F 3 "" H 11700 4450 50  0001 C CNN
	1    11700 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 3050 12000 3050
Wire Wire Line
	12000 3050 12000 2950
$Comp
L power:VCC #PWR?
U 1 1 5C88CB0E
P 12000 2950
F 0 "#PWR?" H 12000 2800 50  0001 C CNN
F 1 "VCC" H 12017 3123 50  0000 C CNN
F 2 "" H 12000 2950 50  0001 C CNN
F 3 "" H 12000 2950 50  0001 C CNN
	1    12000 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U107
U 1 1 5C88CE28
P 11700 5550
F 0 "U107" H 11700 6328 50  0000 C CNN
F 1 "74HCT138" H 11700 6237 50  0000 C CNN
F 2 "" H 11700 5550 50  0001 C CNN
F 3 "" H 11700 5550 50  0001 C CNN
	1    11700 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 6250 11700 6350
$Comp
L power:GND #PWR?
U 1 1 5C88CE2F
P 11700 6350
F 0 "#PWR?" H 11700 6100 50  0001 C CNN
F 1 "GND" H 11705 6177 50  0000 C CNN
F 2 "" H 11700 6350 50  0001 C CNN
F 3 "" H 11700 6350 50  0001 C CNN
	1    11700 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 4950 12000 4950
Wire Wire Line
	12000 4950 12000 4850
$Comp
L power:VCC #PWR?
U 1 1 5C88CE37
P 12000 4850
F 0 "#PWR?" H 12000 4700 50  0001 C CNN
F 1 "VCC" H 12017 5023 50  0000 C CNN
F 2 "" H 12000 4850 50  0001 C CNN
F 3 "" H 12000 4850 50  0001 C CNN
	1    12000 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 5750 10950 5750
Wire Wire Line
	10950 5750 10950 4050
Connection ~ 10950 4050
Wire Wire Line
	10950 4050 10100 4050
Wire Wire Line
	11200 5950 11050 5950
Wire Wire Line
	11050 5950 11050 6350
$Comp
L power:GND #PWR?
U 1 1 5C89A933
P 11050 6350
F 0 "#PWR?" H 11050 6100 50  0001 C CNN
F 1 "GND" H 11055 6177 50  0000 C CNN
F 2 "" H 11050 6350 50  0001 C CNN
F 3 "" H 11050 6350 50  0001 C CNN
	1    11050 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 5850 11050 5850
Wire Wire Line
	11050 5850 11050 3950
Connection ~ 11050 3950
Wire Wire Line
	11050 3950 11200 3950
Wire Wire Line
	11200 3350 10500 3350
Wire Wire Line
	11200 3450 10600 3450
Wire Wire Line
	11200 3550 10700 3550
Text Label 10150 3350 0    50   ~ 0
A5
Text Label 10150 3450 0    50   ~ 0
A6
Text Label 10150 3550 0    50   ~ 0
A7
Wire Wire Line
	11200 5250 10500 5250
Wire Wire Line
	10500 5250 10500 3350
Connection ~ 10500 3350
Wire Wire Line
	10500 3350 10100 3350
Wire Wire Line
	11200 5350 10600 5350
Wire Wire Line
	10600 5350 10600 3450
Connection ~ 10600 3450
Wire Wire Line
	10600 3450 10100 3450
Wire Wire Line
	11200 5450 10700 5450
Wire Wire Line
	10700 5450 10700 3550
Connection ~ 10700 3550
Wire Wire Line
	10700 3550 10100 3550
Wire Wire Line
	8900 4050 9350 4050
Wire Wire Line
	8900 4150 9350 4150
Wire Wire Line
	8900 4250 9350 4250
Wire Wire Line
	8900 4350 9350 4350
Wire Wire Line
	8900 4450 9350 4450
Wire Wire Line
	8900 4550 9350 4550
Wire Wire Line
	8900 4650 9350 4650
Text Label 9100 3950 0    50   ~ 0
~IOR0
Text Label 9100 4050 0    50   ~ 0
~IOR1
Text Label 9100 4150 0    50   ~ 0
~IOR2
Text Label 9100 4250 0    50   ~ 0
~IOR3
Text Label 9100 4350 0    50   ~ 0
~IOR4
Text Label 9100 4450 0    50   ~ 0
~IOR5
Text Label 9100 4550 0    50   ~ 0
~IOR6
Text Label 9100 4650 0    50   ~ 0
~IOR7
Wire Wire Line
	12200 3350 12750 3350
Wire Wire Line
	12200 3450 12750 3450
Wire Wire Line
	12200 3550 12750 3550
Wire Wire Line
	12200 3650 12750 3650
Wire Wire Line
	12200 3750 12750 3750
Wire Wire Line
	12200 3850 12750 3850
Wire Wire Line
	12200 3950 12750 3950
Wire Wire Line
	12200 4050 12750 4050
Wire Wire Line
	12200 5250 12750 5250
Wire Wire Line
	12200 5350 12750 5350
Wire Wire Line
	12200 5450 12750 5450
Wire Wire Line
	12200 5550 12750 5550
Wire Wire Line
	12200 5650 12750 5650
Wire Wire Line
	12200 5750 12750 5750
Wire Wire Line
	12200 5850 12750 5850
Wire Wire Line
	12200 5950 12750 5950
Text Label 12400 3350 0    50   ~ 0
~IODEV0
Text Label 12400 3450 0    50   ~ 0
~IODEV1
Text Label 12400 3550 0    50   ~ 0
~IODEV2
Text Label 12400 3650 0    50   ~ 0
~IODEV3
Text Label 12400 3750 0    50   ~ 0
~IODEV4
Text Label 12400 3850 0    50   ~ 0
~IODEV5
Text Label 12400 3950 0    50   ~ 0
~IODEV6
Text Label 12400 4050 0    50   ~ 0
~IODEV7
Text Label 12400 5250 0    50   ~ 0
~IODEV8
Text Label 12400 5350 0    50   ~ 0
~IODEV9
Text Label 12400 5450 0    50   ~ 0
~IODEV10
Text Label 12400 5550 0    50   ~ 0
~IODEV11
Text Label 12400 5650 0    50   ~ 0
~IODEV12
Text Label 12400 5750 0    50   ~ 0
~IODEV13
Text Label 12400 5850 0    50   ~ 0
~IODEV14
Text Label 12400 5950 0    50   ~ 0
~IODEV15
Text Notes 9900 1050 0    50   ~ 0
~RMEM~ goes low when the CPU is reading from memory
Text Notes 9900 1650 0    50   ~ 0
~WMEM~ goes low when the CPU is writing to memory
Text Notes 9900 2150 0    50   ~ 0
~RAMEN~ goes low when the CPU accesses the RAM\nat addresses $0000..$7FFF
Text Notes 9900 2550 0    50   ~ 0
~ROMEN~ goes low when the CPU accesses the ROM\nat addresses $9000..$FFFF
Text Notes 8600 5800 0    50   ~ 0
~IOR0~ through ~IOR7~ are active low enables\nfor 512 byte "regions" of the IO space:\n\n~IOR0~: asserted for addresses $8000-$81FF\n~IOR1~: asserted for addresses $8200-$83FF\n~IOR2~: asserted for addresses $8400-$85FF\n~IOR3~: asserted for addresses $8600-$87FF\n~IOR4~: asserted for addresses $8800-$89FF\n~IOR5~: asserted for addresses $8A00-$8BFF\n~IOR6~: asserted for addresses $8C00-$8DFF\n~IOR7~: asserted for addresses $8E00-$8FFF
Text Notes 12200 3150 0    50   ~ 0
~IODEV0~ through ~IODEV15~\ndecode the region $8000-$81FF\ninto 16 "devices" of 32 bytes\neach.
$Comp
L 74xx:74LS27 U104
U 3 1 5C8430FB
P 12850 1100
F 0 "U104" H 12850 1425 50  0000 C CNN
F 1 "74HCT27" H 12850 1334 50  0000 C CNN
F 2 "" H 12850 1100 50  0001 C CNN
F 3 "" H 12850 1100 50  0001 C CNN
	3    12850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 1000 12400 1000
Wire Wire Line
	12400 1000 12400 1100
Wire Wire Line
	12550 1100 12400 1100
Connection ~ 12400 1100
Wire Wire Line
	12400 1100 12400 1200
Wire Wire Line
	12550 1200 12400 1200
Connection ~ 12400 1200
Wire Wire Line
	12400 1200 12400 1300
$Comp
L power:GND #PWR?
U 1 1 5C856556
P 12400 1300
F 0 "#PWR?" H 12400 1050 50  0001 C CNN
F 1 "GND" H 12405 1127 50  0000 C CNN
F 2 "" H 12400 1300 50  0001 C CNN
F 3 "" H 12400 1300 50  0001 C CNN
	1    12400 1300
	1    0    0    -1  
$EndComp
Text Notes 12550 700  0    50   ~ 0
Unused gate
$Comp
L 74xx:74LS27 U104
U 4 1 5C85D4D1
P 3000 6900
F 0 "U104" H 3230 6946 50  0000 L CNN
F 1 "74HCT27" H 3230 6855 50  0000 L CNN
F 2 "" H 3000 6900 50  0001 C CNN
F 3 "" H 3000 6900 50  0001 C CNN
	4    3000 6900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U103
U 5 1 5C85D8D8
P 1650 6900
F 0 "U103" H 1880 6946 50  0000 L CNN
F 1 "74HCT00" H 1880 6855 50  0000 L CNN
F 2 "" H 1650 6900 50  0001 C CNN
F 3 "" H 1650 6900 50  0001 C CNN
	5    1650 6900
	1    0    0    -1  
$EndComp
$Comp
L device:C C104
U 1 1 5C85DB8D
P 1050 6950
F 0 "C104" H 1165 6996 50  0000 L CNN
F 1 "0.1 uF" H 1165 6905 50  0000 L CNN
F 2 "" H 1088 6800 50  0001 C CNN
F 3 "" H 1050 6950 50  0001 C CNN
	1    1050 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6800 1050 6250
Wire Wire Line
	1050 6250 1650 6250
Wire Wire Line
	4700 6250 4700 6800
Wire Wire Line
	2800 6250 2800 6100
Connection ~ 2800 6250
Wire Wire Line
	2800 6250 3000 6250
$Comp
L power:VCC #PWR?
U 1 1 5C88D36C
P 2800 6100
F 0 "#PWR?" H 2800 5950 50  0001 C CNN
F 1 "VCC" H 2817 6273 50  0000 C CNN
F 2 "" H 2800 6100 50  0001 C CNN
F 3 "" H 2800 6100 50  0001 C CNN
	1    2800 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6400 1650 6250
Connection ~ 1650 6250
Wire Wire Line
	1650 6250 2400 6250
Wire Wire Line
	3000 6400 3000 6250
Connection ~ 3000 6250
Wire Wire Line
	3000 6250 3750 6250
Wire Wire Line
	3750 6800 3750 6250
Connection ~ 3750 6250
Wire Wire Line
	3750 6250 4250 6250
Wire Wire Line
	4250 6800 4250 6250
Connection ~ 4250 6250
Wire Wire Line
	4250 6250 4700 6250
Wire Wire Line
	1050 7100 1050 7550
Wire Wire Line
	1050 7550 1650 7550
Wire Wire Line
	4700 7550 4700 7100
Wire Wire Line
	1650 7400 1650 7550
Connection ~ 1650 7550
Wire Wire Line
	1650 7550 2400 7550
Wire Wire Line
	3000 7400 3000 7550
Connection ~ 3000 7550
Wire Wire Line
	3000 7550 3750 7550
Wire Wire Line
	3750 7100 3750 7550
Connection ~ 3750 7550
Wire Wire Line
	3750 7550 4250 7550
Wire Wire Line
	4250 7100 4250 7550
Connection ~ 4250 7550
Wire Wire Line
	4250 7550 4700 7550
Wire Wire Line
	2400 6800 2400 6250
Connection ~ 2400 6250
Wire Wire Line
	2400 6250 2800 6250
Wire Wire Line
	2400 7100 2400 7550
Connection ~ 2400 7550
Wire Wire Line
	2400 7550 2800 7550
$Comp
L device:C C105
U 1 1 5C8F32FC
P 2400 6950
F 0 "C105" H 2515 6996 50  0000 L CNN
F 1 "0.1 uF" H 2515 6905 50  0000 L CNN
F 2 "" H 2438 6800 50  0001 C CNN
F 3 "" H 2400 6950 50  0001 C CNN
	1    2400 6950
	1    0    0    -1  
$EndComp
$Comp
L device:C C106
U 1 1 5C9105F8
P 3750 6950
F 0 "C106" H 3865 6996 50  0000 L CNN
F 1 "0.1 uF" H 3865 6905 50  0000 L CNN
F 2 "" H 3788 6800 50  0001 C CNN
F 3 "" H 3750 6950 50  0001 C CNN
	1    3750 6950
	1    0    0    -1  
$EndComp
$Comp
L device:C C107
U 1 1 5C923E78
P 4250 6950
F 0 "C107" H 4365 6996 50  0000 L CNN
F 1 "0.1 uF" H 4365 6905 50  0000 L CNN
F 2 "" H 4288 6800 50  0001 C CNN
F 3 "" H 4250 6950 50  0001 C CNN
	1    4250 6950
	1    0    0    -1  
$EndComp
$Comp
L device:C C108
U 1 1 5C954CDB
P 4700 6950
F 0 "C108" H 4815 6996 50  0000 L CNN
F 1 "0.1 uF" H 4815 6905 50  0000 L CNN
F 2 "" H 4738 6800 50  0001 C CNN
F 3 "" H 4700 6950 50  0001 C CNN
	1    4700 6950
	1    0    0    -1  
$EndComp
Text Notes 3700 6100 0    50   ~ 0
Place C106-C108 near the\npower pins of U105-U107
Wire Wire Line
	2800 7550 2800 7700
Connection ~ 2800 7550
Wire Wire Line
	2800 7550 3000 7550
$Comp
L power:GND #PWR?
U 1 1 5C97559C
P 2800 7700
F 0 "#PWR?" H 2800 7450 50  0001 C CNN
F 1 "GND" H 2805 7527 50  0000 C CNN
F 2 "" H 2800 7700 50  0001 C CNN
F 3 "" H 2800 7700 50  0001 C CNN
	1    2800 7700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
