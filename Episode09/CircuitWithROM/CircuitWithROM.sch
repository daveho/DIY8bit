EESchema Schematic File Version 4
LIBS:CircuitWithROM-cache
EELAYER 26 0
EELAYER END
$Descr User 14173 10953
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
Text Notes 9550 9400 0    50   ~ 0
6809 circuit with glue logic, ROM, and output port
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
U 4 1 5C85D4D1
P 11350 7750
F 0 "U104" H 11580 7796 50  0000 L CNN
F 1 "74HCT27" H 11580 7705 50  0000 L CNN
F 2 "" H 11350 7750 50  0001 C CNN
F 3 "" H 11350 7750 50  0001 C CNN
	4    11350 7750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U103
U 5 1 5C85D8D8
P 10000 7750
F 0 "U103" H 10230 7796 50  0000 L CNN
F 1 "74HCT00" H 10230 7705 50  0000 L CNN
F 2 "" H 10000 7750 50  0001 C CNN
F 3 "" H 10000 7750 50  0001 C CNN
	5    10000 7750
	1    0    0    -1  
$EndComp
$Comp
L device:C C104
U 1 1 5C85DB8D
P 9400 7800
F 0 "C104" H 9515 7846 50  0000 L CNN
F 1 "0.1 uF" H 9515 7755 50  0000 L CNN
F 2 "" H 9438 7650 50  0001 C CNN
F 3 "" H 9400 7800 50  0001 C CNN
	1    9400 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 7650 9400 7100
Wire Wire Line
	9400 7100 10000 7100
Wire Wire Line
	13050 7100 13050 7650
Wire Wire Line
	11150 7100 11150 6950
Connection ~ 11150 7100
Wire Wire Line
	11150 7100 11350 7100
$Comp
L power:VCC #PWR?
U 1 1 5C88D36C
P 11150 6950
F 0 "#PWR?" H 11150 6800 50  0001 C CNN
F 1 "VCC" H 11167 7123 50  0000 C CNN
F 2 "" H 11150 6950 50  0001 C CNN
F 3 "" H 11150 6950 50  0001 C CNN
	1    11150 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 7250 10000 7100
Connection ~ 10000 7100
Wire Wire Line
	10000 7100 10750 7100
Wire Wire Line
	11350 7250 11350 7100
Connection ~ 11350 7100
Wire Wire Line
	11350 7100 12100 7100
Wire Wire Line
	12100 7650 12100 7100
Connection ~ 12100 7100
Wire Wire Line
	12100 7100 12600 7100
Wire Wire Line
	12600 7650 12600 7100
Connection ~ 12600 7100
Wire Wire Line
	12600 7100 13050 7100
Wire Wire Line
	9400 7950 9400 8400
Wire Wire Line
	9400 8400 10000 8400
Wire Wire Line
	13050 8400 13050 7950
Wire Wire Line
	10000 8250 10000 8400
Connection ~ 10000 8400
Wire Wire Line
	10000 8400 10750 8400
Wire Wire Line
	11350 8250 11350 8400
Connection ~ 11350 8400
Wire Wire Line
	11350 8400 12100 8400
Wire Wire Line
	12100 7950 12100 8400
Connection ~ 12100 8400
Wire Wire Line
	12100 8400 12600 8400
Wire Wire Line
	12600 7950 12600 8400
Connection ~ 12600 8400
Wire Wire Line
	12600 8400 13050 8400
Wire Wire Line
	10750 7650 10750 7100
Connection ~ 10750 7100
Wire Wire Line
	10750 7100 11150 7100
Wire Wire Line
	10750 7950 10750 8400
Connection ~ 10750 8400
Wire Wire Line
	10750 8400 11150 8400
$Comp
L device:C C105
U 1 1 5C8F32FC
P 10750 7800
F 0 "C105" H 10865 7846 50  0000 L CNN
F 1 "0.1 uF" H 10865 7755 50  0000 L CNN
F 2 "" H 10788 7650 50  0001 C CNN
F 3 "" H 10750 7800 50  0001 C CNN
	1    10750 7800
	1    0    0    -1  
$EndComp
$Comp
L device:C C106
U 1 1 5C9105F8
P 12100 7800
F 0 "C106" H 12215 7846 50  0000 L CNN
F 1 "0.1 uF" H 12215 7755 50  0000 L CNN
F 2 "" H 12138 7650 50  0001 C CNN
F 3 "" H 12100 7800 50  0001 C CNN
	1    12100 7800
	1    0    0    -1  
