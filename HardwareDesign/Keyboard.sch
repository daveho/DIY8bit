EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 12100 9350
encoding utf-8
Sheet 6 6
Title "keyboard controller"
Date ""
Rev ""
Comp "daveho hacks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L memory:IDT7201 U502
U 1 1 5E2D049F
P 9700 2400
F 0 "U502" H 9700 3581 50  0000 C CNN
F 1 "IDT7201" H 9700 3490 50  0000 C CNN
F 2 "" H 9700 2400 50  0001 C CNN
F 3 "" H 9700 2400 50  0001 C CNN
	1    9700 2400
	1    0    0    -1  
$EndComp
$Comp
L P80C32SBPN:P80C32SBPN U501
U 1 1 5E2D16A0
P 6000 5300
F 0 "U501" H 6000 7070 50  0000 C CNN
F 1 "87C51/89C51" H 6000 6979 50  0000 C CNN
F 2 "DIP254P1524X470-40" H 6000 5300 50  0001 L BNN
F 3 "None" H 6000 5300 50  0001 L BNN
F 4 "NXP Semiconductors" H 6000 5300 50  0001 L BNN "Field4"
F 5 "DIP-40 NXP Semiconductors" H 6000 5300 50  0001 L BNN "Field5"
F 6 "Microcontroller 8-Bit" H 6000 5300 50  0001 L BNN "Field6"
F 7 "P80C32SBPN" H 6000 5300 50  0001 L BNN "Field7"
F 8 "Unavailable" H 6000 5300 50  0001 L BNN "Field8"
	1    6000 5300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U503
U 1 1 5E2E7734
P 6650 2000
F 0 "U503" H 6650 2781 50  0000 C CNN
F 1 "74HCT138" H 6650 2690 50  0000 C CNN
F 2 "" H 6650 2000 50  0001 C CNN
F 3 "" H 6650 2000 50  0001 C CNN
	1    6650 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U504
U 1 1 5E2E8359
P 9700 5300
F 0 "U504" H 9700 6281 50  0000 C CNN
F 1 "74HCT541" H 9700 6190 50  0000 C CNN
F 2 "" H 9700 5300 50  0001 C CNN
F 3 "" H 9700 5300 50  0001 C CNN
	1    9700 5300
	1    0    0    -1  
$EndComp
Text Label 4500 4500 0    50   ~ 0
COL0
Text Label 4500 4600 0    50   ~ 0
COL1
Text Label 4500 4700 0    50   ~ 0
COL2
Text Label 4500 4800 0    50   ~ 0
COL3
Text Label 4500 4900 0    50   ~ 0
COL4
Text Label 4500 5000 0    50   ~ 0
COL5
Text Label 4500 5100 0    50   ~ 0
COL6
Text Label 4500 5200 0    50   ~ 0
COL7
Text Label 4500 5400 0    50   ~ 0
ROW0
Text Label 4500 5500 0    50   ~ 0
ROW1
Text Label 4500 5600 0    50   ~ 0
ROW2
Text Label 4500 5700 0    50   ~ 0
ROW3
Text Label 4500 5800 0    50   ~ 0
ROW4
Text Label 4500 5900 0    50   ~ 0
ROW5
Text Label 4500 6000 0    50   ~ 0
ROW6
Text Label 4500 6100 0    50   ~ 0
ROW7
Wire Wire Line
	3550 6100 3450 6100
Wire Wire Line
	6150 1800 5900 1800
Wire Wire Line
	5900 1800 5900 1900
Wire Wire Line
	6150 1900 5900 1900
Connection ~ 5900 1900
Wire Wire Line
	5900 1900 5900 1950
$Comp
L power:GND #PWR?
U 1 1 5E444C89
P 5900 1950
F 0 "#PWR?" H 5900 1700 50  0001 C CNN
F 1 "GND" H 5905 1777 50  0000 C CNN
F 2 "" H 5900 1950 50  0001 C CNN
F 3 "" H 5900 1950 50  0001 C CNN
	1    5900 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1700 5450 1700
Wire Wire Line
	6150 2300 5450 2300
Wire Wire Line
	6150 2400 5450 2400
Text HLabel 5450 1700 0    50   Input ~ 0
A0
Text HLabel 5450 2300 0    50   Input ~ 0
~RMEM
Text HLabel 5450 2400 0    50   Input ~ 0
~KB_CS
Wire Wire Line
	6150 2200 5650 2200
Wire Wire Line
	5650 2200 5650 2000
$Comp
L power:VCC #PWR?
U 1 1 5E4564AB
P 5650 2000
F 0 "#PWR?" H 5650 1850 50  0001 C CNN
F 1 "VCC" H 5667 2173 50  0000 C CNN
F 2 "" H 5650 2000 50  0001 C CNN
F 3 "" H 5650 2000 50  0001 C CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1400 6950 1400
Wire Wire Line
	6950 1400 6950 1200
$Comp
L power:VCC #PWR?
U 1 1 5E458D61
P 6950 1200
F 0 "#PWR?" H 6950 1050 50  0001 C CNN
F 1 "VCC" H 6967 1373 50  0000 C CNN
F 2 "" H 6950 1200 50  0001 C CNN
F 3 "" H 6950 1200 50  0001 C CNN
	1    6950 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1400 10000 1400
Wire Wire Line
	10000 1400 10000 1150
$Comp
L power:VCC #PWR?
U 1 1 5E45F8C2
P 10000 1150
F 0 "#PWR?" H 10000 1000 50  0001 C CNN
F 1 "VCC" H 10017 1323 50  0000 C CNN
F 2 "" H 10000 1150 50  0001 C CNN
F 3 "" H 10000 1150 50  0001 C CNN
	1    10000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4500 10050 4500
