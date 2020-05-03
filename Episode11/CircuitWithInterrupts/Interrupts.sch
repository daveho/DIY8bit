EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 12100 9350
encoding utf-8
Sheet 5 6
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
L 74xx:74LS147 U403
U 1 1 5E12A66B
P 8150 4550
F 0 "U403" H 8150 5428 50  0000 C CNN
F 1 "74HCT147" H 8150 5337 50  0000 C CNN
F 2 "" H 8150 4550 50  0001 C CNN
F 3 "" H 8150 4550 50  0001 C CNN
	1    8150 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U401
U 1 1 5E12A885
P 3050 2950
F 0 "U401" H 3050 3428 50  0000 C CNN
F 1 "74HCT74" H 3050 3337 50  0000 C CNN
F 2 "" H 3050 2950 50  0001 C CNN
F 3 "" H 3050 2950 50  0001 C CNN
	1    3050 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U401
U 2 1 5E12A8F8
P 3050 4050
F 0 "U401" H 3050 4528 50  0000 C CNN
F 1 "74HCT74" H 3050 4437 50  0000 C CNN
F 2 "" H 3050 4050 50  0001 C CNN
F 3 "" H 3050 4050 50  0001 C CNN
	2    3050 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U401
U 3 1 5E12A93E
P 4300 7750
F 0 "U401" H 4530 7796 50  0000 L CNN
F 1 "74HCT74" H 4530 7705 50  0000 L CNN
F 2 "" H 4300 7750 50  0001 C CNN
F 3 "" H 4300 7750 50  0001 C CNN
	3    4300 7750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS11 U402
U 1 1 5E12AACA
P 8550 1400
F 0 "U402" H 8550 1725 50  0000 C CNN
F 1 "74HCT11" H 8550 1634 50  0000 C CNN
F 2 "" H 8550 1400 50  0001 C CNN
F 3 "" H 8550 1400 50  0001 C CNN
	1    8550 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS11 U402
U 2 1 5E12AC32
P 8550 2000
F 0 "U402" H 8550 2325 50  0000 C CNN
F 1 "74HCT11" H 8550 2234 50  0000 C CNN
F 2 "" H 8550 2000 50  0001 C CNN
F 3 "" H 8550 2000 50  0001 C CNN
	2    8550 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS11 U402
U 3 1 5E12ACD5
P 9550 900
F 0 "U402" H 9550 1225 50  0000 C CNN
F 1 "74HCT11" H 9550 1134 50  0000 C CNN
F 2 "" H 9550 900 50  0001 C CNN
F 3 "" H 9550 900 50  0001 C CNN
	3    9550 900 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS11 U402
U 4 1 5E12AD31
P 5100 7750
F 0 "U402" H 5330 7796 50  0000 L CNN
F 1 "74HCT11" H 5330 7705 50  0000 L CNN
F 2 "" H 5100 7750 50  0001 C CNN
F 3 "" H 5100 7750 50  0001 C CNN
	4    5100 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2850 2600 2850
Wire Wire Line
	2600 2850 2600 3950
Wire Wire Line
	2750 3950 2600 3950
Connection ~ 2600 3950
Wire Wire Line
	2600 3950 2600 4450
$Comp
L power:GND #PWR?
U 1 1 5E12B290
P 2600 4450
F 0 "#PWR?" H 2600 4200 50  0001 C CNN
F 1 "GND" H 2605 4277 50  0000 C CNN
F 2 "" H 2600 4450 50  0001 C CNN
F 3 "" H 2600 4450 50  0001 C CNN
	1    2600 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3250 3050 3450
Wire Wire Line
	3050 3450 3200 3450
Wire Wire Line
	3200 3450 3200 3400
$Comp
L power:VCC #PWR?
U 1 1 5E12B424
P 3200 3400
F 0 "#PWR?" H 3200 3250 50  0001 C CNN
F 1 "VCC" H 3217 3573 50  0000 C CNN
F 2 "" H 3200 3400 50  0001 C CNN
F 3 "" H 3200 3400 50  0001 C CNN
	1    3200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4350 3050 4550
Wire Wire Line
	3050 4550 3200 4550
Wire Wire Line
	3200 4550 3200 4500
$Comp
L power:VCC #PWR?
U 1 1 5E12B63B
P 3200 4500
F 0 "#PWR?" H 3200 4350 50  0001 C CNN
F 1 "VCC" H 3217 4673 50  0000 C CNN
F 2 "" H 3200 4500 50  0001 C CNN
F 3 "" H 3200 4500 50  0001 C CNN
	1    3200 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3850 8450 3850
Wire Wire Line
	8450 3850 8450 3700
$Comp
L power:VCC #PWR?
U 1 1 5E12B97D
P 8450 3700
F 0 "#PWR?" H 8450 3550 50  0001 C CNN
F 1 "VCC" H 8467 3873 50  0000 C CNN
F 2 "" H 8450 3700 50  0001 C CNN
F 3 "" H 8450 3700 50  0001 C CNN
	1    8450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5250 8150 5400
