EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
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
P 8600 2000
F 0 "U502" H 8600 3181 50  0000 C CNN
F 1 "IDT7201" H 8600 3090 50  0000 C CNN
F 2 "" H 8600 2000 50  0001 C CNN
F 3 "" H 8600 2000 50  0001 C CNN
	1    8600 2000
	1    0    0    -1  
$EndComp
$Comp
L P80C32SBPN:P80C32SBPN U501
U 1 1 5E2D16A0
P 4900 4900
F 0 "U501" H 4900 6670 50  0000 C CNN
F 1 "87C51/89C51" H 4900 6579 50  0000 C CNN
F 2 "DIP254P1524X470-40" H 4900 4900 50  0001 L BNN
F 3 "None" H 4900 4900 50  0001 L BNN
F 4 "NXP Semiconductors" H 4900 4900 50  0001 L BNN "Field4"
F 5 "DIP-40 NXP Semiconductors" H 4900 4900 50  0001 L BNN "Field5"
F 6 "Microcontroller 8-Bit" H 4900 4900 50  0001 L BNN "Field6"
F 7 "P80C32SBPN" H 4900 4900 50  0001 L BNN "Field7"
F 8 "Unavailable" H 4900 4900 50  0001 L BNN "Field8"
	1    4900 4900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U503
U 1 1 5E2E7734
P 5550 1600
F 0 "U503" H 5550 2381 50  0000 C CNN
F 1 "74LS138" H 5550 2290 50  0000 C CNN
F 2 "" H 5550 1600 50  0001 C CNN
F 3 "" H 5550 1600 50  0001 C CNN
	1    5550 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U504
U 1 1 5E2E8359
P 8600 4900
F 0 "U504" H 8600 5881 50  0000 C CNN
F 1 "74HCT541" H 8600 5790 50  0000 C CNN
F 2 "" H 8600 4900 50  0001 C CNN
F 3 "" H 8600 4900 50  0001 C CNN
	1    8600 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J501
U 1 1 5E2FF21D
P 900 2150
F 0 "J501" H 818 3267 50  0000 C CNN
F 1 "Conn_01x20" H 818 3176 50  0000 C CNN
F 2 "" H 900 2150 50  0001 C CNN
F 3 "~" H 900 2150 50  0001 C CNN
	1    900  2150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1100 1350 1300 1350
NoConn ~ 1300 1350
Wire Wire Line
	1100 1550 1300 1550
NoConn ~ 1300 1550
Wire Wire Line
	1100 1650 1300 1650
NoConn ~ 1300 1650
Wire Wire Line
	1100 3150 1300 3150
NoConn ~ 1300 3150
Text Label 3400 4100 0    50   ~ 0
COL0
Text Label 3400 4200 0    50   ~ 0
COL1
Text Label 3400 4300 0    50   ~ 0
COL2
Text Label 3400 4400 0    50   ~ 0
COL3
Text Label 3400 4500 0    50   ~ 0
COL4
Text Label 3400 4600 0    50   ~ 0
COL5
Text Label 3400 4700 0    50   ~ 0
COL6
Text Label 3400 4800 0    50   ~ 0
COL7
Text Label 3400 5000 0    50   ~ 0
ROW0
Text Label 3400 5100 0    50   ~ 0
ROW1
Text Label 3400 5200 0    50   ~ 0
ROW2
Text Label 3400 5300 0    50   ~ 0
ROW3
Text Label 3400 5400 0    50   ~ 0
ROW4
Text Label 3400 5500 0    50   ~ 0
ROW5
Text Label 3400 5600 0    50   ~ 0
ROW6
Text Label 3400 5700 0    50   ~ 0
ROW7
$Comp
L device:R_Network08 RN501
U 1 1 5E35B9F3
P 2650 5300
F 0 "RN501" V 3167 5300 50  0000 C CNN
F 1 "22k" V 3076 5300 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP9" V 3125 5300 50  0001 C CNN
F 3 "" H 2650 5300 50  0001 C CNN
	1    2650 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 5700 2300 5700
