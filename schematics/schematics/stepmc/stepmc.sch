EESchema Schematic File Version 2  date 2012. 01. 26. 16:35:58
LIBS:mcp4131
LIBS:l298
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:l297
LIBS:pic16f1829
LIBS:stepmc-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "Stepper motor control circuit"
Date "26 jan 2012"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1100 1050 0    60   ~ 0
R1 = R2\nMaximum reference \nvoltage is 2.5V
Text Notes 9650 2400 0    60   ~ 0
Motor
Wire Wire Line
	3300 3200 4450 3200
Wire Wire Line
	4450 3200 4450 3000
Wire Wire Line
	1800 5300 1200 5300
Wire Wire Line
	1200 5200 1800 5200
Wire Wire Line
	1200 5000 1800 5000
Wire Wire Line
	3000 5100 3000 5050
Wire Wire Line
	3000 5050 3100 5050
Wire Wire Line
	3550 1900 3450 1900
Wire Wire Line
	3300 1900 3400 1900
Wire Wire Line
	3400 1900 3400 1800
Wire Wire Line
	3400 1800 3650 1800
Wire Wire Line
	3650 1800 3650 1900
Wire Wire Line
	3300 1400 3850 1400
Wire Wire Line
	3850 1400 3850 1900
Wire Bus Line
	3200 1450 3200 5200
Wire Bus Line
	1100 5350 1100 4100
Wire Bus Line
	1100 4100 3200 4100
Wire Wire Line
	2900 7200 2900 6950
Wire Wire Line
	2900 6950 4350 6950
Wire Wire Line
	4350 6950 4350 3800
Wire Wire Line
	4350 3800 3550 3800
Wire Wire Line
	3550 3800 3550 3000
Wire Wire Line
	1800 5500 1300 5500
Wire Wire Line
	1300 5500 1300 2200
Wire Wire Line
	1300 2200 1600 2200
Wire Wire Line
	3000 5500 3200 5500
Wire Wire Line
	3200 5500 3200 6200
Wire Wire Line
	3200 6200 2200 6200
Wire Wire Line
	2200 6200 2200 7200
Wire Wire Line
	3000 4700 3800 4700
Wire Wire Line
	3800 4700 3800 4600
Wire Wire Line
	3800 4600 5150 4600
Connection ~ 1600 4600
Wire Wire Line
	1600 4600 1600 4400
Wire Wire Line
	1600 4400 5150 4400
Connection ~ 3650 4600
Wire Wire Line
	3650 3000 3650 6500
Wire Wire Line
	3650 6500 2100 6500
Wire Wire Line
	2100 6500 2100 7200
Wire Wire Line
	4050 1900 4050 1700
Wire Wire Line
	4050 1700 3050 1700
Wire Wire Line
	3050 1700 3050 2300
Wire Wire Line
	3050 2300 2600 2300
Wire Wire Line
	2600 2200 2750 2200
Wire Wire Line
	2750 2200 2750 1600
Connection ~ 900  1600
Wire Wire Line
	2750 1600 900  1600
Wire Wire Line
	900  1650 900  1550
Connection ~ 1200 2400
Wire Wire Line
	1200 2100 1200 3700
Wire Wire Line
	1200 2100 1600 2100
Connection ~ 2600 900 
Wire Wire Line
	2600 900  2600 2100
Connection ~ 3650 3700
Wire Wire Line
	3650 4600 3000 4600
Connection ~ 4700 3700
Wire Wire Line
	4700 3700 4700 2700
Connection ~ 4350 900 
Connection ~ 5150 900 
Wire Wire Line
	4350 900  4350 1900
Connection ~ 5250 2000
Wire Wire Line
	5250 2600 5250 1650
Wire Wire Line
	5250 1650 4250 1650
Wire Wire Line
	4250 1650 4250 1900
Connection ~ 5000 1900
Wire Wire Line
	5000 1900 5950 1900
Wire Wire Line
	5950 1900 5950 1750
Connection ~ 5250 3100
Connection ~ 6650 3700
Wire Wire Line
	5550 3700 5550 3100
Wire Wire Line
	5550 3100 5000 3100
Wire Wire Line
	6950 1750 6950 3350
Wire Wire Line
	6950 3350 4250 3350
Wire Wire Line
	4250 3350 4250 3000
Connection ~ 7200 3700
Wire Wire Line
	6650 3700 6650 1900