$Comp
L power:GND #PWR?
U 1 1 5E12BAA7
P 8150 5400
F 0 "#PWR?" H 8150 5150 50  0001 C CNN
F 1 "GND" H 8155 5227 50  0000 C CNN
F 2 "" H 8150 5400 50  0001 C CNN
F 3 "" H 8150 5400 50  0001 C CNN
	1    8150 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2850 3600 2850
Wire Wire Line
	7650 4850 7500 4850
Wire Wire Line
	7500 4850 7500 4950
Wire Wire Line
	7500 5250 7300 5250
Wire Wire Line
	7300 5250 7300 5150
$Comp
L power:VCC #PWR?
U 1 1 5E12C776
P 7300 5150
F 0 "#PWR?" H 7300 5000 50  0001 C CNN
F 1 "VCC" H 7317 5323 50  0000 C CNN
F 2 "" H 7300 5150 50  0001 C CNN
F 3 "" H 7300 5150 50  0001 C CNN
	1    7300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4950 7500 4950
Connection ~ 7500 4950
Wire Wire Line
	7500 4950 7500 5250
Wire Wire Line
	8850 2000 9050 2000
Wire Wire Line
	9050 2000 9050 1000
Wire Wire Line
	9050 1000 9250 1000
Text HLabel 1100 1450 0    50   Input ~ 0
~IRQ1
Text HLabel 1100 1550 0    50   Input ~ 0
~IRQ2
Text HLabel 1100 1750 0    50   Input ~ 0
~IRQ4
Text HLabel 1100 1850 0    50   Input ~ 0
~IRQ5
Text HLabel 1100 2050 0    50   Input ~ 0
~IRQ7
Text Notes 750  1300 0    50   ~ 0
~IRQ3_IN~ and ~IRQ6_IN~ are\nedge-triggered (positive\nedge)\n\n~IRQ3_CLR~ and ~IRQ6_CLR~\ncan be temporarily\nasserted to clear ~IRQ3~/\n~IRQ6~ after they are\ntriggered
Text HLabel 1100 1650 0    50   Input ~ 0
~IRQ3
Text HLabel 1100 1950 0    50   Input ~ 0
~IRQ6
$Comp
L device:R R401
U 1 1 5E134155
P 1800 1150
F 0 "R401" H 1870 1196 50  0000 L CNN
F 1 "4k7" H 1870 1105 50  0000 L CNN
F 2 "" V 1730 1150 50  0001 C CNN
F 3 "" H 1800 1150 50  0001 C CNN
	1    1800 1150
	1    0    0    -1  
$EndComp
$Comp
L device:R R402
U 1 1 5E1350D9
P 2150 1150
F 0 "R402" H 2220 1196 50  0000 L CNN
F 1 "4k7" H 2220 1105 50  0000 L CNN
F 2 "" V 2080 1150 50  0001 C CNN
F 3 "" H 2150 1150 50  0001 C CNN
	1    2150 1150
	1    0    0    -1  
$EndComp
$Comp
L device:R R404
U 1 1 5E135876
P 2500 1150
F 0 "R404" H 2570 1196 50  0000 L CNN
F 1 "4k7" H 2570 1105 50  0000 L CNN
F 2 "" V 2430 1150 50  0001 C CNN
F 3 "" H 2500 1150 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
$Comp
L device:R R405
U 1 1 5E13587C
P 2850 1150
F 0 "R405" H 2920 1196 50  0000 L CNN
F 1 "4k7" H 2920 1105 50  0000 L CNN
F 2 "" V 2780 1150 50  0001 C CNN
F 3 "" H 2850 1150 50  0001 C CNN
	1    2850 1150
	1    0    0    -1  
$EndComp
$Comp
L device:R R406
U 1 1 5E135FE1
P 3200 1150
F 0 "R406" H 3270 1196 50  0000 L CNN
F 1 "4k7" H 3270 1105 50  0000 L CNN
F 2 "" V 3130 1150 50  0001 C CNN
F 3 "" H 3200 1150 50  0001 C CNN
	1    3200 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1000 1800 800 
Wire Wire Line
	1800 800  2150 800 
Wire Wire Line
	3200 1000 3200 800 
Wire Wire Line
	3200 800  2850 800 
Wire Wire Line
	2150 1000 2150 800 
Wire Wire Line
	2850 1000 2850 800 
Wire Wire Line
	1800 1300 1800 1450
Wire Wire Line
	2150 1300 2150 1550
Wire Wire Line
	2500 1300 2500 1750
Wire Wire Line
	2850 1300 2850 1850
Wire Wire Line
	3200 1300 3200 2050
Wire Wire Line
	7650 4150 7550 4150
Wire Wire Line
	9850 900  10100 900 
Text HLabel 10100 900  2    50   Output ~ 0
~IRQ
$Comp
L 74xx:74LS540 U404
U 1 1 5E148ECE
P 9500 4650
F 0 "U404" H 9500 5628 50  0000 C CNN
F 1 "74HCT540" H 9500 5537 50  0000 C CNN
F 2 "" H 9500 4650 50  0001 C CNN
F 3 "" H 9500 4650 50  0001 C CNN
	1    9500 4650
	1    0    0    -1  