Wire Wire Line
	5050 1400 4800 1400
Wire Wire Line
	4800 1400 4800 1500
Wire Wire Line
	5050 1500 4800 1500
Connection ~ 4800 1500
Wire Wire Line
	4800 1500 4800 1550
$Comp
L power:GND #PWR?
U 1 1 5E444C89
P 4800 1550
F 0 "#PWR?" H 4800 1300 50  0001 C CNN
F 1 "GND" H 4805 1377 50  0000 C CNN
F 2 "" H 4800 1550 50  0001 C CNN
F 3 "" H 4800 1550 50  0001 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1300 4350 1300
Wire Wire Line
	5050 1900 4350 1900
Wire Wire Line
	5050 2000 4350 2000
Text HLabel 4350 1300 0    50   Input ~ 0
A0
Text HLabel 4350 1900 0    50   Input ~ 0
~RMEM
Text HLabel 4350 2000 0    50   Input ~ 0
~KB_CS
Wire Wire Line
	5050 1800 4550 1800
Wire Wire Line
	4550 1800 4550 1600
$Comp
L power:VCC #PWR?
U 1 1 5E4564AB
P 4550 1600
F 0 "#PWR?" H 4550 1450 50  0001 C CNN
F 1 "VCC" H 4567 1773 50  0000 C CNN
F 2 "" H 4550 1600 50  0001 C CNN
F 3 "" H 4550 1600 50  0001 C CNN
	1    4550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1000 5850 1000
Wire Wire Line
	5850 1000 5850 800 
$Comp
L power:VCC #PWR?
U 1 1 5E458D61
P 5850 800
F 0 "#PWR?" H 5850 650 50  0001 C CNN
F 1 "VCC" H 5867 973 50  0000 C CNN
F 2 "" H 5850 800 50  0001 C CNN
F 3 "" H 5850 800 50  0001 C CNN
	1    5850 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1000 8900 1000
Wire Wire Line
	8900 1000 8900 750 
$Comp
L power:VCC #PWR?
U 1 1 5E45F8C2
P 8900 750
F 0 "#PWR?" H 8900 600 50  0001 C CNN
F 1 "VCC" H 8917 923 50  0000 C CNN
F 2 "" H 8900 750 50  0001 C CNN
F 3 "" H 8900 750 50  0001 C CNN
	1    8900 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4100 8950 4100
Wire Wire Line
	8950 4100 8950 3900
$Comp
L power:VCC #PWR?
U 1 1 5E4645C6
P 8950 3900
F 0 "#PWR?" H 8950 3750 50  0001 C CNN
F 1 "VCC" H 8967 4073 50  0000 C CNN
F 2 "" H 8950 3900 50  0001 C CNN
F 3 "" H 8950 3900 50  0001 C CNN
	1    8950 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3000 8600 3150
$Comp
L power:GND #PWR?
U 1 1 5E46CD86
P 8600 3150
F 0 "#PWR?" H 8600 2900 50  0001 C CNN
F 1 "GND" H 8605 2977 50  0000 C CNN
F 2 "" H 8600 3150 50  0001 C CNN
F 3 "" H 8600 3150 50  0001 C CNN
	1    8600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5700 8600 5850
$Comp
L power:GND #PWR?
U 1 1 5E46E409
P 8600 5850
F 0 "#PWR?" H 8600 5600 50  0001 C CNN
F 1 "GND" H 8605 5677 50  0000 C CNN
F 2 "" H 8600 5850 50  0001 C CNN
F 3 "" H 8600 5850 50  0001 C CNN
	1    8600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4100 3800 4100
Wire Wire Line
	3050 4200 3800 4200
Wire Wire Line
	3050 4300 3800 4300
Wire Wire Line
	3050 4400 3800 4400
Wire Wire Line
	3050 4500 3800 4500
Wire Wire Line
	3050 4600 3800 4600
