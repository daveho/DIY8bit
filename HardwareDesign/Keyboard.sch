EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 6 7
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
P 8150 2050
F 0 "U502" H 8150 3231 50  0000 C CNN
F 1 "IDT7201" H 8150 3140 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 8150 2050 50  0001 C CNN
F 3 "" H 8150 2050 50  0001 C CNN
	1    8150 2050
	1    0    0    -1  
$EndComp
$Comp
L P80C32SBPN:P80C32SBPN U501
U 1 1 5E2D16A0
P 4450 4950
F 0 "U501" H 4450 6720 50  0000 C CNN
F 1 "87C51/89C51" H 4450 6629 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 4450 4950 50  0001 L BNN
F 3 "None" H 4450 4950 50  0001 L BNN
F 4 "NXP Semiconductors" H 4450 4950 50  0001 L BNN "Field4"
F 5 "DIP-40 NXP Semiconductors" H 4450 4950 50  0001 L BNN "Field5"
F 6 "Microcontroller 8-Bit" H 4450 4950 50  0001 L BNN "Field6"
F 7 "P80C32SBPN" H 4450 4950 50  0001 L BNN "Field7"
F 8 "Unavailable" H 4450 4950 50  0001 L BNN "Field8"
	1    4450 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U503
U 1 1 5E2E7734
P 5100 1650
F 0 "U503" H 5100 2431 50  0000 C CNN
F 1 "74HCT138" H 5100 2340 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5100 1650 50  0001 C CNN
F 3 "" H 5100 1650 50  0001 C CNN
	1    5100 1650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U504
U 1 1 5E2E8359
P 8150 4950
F 0 "U504" H 8150 5931 50  0000 C CNN
F 1 "74HCT541" H 8150 5840 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 8150 4950 50  0001 C CNN
F 3 "" H 8150 4950 50  0001 C CNN
	1    8150 4950
	1    0    0    -1  
$EndComp
Text Label 2950 4150 0    50   ~ 0
COL0
Text Label 2950 4250 0    50   ~ 0
COL1
Text Label 2950 4350 0    50   ~ 0
COL2
Text Label 2950 4450 0    50   ~ 0
COL3
Text Label 2950 4550 0    50   ~ 0
COL4
Text Label 2950 4650 0    50   ~ 0
COL5
Text Label 2950 4750 0    50   ~ 0
COL6
Text Label 2950 4850 0    50   ~ 0
COL7
Text Label 2950 5050 0    50   ~ 0
ROW0
Text Label 2950 5150 0    50   ~ 0
ROW1
Text Label 2950 5250 0    50   ~ 0
ROW2
Text Label 2950 5350 0    50   ~ 0
ROW3
Text Label 2950 5450 0    50   ~ 0
ROW4
Text Label 2950 5550 0    50   ~ 0
ROW5
Text Label 2950 5650 0    50   ~ 0
ROW6
Text Label 2950 5750 0    50   ~ 0
ROW7
Wire Wire Line
	2000 5750 1900 5750
Wire Wire Line
	4600 1450 4350 1450
Wire Wire Line
	4350 1450 4350 1550
Wire Wire Line
	4600 1550 4350 1550
Connection ~ 4350 1550
Wire Wire Line
	4350 1550 4350 1600
$Comp
L power:GND #PWR0174
U 1 1 5E444C89
P 4350 1600
F 0 "#PWR0174" H 4350 1350 50  0001 C CNN
F 1 "GND" H 4355 1427 50  0000 C CNN
F 2 "" H 4350 1600 50  0001 C CNN
F 3 "" H 4350 1600 50  0001 C CNN
	1    4350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1350 3900 1350
Wire Wire Line
	4600 1950 3900 1950
Wire Wire Line
	4600 2050 3900 2050
Text HLabel 3900 1350 0    50   Input ~ 0
A0
Text HLabel 3900 1950 0    50   Input ~ 0
~RMEM
Text HLabel 3900 2050 0    50   Input ~ 0
~KB_CS
Wire Wire Line
	4600 1850 4100 1850
Wire Wire Line
	4100 1850 4100 1650