$EndComp
Text HLabel 8500 6300 0    50   Input ~ 0
~RMEM
Text HLabel 1050 7600 0    50   Input ~ 0
~IRQCTRL_CS
Wire Wire Line
	3050 2650 2800 2650
Text HLabel 1100 2250 0    50   Input ~ 0
~IRQ3_CLR
Text HLabel 1100 2350 0    50   Input ~ 0
~IRQ6_CLR
Text Label 1200 1450 0    50   ~ 0
~IRQ1_IN
Text Label 1200 1550 0    50   ~ 0
~IRQ2_IN
Text Label 1200 1750 0    50   ~ 0
~IRQ4_IN
Text Label 1200 1850 0    50   ~ 0
~IRQ5_IN
Text Label 1200 1950 0    50   ~ 0
~IRQ6_IN
Text Label 3750 2050 0    50   ~ 0
~IRQ7
Wire Wire Line
	9000 4150 8650 4150
Wire Wire Line
	9000 4250 8650 4250
Wire Wire Line
	9000 4350 8650 4350
Wire Wire Line
	9000 4450 8650 4450
Wire Wire Line
	9000 4550 8800 4550
Wire Wire Line
	9000 4650 8800 4650
Wire Wire Line
	9000 4750 8800 4750
Wire Wire Line
	9000 4850 8800 4850
Wire Wire Line
	9500 5450 9500 5550
$Comp
L power:GND #PWR?
U 1 1 5E169658
P 9500 5550
F 0 "#PWR?" H 9500 5300 50  0001 C CNN
F 1 "GND" H 9505 5377 50  0000 C CNN
F 2 "" H 9500 5550 50  0001 C CNN
F 3 "" H 9500 5550 50  0001 C CNN
	1    9500 5550
	1    0    0    -1  
$EndComp
$Comp
L device:R R407
U 1 1 5E16A1BD
P 1650 4300
F 0 "R407" H 1720 4346 50  0000 L CNN
F 1 "4k7" H 1720 4255 50  0000 L CNN
F 2 "" V 1580 4300 50  0001 C CNN
F 3 "" H 1650 4300 50  0001 C CNN
	1    1650 4300
	1    0    0    -1  
$EndComp
$Comp
L device:R R403
U 1 1 5E16A1C3
P 2000 4300
F 0 "R403" H 2070 4346 50  0000 L CNN
F 1 "4k7" H 2070 4255 50  0000 L CNN
F 2 "" V 1930 4300 50  0001 C CNN
F 3 "" H 2000 4300 50  0001 C CNN
	1    2000 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4550 1850 4650
$Comp
L power:GND #PWR?
U 1 1 5E16F0B5
P 1850 4650
F 0 "#PWR?" H 1850 4400 50  0001 C CNN
F 1 "GND" H 1855 4477 50  0000 C CNN
F 2 "" H 1850 4650 50  0001 C CNN
F 3 "" H 1850 4650 50  0001 C CNN
	1    1850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4550 1650 4550
Wire Wire Line
	1650 4550 1650 4450
Wire Wire Line
	2000 4450 2000 4550
Wire Wire Line
	2000 4550 1850 4550
Connection ~ 1850 4550
Wire Wire Line
	1650 4150 1650 4050
Wire Wire Line
	10000 4150 10250 4150
Wire Wire Line
	10000 4250 10250 4250
Wire Wire Line
	10000 4350 10250 4350
Wire Wire Line
	10000 4450 10250 4450
Wire Wire Line
	10000 4550 10250 4550
Wire Wire Line
	10000 4650 10250 4650
Wire Wire Line
	10000 4750 10250 4750
Wire Wire Line
	10000 4850 10250 4850
Text HLabel 900  4200 0    50   BiDi ~ 0
D0
Text HLabel 900  4300 0    50   BiDi ~ 0
D1
Text HLabel 900  4400 0    50   BiDi ~ 0
D2
Text HLabel 900  4500 0    50   BiDi ~ 0
D3
Text HLabel 900  4600 0    50   BiDi ~ 0
D4
Text HLabel 900  4700 0    50   BiDi ~ 0
D5
Text HLabel 900  4800 0    50   BiDi ~ 0
D6
Text HLabel 900  4900 0    50   BiDi ~ 0
D7
Wire Wire Line
	4300 7350 4300 7100
Wire Wire Line
	5500 7100 5500 6950
$Comp
L power:VCC #PWR?
U 1 1 5E1943DB
P 5500 6950
F 0 "#PWR?" H 5500 6800 50  0001 C CNN
F 1 "VCC" H 5517 7123 50  0000 C CNN
F 2 "" H 5500 6950 50  0001 C CNN
F 3 "" H 5500 6950 50  0001 C CNN
	1    5500 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 8150 4300 8400
Wire Wire Line
	5500 8400 5500 8500
$Comp
L power:GND #PWR?
U 1 1 5E19C08B
P 5500 8500
F 0 "#PWR?" H 5500 8250 50  0001 C CNN
F 1 "GND" H 5505 8327 50  0000 C CNN
F 2 "" H 5500 8500 50  0001 C CNN
F 3 "" H 5500 8500 50  0001 C CNN
	1    5500 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 7250 5100 7100