Wire Wire Line
	10050 4500 10050 4300
$Comp
L power:VCC #PWR?
U 1 1 5E4645C6
P 10050 4300
F 0 "#PWR?" H 10050 4150 50  0001 C CNN
F 1 "VCC" H 10067 4473 50  0000 C CNN
F 2 "" H 10050 4300 50  0001 C CNN
F 3 "" H 10050 4300 50  0001 C CNN
	1    10050 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3400 9700 3550
$Comp
L power:GND #PWR?
U 1 1 5E46CD86
P 9700 3550
F 0 "#PWR?" H 9700 3300 50  0001 C CNN
F 1 "GND" H 9705 3377 50  0000 C CNN
F 2 "" H 9700 3550 50  0001 C CNN
F 3 "" H 9700 3550 50  0001 C CNN
	1    9700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 6100 9700 6250
$Comp
L power:GND #PWR?
U 1 1 5E46E409
P 9700 6250
F 0 "#PWR?" H 9700 6000 50  0001 C CNN
F 1 "GND" H 9705 6077 50  0000 C CNN
F 2 "" H 9700 6250 50  0001 C CNN
F 3 "" H 9700 6250 50  0001 C CNN
	1    9700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4500 4900 4500
Wire Wire Line
	4150 4600 4900 4600
Wire Wire Line
	4150 4700 4900 4700
Wire Wire Line
	4150 4800 4900 4800
Wire Wire Line
	4150 4900 4900 4900
Wire Wire Line
	4150 5000 4900 5000
Wire Wire Line
	4150 5100 4900 5100
Wire Wire Line
	4150 5200 4900 5200
Wire Wire Line
	7150 1700 7750 1700
Wire Wire Line
	11050 1750 10400 1750
Wire Wire Line
	9200 5800 9050 5800
Wire Wire Line
	9050 5800 9050 5950
$Comp
L power:GND #PWR?
U 1 1 5E4A8020
P 9050 5950
F 0 "#PWR?" H 9050 5700 50  0001 C CNN
F 1 "GND" H 9055 5777 50  0000 C CNN
F 2 "" H 9050 5950 50  0001 C CNN
F 3 "" H 9050 5950 50  0001 C CNN
	1    9050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1800 7750 1800
Text Label 7350 1700 0    50   ~ 0
~RD_DATA
Text Label 7350 1800 0    50   ~ 0
~RD_CTRL
Text Label 10600 1750 0    50   ~ 0
~RD_DATA
Wire Wire Line
	9200 5700 8500 5700
Text Label 8600 5700 0    50   ~ 0
~RD_CTRL
Wire Wire Line
	10400 1850 10800 1850
Wire Wire Line
	10400 1950 10800 1950
Wire Wire Line
	10400 2050 10800 2050
Wire Wire Line
	10400 2150 10800 2150
Wire Wire Line
	10400 2250 10800 2250
Wire Wire Line
	10400 2350 10800 2350
Wire Wire Line
	10400 2450 10800 2450
Wire Wire Line
	10400 2550 10800 2550
Text Label 10600 1850 0    50   ~ 0
D0
Text Label 10600 1950 0    50   ~ 0
D1
Text Label 10600 2050 0    50   ~ 0
D2
Text Label 10600 2150 0    50   ~ 0
D3
Text Label 10600 2250 0    50   ~ 0
D4
Text Label 10600 2350 0    50   ~ 0
D5
Text Label 10600 2450 0    50   ~ 0
D6
Text Label 10600 2550 0    50   ~ 0
D7
Entry Wire Line
	10800 1850 10900 1950
Entry Wire Line
	10800 1950 10900 2050
Entry Wire Line
	10800 2050 10900 2150
Entry Wire Line
	10800 2150 10900 2250
Entry Wire Line
	10800 2250 10900 2350
Entry Wire Line
	10800 2350 10900 2450
Entry Wire Line
	10800 2450 10900 2550
Entry Wire Line
	10800 2550 10900 2650
Wire Wire Line
	11000 6350 11350 6350
Wire Wire Line
	11000 6450 11350 6450
Wire Wire Line
	11000 6550 11350 6550
Wire Wire Line
	11000 6650 11350 6650
Wire Wire Line
	11000 6750 11350 6750
Wire Wire Line
	11000 6850 11350 6850
Wire Wire Line
	11000 6950 11350 6950
Wire Wire Line
	11000 7050 11350 7050
Text Label 11100 6350 0    50   ~ 0
D0
Text Label 11100 6450 0    50   ~ 0
D1
Text Label 11100 6550 0    50   ~ 0
D2
Text Label 11100 6650 0    50   ~ 0
D3
Text Label 11100 6750 0    50   ~ 0
D4
Text Label 11100 6850 0    50   ~ 0
D5
Text Label 11100 6950 0    50   ~ 0
D6
Text Label 11100 7050 0    50   ~ 0
D7
Text HLabel 11350 6350 2    50   BiDi ~ 0
D0
Text HLabel 11350 6450 2    50   BiDi ~ 0
D1
Text HLabel 11350 6550 2    50   BiDi ~ 0
D2
Text HLabel 11350 6650 2    50   BiDi ~ 0
D3
Text HLabel 11350 6750 2    50   BiDi ~ 0
D4
Text HLabel 11350 6850 2    50   BiDi ~ 0
D5
Text HLabel 11350 6950 2    50   BiDi ~ 0
D6
Text HLabel 11350 7050 2    50   BiDi ~ 0
D7
Entry Wire Line
	10900 6250 11000 6350
Entry Wire Line
	10900 6350 11000 6450