$Comp
L power:VCC #PWR0175
U 1 1 5E4564AB
P 4100 1650
F 0 "#PWR0175" H 4100 1500 50  0001 C CNN
F 1 "VCC" H 4117 1823 50  0000 C CNN
F 2 "" H 4100 1650 50  0001 C CNN
F 3 "" H 4100 1650 50  0001 C CNN
	1    4100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1050 5400 1050
Wire Wire Line
	5400 1050 5400 850 
$Comp
L power:VCC #PWR0176
U 1 1 5E458D61
P 5400 850
F 0 "#PWR0176" H 5400 700 50  0001 C CNN
F 1 "VCC" H 5417 1023 50  0000 C CNN
F 2 "" H 5400 850 50  0001 C CNN
F 3 "" H 5400 850 50  0001 C CNN
	1    5400 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 1050 8450 1050
Wire Wire Line
	8450 1050 8450 800 
$Comp
L power:VCC #PWR0177
U 1 1 5E45F8C2
P 8450 800
F 0 "#PWR0177" H 8450 650 50  0001 C CNN
F 1 "VCC" H 8467 973 50  0000 C CNN
F 2 "" H 8450 800 50  0001 C CNN
F 3 "" H 8450 800 50  0001 C CNN
	1    8450 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4150 8500 4150
Wire Wire Line
	8500 4150 8500 3950
$Comp
L power:VCC #PWR0178
U 1 1 5E4645C6
P 8500 3950
F 0 "#PWR0178" H 8500 3800 50  0001 C CNN
F 1 "VCC" H 8517 4123 50  0000 C CNN
F 2 "" H 8500 3950 50  0001 C CNN
F 3 "" H 8500 3950 50  0001 C CNN
	1    8500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3050 8150 3200
$Comp
L power:GND #PWR0179
U 1 1 5E46CD86
P 8150 3200
F 0 "#PWR0179" H 8150 2950 50  0001 C CNN
F 1 "GND" H 8155 3027 50  0000 C CNN
F 2 "" H 8150 3200 50  0001 C CNN
F 3 "" H 8150 3200 50  0001 C CNN
	1    8150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5750 8150 5900
$Comp
L power:GND #PWR0180
U 1 1 5E46E409
P 8150 5900
F 0 "#PWR0180" H 8150 5650 50  0001 C CNN
F 1 "GND" H 8155 5727 50  0000 C CNN
F 2 "" H 8150 5900 50  0001 C CNN
F 3 "" H 8150 5900 50  0001 C CNN
	1    8150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4150 3350 4150
Wire Wire Line
	2600 4250 3350 4250
Wire Wire Line
	2600 4350 3350 4350
Wire Wire Line
	2600 4450 3350 4450
Wire Wire Line
	2600 4550 3350 4550
Wire Wire Line
	2600 4650 3350 4650
Wire Wire Line
	2600 4750 3350 4750
Wire Wire Line
	2600 4850 3350 4850
Wire Wire Line
	5600 1350 6200 1350
Wire Wire Line
	9500 1400 8850 1400
Wire Wire Line
	7650 5450 7500 5450
Wire Wire Line
	7500 5450 7500 5600
$Comp
L power:GND #PWR0181
U 1 1 5E4A8020
P 7500 5600
F 0 "#PWR0181" H 7500 5350 50  0001 C CNN
F 1 "GND" H 7505 5427 50  0000 C CNN
F 2 "" H 7500 5600 50  0001 C CNN
F 3 "" H 7500 5600 50  0001 C CNN
	1    7500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1450 6200 1450
Text Label 5800 1350 0    50   ~ 0
~RD_DATA
Text Label 5800 1450 0    50   ~ 0
~RD_CTRL
Text Label 9050 1400 0    50   ~ 0
~RD_DATA
Wire Wire Line
	7650 5350 6950 5350
Text Label 7050 5350 0    50   ~ 0
~RD_CTRL
Wire Wire Line
	8850 1500 9250 1500
Wire Wire Line
	8850 1600 9250 1600
Wire Wire Line
	8850 1700 9250 1700
Wire Wire Line
	8850 1800 9250 1800