Wire Wire Line
	5100 8250 5100 8400
$Comp
L device:C C401
U 1 1 5E1B4035
P 650 8250
F 0 "C401" H 765 8296 50  0000 L CNN
F 1 "100nF" H 765 8205 50  0000 L CNN
F 2 "" H 688 8100 50  0001 C CNN
F 3 "" H 650 8250 50  0001 C CNN
	1    650  8250
	1    0    0    -1  
$EndComp
$Comp
L device:C C402
U 1 1 5E1B7F4B
P 1150 8250
F 0 "C402" H 1265 8296 50  0000 L CNN
F 1 "100nF" H 1265 8205 50  0000 L CNN
F 2 "" H 1188 8100 50  0001 C CNN
F 3 "" H 1150 8250 50  0001 C CNN
	1    1150 8250
	1    0    0    -1  
$EndComp
$Comp
L device:C C403
U 1 1 5E1BBD0D
P 1650 8250
F 0 "C403" H 1765 8296 50  0000 L CNN
F 1 "100nF" H 1765 8205 50  0000 L CNN
F 2 "" H 1688 8100 50  0001 C CNN
F 3 "" H 1650 8250 50  0001 C CNN
	1    1650 8250
	1    0    0    -1  
$EndComp
$Comp
L device:C C404
U 1 1 5E1BBD13
P 2150 8250
F 0 "C404" H 2265 8296 50  0000 L CNN
F 1 "100nF" H 2265 8205 50  0000 L CNN
F 2 "" H 2188 8100 50  0001 C CNN
F 3 "" H 2150 8250 50  0001 C CNN
	1    2150 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 8000 2400 7900
Wire Wire Line
	650  8000 650  8100
$Comp
L power:VCC #PWR?
U 1 1 5E1D3053
P 2400 7900
F 0 "#PWR?" H 2400 7750 50  0001 C CNN
F 1 "VCC" H 2417 8073 50  0000 C CNN
F 2 "" H 2400 7900 50  0001 C CNN
F 3 "" H 2400 7900 50  0001 C CNN
	1    2400 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 8100 1650 8000
Wire Wire Line
	2150 8100 2150 8000
Wire Wire Line
	2150 8000 1650 8000
Connection ~ 1650 8000
Wire Wire Line
	1150 8100 1150 8000
Connection ~ 1150 8000
Wire Wire Line
	1150 8000 650  8000
Wire Wire Line
	650  8400 650  8500
Wire Wire Line
	650  8500 1150 8500
Wire Wire Line
	2400 8500 2400 8600
$Comp
L power:GND #PWR?
U 1 1 5E1E48BD
P 2400 8600
F 0 "#PWR?" H 2400 8350 50  0001 C CNN
F 1 "GND" H 2405 8427 50  0000 C CNN
F 2 "" H 2400 8600 50  0001 C CNN
F 3 "" H 2400 8600 50  0001 C CNN
	1    2400 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 8400 2150 8500
Wire Wire Line
	2150 8500 1650 8500
Wire Wire Line
	1150 8400 1150 8500
Connection ~ 1150 8500
Wire Wire Line
	1650 8400 1650 8500
Connection ~ 1650 8500
Text Notes 1200 7950 0    50   ~ 0
Decoupling caps, place near\nU401-U407
$Comp
L power:VCC #PWR?
U 1 1 5E136F3C
P 2500 750
F 0 "#PWR?" H 2500 600 50  0001 C CNN
F 1 "VCC" H 2517 923 50  0000 C CNN
F 2 "" H 2500 750 50  0001 C CNN
F 3 "" H 2500 750 50  0001 C CNN
	1    2500 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1000 2500 800 
Wire Wire Line
	2150 800  2500 800 
Connection ~ 2150 800 
Connection ~ 2500 800 
Wire Wire Line
	2500 800  2500 750 
Wire Wire Line
	2850 800  2500 800 
Connection ~ 2850 800 
Text Notes 7450 7750 0    50   ~ 0
Interrupt controller
Text Label 3750 1450 0    50   ~ 0
~IRQ1
Text Label 3750 1550 0    50   ~ 0
~IRQ2
Text Label 3750 1650 0    50   ~ 0
~IRQ3
Text Label 3750 1750 0    50   ~ 0
~IRQ4
Text Label 3750 1850 0    50   ~ 0
~IRQ5
Text Label 3750 1950 0    50   ~ 0
~IRQ6
Text Label 1200 2050 0    50   ~ 0
~IRQ7_IN
Text Notes 9350 1350 0    50   ~ 0
~IRQ~ is asserted whenever any\nexternal interrupt is asserted
Text Notes 7900 3500 0    50   ~ 0
Interrupt priority\nencoder
Text Notes 9200 3550 0    50   ~ 0
Buffer allowing CPU to\nread the current interrupt\npriority
Wire Wire Line
	8850 1400 8950 1400
Wire Wire Line
	8950 1400 8950 900 
Wire Wire Line
	8950 900  9250 900 
Wire Wire Line
	1650 4050 2750 4050
Wire Wire Line
	1100 2250 2800 2250
Wire Wire Line
	2800 2250 2800 2650