Entry Wire Line
	10900 6450 11000 6550
Entry Wire Line
	10900 6550 11000 6650
Entry Wire Line
	10900 6650 11000 6750
Entry Wire Line
	10900 6750 11000 6850
Entry Wire Line
	10900 6850 11000 6950
Entry Wire Line
	10900 6950 11000 7050
Wire Wire Line
	10400 2750 10800 2750
Wire Wire Line
	10800 2750 10800 4000
Wire Wire Line
	10800 4000 8700 4000
Wire Wire Line
	8700 4000 8700 4800
Wire Wire Line
	8700 4800 9200 4800
Wire Wire Line
	10400 3050 10700 3050
Wire Wire Line
	10700 3050 10700 3900
Wire Wire Line
	10700 3900 8600 3900
Wire Wire Line
	8600 3900 8600 4900
Wire Wire Line
	8600 4900 9200 4900
Text Label 10500 2750 0    50   ~ 0
EF
Text Label 10500 3050 0    50   ~ 0
FF
Text Label 9050 4800 0    50   ~ 0
EF
Text Label 9050 4900 0    50   ~ 0
FF
Wire Wire Line
	9200 5000 9050 5000
Wire Wire Line
	9050 5000 9050 5100
Connection ~ 9050 5800
Wire Wire Line
	9200 5100 9050 5100
Connection ~ 9050 5100
Wire Wire Line
	9050 5100 9050 5200
Wire Wire Line
	9200 5200 9050 5200
Connection ~ 9050 5200
Wire Wire Line
	9050 5200 9050 5300
Wire Wire Line
	9200 5300 9050 5300
Connection ~ 9050 5300
Wire Wire Line
	9050 5300 9050 5400
Wire Wire Line
	9200 5400 9050 5400
Connection ~ 9050 5400
Wire Wire Line
	9050 5400 9050 5500
Wire Wire Line
	9200 5500 9050 5500
Connection ~ 9050 5500
Wire Wire Line
	9050 5500 9050 5800
Wire Wire Line
	10200 4800 10800 4800
Wire Wire Line
	10200 4900 10800 4900
Wire Wire Line
	10200 5000 10800 5000
Wire Wire Line
	10200 5100 10800 5100
Wire Wire Line
	10200 5200 10800 5200
Wire Wire Line
	10200 5300 10800 5300
Wire Wire Line
	10200 5400 10800 5400
Wire Wire Line
	10200 5500 10800 5500
Entry Wire Line
	10800 4800 10900 4900
Entry Wire Line
	10800 4900 10900 5000
Entry Wire Line
	10800 5000 10900 5100
Entry Wire Line
	10800 5100 10900 5200
Entry Wire Line
	10800 5200 10900 5300
Entry Wire Line
	10800 5300 10900 5400
Entry Wire Line
	10800 5400 10900 5500
Entry Wire Line
	10800 5500 10900 5600
Text Label 10550 4800 0    50   ~ 0
D0
Text Label 10550 4900 0    50   ~ 0
D1
Text Label 10550 5000 0    50   ~ 0
D2
Text Label 10550 5100 0    50   ~ 0
D3
Text Label 10550 5200 0    50   ~ 0
D4
Text Label 10550 5300 0    50   ~ 0
D5
Text Label 10550 5400 0    50   ~ 0
D6
Text Label 10550 5500 0    50   ~ 0
D7
Wire Wire Line
	6650 2700 6650 2850
$Comp
L power:GND #PWR?
U 1 1 5E64FB23
P 6650 2850
F 0 "#PWR?" H 6650 2600 50  0001 C CNN
F 1 "GND" H 6655 2677 50  0000 C CNN
F 2 "" H 6650 2850 50  0001 C CNN
F 3 "" H 6650 2850 50  0001 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3900 4750 3900
Wire Wire Line
	4750 3900 4750 2900
$Comp
L power:VCC #PWR?
U 1 1 5E663AAB
P 4750 2900
F 0 "#PWR?" H 4750 2750 50  0001 C CNN
F 1 "VCC" H 4767 3073 50  0000 C CNN
F 2 "" H 4750 2900 50  0001 C CNN
F 3 "" H 4750 2900 50  0001 C CNN
	1    4750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6900 4750 6900
Wire Wire Line
	4750 6900 4750 7050
$Comp
L power:GND #PWR?
U 1 1 5E67442E
P 4750 7050
F 0 "#PWR?" H 4750 6800 50  0001 C CNN
F 1 "GND" H 4755 6877 50  0000 C CNN
F 2 "" H 4750 7050 50  0001 C CNN
F 3 "" H 4750 7050 50  0001 C CNN
	1    4750 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5500 4900 5500
Wire Wire Line
	3950 5600 4900 5600
Wire Wire Line
	3950 5700 4900 5700
Wire Wire Line
	3950 5800 4900 5800
Wire Wire Line
	3950 6000 4900 6000
Wire Wire Line
	3950 6100 4900 6100
Wire Wire Line
	3950 5400 4900 5400
Wire Wire Line
	3950 5900 4900 5900
Text Notes 2900 4950 0    50   ~ 0
Port 1 actively drives the\ncolumns of the keyboard\nmatrix: outputs are normally\nat VCC, but a column output\nis driven to GND when a scan\nof that column is in progress
Text Notes 2400 6100 0    50   ~ 0
Port 0 reads the rows\n(with pull up resistors\nkeeping the row inputs\nat VCC unless a\nkeyswitch has made a\nconnection to a column\nwhen the column scan\nis in progress)
Text Label 7700 4700 0    50   ~ 0
SCDAT0
Text Label 7700 4800 0    50   ~ 0
SCDAT1
Text Label 7700 4900 0    50   ~ 0
SCDAT2
Text Label 7700 5000 0    50   ~ 0
SCDAT3
Text Label 7700 5100 0    50   ~ 0
SCDAT4
Text Label 7700 5200 0    50   ~ 0
SCDAT5
Text Label 7700 5300 0    50   ~ 0
SCDAT6
Text Label 7700 5400 0    50   ~ 0
SCDAT7
Entry Wire Line
	8150 4700 8250 4600
