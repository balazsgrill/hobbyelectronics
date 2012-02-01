EESchema Schematic File Version 2  date 2012. 01. 31. 16:14:08
LIBS:pic16f1824
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
LIBS:stepmc-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "Stepper motor control circuit"
Date "31 jan 2012"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 6750 2200
Wire Wire Line
	8050 2200 4400 2200
Wire Wire Line
	8050 2200 8050 1150
Wire Wire Line
	8050 1150 8350 1150
Connection ~ 8100 1000
Wire Wire Line
	8100 950  8100 1050
Connection ~ 7800 900 
Wire Wire Line
	7800 900  7950 900 
Wire Wire Line
	7950 900  7950 850 
Wire Wire Line
	7950 850  8350 850 
Wire Wire Line
	6850 1900 6850 3300
Wire Wire Line
	6850 3300 3600 3300
Wire Wire Line
	2700 3600 2600 3600
Wire Wire Line
	2600 3600 2600 4000
Wire Wire Line
	2600 4000 6350 4000
Wire Wire Line
	6350 4000 6350 1750
Wire Wire Line
	6450 1900 6450 4100
Wire Wire Line
	6450 4100 2350 4100
Wire Wire Line
	2350 4100 2350 3400
Wire Wire Line
	2350 3400 2700 3400
Wire Wire Line
	1200 1800 1800 1800
Wire Wire Line
	1800 1800 1800 3700
Wire Wire Line
	1800 3700 3800 3700
Wire Wire Line
	3800 3700 3800 3500
Wire Wire Line
	3800 3500 3600 3500
Wire Wire Line
	4550 1800 3900 1800
Wire Wire Line
	3900 1800 3900 3200
Wire Wire Line
	3900 3200 3600 3200
Wire Wire Line
	4550 1400 2500 1400
Wire Wire Line
	2500 1400 2500 3300
Wire Wire Line
	2500 3300 2700 3300
Connection ~ 2600 1500
Wire Wire Line
	2600 1500 2600 3000
Wire Wire Line
	2600 3000 2700 3000
Wire Wire Line
	1200 1500 4550 1500
Wire Wire Line
	7200 3700 5950 3700
Wire Wire Line
	5950 3700 5950 1750
Wire Wire Line
	6650 3700 6650 1900
Connection ~ 6650 3700
Connection ~ 7200 3700
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
	7350 1750 7350 3600
Connection ~ 7350 3600
Wire Wire Line
	4550 1600 1200 1600
Wire Wire Line
	3600 3000 3700 3000
Wire Wire Line
	3700 3000 3700 1600
Connection ~ 3700 1600
Wire Wire Line
	3600 3100 3800 3100
Wire Wire Line
	3800 3100 3800 1700
Wire Wire Line
	3800 1700 4550 1700
Wire Wire Line
	3600 3400 3900 3400
Wire Wire Line
	3900 3400 3900 3800
Wire Wire Line
	3900 3800 1700 3800
Wire Wire Line
	1700 3800 1700 1700
Wire Wire Line
	1700 1700 1200 1700
Wire Wire Line
	6750 2200 6750 1750
Wire Wire Line
	4400 2200 4400 1500
Connection ~ 4400 1500
Wire Wire Line
	6950 1750 6950 4200
Wire Wire Line
	6950 4200 2250 4200
Wire Wire Line
	2250 4200 2250 3100
Wire Wire Line
	2250 3100 2700 3100
Wire Wire Line
	6550 1750 6550 3900
Wire Wire Line
	6550 3900 2500 3900
Wire Wire Line
	2500 3900 2500 3500
Wire Wire Line
	2500 3500 2700 3500
Wire Wire Line
	7050 1900 7050 3600
Wire Wire Line
	7050 3600 3600 3600
Wire Wire Line
	7950 3600 7950 1000
Connection ~ 7950 3600
Wire Wire Line
	7950 1000 8100 1000
Wire Wire Line
	8100 950  8350 950 
Wire Wire Line
	8100 1050 8350 1050
Text Notes 8900 800  0    60   ~ 0
Power connector:\n1: +12V yellow\n2: GND black\n3: GND black\n4: +5V red\n
$Comp
L CONN_4 P4
U 1 1 4F27D2DC
P 8700 1000
F 0 "P4" V 8650 1000 50  0000 C CNN
F 1 "CONN_4" V 8750 1000 50  0000 C CNN
	1    8700 1000
	1    0    0    -1  
$EndComp
$Comp
L CONN_4 P2
U 1 1 4F27CE3D
P 850 1650
F 0 "P2" V 800 1650 50  0000 C CNN
F 1 "CONN_4" V 900 1650 50  0000 C CNN
	1    850  1650
	-1   0    0    -1  
$EndComp
$Comp
L PIC16F1824 IC1
U 1 1 4F27CD9A
P 3150 3300
F 0 "IC1" H 3150 3800 60  0000 C CNN
F 1 "PIC16F1824" V 3150 3300 60  0000 C CNN
	1    3150 3300
	1    0    0    -1  
$EndComp
Text Notes 9650 2400 0    60   ~ 0
Motor
Text Notes 5050 1350 0    60   ~ 0
ICSP:\nMCLR\nVdd\nVss\nData\nClock\nM
$Comp
L CONN_6 P3
U 1 1 4F21663C
P 4900 1650
F 0 "P3" V 4850 1650 60  0000 C CNN
F 1 "CONN_6" V 4950 1650 60  0000 C CNN
	1    4900 1650
	1    0    0    -1  
$EndComp
Text Notes 800  950  0    60   ~ 0
Connector:\n1- Vdd\n2- Vss\n3- I2C clock SCL\n4- I2C data SDA
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
$EndSCHEMATC