Wire Wire Line
	2700 3750 2700 2350
Wire Wire Line
	2700 2350 1100 2350
Wire Wire Line
	2700 3750 3050 3750
Wire Wire Line
	2000 2950 2000 1650
Wire Wire Line
	2000 1650 1100 1650
Text Label 1200 1650 0    50   ~ 0
~IRQ3_IN
Wire Wire Line
	1650 4050 1650 1950
Wire Wire Line
	1650 1950 1100 1950
Wire Wire Line
	1100 1450 1800 1450
Connection ~ 1800 1450
Wire Wire Line
	1100 1550 2150 1550
Connection ~ 2150 1550
Wire Wire Line
	1100 1750 2500 1750
Connection ~ 2500 1750
Wire Wire Line
	1100 1850 2850 1850
Connection ~ 2850 1850
Wire Wire Line
	1100 2050 3200 2050
Connection ~ 3200 2050
$Comp
L 74xx:74LS574 U405
U 1 1 5E24DC68
P 2550 5850
F 0 "U405" H 2550 6828 50  0000 C CNN
F 1 "74HCT574" H 2550 6737 50  0000 C CNN
F 2 "" H 2550 5850 50  0001 C CNN
F 3 "" H 2550 5850 50  0001 C CNN
	1    2550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4200 1200 4200
Wire Wire Line
	900  4300 1200 4300
Wire Wire Line
	900  4400 1200 4400
Wire Wire Line
	900  4500 1200 4500
Wire Wire Line
	900  4600 1200 4600
Wire Wire Line
	900  4700 1200 4700
Wire Wire Line
	900  4800 1200 4800
Wire Wire Line
	900  4900 1200 4900
Text Label 950  4200 0    50   ~ 0
D0
Text Label 950  4300 0    50   ~ 0
D1
Text Label 950  4400 0    50   ~ 0
D2
Text Label 950  4500 0    50   ~ 0
D3
Text Label 950  4600 0    50   ~ 0
D4
Text Label 950  4700 0    50   ~ 0
D5
Text Label 950  4800 0    50   ~ 0
D6
Text Label 950  4900 0    50   ~ 0
D7
Entry Wire Line
	1200 4200 1300 4300
Entry Wire Line
	1200 4300 1300 4400
Entry Wire Line
	1200 4400 1300 4500
Entry Wire Line
	1200 4500 1300 4600
Entry Wire Line
	1200 4600 1300 4700
Entry Wire Line
	1200 4700 1300 4800
Entry Wire Line
	1200 4800 1300 4900
Entry Wire Line
	1200 4900 1300 5000
Wire Wire Line
	2550 5050 2850 5050
Wire Wire Line
	2850 5050 2850 4950
$Comp
L power:VCC #PWR?
U 1 1 5E26C350
P 2850 4950
F 0 "#PWR?" H 2850 4800 50  0001 C CNN
F 1 "VCC" H 2867 5123 50  0000 C CNN
F 2 "" H 2850 4950 50  0001 C CNN
F 3 "" H 2850 4950 50  0001 C CNN
	1    2850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5450 1400 5450
Wire Wire Line
	2050 5550 1400 5550
Wire Wire Line
	2050 5650 1400 5650
Wire Wire Line
	2050 5750 1400 5750
Wire Wire Line
	2050 5850 1400 5850
Wire Wire Line
	2050 5950 1400 5950
Wire Wire Line
	2050 6050 1400 6050
Text Label 1900 5350 0    50   ~ 0
D0
Text Label 1900 5450 0    50   ~ 0
D1
Text Label 1900 5550 0    50   ~ 0
D2
Text Label 1900 5650 0    50   ~ 0
D3
Text Label 1900 5750 0    50   ~ 0
D4
Text Label 1900 5850 0    50   ~ 0
D5
Text Label 1900 5950 0    50   ~ 0
D6
Text Label 1900 6050 0    50   ~ 0
D7
Entry Wire Line
	1300 5350 1400 5450
Entry Wire Line
	1300 5450 1400 5550
Entry Wire Line
	1300 5550 1400 5650
Entry Wire Line
	1300 5650 1400 5750
Entry Wire Line
	1300 5750 1400 5850
Entry Wire Line
	1300 5850 1400 5950
Entry Wire Line
	1300 5950 1400 6050
Wire Wire Line
	2550 6650 2550 6700
$Comp
L power:GND #PWR?
U 1 1 5E2810E3
P 2550 6700
F 0 "#PWR?" H 2550 6450 50  0001 C CNN
F 1 "GND" H 2555 6527 50  0000 C CNN
F 2 "" H 2550 6700 50  0001 C CNN
F 3 "" H 2550 6700 50  0001 C CNN
	1    2550 6700
	1    0    0    -1  
$EndComp
Connection ~ 1650 4050
Wire Wire Line
	2000 4150 2000 2950
Connection ~ 2000 2950
Wire Wire Line
	2000 2950 2750 2950
$Comp
L 74xx:74LS32 U406
U 1 1 5E322414
P 5650 1550
F 0 "U406" H 5650 1875 50  0000 C CNN
F 1 "74HCT32" H 5650 1784 50  0000 C CNN
F 2 "" H 5650 1550 50  0001 C CNN
F 3 "" H 5650 1550 50  0001 C CNN
	1    5650 1550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U406