$EndComp
$Comp
L device:C C107
U 1 1 5C923E78
P 12600 7800
F 0 "C107" H 12715 7846 50  0000 L CNN
F 1 "0.1 uF" H 12715 7755 50  0000 L CNN
F 2 "" H 12638 7650 50  0001 C CNN
F 3 "" H 12600 7800 50  0001 C CNN
	1    12600 7800
	1    0    0    -1  
$EndComp
$Comp
L device:C C108
U 1 1 5C954CDB
P 13050 7800
F 0 "C108" H 13165 7846 50  0000 L CNN
F 1 "0.1 uF" H 13165 7755 50  0000 L CNN
F 2 "" H 13088 7650 50  0001 C CNN
F 3 "" H 13050 7800 50  0001 C CNN
	1    13050 7800
	1    0    0    -1  
$EndComp
Text Notes 12050 6950 0    50   ~ 0
Place C106-C108 near the\npower pins of U105-U107
Wire Wire Line
	11150 8400 11150 8550
Connection ~ 11150 8400
Wire Wire Line
	11150 8400 11350 8400
$Comp
L power:GND #PWR?
U 1 1 5C97559C
P 11150 8550
F 0 "#PWR?" H 11150 8300 50  0001 C CNN
F 1 "GND" H 11155 8377 50  0000 C CNN
F 2 "" H 11150 8550 50  0001 C CNN
F 3 "" H 11150 8550 50  0001 C CNN
	1    11150 8550
	1    0    0    -1  
$EndComp
Text Notes 12250 5000 0    50   ~ 0
U107 can be omitted if\n~IODEV0~-~IODEV7~ are\nsufficient for planned I/O\ndevices.
Wire Wire Line
	3400 4450 3950 4450
Wire Wire Line
	3400 4550 3950 4550
Wire Wire Line
	3400 4650 3950 4650
Wire Wire Line
	3400 4750 3950 4750
Wire Wire Line
	3400 4850 3950 4850
Wire Wire Line
	3400 4950 3950 4950
Wire Wire Line
	3400 5050 3950 5050
Wire Wire Line
	3400 5150 3950 5150
Text Label 3550 4450 0    50   ~ 0
D0
Text Label 3550 4550 0    50   ~ 0
D1
Text Label 3550 4650 0    50   ~ 0
D2
Text Label 3550 4750 0    50   ~ 0
D3
Text Label 3550 4850 0    50   ~ 0
D4
Text Label 3550 4950 0    50   ~ 0
D5
Text Label 3550 5050 0    50   ~ 0
D6
Text Label 3550 5150 0    50   ~ 0
D7
$Comp
L memory:27C512 U108
U 1 1 5CA69FAE
P 2350 7500
F 0 "U108" H 2350 8678 50  0000 C CNN
F 1 "27C512" H 2350 8587 50  0000 C CNN
F 2 "" H 2350 7500 50  0001 C CNN
F 3 "" H 2350 7500 50  0001 C CNN
	1    2350 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6600 1000 6600
Wire Wire Line
	1650 6700 1000 6700
Wire Wire Line
	1650 6800 1000 6800
Wire Wire Line
	1650 6900 1000 6900
Wire Wire Line
	1650 7000 1000 7000
Wire Wire Line
	1650 7100 1000 7100
Wire Wire Line
	1650 7200 1000 7200
Wire Wire Line
	1650 7300 1000 7300
Wire Wire Line
	1650 7400 1000 7400
Wire Wire Line
	1650 7500 1000 7500
Wire Wire Line
	1650 7600 1000 7600
Wire Wire Line
	1650 7700 1000 7700
Wire Wire Line
	1650 7800 1000 7800
Wire Wire Line
	1650 7900 1000 7900
Wire Wire Line
	1650 8000 1000 8000
Wire Wire Line
	1650 8100 1100 8100