Wire Wire Line
	3050 4700 3800 4700
Wire Wire Line
	3050 4800 3800 4800
Text Notes 700  900  0    50   ~ 0
C16 keyboard connector,\npin 2 is a key and should\nbe removed
Wire Wire Line
	6050 1300 6650 1300
Wire Wire Line
	9950 1350 9300 1350
Wire Wire Line
	8100 5400 7950 5400
Wire Wire Line
	7950 5400 7950 5550
$Comp
L power:GND #PWR?
U 1 1 5E4A8020
P 7950 5550
F 0 "#PWR?" H 7950 5300 50  0001 C CNN
F 1 "GND" H 7955 5377 50  0000 C CNN
F 2 "" H 7950 5550 50  0001 C CNN
F 3 "" H 7950 5550 50  0001 C CNN
	1    7950 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1400 6650 1400
Text Label 6250 1300 0    50   ~ 0
~RD_DATA
Text Label 6250 1400 0    50   ~ 0
~RD_CTRL
Text Label 9500 1350 0    50   ~ 0
~RD_DATA
Wire Wire Line
	8100 5300 7400 5300
Text Label 7500 5300 0    50   ~ 0
~RD_CTRL
Wire Wire Line
	9300 1450 9700 1450
Wire Wire Line
	9300 1550 9700 1550
Wire Wire Line
	9300 1650 9700 1650
Wire Wire Line
	9300 1750 9700 1750
Wire Wire Line
	9300 1850 9700 1850
Wire Wire Line
	9300 1950 9700 1950
Wire Wire Line
	9300 2050 9700 2050
Wire Wire Line
	9300 2150 9700 2150
Text Label 9500 1450 0    50   ~ 0
D0
Text Label 9500 1550 0    50   ~ 0
D1
Text Label 9500 1650 0    50   ~ 0
D2
Text Label 9500 1750 0    50   ~ 0
D3
Text Label 9500 1850 0    50   ~ 0
D4
Text Label 9500 1950 0    50   ~ 0
D5
Text Label 9500 2050 0    50   ~ 0
D6
Text Label 9500 2150 0    50   ~ 0
D7
Entry Wire Line
	9700 1450 9800 1550
Entry Wire Line
	9700 1550 9800 1650
Entry Wire Line
	9700 1650 9800 1750
Entry Wire Line
	9700 1750 9800 1850
Entry Wire Line
	9700 1850 9800 1950
Entry Wire Line
	9700 1950 9800 2050
Entry Wire Line
	9700 2050 9800 2150
Entry Wire Line
	9700 2150 9800 2250
Wire Wire Line
	9900 5950 10250 5950
Wire Wire Line
	9900 6050 10250 6050
Wire Wire Line
	9900 6150 10250 6150
Wire Wire Line
	9900 6250 10250 6250
Wire Wire Line
	9900 6350 10250 6350
Wire Wire Line
	9900 6450 10250 6450
Wire Wire Line
	9900 6550 10250 6550
Wire Wire Line
	9900 6650 10250 6650
Text Label 10000 5950 0    50   ~ 0
D0
Text Label 10000 6050 0    50   ~ 0
D1
Text Label 10000 6150 0    50   ~ 0
D2
Text Label 10000 6250 0    50   ~ 0
D3
Text Label 10000 6350 0    50   ~ 0
D4
Text Label 10000 6450 0    50   ~ 0
D5
Text Label 10000 6550 0    50   ~ 0
D6
Text Label 10000 6650 0    50   ~ 0
D7
Text HLabel 10250 5950 2    50   BiDi ~ 0
D0
Text HLabel 10250 6050 2    50   BiDi ~ 0
D1
Text HLabel 10250 6150 2    50   BiDi ~ 0
D2
Text HLabel 10250 6250 2    50   BiDi ~ 0
D3
Text HLabel 10250 6350 2    50   BiDi ~ 0
D4
Text HLabel 10250 6450 2    50   BiDi ~ 0
D5
Text HLabel 10250 6550 2    50   BiDi ~ 0
D6
Text HLabel 10250 6650 2    50   BiDi ~ 0
D7
Entry Wire Line
	9800 5850 9900 5950