Wire Wire Line
	6850 1900 6850 3600
Wire Wire Line
	6850 3600 4150 3600
Wire Wire Line
	4150 3600 4150 3000
Wire Wire Line
	6350 1750 6350 3500
Wire Wire Line
	6350 3500 3850 3500
Wire Wire Line
	3850 3500 3850 3000
Wire Wire Line
	5150 850  5150 900 
Wire Wire Line
	5350 2200 5350 900 
Wire Wire Line
	5350 2200 6750 2200
Wire Wire Line
	6750 2200 6750 1750
Wire Wire Line
	9400 2700 7150 2700
Wire Wire Line
	7150 2700 7150 1750
Wire Wire Line
	9400 2500 6050 2500
Wire Wire Line
	6050 2500 6050 1900
Connection ~ 8600 1700
Wire Wire Line
	8600 1700 8600 2000
Wire Wire Line
	9200 2000 9200 1700
Wire Wire Line
	9200 1700 7800 1700
Connection ~ 8600 3600
Wire Wire Line
	8600 3600 8600 3300
Wire Wire Line
	9200 3300 9200 3600
Wire Wire Line
	9200 3600 7200 3600
Wire Wire Line
	7200 3600 7200 4000
Wire Wire Line
	8300 2400 8300 2900
Connection ~ 8300 2500
Wire Wire Line
	8600 2400 8600 2900
Connection ~ 8600 2600
Wire Wire Line
	8900 2400 8900 2900
Connection ~ 8900 2700
Wire Wire Line
	9200 2400 9200 2900
Connection ~ 9200 2800
Wire Wire Line
	8900 3600 8900 3300
Connection ~ 8900 3600
Wire Wire Line
	8300 3300 8300 3600
Connection ~ 8300 3600
Wire Wire Line
	8900 1700 8900 2000
Connection ~ 8900 1700
Wire Wire Line
	8300 2000 8300 1700
Connection ~ 8300 1700
Wire Wire Line
	6150 1750 6150 2600
Wire Wire Line
	6150 2600 9400 2600
Wire Wire Line
	7250 1900 7250 2800
Wire Wire Line
	7250 2800 9400 2800
Wire Wire Line
	6250 1900 6250 2100
Wire Wire Line
	6250 2100 7800 2100
Wire Wire Line
	7800 2100 7800 850 
Connection ~ 7800 1700
Wire Wire Line
	6550 1750 6550 3550
Wire Wire Line
	6550 3550 4050 3550
Wire Wire Line
	4050 3550 4050 3000
Wire Wire Line
	7050 1900 7050 3650
Wire Wire Line
	7050 3650 4350 3650
Wire Wire Line
	4350 3650 4350 3000
Wire Wire Line
	6450 1900 6450 3300
Wire Wire Line
	6450 3300 3950 3300
Wire Wire Line
	3950 3300 3950 3000
Wire Wire Line
	4150 1900 4150 1600
Wire Wire Line
	4150 1600 5000 1600
Wire Wire Line
	5000 1600 5000 2600
Wire Wire Line
	7350 1750 7350 2000
Wire Wire Line
	7350 2000 5250 2000
Connection ~ 5550 3700
Wire Wire Line
	3950 1400 3950 1900
Wire Wire Line
	3950 1500 4700 1500
Wire Wire Line
	4700 1500 4700 2300
Connection ~ 3950 1500
Wire Wire Line
	5350 900  600  900 
Wire Wire Line
	1800 4600 600  4600
Connection ~ 3950 900 
Wire Wire Line
	1200 3700 7200 3700
Wire Wire Line
	1200 2400 1600 2400
Wire Wire Line
	900  1050 900  900 
Connection ~ 900  900 
Wire Wire Line
	900  2150 900  2300
Wire Wire Line
	900  2300 1200 2300
Connection ~ 1200 2300
Wire Wire Line
	2600 2400 2600 3700
Connection ~ 2600 3700
Wire Wire Line
	2000 7200 600  7200
Wire Wire Line
	600  7200 600  900 
Connection ~ 600  4600
Wire Wire Line
	5150 4300 1500 4300
Wire Wire Line
	1500 4300 1500 4900
Wire Wire Line
	1500 4900 1800 4900
Wire Wire Line
	5150 4500 3650 4500
Connection ~ 3650 4500
Wire Wire Line
	5150 4700 4000 4700