Text Label 1350 6600 0    50   ~ 0
A0
Text Label 1350 6700 0    50   ~ 0
A1
Text Label 1350 6800 0    50   ~ 0
A2
Text Label 1350 6900 0    50   ~ 0
A3
Text Label 1350 7000 0    50   ~ 0
A4
Text Label 1350 7100 0    50   ~ 0
A5
Text Label 1350 7200 0    50   ~ 0
A6
Text Label 1350 7300 0    50   ~ 0
A7
Text Label 1350 7400 0    50   ~ 0
A8
Text Label 1350 7500 0    50   ~ 0
A9
Text Label 1350 7600 0    50   ~ 0
A10
Text Label 1350 7700 0    50   ~ 0
A11
Text Label 1350 7800 0    50   ~ 0
A12
Text Label 1350 7900 0    50   ~ 0
A13
Text Label 1350 8000 0    50   ~ 0
A14
Wire Wire Line
	1100 8100 1100 8650
$Comp
L power:GND #PWR?
U 1 1 5CA83A54
P 1100 8650
F 0 "#PWR?" H 1100 8400 50  0001 C CNN
F 1 "GND" H 1105 8477 50  0000 C CNN
F 2 "" H 1100 8650 50  0001 C CNN
F 3 "" H 1100 8650 50  0001 C CNN
	1    1100 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 6600 3400 6600
Wire Wire Line
	3050 6700 3400 6700
Wire Wire Line
	3050 6800 3400 6800
Wire Wire Line
	3050 6900 3400 6900
Wire Wire Line
	3050 7000 3400 7000
Wire Wire Line
	3050 7100 3400 7100
Wire Wire Line
	3050 7200 3400 7200
Wire Wire Line
	3050 7300 3400 7300
Text Label 3200 6600 0    50   ~ 0
D0
Text Label 3200 6700 0    50   ~ 0
D1
Text Label 3200 6800 0    50   ~ 0
D2
Text Label 3200 6900 0    50   ~ 0
D3
Text Label 3200 7000 0    50   ~ 0
D4
Text Label 3200 7100 0    50   ~ 0
D5
Text Label 3200 7200 0    50   ~ 0
D6
Text Label 3200 7300 0    50   ~ 0
D7
Wire Wire Line
	1650 8300 1250 8300
Wire Wire Line
	1650 8400 1250 8400
Text Label 1300 8300 0    50   ~ 0
~ROMEN~
Text Label 1300 8400 0    50   ~ 0
~RMEM~
Text Notes 1750 8700 0    50   ~ 0
64K EEPROM or Flash Memory:\nW27C512, 27SF512, or similar
Wire Wire Line
	1900 4250 1550 4250
Wire Wire Line
	1900 4350 1550 4350
Wire Wire Line
	1900 4450 1550 4450
Wire Wire Line
	1900 4550 1550 4550
Wire Wire Line
	1900 4650 1550 4650
Text Label 1600 4250 0    50   ~ 0
A0
Text Label 1600 4350 0    50   ~ 0
A1
Text Label 1600 4450 0    50   ~ 0
A2
Text Label 1600 4550 0    50   ~ 0
A3
Text Label 1600 4650 0    50   ~ 0
A4
Entry Bus Bus
	3750 5800 3850 5700
Entry Wire Line
	3750 5250 3850 5350
Entry Wire Line
	3750 5350 3850 5450
Entry Wire Line
	3750 5450 3850 5550
Entry Bus Bus
	1350 5800 1450 5700
Entry Wire Line
	1450 4350 1550 4250
Entry Wire Line
	1450 4450 1550 4350
Entry Wire Line
	1450 4550 1550 4450
Entry Wire Line
	1450 4650 1550 4550
Entry Wire Line
	1450 4750 1550 4650
Entry Wire Line
	1450 4850 1550 4750
Entry Wire Line
	1450 4950 1550 4850
Entry Wire Line
	1450 5050 1550 4950
Entry Wire Line
	1450 5150 1550 5050
Entry Wire Line
	1450 5250 1550 5150
Entry Wire Line
	1450 5350 1550 5250
Entry Wire Line
	1450 5450 1550 5350
Entry Wire Line
	1450 5550 1550 5450
Entry Bus Bus
	900  5900 1000 5800
Entry Wire Line
	900  6500 1000 6600
Entry Wire Line
	900  6600 1000 6700
Entry Wire Line
	900  6700 1000 6800
Entry Wire Line
	900  6800 1000 6900
Entry Wire Line
	900  6900 1000 7000
Entry Wire Line
	900  7000 1000 7100
Entry Wire Line
	900  7100 1000 7200
Entry Wire Line
	900  7200 1000 7300
Entry Wire Line
	900  7300 1000 7400