Entry Wire Line
	9800 5950 9900 6050
Entry Wire Line
	9800 6050 9900 6150
Entry Wire Line
	9800 6150 9900 6250
Entry Wire Line
	9800 6250 9900 6350
Entry Wire Line
	9800 6350 9900 6450
Entry Wire Line
	9800 6450 9900 6550
Entry Wire Line
	9800 6550 9900 6650
Wire Wire Line
	9300 2350 9700 2350
Wire Wire Line
	9700 2350 9700 3600
Wire Wire Line
	9700 3600 7600 3600
Wire Wire Line
	7600 3600 7600 4400
Wire Wire Line
	7600 4400 8100 4400
Wire Wire Line
	9300 2650 9600 2650
Wire Wire Line
	9600 2650 9600 3500
Wire Wire Line
	9600 3500 7500 3500
Wire Wire Line
	7500 3500 7500 4500
Wire Wire Line
	7500 4500 8100 4500
Text Label 9400 2350 0    50   ~ 0
EF
Text Label 9400 2650 0    50   ~ 0
FF
Text Label 7950 4400 0    50   ~ 0
EF
Text Label 7950 4500 0    50   ~ 0
FF
Wire Wire Line
	8100 4600 7950 4600
Wire Wire Line
	7950 4600 7950 4700
Connection ~ 7950 5400
Wire Wire Line
	8100 4700 7950 4700
Connection ~ 7950 4700
Wire Wire Line
	7950 4700 7950 4800
Wire Wire Line
	8100 4800 7950 4800
Connection ~ 7950 4800
Wire Wire Line
	7950 4800 7950 4900
Wire Wire Line
	8100 4900 7950 4900
Connection ~ 7950 4900
Wire Wire Line
	7950 4900 7950 5000
Wire Wire Line
	8100 5000 7950 5000
Connection ~ 7950 5000
Wire Wire Line
	7950 5000 7950 5100
Wire Wire Line
	8100 5100 7950 5100
Connection ~ 7950 5100
Wire Wire Line
	7950 5100 7950 5400
Wire Wire Line
	9100 4400 9700 4400
Wire Wire Line
	9100 4500 9700 4500
Wire Wire Line
	9100 4600 9700 4600
Wire Wire Line
	9100 4700 9700 4700
Wire Wire Line
	9100 4800 9700 4800
Wire Wire Line
	9100 4900 9700 4900
Wire Wire Line
	9100 5000 9700 5000
Wire Wire Line
	9100 5100 9700 5100
Entry Wire Line
	9700 4400 9800 4500
Entry Wire Line
	9700 4500 9800 4600
Entry Wire Line
	9700 4600 9800 4700
Entry Wire Line
	9700 4700 9800 4800
Entry Wire Line
	9700 4800 9800 4900
Entry Wire Line
	9700 4900 9800 5000
Entry Wire Line
	9700 5000 9800 5100
Entry Wire Line
	9700 5100 9800 5200
Text Label 9450 4400 0    50   ~ 0
D0
Text Label 9450 4500 0    50   ~ 0
D1
Text Label 9450 4600 0    50   ~ 0
D2
Text Label 9450 4700 0    50   ~ 0
D3
Text Label 9450 4800 0    50   ~ 0
D4
Text Label 9450 4900 0    50   ~ 0
D5
Text Label 9450 5000 0    50   ~ 0
D6
Text Label 9450 5100 0    50   ~ 0
D7
Wire Wire Line
	5550 2300 5550 2450
$Comp
L power:GND #PWR?
U 1 1 5E64FB23
P 5550 2450
F 0 "#PWR?" H 5550 2200 50  0001 C CNN
F 1 "GND" H 5555 2277 50  0000 C CNN
F 2 "" H 5550 2450 50  0001 C CNN
F 3 "" H 5550 2450 50  0001 C CNN
	1    5550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3500 3650 3500