Entry Wire Line
	8150 4800 8250 4700
Entry Wire Line
	8150 4900 8250 4800
Entry Wire Line
	8150 5000 8250 4900
Entry Wire Line
	8150 5100 8250 5000
Entry Wire Line
	8150 5200 8250 5100
Entry Wire Line
	8150 5300 8250 5200
Entry Wire Line
	8150 5400 8250 5300
Wire Wire Line
	8350 1850 9000 1850
Wire Wire Line
	8350 1950 9000 1950
Wire Wire Line
	8350 2050 9000 2050
Wire Wire Line
	8350 2150 9000 2150
Wire Wire Line
	8350 2250 9000 2250
Wire Wire Line
	8350 2350 9000 2350
Wire Wire Line
	8350 2450 9000 2450
Wire Wire Line
	8350 2550 9000 2550
Entry Wire Line
	8250 1950 8350 1850
Entry Wire Line
	8250 2050 8350 1950
Entry Wire Line
	8250 2150 8350 2050
Entry Wire Line
	8250 2250 8350 2150
Entry Wire Line
	8250 2350 8350 2250
Entry Wire Line
	8250 2450 8350 2350
Entry Wire Line
	8250 2550 8350 2450
Entry Wire Line
	8250 2650 8350 2550
Text Label 8600 1850 0    50   ~ 0
SCDAT0
Text Label 8600 1950 0    50   ~ 0
SCDAT1
Text Label 8600 2050 0    50   ~ 0
SCDAT2
Text Label 8600 2150 0    50   ~ 0
SCDAT3
Text Label 8600 2250 0    50   ~ 0
SCDAT4
Text Label 8600 2350 0    50   ~ 0
SCDAT5
Text Label 8600 2450 0    50   ~ 0
SCDAT6
Text Label 8600 2550 0    50   ~ 0
SCDAT7
Wire Wire Line
	9000 2650 8500 2650
Wire Wire Line
	8500 2650 8500 2750
$Comp
L power:GND #PWR?
U 1 1 5ED0CA81
P 8500 3550
F 0 "#PWR?" H 8500 3300 50  0001 C CNN
F 1 "GND" H 8505 3377 50  0000 C CNN
F 2 "" H 8500 3550 50  0001 C CNN
F 3 "" H 8500 3550 50  0001 C CNN
	1    8500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4400 8150 1750
Wire Wire Line
	8150 1750 9000 1750
Text Notes 5350 1450 0    50   ~ 0
Generate chip selects for\nreading data from FIFO\n(~RD_DATA~) and reading\nFIFO status bits (~RD_CTRL~).
Wire Wire Line
	9000 2750 8500 2750
Connection ~ 8500 2750
Wire Wire Line
	8500 2750 8500 3550
Wire Wire Line
	8350 4500 8350 2850
Wire Wire Line
	8350 2850 9000 2850
Text Label 7200 4400 0    50   ~ 0
~FIFO_WR
Text Label 7200 4500 0    50   ~ 0
~FIFO_CLR
Text Label 8600 1750 0    50   ~ 0
~FIFO_WR
Text Label 8600 2850 0    50   ~ 0
~FIFO_CLR
Text Notes 7100 5800 0    50   ~ 0
Port 2 is used for\nsending scan code\ndata to the FIFO\nchip.
$Comp
L device:C C501
U 1 1 5ED3B27E
P 3450 7950
F 0 "C501" H 3565 7996 50  0000 L CNN
F 1 "100nF" H 3565 7905 50  0000 L CNN
F 2 "" H 3488 7800 50  0001 C CNN
F 3 "" H 3450 7950 50  0001 C CNN
	1    3450 7950
	1    0    0    -1  
$EndComp
$Comp
L device:C C502
U 1 1 5ED3C82D
P 3950 7950
F 0 "C502" H 4065 7996 50  0000 L CNN
F 1 "100nF" H 4065 7905 50  0000 L CNN
F 2 "" H 3988 7800 50  0001 C CNN
F 3 "" H 3950 7950 50  0001 C CNN
	1    3950 7950
	1    0    0    -1  
$EndComp
$Comp
L device:C C503
U 1 1 5ED482DC
P 4450 7950
F 0 "C503" H 4565 7996 50  0000 L CNN
F 1 "100nF" H 4565 7905 50  0000 L CNN
F 2 "" H 4488 7800 50  0001 C CNN
F 3 "" H 4450 7950 50  0001 C CNN
	1    4450 7950
	1    0    0    -1  
$EndComp
$Comp
L device:C C504
U 1 1 5ED482E6
P 4950 7950
F 0 "C504" H 5065 7996 50  0000 L CNN
F 1 "100nF" H 5065 7905 50  0000 L CNN
F 2 "" H 4988 7800 50  0001 C CNN
F 3 "" H 4950 7950 50  0001 C CNN
	1    4950 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7800 3450 7600
Wire Wire Line
	3450 7600 3950 7600
Wire Wire Line
	4950 7600 4950 7800
Wire Wire Line
	3450 8100 3450 8350
Wire Wire Line
	3450 8350 3950 8350
Wire Wire Line
	4950 8350 4950 8100
Wire Wire Line
	4200 7600 4200 7450