Wire Wire Line
	8850 1900 9250 1900
Wire Wire Line
	8850 2000 9250 2000
Wire Wire Line
	8850 2100 9250 2100
Wire Wire Line
	8850 2200 9250 2200
Text Label 9050 1500 0    50   ~ 0
D0
Text Label 9050 1600 0    50   ~ 0
D1
Text Label 9050 1700 0    50   ~ 0
D2
Text Label 9050 1800 0    50   ~ 0
D3
Text Label 9050 1900 0    50   ~ 0
D4
Text Label 9050 2000 0    50   ~ 0
D5
Text Label 9050 2100 0    50   ~ 0
D6
Text Label 9050 2200 0    50   ~ 0
D7
Entry Wire Line
	9250 1500 9350 1600
Entry Wire Line
	9250 1600 9350 1700
Entry Wire Line
	9250 1700 9350 1800
Entry Wire Line
	9250 1800 9350 1900
Entry Wire Line
	9250 1900 9350 2000
Entry Wire Line
	9250 2000 9350 2100
Entry Wire Line
	9250 2100 9350 2200
Entry Wire Line
	9250 2200 9350 2300
Wire Wire Line
	9450 6000 9800 6000
Wire Wire Line
	9450 6100 9800 6100
Wire Wire Line
	9450 6200 9800 6200
Wire Wire Line
	9450 6300 9800 6300
Wire Wire Line
	9450 6400 9800 6400
Wire Wire Line
	9450 6500 9800 6500
Wire Wire Line
	9450 6600 9800 6600
Wire Wire Line
	9450 6700 9800 6700
Text Label 9550 6000 0    50   ~ 0
D0
Text Label 9550 6100 0    50   ~ 0
D1
Text Label 9550 6200 0    50   ~ 0
D2
Text Label 9550 6300 0    50   ~ 0
D3
Text Label 9550 6400 0    50   ~ 0
D4
Text Label 9550 6500 0    50   ~ 0
D5
Text Label 9550 6600 0    50   ~ 0
D6
Text Label 9550 6700 0    50   ~ 0
D7
Text HLabel 9800 6000 2    50   BiDi ~ 0
D0
Text HLabel 9800 6100 2    50   BiDi ~ 0
D1
Text HLabel 9800 6200 2    50   BiDi ~ 0
D2
Text HLabel 9800 6300 2    50   BiDi ~ 0
D3
Text HLabel 9800 6400 2    50   BiDi ~ 0
D4
Text HLabel 9800 6500 2    50   BiDi ~ 0
D5
Text HLabel 9800 6600 2    50   BiDi ~ 0
D6
Text HLabel 9800 6700 2    50   BiDi ~ 0
D7
Entry Wire Line
	9350 5900 9450 6000
Entry Wire Line
	9350 6000 9450 6100
Entry Wire Line
	9350 6100 9450 6200
Entry Wire Line
	9350 6200 9450 6300
Entry Wire Line
	9350 6300 9450 6400
Entry Wire Line
	9350 6400 9450 6500
Entry Wire Line
	9350 6500 9450 6600
Entry Wire Line
	9350 6600 9450 6700
Wire Wire Line
	8850 2400 9250 2400
Wire Wire Line
	9250 2400 9250 3650
Wire Wire Line
	9250 3650 7150 3650
Wire Wire Line
	7150 3650 7150 4450
Wire Wire Line
	7150 4450 7650 4450
Wire Wire Line
	8850 2700 9150 2700
Wire Wire Line
	9150 2700 9150 3550
Wire Wire Line
	9150 3550 7050 3550
Wire Wire Line
	7050 3550 7050 4550
Wire Wire Line
	7050 4550 7650 4550
Text Label 8950 2400 0    50   ~ 0
EF
Text Label 8950 2700 0    50   ~ 0
FF
Text Label 7500 4450 0    50   ~ 0
EF
Text Label 7500 4550 0    50   ~ 0
FF
Wire Wire Line
	7650 4650 7500 4650
Wire Wire Line
	7500 4650 7500 4750
Connection ~ 7500 5450
Wire Wire Line
	7650 4750 7500 4750