Wire Wire Line
	3650 3500 3650 2500
$Comp
L power:VCC #PWR?
U 1 1 5E663AAB
P 3650 2500
F 0 "#PWR?" H 3650 2350 50  0001 C CNN
F 1 "VCC" H 3667 2673 50  0000 C CNN
F 2 "" H 3650 2500 50  0001 C CNN
F 3 "" H 3650 2500 50  0001 C CNN
	1    3650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6500 3650 6500
Wire Wire Line
	3650 6500 3650 6650
$Comp
L power:GND #PWR?
U 1 1 5E67442E
P 3650 6650
F 0 "#PWR?" H 3650 6400 50  0001 C CNN
F 1 "GND" H 3655 6477 50  0000 C CNN
F 2 "" H 3650 6650 50  0001 C CNN
F 3 "" H 3650 6650 50  0001 C CNN
	1    3650 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5100 3800 5100
Wire Wire Line
	2850 5200 3800 5200
Wire Wire Line
	2850 5300 3800 5300
Wire Wire Line
	2850 5400 3800 5400
Wire Wire Line
	2850 5600 3800 5600
Wire Wire Line
	2850 5700 3800 5700
Wire Wire Line
	2850 5000 3800 5000
Wire Wire Line
	2850 5500 3800 5500
Text Notes 1800 4550 0    50   ~ 0
Port 1 actively drives the\ncolumns of the keyboard\nmatrix: outputs are normally\nat GND, but a column output\nis driven to VCC when a scan\nof that column is in progress
Text Notes 1200 5600 0    50   ~ 0
Port 0 reads the rows\n(with pull down resistors\nkeeping the row inputs\nat GND unless a\nkeyswitch has made a\nconnection to a column\nwhen the column scan\nis in progress)
Text Label 6600 4300 0    50   ~ 0
SCDAT0
Text Label 6600 4400 0    50   ~ 0
SCDAT1
Text Label 6600 4500 0    50   ~ 0
SCDAT2
Text Label 6600 4600 0    50   ~ 0
SCDAT3
Text Label 6600 4700 0    50   ~ 0
SCDAT4
Text Label 6600 4800 0    50   ~ 0
SCDAT5
Text Label 6600 4900 0    50   ~ 0
SCDAT6
Text Label 6600 5000 0    50   ~ 0
SCDAT7
Entry Wire Line
	7050 4300 7150 4200
Entry Wire Line
	7050 4400 7150 4300
Entry Wire Line
	7050 4500 7150 4400
Entry Wire Line
	7050 4600 7150 4500
Entry Wire Line
	7050 4700 7150 4600
Entry Wire Line
	7050 4800 7150 4700
Entry Wire Line
	7050 4900 7150 4800
Entry Wire Line
	7050 5000 7150 4900
Wire Wire Line
	7250 1450 7900 1450
Wire Wire Line
	7250 1550 7900 1550
Wire Wire Line
	7250 1650 7900 1650
Wire Wire Line
	7250 1750 7900 1750
Wire Wire Line
	7250 1850 7900 1850
Wire Wire Line
	7250 1950 7900 1950
Wire Wire Line
	7250 2050 7900 2050
Wire Wire Line
	7250 2150 7900 2150
Entry Wire Line
	7150 1550 7250 1450
Entry Wire Line
	7150 1650 7250 1550
Entry Wire Line
	7150 1750 7250 1650
Entry Wire Line
	7150 1850 7250 1750
Entry Wire Line
	7150 1950 7250 1850
Entry Wire Line
	7150 2050 7250 1950
Entry Wire Line
	7150 2150 7250 2050
Entry Wire Line
	7150 2250 7250 2150