Connection ~ 4200 7600
Wire Wire Line
	4200 7600 4450 7600
Wire Wire Line
	4200 8350 4200 8500
Connection ~ 4200 8350
Wire Wire Line
	4200 8350 4450 8350
$Comp
L power:VCC #PWR?
U 1 1 5ED8CCE0
P 4200 7450
F 0 "#PWR?" H 4200 7300 50  0001 C CNN
F 1 "VCC" H 4217 7623 50  0000 C CNN
F 2 "" H 4200 7450 50  0001 C CNN
F 3 "" H 4200 7450 50  0001 C CNN
	1    4200 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8CF8E
P 4200 8500
F 0 "#PWR?" H 4200 8250 50  0001 C CNN
F 1 "GND" H 4205 8327 50  0000 C CNN
F 2 "" H 4200 8500 50  0001 C CNN
F 3 "" H 4200 8500 50  0001 C CNN
	1    4200 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 7800 3950 7600
Connection ~ 3950 7600
Wire Wire Line
	3950 7600 4200 7600
Wire Wire Line
	4450 7800 4450 7600
Connection ~ 4450 7600
Wire Wire Line
	4450 7600 4950 7600
Wire Wire Line
	3950 8100 3950 8350
Connection ~ 3950 8350
Wire Wire Line
	3950 8350 4200 8350
Wire Wire Line
	4450 8100 4450 8350
Connection ~ 4450 8350
Wire Wire Line
	4450 8350 4950 8350
Text Notes 4400 8600 0    50   ~ 0
Decoupling caps: place near power pins\nof U501-U504
Text Notes 5500 7500 0    50   ~ 0
Microcontroller to scan\nkeyboard matrix and\nsend scan codes to FIFO.\nWill be a 89C51 or 87C51.
Wire Wire Line
	10400 2850 11500 2850
Wire Wire Line
	11500 2850 11500 2550
$Comp
L power:VCC #PWR?
U 1 1 5EDC1EFC
P 11500 2550
F 0 "#PWR?" H 11500 2400 50  0001 C CNN
F 1 "VCC" H 11517 2723 50  0000 C CNN
F 2 "" H 11500 2550 50  0001 C CNN
F 3 "" H 11500 2550 50  0001 C CNN
	1    11500 2550
	1    0    0    -1  
$EndComp
Text HLabel 4000 4100 0    50   Input ~ 0
RST
$Comp
L device:Crystal Y501
U 1 1 5ECF0BDF
P 7200 3400
F 0 "Y501" V 7250 3750 50  0000 R CNN
F 1 "11.0592 MHz" V 7150 4050 50  0000 R CNN
F 2 "" H 7200 3400 50  0001 C CNN
F 3 "" H 7200 3400 50  0001 C CNN
	1    7200 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 4300 4650 4300
Wire Wire Line
	4650 4300 4650 3250
Wire Wire Line
	4650 3250 7200 3250
Wire Wire Line
	7100 3900 7200 3900
Wire Wire Line
	7200 3550 7200 3600
Wire Wire Line
	7100 4700 8150 4700
Wire Wire Line
	7100 4800 8150 4800
Wire Wire Line
	7100 4900 8150 4900
Wire Wire Line
	7100 5000 8150 5000
Wire Wire Line
	7100 5100 8150 5100
Wire Wire Line
	7100 5200 8150 5200
Wire Wire Line
	7100 5300 8150 5300
Wire Wire Line
	7100 5400 8150 5400
Wire Wire Line
	7100 4400 8150 4400
Wire Wire Line
	7100 4500 8350 4500
Wire Wire Line
	7200 3250 7450 3250
Connection ~ 7200 3250
Wire Wire Line
	7450 3600 7200 3600
Connection ~ 7200 3600
Wire Wire Line
	7200 3600 7200 3900
Wire Wire Line
	4900 4200 4750 4200
Wire Wire Line
	4750 4200 4750 3900
Connection ~ 4750 3900
Text Notes 9150 6800 0    50   ~ 0
Buffer to allow EF (empty flag)\nand FF (full flag) bits of FIFO\nto be read by the CPU.
Wire Wire Line
	4000 4100 4900 4100
$Comp
L device:C C505
U 1 1 5F056A2F
P 7600 3250
F 0 "C505" V 7500 3100 50  0000 C CNN
F 1 "30pF" V 7500 3400 50  0000 C CNN
F 2 "" H 7638 3100 50  0001 C CNN
F 3 "" H 7600 3250 50  0001 C CNN
	1    7600 3250
	0    1    1    0   
$EndComp
$Comp
L device:C C506
U 1 1 5F064C1E
P 7600 3600
F 0 "C506" V 7500 3450 50  0000 C CNN
F 1 "30pF" V 7500 3750 50  0000 C CNN
F 2 "" H 7638 3450 50  0001 C CNN
F 3 "" H 7600 3600 50  0001 C CNN
	1    7600 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3250 7900 3250
Wire Wire Line
	7900 3250 7900 3600
Wire Wire Line
	7750 3600 7900 3600
Connection ~ 7900 3600
Wire Wire Line
	7900 3600 7900 3750
$Comp
L power:GND #PWR?
U 1 1 5F09EB58
P 7900 3750
F 0 "#PWR?" H 7900 3500 50  0001 C CNN
F 1 "GND" H 7905 3577 50  0000 C CNN
F 2 "" H 7900 3750 50  0001 C CNN
F 3 "" H 7900 3750 50  0001 C CNN
	1    7900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6100 3450 5900