Connection ~ 7500 4750
Wire Wire Line
	7500 4750 7500 4850
Wire Wire Line
	7650 4850 7500 4850
Connection ~ 7500 4850
Wire Wire Line
	7500 4850 7500 4950
Wire Wire Line
	7650 4950 7500 4950
Connection ~ 7500 4950
Wire Wire Line
	7500 4950 7500 5050
Wire Wire Line
	7650 5050 7500 5050
Connection ~ 7500 5050
Wire Wire Line
	7500 5050 7500 5150
Wire Wire Line
	7650 5150 7500 5150
Connection ~ 7500 5150
Wire Wire Line
	7500 5150 7500 5450
Wire Wire Line
	8650 4450 9250 4450
Wire Wire Line
	8650 4550 9250 4550
Wire Wire Line
	8650 4650 9250 4650
Wire Wire Line
	8650 4750 9250 4750
Wire Wire Line
	8650 4850 9250 4850
Wire Wire Line
	8650 4950 9250 4950
Wire Wire Line
	8650 5050 9250 5050
Wire Wire Line
	8650 5150 9250 5150
Entry Wire Line
	9250 4450 9350 4550
Entry Wire Line
	9250 4550 9350 4650
Entry Wire Line
	9250 4650 9350 4750
Entry Wire Line
	9250 4750 9350 4850
Entry Wire Line
	9250 4850 9350 4950
Entry Wire Line
	9250 4950 9350 5050
Entry Wire Line
	9250 5050 9350 5150
Entry Wire Line
	9250 5150 9350 5250
Text Label 9000 4450 0    50   ~ 0
D0
Text Label 9000 4550 0    50   ~ 0
D1
Text Label 9000 4650 0    50   ~ 0
D2
Text Label 9000 4750 0    50   ~ 0
D3
Text Label 9000 4850 0    50   ~ 0
D4
Text Label 9000 4950 0    50   ~ 0
D5
Text Label 9000 5050 0    50   ~ 0
D6
Text Label 9000 5150 0    50   ~ 0
D7
Wire Wire Line
	5100 2350 5100 2500
$Comp
L power:GND #PWR0182
U 1 1 5E64FB23
P 5100 2500
F 0 "#PWR0182" H 5100 2250 50  0001 C CNN
F 1 "GND" H 5105 2327 50  0000 C CNN
F 2 "" H 5100 2500 50  0001 C CNN
F 3 "" H 5100 2500 50  0001 C CNN
	1    5100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3550 3200 3550
Wire Wire Line
	3200 3550 3200 2550
$Comp
L power:VCC #PWR0183
U 1 1 5E663AAB
P 3200 2550
F 0 "#PWR0183" H 3200 2400 50  0001 C CNN
F 1 "VCC" H 3217 2723 50  0000 C CNN
F 2 "" H 3200 2550 50  0001 C CNN
F 3 "" H 3200 2550 50  0001 C CNN
	1    3200 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6550 3200 6550
Wire Wire Line
	3200 6550 3200 6700
$Comp
L power:GND #PWR0184
U 1 1 5E67442E
P 3200 6700
F 0 "#PWR0184" H 3200 6450 50  0001 C CNN
F 1 "GND" H 3205 6527 50  0000 C CNN
F 2 "" H 3200 6700 50  0001 C CNN
F 3 "" H 3200 6700 50  0001 C CNN
	1    3200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5150 3350 5150
Wire Wire Line
	2400 5250 3350 5250
Wire Wire Line
	2400 5350 3350 5350
Wire Wire Line
	2400 5450 3350 5450
Wire Wire Line
	2400 5650 3350 5650
Wire Wire Line
	2400 5750 3350 5750
Wire Wire Line
	2400 5050 3350 5050
Wire Wire Line
	2400 5550 3350 5550