Text Label 7500 1450 0    50   ~ 0
SCDAT0
Text Label 7500 1550 0    50   ~ 0
SCDAT1
Text Label 7500 1650 0    50   ~ 0
SCDAT2
Text Label 7500 1750 0    50   ~ 0
SCDAT3
Text Label 7500 1850 0    50   ~ 0
SCDAT4
Text Label 7500 1950 0    50   ~ 0
SCDAT5
Text Label 7500 2050 0    50   ~ 0
SCDAT6
Text Label 7500 2150 0    50   ~ 0
SCDAT7
Wire Wire Line
	7900 2250 7400 2250
Wire Wire Line
	7400 2250 7400 2350
$Comp
L power:GND #PWR?
U 1 1 5ED0CA81
P 7400 3150
F 0 "#PWR?" H 7400 2900 50  0001 C CNN
F 1 "GND" H 7405 2977 50  0000 C CNN
F 2 "" H 7400 3150 50  0001 C CNN
F 3 "" H 7400 3150 50  0001 C CNN
	1    7400 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4000 7050 1350
Wire Wire Line
	7050 1350 7900 1350
Text Notes 4250 1050 0    50   ~ 0
Generate chip selects for\nreading data from FIFO\n(~RD_DATA~) and reading\nFIFO status bits (~RD_CTRL~).
Wire Wire Line
	7900 2350 7400 2350
Connection ~ 7400 2350
Wire Wire Line
	7400 2350 7400 3150
Wire Wire Line
	7250 4100 7250 2450
Wire Wire Line
	7250 2450 7900 2450
Text Label 6100 4000 0    50   ~ 0
~FIFO_WR
Text Label 6100 4100 0    50   ~ 0
~FIFO_CLR
Text Label 7500 1350 0    50   ~ 0
~FIFO_WR
Text Label 7500 2450 0    50   ~ 0
~FIFO_CLR
Text Notes 6000 5400 0    50   ~ 0
Port 2 is used for\nsending scan code\ndata to the FIFO\nchip.
$Comp
L device:C C501
U 1 1 5ED3B27E
P 800 7100
F 0 "C501" H 915 7146 50  0000 L CNN
F 1 "100nF" H 915 7055 50  0000 L CNN
F 2 "" H 838 6950 50  0001 C CNN
F 3 "" H 800 7100 50  0001 C CNN
	1    800  7100
	1    0    0    -1  
$EndComp
$Comp
L device:C C502
U 1 1 5ED3C82D
P 1300 7100
F 0 "C502" H 1415 7146 50  0000 L CNN
F 1 "100nF" H 1415 7055 50  0000 L CNN
F 2 "" H 1338 6950 50  0001 C CNN
F 3 "" H 1300 7100 50  0001 C CNN
	1    1300 7100
	1    0    0    -1  
$EndComp
$Comp
L device:C C503
U 1 1 5ED482DC
P 1800 7100
F 0 "C503" H 1915 7146 50  0000 L CNN
F 1 "100nF" H 1915 7055 50  0000 L CNN
F 2 "" H 1838 6950 50  0001 C CNN
F 3 "" H 1800 7100 50  0001 C CNN
	1    1800 7100
	1    0    0    -1  
$EndComp
$Comp
L device:C C504
U 1 1 5ED482E6
P 2300 7100
F 0 "C504" H 2415 7146 50  0000 L CNN
F 1 "100nF" H 2415 7055 50  0000 L CNN
F 2 "" H 2338 6950 50  0001 C CNN
F 3 "" H 2300 7100 50  0001 C CNN
	1    2300 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6950 800  6750
Wire Wire Line
	800  6750 1300 6750
Wire Wire Line
	2300 6750 2300 6950
Wire Wire Line
	800  7250 800  7500
Wire Wire Line
	800  7500 1300 7500
Wire Wire Line
	2300 7500 2300 7250
Wire Wire Line
	1550 6750 1550 6600
Connection ~ 1550 6750
Wire Wire Line
	1550 6750 1800 6750
Wire Wire Line
	1550 7500 1550 7650