Entry Wire Line
	900  7400 1000 7500
Entry Wire Line
	900  7500 1000 7600
Entry Wire Line
	900  7600 1000 7700
Entry Wire Line
	900  7700 1000 7800
Entry Wire Line
	900  7800 1000 7900
Entry Wire Line
	900  7900 1000 8000
Entry Wire Line
	3950 4450 4050 4550
Entry Wire Line
	3950 4550 4050 4650
Entry Wire Line
	3950 4650 4050 4750
Entry Wire Line
	3950 4750 4050 4850
Entry Wire Line
	3950 4850 4050 4950
Entry Wire Line
	3950 4950 4050 5050
Entry Wire Line
	3950 5050 4050 5150
Entry Wire Line
	3950 5150 4050 5250
Entry Bus Bus
	3950 6000 4050 5900
Wire Bus Line
	3950 6000 3600 6000
Entry Bus Bus
	3500 6100 3600 6000
Entry Wire Line
	3400 6600 3500 6500
Entry Wire Line
	3400 6700 3500 6600
Entry Wire Line
	3400 6800 3500 6700
Entry Wire Line
	3400 6900 3500 6800
Entry Wire Line
	3400 7000 3500 6900
Entry Wire Line
	3400 7100 3500 7000
Entry Wire Line
	3400 7200 3500 7100
Entry Wire Line
	3400 7300 3500 7200
$Comp
L 74xx:74LS574 U109
U 1 1 5CC910DA
P 6000 7650
F 0 "U109" H 6000 8628 50  0000 C CNN
F 1 "74HCT574" H 6000 8537 50  0000 C CNN
F 2 "" H 6000 7650 50  0001 C CNN
F 3 "" H 6000 7650 50  0001 C CNN
	1    6000 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 8050 4900 8050
Wire Wire Line
	5500 8150 5400 8150
Wire Wire Line
	5400 8150 5400 8550
$Comp
L power:GND #PWR?
U 1 1 5CD86278
P 5400 8550
F 0 "#PWR?" H 5400 8300 50  0001 C CNN
F 1 "GND" H 5405 8377 50  0000 C CNN
F 2 "" H 5400 8550 50  0001 C CNN
F 3 "" H 5400 8550 50  0001 C CNN
	1    5400 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 8450 6000 8550
$Comp
L power:GND #PWR?
U 1 1 5CDA9877
P 6000 8550
F 0 "#PWR?" H 6000 8300 50  0001 C CNN
F 1 "GND" H 6005 8377 50  0000 C CNN
F 2 "" H 6000 8550 50  0001 C CNN
F 3 "" H 6000 8550 50  0001 C CNN
	1    6000 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6850 6350 6850
Wire Wire Line
	6350 6850 6350 6700
$Comp
L power:VCC #PWR?
U 1 1 5CDBBC1F
P 6350 6700
F 0 "#PWR?" H 6350 6550 50  0001 C CNN
F 1 "VCC" H 6367 6873 50  0000 C CNN
F 2 "" H 6350 6700 50  0001 C CNN
F 3 "" H 6350 6700 50  0001 C CNN
	1    6350 6700
	1    0    0    -1  
$EndComp
Text Notes 6550 6700 0    50   ~ 0
This is a temporary output port\nand 7 segment LED display to be\nused for testing.  They will (most\nlikely) be removed in the next\nversion of the circuit (along with\nthe OR gate needed to decode\nR~W~ and ~IODEV0~.)
$Comp
L Display_Character:LTS-6960HR AFF101
U 1 1 5CE824F7
P 7750 7550
F 0 "AFF101" H 7750 8217 50  0000 C CNN
F 1 "LTS-6960HR" H 7750 8126 50  0000 C CNN
F 2 "Display_7Segment:7SegmentLED_LTS6760_LTS6780" H 7750 6950 50  0001 C CNN
F 3 "" H 7750 7550 50  0001 C CNN
	1    7750 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 7250 8500 7250
Wire Wire Line
	8250 7150 8500 7150
Wire Wire Line
	8500 6750 8500 7150
Connection ~ 8500 7150
Wire Wire Line
	8500 7150 8500 7250
$Comp
L power:VCC #PWR?
U 1 1 5CEA6F55
P 8500 6750
F 0 "#PWR?" H 8500 6600 50  0001 C CNN
F 1 "VCC" H 8517 6923 50  0000 C CNN
F 2 "" H 8500 6750 50  0001 C CNN
F 3 "" H 8500 6750 50  0001 C CNN
	1    8500 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 8300 8500 8300