Text Notes 1350 4600 0    50   ~ 0
Port 1 actively drives the\ncolumns of the keyboard\nmatrix: outputs are normally\nat VCC, but a column output\nis driven to GND when a scan\nof that column is in progress
Text Notes 850  5750 0    50   ~ 0
Port 0 reads the rows\n(with pull up resistors\nkeeping the row inputs\nat VCC unless a\nkeyswitch has made a\nconnection to a column\nwhen the column scan\nis in progress)
Text Label 6150 4350 0    50   ~ 0
SCDAT0
Text Label 6150 4450 0    50   ~ 0
SCDAT1
Text Label 6150 4550 0    50   ~ 0
SCDAT2
Text Label 6150 4650 0    50   ~ 0
SCDAT3
Text Label 6150 4750 0    50   ~ 0
SCDAT4
Text Label 6150 4850 0    50   ~ 0
SCDAT5
Text Label 6150 4950 0    50   ~ 0
SCDAT6
Text Label 6150 5050 0    50   ~ 0
SCDAT7
Entry Wire Line
	6600 4350 6700 4250
Entry Wire Line
	6600 4450 6700 4350
Entry Wire Line
	6600 4550 6700 4450
Entry Wire Line
	6600 4650 6700 4550
Entry Wire Line
	6600 4750 6700 4650
Entry Wire Line
	6600 4850 6700 4750
Entry Wire Line
	6600 4950 6700 4850
Entry Wire Line
	6600 5050 6700 4950
Wire Wire Line
	6800 1500 7450 1500
Wire Wire Line
	6800 1600 7450 1600
Wire Wire Line
	6800 1700 7450 1700
Wire Wire Line
	6800 1800 7450 1800
Wire Wire Line
	6800 1900 7450 1900
Wire Wire Line
	6800 2000 7450 2000
Wire Wire Line
	6800 2100 7450 2100
Wire Wire Line
	6800 2200 7450 2200
Entry Wire Line
	6700 1600 6800 1500
Entry Wire Line
	6700 1700 6800 1600
Entry Wire Line
	6700 1800 6800 1700
Entry Wire Line
	6700 1900 6800 1800
Entry Wire Line
	6700 2000 6800 1900
Entry Wire Line
	6700 2100 6800 2000
Entry Wire Line
	6700 2200 6800 2100
Entry Wire Line
	6700 2300 6800 2200
Text Label 7050 1500 0    50   ~ 0
SCDAT0
Text Label 7050 1600 0    50   ~ 0
SCDAT1
Text Label 7050 1700 0    50   ~ 0
SCDAT2
Text Label 7050 1800 0    50   ~ 0
SCDAT3
Text Label 7050 1900 0    50   ~ 0
SCDAT4
Text Label 7050 2000 0    50   ~ 0
SCDAT5
Text Label 7050 2100 0    50   ~ 0
SCDAT6
Text Label 7050 2200 0    50   ~ 0
SCDAT7
Wire Wire Line
	7450 2300 6950 2300
Wire Wire Line
	6950 2300 6950 2400
$Comp
L power:GND #PWR0185
U 1 1 5ED0CA81
P 6950 3200
F 0 "#PWR0185" H 6950 2950 50  0001 C CNN
F 1 "GND" H 6955 3027 50  0000 C CNN
F 2 "" H 6950 3200 50  0001 C CNN
F 3 "" H 6950 3200 50  0001 C CNN
	1    6950 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4050 6600 1400
Wire Wire Line
	6600 1400 7450 1400
Text Notes 3800 1100 0    50   ~ 0
Generate chip selects for\nreading data from FIFO\n(~RD_DATA~) and reading\nFIFO status bits (~RD_CTRL~).
Wire Wire Line
	7450 2400 6950 2400
Connection ~ 6950 2400
Wire Wire Line
	6950 2400 6950 3200
Wire Wire Line
	6800 4150 6800 2500
Wire Wire Line
	6800 2500 7450 2500
Text Label 5650 4050 0    50   ~ 0
~FIFO_WR
Text Label 5650 4150 0    50   ~ 0
~FIFO_CLR
Text Label 7050 1400 0    50   ~ 0
~FIFO_WR
Text Label 7050 2500 0    50   ~ 0
~FIFO_CLR
Text Notes 5550 5450 0    50   ~ 0
Port 2 is used for\nsending scan code\ndata to the FIFO\nchip.
$Comp
L device:C C501
U 1 1 5ED3B27E
P 800 7000
F 0 "C501" H 915 7046 50  0000 L CNN
F 1 "0.1 μF" H 915 6955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 838 6850 50  0001 C CNN
F 3 "" H 800 7000 50  0001 C CNN
	1    800  7000
	1    0    0    -1  