Connection ~ 1550 7500
Wire Wire Line
	1550 7500 1800 7500
$Comp
L power:VCC #PWR?
U 1 1 5ED8CCE0
P 1550 6600
F 0 "#PWR?" H 1550 6450 50  0001 C CNN
F 1 "VCC" H 1567 6773 50  0000 C CNN
F 2 "" H 1550 6600 50  0001 C CNN
F 3 "" H 1550 6600 50  0001 C CNN
	1    1550 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8CF8E
P 1550 7650
F 0 "#PWR?" H 1550 7400 50  0001 C CNN
F 1 "GND" H 1555 7477 50  0000 C CNN
F 2 "" H 1550 7650 50  0001 C CNN
F 3 "" H 1550 7650 50  0001 C CNN
	1    1550 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6950 1300 6750
Connection ~ 1300 6750
Wire Wire Line
	1300 6750 1550 6750
Wire Wire Line
	1800 6950 1800 6750
Connection ~ 1800 6750
Wire Wire Line
	1800 6750 2300 6750
Wire Wire Line
	1300 7250 1300 7500
Connection ~ 1300 7500
Wire Wire Line
	1300 7500 1550 7500
Wire Wire Line
	1800 7250 1800 7500
Connection ~ 1800 7500
Wire Wire Line
	1800 7500 2300 7500
Text Notes 1750 7750 0    50   ~ 0
Decoupling caps: place near power pins\nof U501-U504
Text Notes 4400 7100 0    50   ~ 0
Microcontroller to scan\nkeyboard matrix and\nsend scan codes to FIFO.\nWill be a 89C51 or 87C51.
Wire Wire Line
	9300 2450 10300 2450
Wire Wire Line
	10300 2450 10300 2150
$Comp
L power:VCC #PWR?
U 1 1 5EDC1EFC
P 10300 2150
F 0 "#PWR?" H 10300 2000 50  0001 C CNN
F 1 "VCC" H 10317 2323 50  0000 C CNN
F 2 "" H 10300 2150 50  0001 C CNN
F 3 "" H 10300 2150 50  0001 C CNN
	1    10300 2150
	1    0    0    -1  
$EndComp
Text HLabel 2900 3700 0    50   Input ~ 0
RST
$Comp
L device:Crystal Y501
U 1 1 5ECF0BDF
P 6100 3000
F 0 "Y501" V 6150 3350 50  0000 R CNN
F 1 "11.0592 MHz" V 6050 3650 50  0000 R CNN
F 2 "" H 6100 3000 50  0001 C CNN
F 3 "" H 6100 3000 50  0001 C CNN
	1    6100 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 3900 3550 3900
Wire Wire Line
	3550 3900 3550 2850
Wire Wire Line
	3550 2850 6100 2850
Wire Wire Line
	6000 3500 6100 3500
Wire Wire Line
	6100 3150 6100 3200
Wire Wire Line
	6000 4300 7050 4300
Wire Wire Line
	6000 4400 7050 4400
Wire Wire Line
	6000 4500 7050 4500
Wire Wire Line
	6000 4600 7050 4600
Wire Wire Line
	6000 4700 7050 4700
Wire Wire Line
	6000 4800 7050 4800
Wire Wire Line
	6000 4900 7050 4900
Wire Wire Line
	6000 5000 7050 5000
Wire Wire Line
	6000 4000 7050 4000
Wire Wire Line
	6000 4100 7250 4100
Wire Wire Line
	6100 2850 6350 2850
Connection ~ 6100 2850
Wire Wire Line
	6350 3200 6100 3200
Connection ~ 6100 3200
Wire Wire Line
	6100 3200 6100 3500
Wire Wire Line
	3800 3800 3650 3800
Wire Wire Line
	3650 3800 3650 3500
Connection ~ 3650 3500
Text Notes 8050 6400 0    50   ~ 0
Buffer to allow EF (empty flag)\nand FF (full flag) bits of FIFO\nto be read by the CPU.
Wire Wire Line
	2900 3700 3800 3700