$Comp
L power:VCC #PWR?
U 1 1 5ED640C7
P 3450 5900
F 0 "#PWR?" H 3450 5750 50  0001 C CNN
F 1 "VCC" H 3467 6073 50  0000 C CNN
F 2 "" H 3450 5900 50  0001 C CNN
F 3 "" H 3450 5900 50  0001 C CNN
	1    3450 5900
	1    0    0    -1  
$EndComp
Text Notes 3250 6400 0    50   ~ 0
The exact value of RN501 isn't\ncritical: anything between 2k7\nand 47k should work fine.
Text Label 1700 7450 0    50   ~ 0
COL5
Wire Wire Line
	1150 7750 2000 7750
Wire Wire Line
	1150 7650 2000 7650
Wire Wire Line
	1150 8450 2000 8450
Wire Wire Line
	1150 8150 2000 8150
Wire Wire Line
	1150 6650 2000 6650
Wire Wire Line
	1150 7850 2000 7850
Wire Wire Line
	1150 7350 2000 7350
Wire Wire Line
	1150 7150 2000 7150
Wire Wire Line
	1150 8250 2000 8250
Wire Wire Line
	1150 8050 2000 8050
Wire Wire Line
	1150 7950 2000 7950
Wire Wire Line
	1150 7550 2000 7550
Wire Wire Line
	1150 7450 2000 7450
Wire Wire Line
	1150 7250 2000 7250
Wire Wire Line
	1150 6850 2000 6850
Wire Wire Line
	1150 8350 2000 8350
Text Label 1700 8450 0    50   ~ 0
ROW7
Text Label 1700 8150 0    50   ~ 0
ROW6
Text Label 1700 6650 0    50   ~ 0
ROW5
Text Label 1700 7850 0    50   ~ 0
ROW4
Text Label 1700 7650 0    50   ~ 0
ROW3
Text Label 1700 7750 0    50   ~ 0
ROW2
Text Label 1700 7350 0    50   ~ 0
ROW1
Text Label 1700 7150 0    50   ~ 0
ROW0
Text Label 1700 8250 0    50   ~ 0
COL7
Text Label 1700 7550 0    50   ~ 0
COL6
Text Label 1700 7250 0    50   ~ 0
COL4
Text Label 1700 6850 0    50   ~ 0
COL3
Text Label 1700 7950 0    50   ~ 0
COL2
Text Label 1700 8050 0    50   ~ 0
COL1
Text Label 1700 8350 0    50   ~ 0
COL0
Text Notes 750  6300 0    50   ~ 0
C16 keyboard connector,\npin 2 is a key and should\nbe removed
NoConn ~ 1350 8550
Wire Wire Line
	1150 8550 1350 8550
NoConn ~ 1350 7050
Wire Wire Line
	1150 7050 1350 7050
NoConn ~ 1350 6950
Wire Wire Line
	1150 6950 1350 6950
NoConn ~ 1350 6750
Wire Wire Line
	1150 6750 1350 6750
$Comp
L Connector_Generic:Conn_01x20 J501
U 1 1 5E2FF21D
P 950 7550
F 0 "J501" H 868 8667 50  0000 C CNN
F 1 "Conn_01x20" H 868 8576 50  0000 C CNN
F 2 "" H 950 7550 50  0001 C CNN
F 3 "~" H 950 7550 50  0001 C CNN
	1    950  7550
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x40_Counter_Clockwise J?
U 1 1 63DC31C6
P 1650 2800
AR Path="/5CFA6AAA/63DC31C6" Ref="J?"  Part="1" 
AR Path="/5D49B078/63DC31C6" Ref="J?"  Part="1" 
AR Path="/5E2CF983/63DC31C6" Ref="J502"  Part="1" 
F 0 "J502" H 1700 4917 50  0000 C CNN
F 1 "Conn_02x40_Counter_Clockwise" H 1700 4826 50  0000 C CNN
F 2 "" H 1650 2800 50  0001 C CNN
F 3 "~" H 1650 2800 50  0001 C CNN
	1    1650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  900  1450 900 
Wire Wire Line
	900  1000 1450 1000
Wire Wire Line
	900  1100 1450 1100
Wire Wire Line
	900  1200 1450 1200
Wire Wire Line
	900  1300 1450 1300
Wire Wire Line
	900  1400 1450 1400
Wire Wire Line
	900  1500 1450 1500
Wire Wire Line
	900  1600 1450 1600
Wire Wire Line
	900  1700 1450 1700
Wire Wire Line
	900  1800 1450 1800
Wire Wire Line
	900  1900 1450 1900
Wire Wire Line
	900  2000 1450 2000
Wire Wire Line
	900  2100 1450 2100
Wire Wire Line
	900  2200 1450 2200
Wire Wire Line
	900  2300 1450 2300
Wire Wire Line
	900  2400 1450 2400
Wire Wire Line
	900  2500 1450 2500
Wire Wire Line
	900  2600 1450 2600
Wire Wire Line
	900  2700 1450 2700
Wire Wire Line
	900  2800 1450 2800
Wire Wire Line
	900  2900 1450 2900
Wire Wire Line
	900  3000 1450 3000
Wire Wire Line
	900  3100 1450 3100
Wire Wire Line
	900  3200 1450 3200
Wire Wire Line
	900  3300 1450 3300
Wire Wire Line
	900  3400 1450 3400
Wire Wire Line
	900  3500 1450 3500
Wire Wire Line
	900  3600 1450 3600
Wire Wire Line
	900  3700 1450 3700
Wire Wire Line
	900  3800 1450 3800
Wire Wire Line
	900  3900 1450 3900
Wire Wire Line
	900  4000 1450 4000
Wire Wire Line
	900  4100 1450 4100
Wire Wire Line
	900  4200 1450 4200
Wire Wire Line
	900  4300 1450 4300
Wire Wire Line
	900  4400 1450 4400