$EndComp
$Comp
L device:C C502
U 1 1 5ED3C82D
P 1300 7000
F 0 "C502" H 1415 7046 50  0000 L CNN
F 1 "0.1 μF" H 1415 6955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1338 6850 50  0001 C CNN
F 3 "" H 1300 7000 50  0001 C CNN
	1    1300 7000
	1    0    0    -1  
$EndComp
$Comp
L device:C C503
U 1 1 5ED482DC
P 1800 7000
F 0 "C503" H 1915 7046 50  0000 L CNN
F 1 "0.1 μF" H 1915 6955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1838 6850 50  0001 C CNN
F 3 "" H 1800 7000 50  0001 C CNN
	1    1800 7000
	1    0    0    -1  
$EndComp
$Comp
L device:C C504
U 1 1 5ED482E6
P 2300 7000
F 0 "C504" H 2415 7046 50  0000 L CNN
F 1 "0.1 μF" H 2415 6955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2338 6850 50  0001 C CNN
F 3 "" H 2300 7000 50  0001 C CNN
	1    2300 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6850 800  6650
Wire Wire Line
	800  6650 1300 6650
Wire Wire Line
	2300 6650 2300 6850
Wire Wire Line
	800  7150 800  7400
Wire Wire Line
	800  7400 1300 7400
Wire Wire Line
	2300 7400 2300 7150
Wire Wire Line
	1550 6650 1550 6500
Connection ~ 1550 6650
Wire Wire Line
	1550 6650 1800 6650
Wire Wire Line
	1550 7400 1550 7550
Connection ~ 1550 7400
Wire Wire Line
	1550 7400 1800 7400
$Comp
L power:VCC #PWR0186
U 1 1 5ED8CCE0
P 1550 6500
F 0 "#PWR0186" H 1550 6350 50  0001 C CNN
F 1 "VCC" H 1567 6673 50  0000 C CNN
F 2 "" H 1550 6500 50  0001 C CNN
F 3 "" H 1550 6500 50  0001 C CNN
	1    1550 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0187
U 1 1 5ED8CF8E
P 1550 7550
F 0 "#PWR0187" H 1550 7300 50  0001 C CNN
F 1 "GND" H 1555 7377 50  0000 C CNN
F 2 "" H 1550 7550 50  0001 C CNN
F 3 "" H 1550 7550 50  0001 C CNN
	1    1550 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6850 1300 6650
Connection ~ 1300 6650
Wire Wire Line
	1300 6650 1550 6650
Wire Wire Line
	1800 6850 1800 6650
Connection ~ 1800 6650
Wire Wire Line
	1800 6650 2300 6650
Wire Wire Line
	1300 7150 1300 7400
Connection ~ 1300 7400
Wire Wire Line
	1300 7400 1550 7400
Wire Wire Line
	1800 7150 1800 7400
Connection ~ 1800 7400
Wire Wire Line
	1800 7400 2300 7400
Text Notes 1750 7650 0    50   ~ 0
Decoupling caps: place near power pins\nof U501-U504
Text Notes 3950 7150 0    50   ~ 0
Microcontroller to scan\nkeyboard matrix and\nsend scan codes to FIFO.\nWill be a 89C51 or 87C51.
Wire Wire Line
	8850 2500 9950 2500
Wire Wire Line
	9950 2500 9950 2200
$Comp
L power:VCC #PWR0188
U 1 1 5EDC1EFC
P 9950 2200
F 0 "#PWR0188" H 9950 2050 50  0001 C CNN
F 1 "VCC" H 9967 2373 50  0000 C CNN
F 2 "" H 9950 2200 50  0001 C CNN
F 3 "" H 9950 2200 50  0001 C CNN
	1    9950 2200
	1    0    0    -1  