U 2 1 5E3224A3
P 5650 2100
F 0 "U406" H 5650 2425 50  0000 C CNN
F 1 "74HCT32" H 5650 2334 50  0000 C CNN
F 2 "" H 5650 2100 50  0001 C CNN
F 3 "" H 5650 2100 50  0001 C CNN
	2    5650 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U406
U 3 1 5E322535
P 5650 2650
F 0 "U406" H 5650 2975 50  0000 C CNN
F 1 "74HCT32" H 5650 2884 50  0000 C CNN
F 2 "" H 5650 2650 50  0001 C CNN
F 3 "" H 5650 2650 50  0001 C CNN
	3    5650 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U406
U 4 1 5E3225B6
P 5650 3200
F 0 "U406" H 5650 3525 50  0000 C CNN
F 1 "74HCT32" H 5650 3434 50  0000 C CNN
F 2 "" H 5650 3200 50  0001 C CNN
F 3 "" H 5650 3200 50  0001 C CNN
	4    5650 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U406
U 5 1 5E322642
P 5900 7750
F 0 "U406" H 6130 7796 50  0000 L CNN
F 1 "74HCT32" H 6130 7705 50  0000 L CNN
F 2 "" H 5900 7750 50  0001 C CNN
F 3 "" H 5900 7750 50  0001 C CNN
	5    5900 7750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U407
U 1 1 5E3234AD
P 5650 3750
F 0 "U407" H 5650 4075 50  0000 C CNN
F 1 "74HCT32" H 5650 3984 50  0000 C CNN
F 2 "" H 5650 3750 50  0001 C CNN
F 3 "" H 5650 3750 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U407
U 2 1 5E3234B3
P 5650 4300
F 0 "U407" H 5650 4625 50  0000 C CNN
F 1 "74HCT32" H 5650 4534 50  0000 C CNN
F 2 "" H 5650 4300 50  0001 C CNN
F 3 "" H 5650 4300 50  0001 C CNN
	2    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U407
U 3 1 5E3234B9
P 5650 4850
F 0 "U407" H 5650 5175 50  0000 C CNN
F 1 "74HCT32" H 5650 5084 50  0000 C CNN
F 2 "" H 5650 4850 50  0001 C CNN
F 3 "" H 5650 4850 50  0001 C CNN
	3    5650 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U407
U 4 1 5E3234BF
P 2300 7500
F 0 "U407" H 2300 7825 50  0000 C CNN
F 1 "74HCT32" H 2300 7734 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	4    2300 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1450 5350 1450
Wire Wire Line
	5350 2000 4550 2000
Wire Wire Line
	4550 2000 4550 1550
Wire Wire Line
	2150 1550 4550 1550
Wire Wire Line
	3600 2850 3600 1650
Wire Wire Line
	3600 1650 4450 1650
Wire Wire Line
	4450 1650 4450 2550
Wire Wire Line
	4450 2550 5350 2550
Wire Wire Line
	5350 3100 4350 3100
Wire Wire Line
	4350 3100 4350 1750
Wire Wire Line
	2500 1750 4350 1750
Wire Wire Line
	5350 3650 4250 3650
Wire Wire Line
	4250 3650 4250 1850
Wire Wire Line
	2850 1850 4250 1850
Wire Wire Line
	3700 3950 3700 1950
Wire Wire Line
	3700 1950 4150 1950
Wire Wire Line
	4150 1950 4150 4200
Wire Wire Line
	4150 4200 5350 4200
Wire Wire Line
	3350 3950 3700 3950
Wire Wire Line
	5350 4750 4050 4750
Wire Wire Line
	4050 4750 4050 2050
Wire Wire Line
	3200 2050 4050 2050
Wire Wire Line
	3050 6050 5250 6050
Wire Wire Line
	5250 6050 5250 4950
Wire Wire Line
	5250 4950 5350 4950
Wire Wire Line
	3050 5950 5150 5950
Wire Wire Line
	5150 5950 5150 4400
Wire Wire Line
	5150 4400 5350 4400
Wire Wire Line
	3050 5850 5050 5850
Wire Wire Line
	5050 5850 5050 3850
Wire Wire Line
	5050 3850 5350 3850
Wire Wire Line
	3050 5750 4950 5750
Wire Wire Line
	4950 5750 4950 3300
Wire Wire Line
	4950 3300 5350 3300
Wire Wire Line
	3050 5650 4850 5650
Wire Wire Line
	4850 5650 4850 2750
Wire Wire Line
	4850 2750 5350 2750
Wire Wire Line
	3050 5550 4750 5550
Wire Wire Line
	4750 5550 4750 2200
Wire Wire Line
	4750 2200 5350 2200
Wire Wire Line
	3050 5450 4650 5450
Wire Wire Line
	4650 5450 4650 1650
Wire Wire Line
	4650 1650 5350 1650