Wire Wire Line
	4000 4700 4000 4800
Wire Wire Line
	4000 4800 3000 4800
Wire Wire Line
	2300 7200 2300 6300
Wire Wire Line
	2300 6300 3300 6300
Wire Wire Line
	3300 6300 3300 5300
Wire Wire Line
	3300 5300 3000 5300
Wire Wire Line
	1800 4700 1400 4700
Wire Wire Line
	1400 4700 1400 2300
Wire Wire Line
	1400 2300 1600 2300
Wire Wire Line
	4450 1900 4450 700 
Wire Wire Line
	4450 700  3500 700 
Wire Wire Line
	3500 700  3500 1500
Wire Wire Line
	3500 1500 3300 1500
Wire Wire Line
	3750 1900 3750 1750
Wire Wire Line
	3750 1750 3300 1750
Wire Wire Line
	3300 1750 3300 1800
Wire Wire Line
	3450 1900 3450 2000
Wire Wire Line
	3450 2000 3300 2000
Wire Wire Line
	3100 4950 3000 4950
Wire Wire Line
	3000 4950 3000 5000
Wire Wire Line
	3100 5150 3000 5150
Wire Wire Line
	3000 5150 3000 5200
Wire Wire Line
	1800 5100 1200 5100
Wire Wire Line
	3750 3000 3750 3100
Wire Wire Line
	3750 3100 3300 3100
Entry Wire Line
	3200 3300 3300 3200
Entry Wire Line
	3200 3200 3300 3100
Entry Wire Line
	1100 5200 1200 5300
Entry Wire Line
	1100 5100 1200 5200
Entry Wire Line
	1100 5000 1200 5100
Entry Wire Line
	1100 4900 1200 5000
Entry Wire Line
	3100 4950 3200 4850
Entry Wire Line
	3100 5150 3200 5050
Entry Wire Line
	3100 5050 3200 4950
Entry Wire Line
	3200 1500 3300 1400
Entry Wire Line
	3200 1600 3300 1500
Entry Wire Line
	3200 2100 3300 2000
Entry Wire Line
	3200 2000 3300 1900
Entry Wire Line
	3200 1900 3300 1800
Text Notes 4550 5050 0    60   ~ 0
Control signals: RC0-RC6\nRC0: reset\nRC1: HALF\nRC2: clock\nRC3: CW\nRC4: ctrl\nRC5: enable\nRC6: home (input)\n
Text Notes 4100 7400 0    60   ~ 0
10- sync
Text Notes 2100 5700 0    60   ~ 0
SCL1 - RB6\nSDA1 - RB4\nSCK2 - RB7\nSDO2 - RC1 or RA5
Text Notes 5650 4300 0    60   ~ 0
ICSP:\nMCLR\nVdd\nVss\nData\nClock\nM
$Comp
L CONN_6 P3
U 1 1 4F21663C
P 5500 4550
F 0 "P3" V 5450 4550 60  0000 C CNN
F 1 "CONN_6" V 5550 4550 60  0000 C CNN
	1    5500 4550
	1    0    0    -1  
$EndComp
Text Notes 3100 7300 0    60   ~ 0
Connector:\n1- Vdd\n2- Vss\n3- I2C clock SCL\n4- I2C data SDA
$Comp
L CONN_10 P2
U 1 1 4F216551
P 2450 7550
F 0 "P2" V 2400 7550 60  0000 C CNN
F 1 "CONN_10" V 2500 7550 60  0000 C CNN
	1    2450 7550
	0    -1   1    0   
$EndComp
$Comp
L R R3
U 1 1 4F216499
P 900 1900
F 0 "R3" V 980 1900 50  0000 C CNN
F 1 "R" V 900 1900 50  0000 C CNN
	1    900  1900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4F216491
P 900 1300
F 0 "R2" V 980 1300 50  0000 C CNN
F 1 "R" V 900 1300 50  0000 C CNN
	1    900  1300
	1    0    0    -1  
$EndComp
$Comp
L MCP4131 IC4
U 1 1 4F216410
P 2100 2250
F 0 "IC4" H 2100 2550 60  0000 C CNN
F 1 "MCP4131" V 2100 2250 60  0000 C CNN
	1    2100 2250
	1    0    0    -1  