$EndComp
Text HLabel 2450 3750 0    50   Input ~ 0
RST
$Comp
L device:Crystal Y501
U 1 1 5ECF0BDF
P 5650 3050
F 0 "Y501" V 5700 3400 50  0000 R CNN
F 1 "11.0592 MHz" V 5600 3700 50  0000 R CNN
F 2 "Crystal:Crystal_HC18-U_Vertical" H 5650 3050 50  0001 C CNN
F 3 "" H 5650 3050 50  0001 C CNN
	1    5650 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 3950 3100 3950
Wire Wire Line
	3100 3950 3100 2900
Wire Wire Line
	3100 2900 5650 2900
Wire Wire Line
	5550 3550 5650 3550
Wire Wire Line
	5650 3200 5650 3250
Wire Wire Line
	5550 4350 6600 4350
Wire Wire Line
	5550 4450 6600 4450
Wire Wire Line
	5550 4550 6600 4550
Wire Wire Line
	5550 4650 6600 4650
Wire Wire Line
	5550 4750 6600 4750
Wire Wire Line
	5550 4850 6600 4850
Wire Wire Line
	5550 4950 6600 4950
Wire Wire Line
	5550 5050 6600 5050
Wire Wire Line
	5550 4050 6600 4050
Wire Wire Line
	5550 4150 6800 4150
Wire Wire Line
	5650 2900 5900 2900
Connection ~ 5650 2900
Wire Wire Line
	5900 3250 5650 3250
Connection ~ 5650 3250
Wire Wire Line
	5650 3250 5650 3550
Wire Wire Line
	3350 3850 3200 3850
Wire Wire Line
	3200 3850 3200 3550
Connection ~ 3200 3550
Text Notes 7600 6450 0    50   ~ 0
Buffer to allow EF (empty flag)\nand FF (full flag) bits of FIFO\nto be read by the CPU.
Wire Wire Line
	2450 3750 3350 3750
$Comp
L device:C C505
U 1 1 5F056A2F
P 6050 2900
F 0 "C505" V 5950 2750 50  0000 C CNN
F 1 "30pF" V 5950 3050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6088 2750 50  0001 C CNN
F 3 "" H 6050 2900 50  0001 C CNN
	1    6050 2900
	0    1    1    0   
$EndComp
$Comp
L device:C C506
U 1 1 5F064C1E
P 6050 3250
F 0 "C506" V 5950 3100 50  0000 C CNN
F 1 "30pF" V 5950 3400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6088 3100 50  0001 C CNN
F 3 "" H 6050 3250 50  0001 C CNN
	1    6050 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 2900 6350 2900
Wire Wire Line
	6350 2900 6350 3250
Wire Wire Line
	6200 3250 6350 3250
Connection ~ 6350 3250
Wire Wire Line
	6350 3250 6350 3400
$Comp
L power:GND #PWR0189
U 1 1 5F09EB58
P 6350 3400
F 0 "#PWR0189" H 6350 3150 50  0001 C CNN
F 1 "GND" H 6355 3227 50  0000 C CNN
F 2 "" H 6350 3400 50  0001 C CNN
F 3 "" H 6350 3400 50  0001 C CNN
	1    6350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5750 1900 5550
$Comp
L power:VCC #PWR0190
U 1 1 5ED640C7
P 1900 5550
F 0 "#PWR0190" H 1900 5400 50  0001 C CNN
F 1 "VCC" H 1917 5723 50  0000 C CNN
F 2 "" H 1900 5550 50  0001 C CNN
F 3 "" H 1900 5550 50  0001 C CNN
	1    1900 5550
	1    0    0    -1  
$EndComp
Text Notes 1700 6050 0    50   ~ 0
The exact value of RN501 isn't\ncritical: anything between 2k7\nand 47k should work fine.
Text Label 1600 2000 0    50   ~ 0
COL5
Wire Wire Line
	1050 2300 1900 2300
Wire Wire Line
	1050 2200 1900 2200
Wire Wire Line
	1050 3000 1900 3000
Wire Wire Line
	1050 2700 1900 2700
Wire Wire Line
	1050 1200 1900 1200