Wire Wire Line
	900  4500 1450 4500
Wire Wire Line
	900  4600 1450 4600
Wire Wire Line
	900  4700 1450 4700
Wire Wire Line
	900  4800 1450 4800
Wire Wire Line
	1950 900  2500 900 
Wire Wire Line
	1950 1000 2500 1000
Wire Wire Line
	1950 1100 2500 1100
Wire Wire Line
	1950 1200 2500 1200
Wire Wire Line
	1950 1300 2500 1300
Wire Wire Line
	1950 1400 2500 1400
Wire Wire Line
	1950 1500 2500 1500
Wire Wire Line
	1950 1600 2500 1600
Wire Wire Line
	1950 1700 2500 1700
Wire Wire Line
	1950 1800 2500 1800
Wire Wire Line
	1950 1900 2500 1900
Wire Wire Line
	1950 2000 2500 2000
Wire Wire Line
	1950 2100 2500 2100
Wire Wire Line
	1950 2200 2500 2200
Wire Wire Line
	1950 2300 2500 2300
Wire Wire Line
	1950 2400 2500 2400
Wire Wire Line
	1950 2500 2500 2500
Wire Wire Line
	1950 2600 2500 2600
Wire Wire Line
	1950 2700 2500 2700
Wire Wire Line
	1950 2800 2500 2800
Wire Wire Line
	1950 2900 2500 2900
Wire Wire Line
	1950 3000 2500 3000
Wire Wire Line
	1950 3100 2500 3100
Wire Wire Line
	1950 3200 2500 3200
Wire Wire Line
	1950 3300 2500 3300
Wire Wire Line
	1950 3400 2500 3400
Wire Wire Line
	1950 3500 2500 3500
Wire Wire Line
	1950 3600 2500 3600
Wire Wire Line
	1950 3700 2500 3700
Wire Wire Line
	1950 3800 2500 3800
Wire Wire Line
	1950 3900 2500 3900
Wire Wire Line
	1950 4000 2500 4000
Wire Wire Line
	1950 4100 2500 4100
Wire Wire Line
	1950 4200 2500 4200
Wire Wire Line
	1950 4300 2500 4300
Wire Wire Line
	1950 4400 2500 4400
Wire Wire Line
	1950 4500 2500 4500
Wire Wire Line
	1950 4600 2500 4600
Wire Wire Line
	1950 4700 2500 4700
Wire Wire Line
	1950 4800 2500 4800
Text Label 2300 1000 0    50   ~ 0
D0
Text Label 2300 1100 0    50   ~ 0
D1
Text Label 2300 1200 0    50   ~ 0
D2
Text Label 2300 1300 0    50   ~ 0
D3
Text Label 2300 1400 0    50   ~ 0
D4
Text Label 2300 1500 0    50   ~ 0
D5
Text Label 2300 1600 0    50   ~ 0
D6
Text Label 2300 1700 0    50   ~ 0
D7
Text Label 2300 1800 0    50   ~ 0
A8
Text Label 2300 1900 0    50   ~ 0
A9
Text Label 2250 2000 0    50   ~ 0
A10
Text Label 2250 2100 0    50   ~ 0
A11
Text Label 2250 2200 0    50   ~ 0
A12
Text Label 2250 2300 0    50   ~ 0
A13
Text Label 2250 2400 0    50   ~ 0
A14
Text Label 2250 2500 0    50   ~ 0
A15
Text Label 2300 2600 0    50   ~ 0
A0
Text Label 2300 2700 0    50   ~ 0
A1
Text Label 2300 2800 0    50   ~ 0
A2
Text Label 2300 2900 0    50   ~ 0
A3
Text Label 2300 3000 0    50   ~ 0
A4
Text Label 2300 3100 0    50   ~ 0
A5
Text Label 2300 3200 0    50   ~ 0
A6
Text Label 2300 3300 0    50   ~ 0
A7
Text Label 2250 4100 0    50   ~ 0
R~W
Text Label 2150 4200 0    50   ~ 0
~ROMEN~
Text Label 2350 4300 0    50   ~ 0
E
Text Label 2200 4400 0    50   ~ 0
~RMEM~
Text Label 2200 4500 0    50   ~ 0
~WMEM~
Text Label 2250 4600 0    50   ~ 0
~RST~
Text Label 2250 4700 0    50   ~ 0
RST
Wire Wire Line
	2500 4800 2500 4900
$Comp
L power:GND #PWR?
U 1 1 63DC323C
P 2500 4900
AR Path="/5CFA6AAA/63DC323C" Ref="#PWR?"  Part="1" 
AR Path="/5D49B078/63DC323C" Ref="#PWR?"  Part="1" 
AR Path="/5E2CF983/63DC323C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 4650 50  0001 C CNN
F 1 "GND" H 2505 4727 50  0000 C CNN
F 2 "" H 2500 4900 50  0001 C CNN
F 3 "" H 2500 4900 50  0001 C CNN
	1    2500 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4800 900  5150
Wire Wire Line
	900  5150 650  5150