$EndComp
$Comp
L PIC16F1829 IC3
U 1 1 4F215E10
P 2400 5050
F 0 "IC3" H 2400 5400 60  0000 C CNN
F 1 "PIC16F1829" V 2400 5050 60  0000 C CNN
	1    2400 5050
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4F0C8B59
P 4700 2500
F 0 "C1" H 4750 2600 50  0000 L CNN
F 1 "C" H 4750 2400 50  0000 L CNN
	1    4700 2500
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4F0C8B29
P 3950 1150
F 0 "R1" V 4030 1150 50  0000 C CNN
F 1 "R" V 3950 1150 50  0000 C CNN
	1    3950 1150
	1    0    0    -1  
$EndComp
$Comp
L R Rs2
U 1 1 4F0C8A6F
P 5250 2850
F 0 "Rs2" V 5330 2850 50  0000 C CNN
F 1 "R" V 5250 2850 50  0000 C CNN
	1    5250 2850
	1    0    0    -1  
$EndComp
$Comp
L R Rs1
U 1 1 4F0C8A66
P 5000 2850
F 0 "Rs1" V 5080 2850 50  0000 C CNN
F 1 "R" V 5000 2850 50  0000 C CNN
	1    5000 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4F0C8891
P 7200 4000
F 0 "#PWR?" H 7200 4000 30  0001 C CNN
F 1 "GND" H 7200 3930 30  0001 C CNN
	1    7200 4000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 4F0C887F
P 7800 850
F 0 "#PWR?" H 7800 950 30  0001 C CNN
F 1 "VCC" H 7800 950 30  0000 C CNN
	1    7800 850 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 4F0C8864
P 5150 850
F 0 "#PWR?" H 5150 940 20  0001 C CNN
F 1 "+5V" H 5150 940 30  0000 C CNN
	1    5150 850 
	1    0    0    -1  
$EndComp
$Comp
L DIODE D8
U 1 1 4F0C872F
P 9200 3100
F 0 "D8" H 9200 3200 40  0000 C CNN
F 1 "DIODE" H 9200 3000 40  0000 C CNN
	1    9200 3100
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D7
U 1 1 4F0C872C
P 8900 3100
F 0 "D7" H 8900 3200 40  0000 C CNN
F 1 "DIODE" H 8900 3000 40  0000 C CNN
	1    8900 3100
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D6
U 1 1 4F0C8728
P 8600 3100
F 0 "D6" H 8600 3200 40  0000 C CNN
F 1 "DIODE" H 8600 3000 40  0000 C CNN
	1    8600 3100
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D5
U 1 1 4F0C8725
P 8300 3100
F 0 "D5" H 8300 3200 40  0000 C CNN
F 1 "DIODE" H 8300 3000 40  0000 C CNN
	1    8300 3100
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D4
U 1 1 4F0C871F
P 9200 2200
F 0 "D4" H 9200 2300 40  0000 C CNN
F 1 "DIODE" H 9200 2100 40  0000 C CNN
	1    9200 2200
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D3
U 1 1 4F0C871B
P 8900 2200
F 0 "D3" H 8900 2300 40  0000 C CNN
F 1 "DIODE" H 8900 2100 40  0000 C CNN
	1    8900 2200
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D2
U 1 1 4F0C8718
P 8600 2200
F 0 "D2" H 8600 2300 40  0000 C CNN
F 1 "DIODE" H 8600 2100 40  0000 C CNN
	1    8600 2200
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D1
U 1 1 4F0C870A
P 8300 2200
F 0 "D1" H 8300 2300 40  0000 C CNN
F 1 "DIODE" H 8300 2100 40  0000 C CNN
	1    8300 2200
	0    -1   -1   0   
$EndComp
$Comp
L CONN_4 P1
U 1 1 4F0C86CE
P 9750 2650
F 0 "P1" V 9700 2650 50  0000 C CNN
F 1 "CONN_4" V 9800 2650 50  0000 C CNN
	1    9750 2650
	1    0    0    -1  
$EndComp
$Comp
L L298 IC2
U 1 1 4F0C85F5
P 6650 1200
F 0 "IC2" H 6300 1350 60  0000 C CNN
F 1 "L298" H 7000 1350 60  0000 C CNN
	1    6650 1200
	1    0    0    -1  
$EndComp
$Comp
L L297 IC1
U 1 1 4F0C784F
P 4000 2450
F 0 "IC1" H 4000 3000 60  0000 C CNN
F 1 "L297" V 4000 2450 60  0000 C CNN
	1    4000 2450
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