$Comp
L device:C C505
U 1 1 5F056A2F
P 6500 2850
F 0 "C505" V 6400 2700 50  0000 C CNN
F 1 "30pF" V 6400 3000 50  0000 C CNN
F 2 "" H 6538 2700 50  0001 C CNN
F 3 "" H 6500 2850 50  0001 C CNN
	1    6500 2850
	0    1    1    0   
$EndComp
$Comp
L device:C C506
U 1 1 5F064C1E
P 6500 3200
F 0 "C506" V 6400 3050 50  0000 C CNN
F 1 "30pF" V 6400 3350 50  0000 C CNN
F 2 "" H 6538 3050 50  0001 C CNN
F 3 "" H 6500 3200 50  0001 C CNN
	1    6500 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 2850 6800 2850
Wire Wire Line
	6800 2850 6800 3200
Wire Wire Line
	6650 3200 6800 3200
Connection ~ 6800 3200
Wire Wire Line
	6800 3200 6800 3350
$Comp
L power:GND #PWR?
U 1 1 5F09EB58
P 6800 3350
F 0 "#PWR?" H 6800 3100 50  0001 C CNN
F 1 "GND" H 6805 3177 50  0000 C CNN
F 2 "" H 6800 3350 50  0001 C CNN
F 3 "" H 6800 3350 50  0001 C CNN
	1    6800 3350
	1    0    0    -1  
$EndComp
Text Label 1650 2950 0    50   ~ 0
COL0
Text Label 1650 2650 0    50   ~ 0
COL1
Text Label 1650 2550 0    50   ~ 0
COL2
Text Label 1650 1450 0    50   ~ 0
COL3
Text Label 1650 1850 0    50   ~ 0
COL4
Text Label 1650 2150 0    50   ~ 0
COL6
Text Label 1650 2850 0    50   ~ 0
COL7
Text Label 1650 1750 0    50   ~ 0
ROW0
Text Label 1650 1950 0    50   ~ 0
ROW1
Text Label 1650 2350 0    50   ~ 0
ROW2
Text Label 1650 2250 0    50   ~ 0
ROW3
Text Label 1650 2450 0    50   ~ 0
ROW4
Text Label 1650 1250 0    50   ~ 0
ROW5
Text Label 1650 2750 0    50   ~ 0
ROW6
Text Label 1650 3050 0    50   ~ 0
ROW7
Wire Wire Line
	1100 2950 1950 2950
Wire Wire Line
	1100 1450 1950 1450
Wire Wire Line
	1100 1850 1950 1850
Wire Wire Line
	1100 2050 1950 2050
Wire Wire Line
	1100 2150 1950 2150
Wire Wire Line
	1100 2550 1950 2550
Wire Wire Line
	1100 2650 1950 2650
Wire Wire Line
	1100 2850 1950 2850
Wire Wire Line
	1100 1750 1950 1750
Wire Wire Line
	1100 1950 1950 1950
Wire Wire Line
	1100 2450 1950 2450
Wire Wire Line
	1100 1250 1950 1250
Wire Wire Line
	1100 2750 1950 2750
Wire Wire Line
	1100 3050 1950 3050
Wire Wire Line
	1100 2250 1950 2250
Wire Wire Line
	1100 2350 1950 2350
Text Label 1650 2050 0    50   ~ 0
COL5
Wire Wire Line
	2300 5700 2300 5850
Wire Bus Line
	7150 1550 7150 4900
Wire Bus Line
	9800 1550 9800 6550
$Comp
L power:GND #PWR?
U 1 1 5ED1C2BF
P 2300 5850
F 0 "#PWR?" H 2300 5600 50  0001 C CNN
F 1 "GND" H 2305 5677 50  0000 C CNN
F 2 "" H 2300 5850 50  0001 C CNN
F 3 "" H 2300 5850 50  0001 C CNN
	1    2300 5850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