Text Label 1000 3200 0    50   ~ 0
~IODEV0
Text Label 1000 3300 0    50   ~ 0
~IODEV1
Text Label 1000 3400 0    50   ~ 0
~IODEV2
Text Label 1000 3500 0    50   ~ 0
~IODEV3
Text Label 1000 3600 0    50   ~ 0
~IODEV4
Text Label 1000 3700 0    50   ~ 0
~IODEV5
Text Label 1000 3800 0    50   ~ 0
~IODEV6
Text Label 1000 3900 0    50   ~ 0
~IODEV7
Text Label 1000 4000 0    50   ~ 0
~IODEV8
Text Label 1000 4100 0    50   ~ 0
~IODEV9
Text Label 1000 4200 0    50   ~ 0
~IODEV10
Text Label 1000 4300 0    50   ~ 0
~IODEV11
Text Label 1000 4400 0    50   ~ 0
~IODEV12
Text Label 1000 4500 0    50   ~ 0
~IODEV13
Text Label 1000 4600 0    50   ~ 0
~IODEV14
Text Label 1000 4700 0    50   ~ 0
~IODEV15
Text Label 1000 1000 0    50   ~ 0
~IRQ
Text Label 1000 1100 0    50   ~ 0
PC0
Text Label 1000 1200 0    50   ~ 0
PC1
Text Label 1000 1300 0    50   ~ 0
PC2
Text Label 1000 1400 0    50   ~ 0
PC3
Text Label 1000 1500 0    50   ~ 0
PC4
Text Label 1000 1600 0    50   ~ 0
PC5
Text Label 1000 1700 0    50   ~ 0
PC6
Text Label 1000 1800 0    50   ~ 0
PC7
Text Label 1000 1900 0    50   ~ 0
TIRQ
Text Notes 1350 5000 0    50   ~ 0
backplane connector
Wire Wire Line
	650  5150 650  5050
$Comp
L power:VCC #PWR?
U 1 1 63DC3260
P 650 5050
AR Path="/5D49B078/63DC3260" Ref="#PWR?"  Part="1" 
AR Path="/5E2CF983/63DC3260" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 650 4900 50  0001 C CNN
F 1 "VCC" H 667 5223 50  0000 C CNN
F 2 "" H 650 5050 50  0001 C CNN
F 3 "" H 650 5050 50  0001 C CNN
	1    650  5050
	1    0    0    -1  
$EndComp
Text Notes 750  700  0    50   ~ 0
back row (backplane)\nbottom row (board)
Text Notes 1900 700  0    50   ~ 0
front row (backplane)\ntop row (board)
Text Label 1000 2500 0    50   ~ 0
~IOR1~
Text Label 1000 2600 0    50   ~ 0
~IOR2~
Text Label 1000 2700 0    50   ~ 0
~IOR3~
Text Label 1000 2800 0    50   ~ 0
~IOR4~
Text Label 1000 2900 0    50   ~ 0
~IOR5~
Text Label 1000 3000 0    50   ~ 0
~IOR6~
Text Label 1000 3100 0    50   ~ 0
~IOR7~
$Comp
L device:R_Network08 RN501
U 1 1 63FAD2F3
P 3750 5700
F 0 "RN501" V 4267 5700 50  0000 C CNN
F 1 "R_Network08" V 4176 5700 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP9" V 4225 5700 50  0001 C CNN
F 3 "" H 3750 5700 50  0001 C CNN
	1    3750 5700
	0    -1   -1   0   
$EndComp
Text Label 5550 1700 0    50   ~ 0
A0
Text Label 5600 2300 0    50   ~ 0
~RMEM~
Text Label 4100 4100 0    50   ~ 0
RST
Text Label 5600 2400 0    50   ~ 0
~IODEV4
Text Label 1000 2000 0    50   ~ 0
~KIRQ~
$Comp
L Connector_Generic:Conn_01x02 J503
U 1 1 6411FF93
P 10350 1350
F 0 "J503" H 10268 1025 50  0000 C CNN
F 1 "Conn_01x02" H 10268 1116 50  0000 C CNN
F 2 "" H 10350 1350 50  0001 C CNN
F 3 "~" H 10350 1350 50  0001 C CNN
	1    10350 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	10550 1350 11350 1350
Wire Wire Line
	11350 1350 11350 2750
Wire Wire Line
	11350 2750 10800 2750
Connection ~ 10800 2750
Wire Wire Line
	10550 1250 11350 1250
Text Label 10850 1250 0    50   ~ 0
~KIRQ~
Text HLabel 11350 1250 2    50   Output ~ 0
~KIRQ~
Text Notes 10300 900  0    50   ~ 0
Jumper to enable keyboard\nIRQ (when FIFO is not empty)
$Comp
L device:CP C?
U 1 1 60CF49C0
P 3200 1400
AR Path="/5CFA6AAA/60CF49C0" Ref="C?"  Part="1" 
AR Path="/5E2CF983/60CF49C0" Ref="C507"  Part="1" 
F 0 "C507" H 3318 1446 50  0000 L CNN
F 1 "10μF" H 3318 1355 50  0000 L CNN
F 2 "" H 3238 1250 50  0001 C CNN
F 3 "" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1250 3200 1100
$Comp
L power:VCC #PWR?
U 1 1 60CF49C7
P 3200 1100
F 0 "#PWR?" H 3200 950 50  0001 C CNN
F 1 "VCC" H 3217 1273 50  0000 C CNN
F 2 "" H 3200 1100 50  0001 C CNN
F 3 "" H 3200 1100 50  0001 C CNN
	1    3200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1550 3200 1750
$Comp
L power:GND #PWR?
U 1 1 60CF49CE
P 3200 1750
F 0 "#PWR?" H 3200 1500 50  0001 C CNN
F 1 "GND" H 3205 1577 50  0000 C CNN
F 2 "" H 3200 1750 50  0001 C CNN
F 3 "" H 3200 1750 50  0001 C CNN
	1    3200 1750
	1    0    0    -1  
$EndComp
Text Notes 3400 1150 0    50   ~ 0
Bulk decoupling for board,\nplace near power pins of\n2x40 connector to backplane
Wire Bus Line
	8250 1950 8250 5300
Wire Bus Line
	10900 1950 10900 6950
$EndSCHEMATC