$Comp
L 74xx:74LS32 U407
U 5 1 5E424895
P 6750 7750
F 0 "U407" H 6980 7796 50  0000 L CNN
F 1 "74HCT32" H 6980 7705 50  0000 L CNN
F 2 "" H 6750 7750 50  0001 C CNN
F 3 "" H 6750 7750 50  0001 C CNN
	5    6750 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5350 3300 5350
NoConn ~ 3300 5350
Wire Wire Line
	5950 1550 6200 1550
Wire Wire Line
	6200 1550 6200 800 
Wire Wire Line
	6200 800  7550 800 
Wire Wire Line
	5950 2100 6300 2100
Wire Wire Line
	6300 2100 6300 1300
Wire Wire Line
	6300 1300 7450 1300
Wire Wire Line
	5950 2650 6400 2650
Wire Wire Line
	6400 2650 6400 1400
Wire Wire Line
	6400 1400 7350 1400
Wire Wire Line
	5950 3200 6500 3200
Wire Wire Line
	6500 3200 6500 1500
Wire Wire Line
	6500 1500 7250 1500
Wire Wire Line
	5950 3750 6600 3750
Wire Wire Line
	6600 3750 6600 1900
Wire Wire Line
	5950 4300 6700 4300
Wire Wire Line
	6700 4300 6700 2000
Wire Wire Line
	5950 4850 6800 4850
Wire Wire Line
	6800 4850 6800 2100
Wire Wire Line
	9000 5050 8600 5050
Wire Wire Line
	8600 5050 8600 6300
Wire Wire Line
	8600 6300 8500 6300
Wire Wire Line
	9000 5150 8700 5150
Wire Wire Line
	8700 5150 8700 6450
Wire Wire Line
	1050 7600 2000 7600
Text Label 1150 7600 0    50   ~ 0
~IRQCTRL_CS
Wire Wire Line
	8000 6450 8700 6450
Text Label 8050 6450 0    50   ~ 0
~IRQCTRL_CS
Wire Wire Line
	2000 7400 1050 7400
Text HLabel 1050 7400 0    50   Input ~ 0
~WMEM
Wire Wire Line
	2600 7500 2950 7500
Wire Wire Line
	2950 7500 2950 6950
Wire Bus Line
	1400 7050 3050 7050
Entry Bus Bus
	1300 6950 1400 7050
Wire Wire Line
	7550 4150 7550 800 
Wire Wire Line
	7550 800  9250 800 
Wire Wire Line
	7450 4250 7450 1300
Wire Wire Line
	7450 4250 7650 4250
Connection ~ 7450 1300
Wire Wire Line
	7450 1300 8250 1300
Wire Wire Line
	7350 4350 7350 1400
Wire Wire Line
	7350 4350 7650 4350
Connection ~ 7350 1400
Wire Wire Line
	7350 1400 8250 1400
Wire Wire Line
	7250 4450 7650 4450
Wire Wire Line
	7150 4550 7650 4550
Wire Wire Line
	7050 4650 7650 4650
Wire Wire Line
	6600 1900 7150 1900
Wire Wire Line
	7250 4450 7250 1500
Connection ~ 7250 1500
Wire Wire Line
	7250 1500 8250 1500
Wire Wire Line
	6700 2000 7050 2000
Wire Wire Line
	7150 4550 7150 1900
Connection ~ 7150 1900
Wire Wire Line
	7150 1900 8250 1900
Wire Wire Line
	6800 2100 6950 2100
Wire Wire Line
	7050 4650 7050 2000
Connection ~ 7050 2000
Wire Wire Line
	7050 2000 8250 2000
Wire Wire Line
	6950 4750 6950 2100
Wire Wire Line
	6950 4750 7650 4750
Connection ~ 6950 2100
Wire Wire Line
	6950 2100 8250 2100
Entry Bus Bus
	3050 7050 3150 6950
Wire Bus Line
	3150 6950 3150 6700
Entry Bus Bus
	3150 6700 3250 6600
Wire Bus Line
	3250 6600 10250 6600
Entry Bus Bus
	10250 6600 10350 6500
Entry Wire Line
	10250 4150 10350 4250
Entry Wire Line
	10250 4250 10350 4350
Entry Wire Line
	10250 4350 10350 4450
Entry Wire Line
	10250 4450 10350 4550
Entry Wire Line
	10250 4550 10350 4650
Entry Wire Line
	10250 4650 10350 4750
Entry Wire Line
	10250 4750 10350 4850
Entry Wire Line
	10250 4850 10350 4950
Text Label 10000 4150 0    50   ~ 0
D0
Text Label 10000 4250 0    50   ~ 0
D1
Text Label 10000 4350 0    50   ~ 0
D2
Text Label 10000 4450 0    50   ~ 0
D3
Text Label 10000 4550 0    50   ~ 0
D4
Text Label 10000 4650 0    50   ~ 0
D5
Text Label 10000 4750 0    50   ~ 0
D6
Text Label 10000 4850 0    50   ~ 0
D7
$Comp
L device:C C405
U 1 1 5E75B086
P 2600 8250
F 0 "C405" H 2715 8296 50  0000 L CNN
F 1 "100nF" H 2715 8205 50  0000 L CNN
F 2 "" H 2638 8100 50  0001 C CNN
F 3 "" H 2600 8250 50  0001 C CNN
	1    2600 8250
	1    0    0    -1  