Wire Wire Line
	8500 8300 8500 7850
Wire Wire Line
	8500 7850 8250 7850
Entry Bus Bus
	3500 9800 3600 9900
Wire Wire Line
	5500 7150 5250 7150
Wire Wire Line
	5500 7250 5250 7250
Wire Wire Line
	5500 7350 5250 7350
Wire Wire Line
	5500 7450 5250 7450
Wire Wire Line
	5500 7550 5250 7550
Wire Wire Line
	5500 7650 5250 7650
Wire Wire Line
	5500 7750 5250 7750
Wire Wire Line
	5500 7850 5250 7850
Text Label 5300 7150 0    50   ~ 0
D0
Text Label 5300 7250 0    50   ~ 0
D1
Text Label 5300 7350 0    50   ~ 0
D2
Text Label 5300 7450 0    50   ~ 0
D3
Text Label 5300 7550 0    50   ~ 0
D4
Text Label 5300 7650 0    50   ~ 0
D5
Text Label 5300 7750 0    50   ~ 0
D6
Text Label 5300 7850 0    50   ~ 0
D7
Entry Wire Line
	5150 7250 5250 7150
Entry Wire Line
	5150 7350 5250 7250
Entry Wire Line
	5150 7450 5250 7350
Entry Wire Line
	5150 7550 5250 7450
Entry Wire Line
	5150 7650 5250 7550
Entry Wire Line
	5150 7750 5250 7650
Entry Wire Line
	5150 7850 5250 7750
Entry Wire Line
	5150 7950 5250 7850
Entry Bus Bus
	5050 9900 5150 9800
Wire Bus Line
	5050 9900 3600 9900
$Comp
L device:R R102
U 1 1 5CF760D6
P 6900 7150
F 0 "R102" V 6850 6900 50  0000 C CNN
F 1 "R" V 6900 7150 50  0000 C CNN
F 2 "" V 6830 7150 50  0001 C CNN
F 3 "" H 6900 7150 50  0001 C CNN
	1    6900 7150
	0    1    1    0   
$EndComp
$Comp
L device:R R103
U 1 1 5D0255BA
P 6900 7250
F 0 "R103" V 6850 7000 50  0000 C CNN
F 1 "R" V 6900 7250 50  0000 C CNN
F 2 "" V 6830 7250 50  0001 C CNN
F 3 "" H 6900 7250 50  0001 C CNN
	1    6900 7250
	0    1    1    0   
$EndComp
$Comp
L device:R R104
U 1 1 5D03A44C
P 6900 7350
F 0 "R104" V 6850 7100 50  0000 C CNN
F 1 "R" V 6900 7350 50  0000 C CNN
F 2 "" V 6830 7350 50  0001 C CNN
F 3 "" H 6900 7350 50  0001 C CNN
	1    6900 7350
	0    1    1    0   
$EndComp
$Comp
L device:R R105
U 1 1 5D03A452
P 6900 7450
F 0 "R105" V 6850 7200 50  0000 C CNN
F 1 "R" V 6900 7450 50  0000 C CNN
F 2 "" V 6830 7450 50  0001 C CNN
F 3 "" H 6900 7450 50  0001 C CNN
	1    6900 7450
	0    1    1    0   
$EndComp
$Comp
L device:R R106
U 1 1 5D06435D
P 6900 7550
F 0 "R106" V 6850 7300 50  0000 C CNN
F 1 "R" V 6900 7550 50  0000 C CNN
F 2 "" V 6830 7550 50  0001 C CNN
F 3 "" H 6900 7550 50  0001 C CNN
	1    6900 7550
	0    1    1    0   
$EndComp
$Comp
L device:R R107
U 1 1 5D064363
P 6900 7650
F 0 "R107" V 6850 7400 50  0000 C CNN
F 1 "R" V 6900 7650 50  0000 C CNN
F 2 "" V 6830 7650 50  0001 C CNN
F 3 "" H 6900 7650 50  0001 C CNN
	1    6900 7650
	0    1    1    0   