Wire Wire Line
	1050 2400 1900 2400
Wire Wire Line
	1050 1900 1900 1900
Wire Wire Line
	1050 1700 1900 1700
Wire Wire Line
	1050 2800 1900 2800
Wire Wire Line
	1050 2600 1900 2600
Wire Wire Line
	1050 2500 1900 2500
Wire Wire Line
	1050 2100 1900 2100
Wire Wire Line
	1050 2000 1900 2000
Wire Wire Line
	1050 1800 1900 1800
Wire Wire Line
	1050 1400 1900 1400
Wire Wire Line
	1050 2900 1900 2900
Text Label 1600 3000 0    50   ~ 0
ROW7
Text Label 1600 2700 0    50   ~ 0
ROW6
Text Label 1600 1200 0    50   ~ 0
ROW5
Text Label 1600 2400 0    50   ~ 0
ROW4
Text Label 1600 2200 0    50   ~ 0
ROW3
Text Label 1600 2300 0    50   ~ 0
ROW2
Text Label 1600 1900 0    50   ~ 0
ROW1
Text Label 1600 1700 0    50   ~ 0
ROW0
Text Label 1600 2800 0    50   ~ 0
COL7
Text Label 1600 2100 0    50   ~ 0
COL6
Text Label 1600 1800 0    50   ~ 0
COL4
Text Label 1600 1400 0    50   ~ 0
COL3
Text Label 1600 2500 0    50   ~ 0
COL2
Text Label 1600 2600 0    50   ~ 0
COL1
Text Label 1600 2900 0    50   ~ 0
COL0
Text Notes 650  850  0    50   ~ 0
C16 keyboard connector,\npin 2 is a key and should\nbe removed
NoConn ~ 1250 3100
Wire Wire Line
	1050 3100 1250 3100
NoConn ~ 1250 1600
Wire Wire Line
	1050 1600 1250 1600
NoConn ~ 1250 1500
Wire Wire Line
	1050 1500 1250 1500
NoConn ~ 1250 1300
Wire Wire Line
	1050 1300 1250 1300
$Comp
L Connector_Generic:Conn_01x20 J501
U 1 1 5E2FF21D
P 850 2100
F 0 "J501" H 768 3217 50  0000 C CNN
F 1 "Conn_01x20" H 768 3126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Vertical" H 850 2100 50  0001 C CNN
F 3 "~" H 850 2100 50  0001 C CNN
	1    850  2100
	-1   0    0    -1  
$EndComp
$Comp
L device:R_Network08 RN501
U 1 1 63FAD2F3
P 2200 5350
F 0 "RN501" V 2717 5350 50  0000 C CNN
F 1 "R_Network08" V 2626 5350 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2675 5350 50  0001 C CNN
F 3 "" H 2200 5350 50  0001 C CNN
	1    2200 5350
	0    -1   -1   0   
$EndComp
Text Label 4000 1350 0    50   ~ 0
A0
Text Label 4050 1950 0    50   ~ 0
~RMEM~
Text Label 2550 3750 0    50   ~ 0
RST
Text Label 4050 2050 0    50   ~ 0
~IODEV4
$Comp
L Connector_Generic:Conn_01x02 J503
U 1 1 6411FF93
P 8800 1000
F 0 "J503" H 8718 675 50  0000 C CNN
F 1 "Conn_01x02" H 8718 766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8800 1000 50  0001 C CNN
F 3 "~" H 8800 1000 50  0001 C CNN
	1    8800 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 1000 9800 1000
Wire Wire Line
	9800 1000 9800 2400
Wire Wire Line
	9800 2400 9250 2400
Connection ~ 9250 2400
Wire Wire Line
	9000 900  9800 900 
Text Label 9300 900  0    50   ~ 0
~KIRQ~
Text HLabel 9800 900  2    50   Output ~ 0
~KIRQ~
Text Notes 9150 750  0    50   ~ 0
Jumper to enable keyboard\nIRQ (when FIFO is not empty)
Wire Bus Line
	6700 1600 6700 4950
Wire Bus Line
	9350 1600 9350 6600
$EndSCHEMATC