$EndComp
$Comp
L device:C C406
U 1 1 5E75B08C
P 3100 8250
F 0 "C406" H 3215 8296 50  0000 L CNN
F 1 "100nF" H 3215 8205 50  0000 L CNN
F 2 "" H 3138 8100 50  0001 C CNN
F 3 "" H 3100 8250 50  0001 C CNN
	1    3100 8250
	1    0    0    -1  
$EndComp
$Comp
L device:C C407
U 1 1 5E75B092
P 3600 8250
F 0 "C407" H 3715 8296 50  0000 L CNN
F 1 "100nF" H 3715 8205 50  0000 L CNN
F 2 "" H 3638 8100 50  0001 C CNN
F 3 "" H 3600 8250 50  0001 C CNN
	1    3600 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 8100 3100 8000
Wire Wire Line
	3600 8100 3600 8000
Wire Wire Line
	2600 8100 2600 8000
Wire Wire Line
	1150 8000 1650 8000
Wire Wire Line
	1150 8500 1650 8500
Wire Wire Line
	3600 8000 3100 8000
Connection ~ 2150 8000
Connection ~ 2400 8000
Wire Wire Line
	2400 8000 2150 8000
Connection ~ 2600 8000
Wire Wire Line
	2600 8000 2400 8000
Connection ~ 3100 8000
Wire Wire Line
	3100 8000 2600 8000
Wire Wire Line
	3600 8400 3600 8500
Wire Wire Line
	3600 8500 3100 8500
Connection ~ 2150 8500
Connection ~ 2400 8500
Wire Wire Line
	2400 8500 2150 8500
Wire Wire Line
	2600 8400 2600 8500
Connection ~ 2600 8500
Wire Wire Line
	2600 8500 2400 8500
Wire Wire Line
	3100 8400 3100 8500
Connection ~ 3100 8500
Wire Wire Line
	3100 8500 2600 8500
Wire Wire Line
	4300 7100 5100 7100
Wire Wire Line
	4300 8400 5100 8400
Wire Wire Line
	6750 7250 6750 7100
Wire Wire Line
	6750 7100 5900 7100
Connection ~ 5100 7100
Connection ~ 5500 7100
Wire Wire Line
	5500 7100 5100 7100
Wire Wire Line
	5900 7250 5900 7100
Connection ~ 5900 7100
Wire Wire Line
	5900 7100 5500 7100
Wire Wire Line
	6750 8250 6750 8400
Wire Wire Line
	6750 8400 5900 8400
Connection ~ 5100 8400
Connection ~ 5500 8400
Wire Wire Line
	5500 8400 5100 8400
Wire Wire Line
	5900 8250 5900 8400
Connection ~ 5900 8400
Wire Wire Line
	5900 8400 5500 8400
Text Notes 2900 6350 0    50   ~ 0
Selectively enable/disable\nindividual IRQs (0=enable,\n1=disable)
Text Notes 5300 1200 0    50   ~ 0
IRQ enable/disable\nlogic
Connection ~ 7550 800 
Wire Wire Line
	9500 3850 9800 3850
Wire Wire Line
	9800 3850 9800 3700
$Comp
L power:VCC #PWR?
U 1 1 5E9D33AB
P 9800 3700
F 0 "#PWR?" H 9800 3550 50  0001 C CNN
F 1 "VCC" H 9817 3873 50  0000 C CNN
F 2 "" H 9800 3700 50  0001 C CNN
F 3 "" H 9800 3700 50  0001 C CNN
	1    9800 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4850 8800 4750
Connection ~ 8800 4550
Wire Wire Line
	8800 4550 8800 3950
Connection ~ 8800 4650
Wire Wire Line
	8800 4650 8800 4550
Connection ~ 8800 4750
Wire Wire Line
	8800 4750 8800 4650
$Comp
L power:VCC #PWR?
U 1 1 5EB19734
P 8800 3950
F 0 "#PWR?" H 8800 3800 50  0001 C CNN
F 1 "VCC" H 8817 4123 50  0000 C CNN
F 2 "" H 8800 3950 50  0001 C CNN
F 3 "" H 8800 3950 50  0001 C CNN
	1    8800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6250 2050 6250
Wire Wire Line
	1500 6950 1500 6250
Wire Wire Line
	2950 6950 1500 6950
$Comp
L power:GND #PWR?
U 1 1 5E281058
P 1700 6700
F 0 "#PWR?" H 1700 6450 50  0001 C CNN
F 1 "GND" H 1705 6527 50  0000 C CNN
F 2 "" H 1700 6700 50  0001 C CNN
F 3 "" H 1700 6700 50  0001 C CNN
	1    1700 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6350 1700 6700
Wire Wire Line
	2050 6350 1700 6350
Wire Wire Line
	2050 5350 1700 5350
Wire Wire Line
	1700 5350 1700 6350
Wire Bus Line
	10350 4250 10350 6500
Wire Bus Line
	1300 4300 1300 6950
Connection ~ 1700 6350
$EndSCHEMATC