$EndComp
$Comp
L device:R R108
U 1 1 5D064369
P 6900 7750
F 0 "R108" V 6850 7500 50  0000 C CNN
F 1 "R" V 6900 7750 50  0000 C CNN
F 2 "" V 6830 7750 50  0001 C CNN
F 3 "" H 6900 7750 50  0001 C CNN
	1    6900 7750
	0    1    1    0   
$EndComp
$Comp
L device:R R109
U 1 1 5D06436F
P 6900 7850
F 0 "R109" V 6850 7600 50  0000 C CNN
F 1 "R" V 6900 7850 50  0000 C CNN
F 2 "" V 6830 7850 50  0001 C CNN
F 3 "" H 6900 7850 50  0001 C CNN
	1    6900 7850
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 7150 6750 7150
Wire Wire Line
	6500 7250 6750 7250
Wire Wire Line
	6500 7350 6750 7350
Wire Wire Line
	6500 7450 6750 7450
Wire Wire Line
	6500 7550 6750 7550
Wire Wire Line
	6500 7650 6750 7650
Wire Wire Line
	6500 7750 6750 7750
Wire Wire Line
	6500 7850 6750 7850
Wire Wire Line
	7050 7150 7250 7150
Wire Wire Line
	7050 7250 7250 7250
Wire Wire Line
	7050 7350 7250 7350
Wire Wire Line
	7050 7450 7250 7450
Wire Wire Line
	7050 7550 7250 7550
Wire Wire Line
	7050 7650 7250 7650
Wire Wire Line
	7050 7750 7250 7750
Wire Wire Line
	7050 7850 7200 7850
Wire Wire Line
	7200 7850 7200 8300
$Comp
L 74xx:74LS27 U103
U 3 1 5D101844
P 13050 1350
F 0 "U103" H 13050 1675 50  0000 C CNN
F 1 "74HCT27" H 13050 1584 50  0000 C CNN
F 2 "" H 13050 1350 50  0001 C CNN
F 3 "" H 13050 1350 50  0001 C CNN
	3    13050 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	12750 1450 12600 1450
$Comp
L power:GND #PWR?
U 1 1 5D10184C
P 12600 1800
F 0 "#PWR?" H 12600 1550 50  0001 C CNN
F 1 "GND" H 12605 1627 50  0000 C CNN
F 2 "" H 12600 1800 50  0001 C CNN
F 3 "" H 12600 1800 50  0001 C CNN
	1    12600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12600 1800 12600 1450
Wire Wire Line
	12600 1250 12750 1250
Wire Wire Line
	12600 1350 12750 1350
Wire Wire Line
	12600 1350 12600 1450
Connection ~ 12600 1450
Wire Wire Line
	12600 1250 12600 1350
Connection ~ 12600 1350
Text Notes 12750 850  0    50   ~ 0
Unused gate
$Comp
L 74xx:74LS32 U110
U 1 1 5D190D9D
P 4600 8050
F 0 "U110" H 4600 8375 50  0000 C CNN
F 1 "74HCT32" H 4600 8284 50  0000 C CNN
F 2 "" H 4600 8050 50  0001 C CNN
F 3 "" H 4600 8050 50  0001 C CNN
	1    4600 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 7950 3950 7950
Wire Wire Line
	4300 8150 3950 8150
Text Label 4000 7950 0    50   ~ 0
R~W~
Text Label 4000 8150 0    50   ~ 0
~IODEV0~
$Comp
L 74xx:74LS32 U110
U 2 1 5D1C293D
P 5950 9550
F 0 "U110" H 5950 9875 50  0000 C CNN
F 1 "74HCT32" H 5950 9784 50  0000 C CNN
F 2 "" H 5950 9550 50  0001 C CNN
F 3 "" H 5950 9550 50  0001 C CNN
	2    5950 9550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U110
U 3 1 5D1C2A0B
P 6750 9550
F 0 "U110" H 6750 9875 50  0000 C CNN
F 1 "74HCT32" H 6750 9784 50  0000 C CNN
F 2 "" H 6750 9550 50  0001 C CNN
F 3 "" H 6750 9550 50  0001 C CNN
	3    6750 9550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U110
U 4 1 5D1C2AE6
P 7550 9550
F 0 "U110" H 7550 9875 50  0000 C CNN
F 1 "74HCT32" H 7550 9784 50  0000 C CNN
F 2 "" H 7550 9550 50  0001 C CNN
F 3 "" H 7550 9550 50  0001 C CNN
	4    7550 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 9450 5550 9450
Wire Wire Line
	5550 9450 5550 9650
Wire Wire Line
	5650 9650 5550 9650
Connection ~ 5550 9650
Wire Wire Line
	5550 9650 5550 9800
$Comp
L power:GND #PWR?
U 1 1 5D20CD86
P 5550 9800
F 0 "#PWR?" H 5550 9550 50  0001 C CNN
F 1 "GND" H 5555 9627 50  0000 C CNN
F 2 "" H 5550 9800 50  0001 C CNN
F 3 "" H 5550 9800 50  0001 C CNN
	1    5550 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 9450 6350 9450
Wire Wire Line
	6350 9450 6350 9650
Wire Wire Line
	6450 9650 6350 9650
Connection ~ 6350 9650
Wire Wire Line
	6350 9650 6350 9800
$Comp
L power:GND #PWR?
U 1 1 5D20CE18
P 6350 9800
F 0 "#PWR?" H 6350 9550 50  0001 C CNN
F 1 "GND" H 6355 9627 50  0000 C CNN
F 2 "" H 6350 9800 50  0001 C CNN
F 3 "" H 6350 9800 50  0001 C CNN
	1    6350 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 9450 7150 9450
Wire Wire Line
	7150 9450 7150 9650
Wire Wire Line
	7250 9650 7150 9650
Connection ~ 7150 9650
Wire Wire Line
	7150 9650 7150 9800
$Comp
L power:GND #PWR?
U 1 1 5D226744
P 7150 9800
F 0 "#PWR?" H 7150 9550 50  0001 C CNN
F 1 "GND" H 7155 9627 50  0000 C CNN
F 2 "" H 7150 9800 50  0001 C CNN
F 3 "" H 7150 9800 50  0001 C CNN
	1    7150 9800
	1    0    0    -1  
$EndComp
Text Notes 6400 9100 0    50   ~ 0
Unused gates
$Comp
L 74xx:74LS32 U110
U 5 1 5D25B3EA
P 8250 9550
F 0 "U110" H 8480 9596 50  0000 L CNN
F 1 "74HCT32" H 8480 9505 50  0000 L CNN
F 2 "" H 8250 9550 50  0001 C CNN
F 3 "" H 8250 9550 50  0001 C CNN
	5    8250 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 9050 8250 8950
Wire Wire Line
	8250 8950 8600 8950
Wire Wire Line
	8950 8950 8950 9400
$Comp
L device:C C109
U 1 1 5D275D60
P 8950 9550
F 0 "C109" H 9065 9596 50  0000 L CNN
F 1 "0.1 uF" H 9065 9505 50  0000 L CNN
F 2 "" H 8988 9400 50  0001 C CNN
F 3 "" H 8950 9550 50  0001 C CNN
	1    8950 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 10050 8250 10150
Wire Wire Line
	8250 10150 8600 10150
Wire Wire Line
	8950 10150 8950 9700
Wire Wire Line
	8600 8850 8600 8950
Connection ~ 8600 8950
Wire Wire Line
	8600 8950 8950 8950
$Comp
L power:VCC #PWR?
U 1 1 5D318895
P 8600 8850
F 0 "#PWR?" H 8600 8700 50  0001 C CNN
F 1 "VCC" H 8617 9023 50  0000 C CNN
F 2 "" H 8600 8850 50  0001 C CNN
F 3 "" H 8600 8850 50  0001 C CNN
	1    8600 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 10250 8600 10150
Connection ~ 8600 10150
Wire Wire Line
	8600 10150 8950 10150
$Comp
L power:GND #PWR?
U 1 1 5D333EB6
P 8600 10250
F 0 "#PWR?" H 8600 10000 50  0001 C CNN
F 1 "GND" H 8605 10077 50  0000 C CNN
F 2 "" H 8600 10250 50  0001 C CNN
F 3 "" H 8600 10250 50  0001 C CNN
	1    8600 10250
	1    0    0    -1  
$EndComp
Wire Bus Line
	1000 5800 3750 5800
Wire Bus Line
	3850 5350 3850 5700
Wire Bus Line
	5150 7250 5150 9800
Wire Bus Line
	3500 6100 3500 9800
Wire Bus Line
	4050 4550 4050 5900
Wire Bus Line
	1450 4350 1450 5700
Wire Bus Line
	900  5900 900  7900
$EndSCHEMATC
