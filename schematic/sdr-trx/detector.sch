EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title "Tayloe Detector"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Analog_Switch:SN74CBT3253 U?
U 1 1 5EB9C5CC
P 8350 1850
AR Path="/5E9F4ACB/5EB9C5CC" Ref="U?"  Part="1" 
AR Path="/5EA188E4/5EB9C5CC" Ref="U?"  Part="1" 
F 0 "U?" H 8300 2450 50  0000 R CNN
F 1 "SN74CBT3253" H 8250 1250 50  0000 R CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 8350 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74cbt3253" H 8350 1850 50  0001 C CNN
	1    8350 1850
	-1   0    0    -1  
$EndComp
Text GLabel 7300 700  0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	7650 1150 7650 1100
Connection ~ 7650 1100
$Comp
L Device:C C?
U 1 1 5EB9C5D5
P 7900 900
AR Path="/5E9E88B8/5EB9C5D5" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C5D5" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB9C5D5" Ref="C?"  Part="1" 
F 0 "C?" H 8015 946 50  0000 L CNN
F 1 "10nF" H 8015 855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7938 750 50  0001 C CNN
F 3 "~" H 7900 900 50  0001 C CNN
	1    7900 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB9C5DB
P 7400 900
AR Path="/5E9E88B8/5EB9C5DB" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C5DB" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB9C5DB" Ref="C?"  Part="1" 
F 0 "C?" H 7515 946 50  0000 L CNN
F 1 "0.1uF" H 7515 855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7438 750 50  0001 C CNN
F 3 "~" H 7400 900 50  0001 C CNN
	1    7400 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB9C5E1
P 7650 1150
AR Path="/5E9E88B8/5EB9C5E1" Ref="#PWR?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C5E1" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EB9C5E1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7650 900 50  0001 C CNN
F 1 "GND" H 7655 977 50  0000 C CNN
F 2 "" H 7650 1150 50  0001 C CNN
F 3 "" H 7650 1150 50  0001 C CNN
	1    7650 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1100 7900 1100
Wire Wire Line
	7400 1050 7400 1100
Wire Wire Line
	7400 1100 7650 1100
Wire Wire Line
	7400 750  7400 700 
Wire Wire Line
	7400 700  7900 700 
Wire Wire Line
	7900 750  7900 700 
Wire Wire Line
	7900 1100 7900 1050
Connection ~ 7900 700 
Wire Wire Line
	7950 1750 7900 1750
Wire Wire Line
	7900 1750 7900 1950
Wire Wire Line
	7950 1650 7850 1650
Wire Wire Line
	7800 1550 7950 1550
Wire Wire Line
	7950 1450 7750 1450
Wire Wire Line
	7750 1450 7750 2250
Wire Wire Line
	7300 700  7400 700 
Connection ~ 7400 700 
Wire Wire Line
	8350 700  8350 1250
Wire Wire Line
	7900 700  8350 700 
Wire Wire Line
	8350 700  8850 700 
Wire Wire Line
	8850 700  8850 750 
Connection ~ 8350 700 
Wire Wire Line
	7850 1650 7850 2050
Wire Wire Line
	7800 1550 7800 2150
$Comp
L Device:R R?
U 1 1 5EB9C5FF
P 8850 900
AR Path="/5E9E88B8/5EB9C5FF" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C5FF" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB9C5FF" Ref="R?"  Part="1" 
F 0 "R?" H 8750 950 50  0000 R CNN
F 1 "10K" H 8750 850 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8780 900 50  0001 C CNN
F 3 "~" H 8850 900 50  0001 C CNN
	1    8850 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EB9C606
P 9150 1550
AR Path="/5E9E88B8/5EB9C606" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C606" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB9C606" Ref="R?"  Part="1" 
F 0 "R?" V 9250 1650 50  0000 L CNN
F 1 "100R 1%" V 9250 1550 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9080 1550 50  0001 C CNN
F 3 "~" H 9150 1550 50  0001 C CNN
	1    9150 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB9C60C
P 9150 1150
AR Path="/5E9E88B8/5EB9C60C" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB9C60C" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB9C60C" Ref="R?"  Part="1" 
F 0 "R?" V 9250 1250 50  0000 L CNN
F 1 "100R 1%" V 9250 1150 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9080 1150 50  0001 C CNN
F 3 "~" H 9150 1150 50  0001 C CNN
	1    9150 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8750 1450 8900 1450
Wire Wire Line
	8900 1150 9000 1150
Wire Wire Line
	9600 1150 9300 1150
Wire Wire Line
	9300 1550 9600 1550
Wire Wire Line
	10000 1550 10100 1550
Wire Wire Line
	8900 1150 8900 1450
Wire Wire Line
	8750 1550 9000 1550
Text HLabel 10550 1150 2    50   Input ~ 0
RF
Wire Wire Line
	10000 1150 10550 1150
$Comp
L sdr-trx:CX2047LANL TR?
U 1 1 5EB9C621
P 9800 1350
AR Path="/5E9F4ACB/5EB9C621" Ref="TR?"  Part="1" 
AR Path="/5EA188E4/5EB9C621" Ref="TR?"  Part="1" 
F 0 "TR?" H 9800 1700 50  0000 C CNN
F 1 "CX2047LANL" H 9700 1050 50  0000 C CNN
F 2 "sdr-trx:CX2047LANL" H 9800 1000 50  0001 C CNN
F 3 "https://productfinder.pulseeng.com/doc_type/WEB301/doc_num/CX2047LANL-01/doc_part/CX2047LANL.pdf" H 9800 1350 50  0001 C CNN
	1    9800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 1950 7950 1950
Wire Wire Line
	7950 2050 7850 2050
Wire Wire Line
	7950 2150 7800 2150
Wire Wire Line
	7950 2250 7750 2250
Wire Wire Line
	8750 2150 8850 2150
Wire Wire Line
	8850 1050 8850 2050
Wire Wire Line
	8750 2250 8850 2250
Wire Wire Line
	8850 2250 8850 2150
Connection ~ 8850 2150
$Comp
L power:GND #PWR?
U 1 1 5EC1534E
P 8350 2500
AR Path="/5E9F4ACB/5EC1534E" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EC1534E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8350 2250 50  0001 C CNN
F 1 "GND" H 8355 2327 50  0000 C CNN
F 2 "" H 8350 2500 50  0001 C CNN
F 3 "" H 8350 2500 50  0001 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2500 8350 2450
Text HLabel 10550 2050 2    50   Input ~ 0
RX-EN#
Text HLabel 10550 1950 2    50   Input ~ 0
F90
Text HLabel 10550 1850 2    50   Input ~ 0
F00
Wire Wire Line
	8750 1850 10550 1850
Wire Wire Line
	10550 1950 8750 1950
Wire Wire Line
	10550 2050 8850 2050
Connection ~ 8850 2050
Wire Wire Line
	8850 2050 8850 2150
Wire Wire Line
	9350 1350 9600 1350
Text Label 6100 6750 2    50   ~ 0
INP-270
Text Label 6100 4950 2    50   ~ 0
INP-090
Text Label 6100 3250 2    50   ~ 0
INP-180
Connection ~ 5700 1450
Text Label 6100 1450 2    50   ~ 0
INP-000
Wire Wire Line
	5400 5850 5450 5850
Wire Wire Line
	5450 5850 5450 6350
Connection ~ 5450 5850
Wire Wire Line
	5700 5850 5700 6050
Connection ~ 5700 5850
Wire Wire Line
	5700 5850 5450 5850
Connection ~ 5450 4950
Wire Wire Line
	5700 4950 5700 5400
Wire Wire Line
	5450 4950 5700 4950
Wire Wire Line
	5450 4950 5450 5050
Wire Wire Line
	5700 5700 5700 5850
Connection ~ 5450 6750
Wire Wire Line
	5700 6750 5450 6750
Wire Wire Line
	5700 6350 5700 6750
Wire Wire Line
	5450 6750 5450 6650
Wire Wire Line
	5450 5350 5450 5850
$Comp
L Device:C C?
U 1 1 5EB01F7F
P 5700 6200
AR Path="/5E9E88B8/5EB01F7F" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F7F" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F7F" Ref="C?"  Part="1" 
F 0 "C?" V 5550 6200 50  0000 C CNN
F 1 "8.2nF 1%" V 5850 6200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 6050 50  0001 C CNN
F 3 "~" H 5700 6200 50  0001 C CNN
	1    5700 6200
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01F79
P 5450 6500
AR Path="/5E9E88B8/5EB01F79" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F79" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F79" Ref="C?"  Part="1" 
F 0 "C?" V 5300 6500 50  0000 C CNN
F 1 "8.2nF 1%" V 5600 6500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 6350 50  0001 C CNN
F 3 "~" H 5450 6500 50  0001 C CNN
	1    5450 6500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 6750 5450 6750
Wire Wire Line
	4900 4950 5450 4950
$Comp
L Device:C C?
U 1 1 5EB01F71
P 5700 5550
AR Path="/5E9E88B8/5EB01F71" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F71" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F71" Ref="C?"  Part="1" 
F 0 "C?" V 5550 5550 50  0000 C CNN
F 1 "8.2nF 1%" V 5850 5550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 5400 50  0001 C CNN
F 3 "~" H 5700 5550 50  0001 C CNN
	1    5700 5550
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01F6B
P 5450 5200
AR Path="/5E9E88B8/5EB01F6B" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F6B" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F6B" Ref="C?"  Part="1" 
F 0 "C?" V 5300 5200 50  0000 C CNN
F 1 "8.2nF 1%" V 5600 5200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 5050 50  0001 C CNN
F 3 "~" H 5450 5200 50  0001 C CNN
	1    5450 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1200 5900 1100 5900
Text HLabel 1100 5900 0    50   Output ~ 0
OUT-Q
Wire Wire Line
	1550 5900 1500 5900
$Comp
L Device:C C?
U 1 1 5EB01F62
P 1350 5900
AR Path="/5E9E88B8/5EB01F62" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F62" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F62" Ref="C?"  Part="1" 
F 0 "C?" V 1200 5850 50  0000 L CNN
F 1 "1.0uF" V 1500 5800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 5750 50  0001 C CNN
F 3 "~" H 1350 5900 50  0001 C CNN
	1    1350 5900
	0    -1   1    0   
$EndComp
Wire Wire Line
	2250 5900 1850 5900
$Comp
L Device:R R?
U 1 1 5EB01F5B
P 1700 5900
AR Path="/5E9E88B8/5EB01F5B" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F5B" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01F5B" Ref="R?"  Part="1" 
F 0 "R?" V 1600 5850 50  0000 L CNN
F 1 "10R" V 1800 5800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 5900 50  0001 C CNN
F 3 "~" H 1700 5900 50  0001 C CNN
	1    1700 5900
	0    -1   1    0   
$EndComp
Wire Wire Line
	2550 5500 2550 5600
Wire Wire Line
	2500 5500 2550 5500
Wire Wire Line
	2500 5050 2500 5500
Wire Wire Line
	2550 5050 2500 5050
Connection ~ 2900 5050
Wire Wire Line
	2900 5050 2850 5050
$Comp
L Device:R R?
U 1 1 5EB01F4F
P 2700 5050
AR Path="/5E9E88B8/5EB01F4F" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F4F" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01F4F" Ref="R?"  Part="1" 
F 0 "R?" V 2600 5000 50  0000 L CNN
F 1 "1K 1%" V 2800 4950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 5050 50  0001 C CNN
F 3 "~" H 2700 5050 50  0001 C CNN
	1    2700 5050
	0    -1   1    0   
$EndComp
Wire Wire Line
	2900 5050 3050 5050
Wire Wire Line
	2900 5800 2900 5050
Wire Wire Line
	2850 5800 2900 5800
Wire Wire Line
	2900 7000 2900 7200
Text Label 2900 7200 1    50   ~ 0
BIAS
Connection ~ 2900 6650
Wire Wire Line
	2900 6650 2900 6700
$Comp
L Device:R R?
U 1 1 5EB01F42
P 2900 6850
AR Path="/5E9E88B8/5EB01F42" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F42" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01F42" Ref="R?"  Part="1" 
F 0 "R?" H 2850 6800 50  0000 R CNN
F 1 "1K 1%" H 2850 6900 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2830 6850 50  0001 C CNN
F 3 "~" H 2900 6850 50  0001 C CNN
	1    2900 6850
	1    0    0    1   
$EndComp
Wire Wire Line
	2900 6650 3050 6650
Wire Wire Line
	2900 6000 2900 6650
Wire Wire Line
	2850 6000 2900 6000
Wire Wire Line
	2650 5600 2650 5550
Text GLabel 1350 6650 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	2650 6250 2650 6650
Connection ~ 2650 6250
Wire Wire Line
	2550 6250 2550 6200
Wire Wire Line
	2650 6250 2550 6250
Wire Wire Line
	2650 6200 2650 6250
$Comp
L Device:C C?
U 1 1 5EB01F15
P 2450 6850
AR Path="/5E9E88B8/5EB01F15" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F15" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F15" Ref="C?"  Part="1" 
F 0 "C?" H 2565 6896 50  0000 L CNN
F 1 "10nF" H 2565 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 6700 50  0001 C CNN
F 3 "~" H 2450 6850 50  0001 C CNN
	1    2450 6850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01F0F
P 1450 6850
AR Path="/5E9E88B8/5EB01F0F" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F0F" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F0F" Ref="C?"  Part="1" 
F 0 "C?" H 1565 6896 50  0000 L CNN
F 1 "1.0uF" H 1565 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1488 6700 50  0001 C CNN
F 3 "~" H 1450 6850 50  0001 C CNN
	1    1450 6850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01F09
P 1950 6850
AR Path="/5E9E88B8/5EB01F09" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01F09" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01F09" Ref="C?"  Part="1" 
F 0 "C?" H 2065 6896 50  0000 L CNN
F 1 "0.1uF" H 2065 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1988 6700 50  0001 C CNN
F 3 "~" H 1950 6850 50  0001 C CNN
	1    1950 6850
	-1   0    0    -1  
$EndComp
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EB01F03
P 2550 5900
F 0 "U?" H 2700 5750 50  0000 L CNN
F 1 "LTC6228XS8" H 2700 6050 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2650 5650 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 2700 6050 50  0001 C CNN
	1    2550 5900
	-1   0    0    1   
$EndComp
Connection ~ 3400 6650
Wire Wire Line
	3350 6650 3400 6650
Connection ~ 3400 5050
Wire Wire Line
	3350 5050 3400 5050
$Comp
L Device:R R?
U 1 1 5EB01EF9
P 3200 6650
AR Path="/5E9E88B8/5EB01EF9" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EF9" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EF9" Ref="R?"  Part="1" 
F 0 "R?" V 3100 6600 50  0000 L CNN
F 1 "820R 1%" V 3300 6500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3130 6650 50  0001 C CNN
F 3 "~" H 3200 6650 50  0001 C CNN
	1    3200 6650
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB01EF3
P 3200 5050
AR Path="/5E9E88B8/5EB01EF3" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EF3" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EF3" Ref="R?"  Part="1" 
F 0 "R?" V 3100 5000 50  0000 L CNN
F 1 "820R 1%" V 3300 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3130 5050 50  0001 C CNN
F 3 "~" H 3200 5050 50  0001 C CNN
	1    3200 5050
	0    -1   1    0   
$EndComp
Wire Wire Line
	3400 6650 3400 6000
Wire Wire Line
	3650 6650 3400 6650
Wire Wire Line
	3400 5050 3650 5050
Wire Wire Line
	3400 5700 3400 5050
$Comp
L Device:C C?
U 1 1 5EB01EE9
P 3400 5850
AR Path="/5E9E88B8/5EB01EE9" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EE9" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01EE9" Ref="C?"  Part="1" 
F 0 "C?" H 3500 5900 50  0000 L CNN
F 1 "8.2nF 1%" H 3500 5750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3438 5700 50  0001 C CNN
F 3 "~" H 3400 5850 50  0001 C CNN
	1    3400 5850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 6650 4300 6650
Wire Wire Line
	3950 5050 4300 5050
$Comp
L Device:R R?
U 1 1 5EB01EE1
P 3800 5050
AR Path="/5E9E88B8/5EB01EE1" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EE1" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EE1" Ref="R?"  Part="1" 
F 0 "R?" V 3700 5000 50  0000 L CNN
F 1 "100R 1%" V 3900 4950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3730 5050 50  0001 C CNN
F 3 "~" H 3800 5050 50  0001 C CNN
	1    3800 5050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB01EDB
P 3800 6650
AR Path="/5E9E88B8/5EB01EDB" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EDB" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EDB" Ref="R?"  Part="1" 
F 0 "R?" V 3700 6600 50  0000 L CNN
F 1 "100R 1%" V 3900 6600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3730 6650 50  0001 C CNN
F 3 "~" H 3800 6650 50  0001 C CNN
	1    3800 6650
	0    -1   1    0   
$EndComp
Connection ~ 3900 6050
Wire Wire Line
	3900 6000 3900 6050
Wire Wire Line
	3900 6350 3900 6050
Wire Wire Line
	4100 6350 3900 6350
Wire Wire Line
	4950 6050 3900 6050
Wire Wire Line
	4950 6550 4950 6050
Wire Wire Line
	4900 6550 4950 6550
Wire Wire Line
	3900 5650 3900 5700
Connection ~ 3900 5650
Wire Wire Line
	4950 5650 3900 5650
Wire Wire Line
	4950 5150 4950 5650
Wire Wire Line
	4900 5150 4950 5150
Wire Wire Line
	3900 5350 3900 5650
Wire Wire Line
	4100 5350 3900 5350
$Comp
L Device:R R?
U 1 1 5EB01EC7
P 3900 5850
AR Path="/5E9E88B8/5EB01EC7" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EC7" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EC7" Ref="R?"  Part="1" 
F 0 "R?" H 3850 5800 50  0000 R CNN
F 1 "10R 1%" H 3850 5900 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3830 5850 50  0001 C CNN
F 3 "~" H 3900 5850 50  0001 C CNN
	1    3900 5850
	1    0    0    1   
$EndComp
Wire Wire Line
	4600 6350 4400 6350
Wire Wire Line
	4600 5350 4400 5350
$Comp
L Device:R R?
U 1 1 5EB01EBF
P 4250 6350
AR Path="/5E9E88B8/5EB01EBF" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EBF" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EBF" Ref="R?"  Part="1" 
F 0 "R?" V 4150 6300 50  0000 R CNN
F 1 "1K 1%" V 4150 6400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 6350 50  0001 C CNN
F 3 "~" H 4250 6350 50  0001 C CNN
	1    4250 6350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB01EB9
P 4250 5350
AR Path="/5E9E88B8/5EB01EB9" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EB01EB9" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EB01EB9" Ref="R?"  Part="1" 
F 0 "R?" V 4350 5300 50  0000 R CNN
F 1 "1K 1%" V 4350 5350 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 5350 50  0001 C CNN
F 3 "~" H 4250 5350 50  0001 C CNN
	1    4250 5350
	0    -1   1    0   
$EndComp
Wire Wire Line
	3700 7350 3700 7400
Wire Wire Line
	4200 7400 3700 7400
Connection ~ 4200 7400
Wire Wire Line
	4200 7350 4200 7400
Wire Wire Line
	4700 7400 4200 7400
Wire Wire Line
	4700 7350 4700 7400
Text GLabel 3600 7000 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	4600 7000 4600 6950
Wire Wire Line
	4700 7000 4600 7000
Wire Wire Line
	4700 6950 4700 7000
$Comp
L Device:C C?
U 1 1 5EB01E96
P 4700 7200
AR Path="/5E9E88B8/5EB01E96" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E96" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E96" Ref="C?"  Part="1" 
F 0 "C?" H 4815 7246 50  0000 L CNN
F 1 "10nF" H 4815 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4738 7050 50  0001 C CNN
F 3 "~" H 4700 7200 50  0001 C CNN
	1    4700 7200
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01E90
P 3700 7200
AR Path="/5E9E88B8/5EB01E90" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E90" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E90" Ref="C?"  Part="1" 
F 0 "C?" H 3815 7246 50  0000 L CNN
F 1 "1.0uF" H 3815 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3738 7050 50  0001 C CNN
F 3 "~" H 3700 7200 50  0001 C CNN
	1    3700 7200
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01E8A
P 4200 7200
AR Path="/5E9E88B8/5EB01E8A" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E8A" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E8A" Ref="C?"  Part="1" 
F 0 "C?" H 4315 7246 50  0000 L CNN
F 1 "0.1uF" H 4315 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4238 7050 50  0001 C CNN
F 3 "~" H 4200 7200 50  0001 C CNN
	1    4200 7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4700 6300 4700 6350
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EB01E7D
P 4600 6650
F 0 "U?" H 4750 6500 50  0000 L CNN
F 1 "LTC6228XS8" H 4750 6800 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 4700 6400 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 4750 6800 50  0001 C CNN
	1    4600 6650
	-1   0    0    1   
$EndComp
Connection ~ 4500 4300
Connection ~ 4700 4700
Wire Wire Line
	4700 4300 4500 4300
Wire Wire Line
	4700 4700 4700 4300
Wire Wire Line
	4000 4700 3500 4700
Wire Wire Line
	4000 4750 4000 4700
Wire Wire Line
	4500 4350 4500 4300
Connection ~ 4000 4700
Wire Wire Line
	4500 4700 4500 4650
Wire Wire Line
	4000 4700 4500 4700
$Comp
L Device:C C?
U 1 1 5EB01E6D
P 4500 4500
AR Path="/5E9E88B8/5EB01E6D" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E6D" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E6D" Ref="C?"  Part="1" 
F 0 "C?" H 4615 4546 50  0000 L CNN
F 1 "10nF" H 4615 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 4350 50  0001 C CNN
F 3 "~" H 4500 4500 50  0001 C CNN
	1    4500 4500
	-1   0    0    -1  
$EndComp
Connection ~ 4000 4300
Wire Wire Line
	4000 4300 4500 4300
Connection ~ 3500 4300
Wire Wire Line
	3400 4300 3500 4300
Wire Wire Line
	3500 4700 3500 4650
Wire Wire Line
	3500 4350 3500 4300
Wire Wire Line
	4000 4300 3500 4300
Wire Wire Line
	4000 4350 4000 4300
Wire Wire Line
	4000 4650 4000 4700
$Comp
L Device:C C?
U 1 1 5EB01E58
P 3500 4500
AR Path="/5E9E88B8/5EB01E58" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E58" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E58" Ref="C?"  Part="1" 
F 0 "C?" H 3615 4546 50  0000 L CNN
F 1 "1.0uF" H 3615 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3538 4350 50  0001 C CNN
F 3 "~" H 3500 4500 50  0001 C CNN
	1    3500 4500
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EB01E52
P 4000 4500
AR Path="/5E9E88B8/5EB01E52" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EB01E52" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EB01E52" Ref="C?"  Part="1" 
F 0 "C?" H 4115 4546 50  0000 L CNN
F 1 "0.1uF" H 4115 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4038 4350 50  0001 C CNN
F 3 "~" H 4000 4500 50  0001 C CNN
	1    4000 4500
	-1   0    0    -1  
$EndComp
Text GLabel 3400 4300 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	4700 5350 4700 5400
Wire Wire Line
	4600 4700 4600 4750
Wire Wire Line
	4700 4700 4600 4700
Wire Wire Line
	4700 4750 4700 4700
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EB01E41
P 4600 5050
F 0 "U?" H 4650 5200 50  0000 L CNN
F 1 "LTC6228XS8" H 4650 4900 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 4700 4800 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 4750 5200 50  0001 C CNN
	1    4600 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 2350 5450 2350
Wire Wire Line
	5450 2350 5450 2850
Connection ~ 5450 2350
Wire Wire Line
	5700 2350 5700 2550
Connection ~ 5700 2350
Wire Wire Line
	5700 2350 5450 2350
Connection ~ 5450 1450
Wire Wire Line
	5700 1450 5700 1900
Wire Wire Line
	5450 1450 5700 1450
Wire Wire Line
	5450 1450 5450 1550
Wire Wire Line
	5700 2200 5700 2350
Connection ~ 5450 3250
Wire Wire Line
	5700 3250 5450 3250
Wire Wire Line
	5700 2850 5700 3250
Wire Wire Line
	5450 3250 5450 3150
Wire Wire Line
	5450 1850 5450 2350
$Comp
L Device:C C?
U 1 1 5EAC09D2
P 5700 2700
AR Path="/5E9E88B8/5EAC09D2" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EAC09D2" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EAC09D2" Ref="C?"  Part="1" 
F 0 "C?" V 5550 2700 50  0000 C CNN
F 1 "8.2nF 1%" V 5850 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 2550 50  0001 C CNN
F 3 "~" H 5700 2700 50  0001 C CNN
	1    5700 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAC04D5
P 5450 3000
AR Path="/5E9E88B8/5EAC04D5" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EAC04D5" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EAC04D5" Ref="C?"  Part="1" 
F 0 "C?" V 5300 3000 50  0000 C CNN
F 1 "8.2nF 1%" V 5600 3000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 2850 50  0001 C CNN
F 3 "~" H 5450 3000 50  0001 C CNN
	1    5450 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 3250 5450 3250
Wire Wire Line
	4900 1450 5450 1450
$Comp
L Device:C C?
U 1 1 5EAB65DB
P 5700 2050
AR Path="/5E9E88B8/5EAB65DB" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EAB65DB" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EAB65DB" Ref="C?"  Part="1" 
F 0 "C?" V 5550 2050 50  0000 C CNN
F 1 "8.2nF 1%" V 5850 2050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 1900 50  0001 C CNN
F 3 "~" H 5700 2050 50  0001 C CNN
	1    5700 2050
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAB4750
P 5450 1700
AR Path="/5E9E88B8/5EAB4750" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EAB4750" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EAB4750" Ref="C?"  Part="1" 
F 0 "C?" V 5300 1700 50  0000 C CNN
F 1 "8.2nF 1%" V 5600 1700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 1550 50  0001 C CNN
F 3 "~" H 5450 1700 50  0001 C CNN
	1    5450 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1200 2400 1100 2400
Text HLabel 1100 2400 0    50   Output ~ 0
OUT-I
Wire Wire Line
	1550 2400 1500 2400
$Comp
L Device:C C?
U 1 1 5EAA2E92
P 1350 2400
AR Path="/5E9E88B8/5EAA2E92" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EAA2E92" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EAA2E92" Ref="C?"  Part="1" 
F 0 "C?" V 1200 2350 50  0000 L CNN
F 1 "1.0uF" V 1500 2300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 2250 50  0001 C CNN
F 3 "~" H 1350 2400 50  0001 C CNN
	1    1350 2400
	0    -1   1    0   
$EndComp
Wire Wire Line
	2250 2400 1850 2400
$Comp
L Device:R R?
U 1 1 5EA9FAE2
P 1700 2400
AR Path="/5E9E88B8/5EA9FAE2" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA9FAE2" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA9FAE2" Ref="R?"  Part="1" 
F 0 "R?" V 1600 2350 50  0000 L CNN
F 1 "10R" V 1800 2300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 2400 50  0001 C CNN
F 3 "~" H 1700 2400 50  0001 C CNN
	1    1700 2400
	0    -1   1    0   
$EndComp
Wire Wire Line
	2550 2000 2550 2100
Wire Wire Line
	2500 2000 2550 2000
Wire Wire Line
	2500 1550 2500 2000
Wire Wire Line
	2550 1550 2500 1550
Connection ~ 2900 1550
Wire Wire Line
	2900 1550 2850 1550
$Comp
L Device:R R?
U 1 1 5EA969D7
P 2700 1550
AR Path="/5E9E88B8/5EA969D7" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA969D7" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA969D7" Ref="R?"  Part="1" 
F 0 "R?" V 2600 1500 50  0000 L CNN
F 1 "1K 1%" V 2800 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 1550 50  0001 C CNN
F 3 "~" H 2700 1550 50  0001 C CNN
	1    2700 1550
	0    -1   1    0   
$EndComp
Wire Wire Line
	2900 1550 3050 1550
Wire Wire Line
	2900 2300 2900 1550
Wire Wire Line
	2850 2300 2900 2300
Wire Wire Line
	2900 3500 2900 3700
Text Label 2900 3700 1    50   ~ 0
BIAS
Connection ~ 2900 3150
Wire Wire Line
	2900 3150 2900 3200
$Comp
L Device:R R?
U 1 1 5EA85C03
P 2900 3350
AR Path="/5E9E88B8/5EA85C03" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA85C03" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA85C03" Ref="R?"  Part="1" 
F 0 "R?" H 2850 3300 50  0000 R CNN
F 1 "1K 1%" H 2850 3400 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2830 3350 50  0001 C CNN
F 3 "~" H 2900 3350 50  0001 C CNN
	1    2900 3350
	1    0    0    1   
$EndComp
Wire Wire Line
	2900 3150 3050 3150
Wire Wire Line
	2900 2500 2900 3150
Wire Wire Line
	2850 2500 2900 2500
Wire Wire Line
	2650 2100 2650 2050
Wire Wire Line
	1450 3150 1350 3150
Connection ~ 1450 3150
Wire Wire Line
	1950 3150 1450 3150
Connection ~ 1950 3150
Wire Wire Line
	2450 3150 1950 3150
Connection ~ 2450 3150
Wire Wire Line
	2650 3150 2450 3150
Text GLabel 1350 3150 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	2650 2750 2650 3150
Connection ~ 2650 2750
Wire Wire Line
	2550 2750 2550 2700
Wire Wire Line
	2650 2750 2550 2750
Wire Wire Line
	2650 2700 2650 2750
$Comp
L Device:C C?
U 1 1 5EA7FC6C
P 2450 3350
AR Path="/5E9E88B8/5EA7FC6C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA7FC6C" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA7FC6C" Ref="C?"  Part="1" 
F 0 "C?" H 2565 3396 50  0000 L CNN
F 1 "10nF" H 2565 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 3200 50  0001 C CNN
F 3 "~" H 2450 3350 50  0001 C CNN
	1    2450 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA7FC66
P 1450 3350
AR Path="/5E9E88B8/5EA7FC66" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA7FC66" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA7FC66" Ref="C?"  Part="1" 
F 0 "C?" H 1565 3396 50  0000 L CNN
F 1 "1.0uF" H 1565 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1488 3200 50  0001 C CNN
F 3 "~" H 1450 3350 50  0001 C CNN
	1    1450 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA7FC60
P 1950 3350
AR Path="/5E9E88B8/5EA7FC60" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA7FC60" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA7FC60" Ref="C?"  Part="1" 
F 0 "C?" H 2065 3396 50  0000 L CNN
F 1 "0.1uF" H 2065 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1988 3200 50  0001 C CNN
F 3 "~" H 1950 3350 50  0001 C CNN
	1    1950 3350
	-1   0    0    -1  
$EndComp
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EA7FC5A
P 2550 2400
F 0 "U?" H 2700 2250 50  0000 L CNN
F 1 "LTC6228XS8" H 2650 2550 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2650 2150 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 2700 2550 50  0001 C CNN
	1    2550 2400
	-1   0    0    1   
$EndComp
Connection ~ 3400 3150
Wire Wire Line
	3350 3150 3400 3150
Connection ~ 3400 1550
Wire Wire Line
	3350 1550 3400 1550
$Comp
L Device:R R?
U 1 1 5EA77085
P 3200 3150
AR Path="/5E9E88B8/5EA77085" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA77085" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA77085" Ref="R?"  Part="1" 
F 0 "R?" V 3100 3100 50  0000 L CNN
F 1 "820R 1%" V 3300 3000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3130 3150 50  0001 C CNN
F 3 "~" H 3200 3150 50  0001 C CNN
	1    3200 3150
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EA76BB5
P 3200 1550
AR Path="/5E9E88B8/5EA76BB5" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA76BB5" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA76BB5" Ref="R?"  Part="1" 
F 0 "R?" V 3100 1500 50  0000 L CNN
F 1 "820R 1%" V 3300 1400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3130 1550 50  0001 C CNN
F 3 "~" H 3200 1550 50  0001 C CNN
	1    3200 1550
	0    -1   1    0   
$EndComp
Wire Wire Line
	3400 3150 3400 2500
Wire Wire Line
	3650 3150 3400 3150
Wire Wire Line
	3400 1550 3650 1550
Wire Wire Line
	3400 2200 3400 1550
$Comp
L Device:C C?
U 1 1 5EA706DB
P 3400 2350
AR Path="/5E9E88B8/5EA706DB" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA706DB" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA706DB" Ref="C?"  Part="1" 
F 0 "C?" H 3500 2400 50  0000 L CNN
F 1 "8.2nF 1%" H 3500 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3438 2200 50  0001 C CNN
F 3 "~" H 3400 2350 50  0001 C CNN
	1    3400 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 3150 4300 3150
Wire Wire Line
	3950 1550 4300 1550
$Comp
L Device:R R?
U 1 1 5EA684B3
P 3800 1550
AR Path="/5E9E88B8/5EA684B3" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA684B3" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA684B3" Ref="R?"  Part="1" 
F 0 "R?" V 3700 1500 50  0000 L CNN
F 1 "100R 1%" V 3900 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3730 1550 50  0001 C CNN
F 3 "~" H 3800 1550 50  0001 C CNN
	1    3800 1550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EA67FAB
P 3800 3150
AR Path="/5E9E88B8/5EA67FAB" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA67FAB" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA67FAB" Ref="R?"  Part="1" 
F 0 "R?" V 3700 3100 50  0000 L CNN
F 1 "100R 1%" V 3900 3100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3730 3150 50  0001 C CNN
F 3 "~" H 3800 3150 50  0001 C CNN
	1    3800 3150
	0    -1   1    0   
$EndComp
Connection ~ 3900 2550
Wire Wire Line
	3900 2500 3900 2550
Wire Wire Line
	3900 2850 3900 2550
Wire Wire Line
	4100 2850 3900 2850
Wire Wire Line
	4950 2550 3900 2550
Wire Wire Line
	4950 3050 4950 2550
Wire Wire Line
	4900 3050 4950 3050
Wire Wire Line
	3900 2150 3900 2200
Connection ~ 3900 2150
Wire Wire Line
	4950 2150 3900 2150
Wire Wire Line
	4950 1650 4950 2150
Wire Wire Line
	4900 1650 4950 1650
Wire Wire Line
	3900 1850 3900 2150
Wire Wire Line
	4100 1850 3900 1850
$Comp
L Device:R R?
U 1 1 5EA5C940
P 3900 2350
AR Path="/5E9E88B8/5EA5C940" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA5C940" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA5C940" Ref="R?"  Part="1" 
F 0 "R?" H 3850 2300 50  0000 R CNN
F 1 "10R 1%" H 3850 2400 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3830 2350 50  0001 C CNN
F 3 "~" H 3900 2350 50  0001 C CNN
	1    3900 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	4600 2850 4400 2850
Wire Wire Line
	4600 1850 4400 1850
$Comp
L Device:R R?
U 1 1 5EA59E3B
P 4250 2850
AR Path="/5E9E88B8/5EA59E3B" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA59E3B" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA59E3B" Ref="R?"  Part="1" 
F 0 "R?" V 4150 2800 50  0000 R CNN
F 1 "1K 1%" V 4150 2900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 2850 50  0001 C CNN
F 3 "~" H 4250 2850 50  0001 C CNN
	1    4250 2850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EA4C3D0
P 4250 1850
AR Path="/5E9E88B8/5EA4C3D0" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA4C3D0" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EA4C3D0" Ref="R?"  Part="1" 
F 0 "R?" V 4350 1800 50  0000 R CNN
F 1 "1K 1%" V 4350 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 1850 50  0001 C CNN
F 3 "~" H 4250 1850 50  0001 C CNN
	1    4250 1850
	0    -1   1    0   
$EndComp
Wire Wire Line
	3700 3850 3700 3900
Wire Wire Line
	4200 3900 3700 3900
Connection ~ 4200 3900
Wire Wire Line
	4200 3850 4200 3900
Wire Wire Line
	4700 3900 4200 3900
Wire Wire Line
	4700 3850 4700 3900
Wire Wire Line
	4600 3500 4600 3450
Wire Wire Line
	4700 3500 4600 3500
Wire Wire Line
	4700 3450 4700 3500
$Comp
L Device:C C?
U 1 1 5EA3E656
P 4700 3700
AR Path="/5E9E88B8/5EA3E656" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA3E656" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA3E656" Ref="C?"  Part="1" 
F 0 "C?" H 4815 3746 50  0000 L CNN
F 1 "10nF" H 4815 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4738 3550 50  0001 C CNN
F 3 "~" H 4700 3700 50  0001 C CNN
	1    4700 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3E649
P 3700 3700
AR Path="/5E9E88B8/5EA3E649" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA3E649" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA3E649" Ref="C?"  Part="1" 
F 0 "C?" H 3815 3746 50  0000 L CNN
F 1 "1.0uF" H 3815 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3738 3550 50  0001 C CNN
F 3 "~" H 3700 3700 50  0001 C CNN
	1    3700 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3E643
P 4200 3700
AR Path="/5E9E88B8/5EA3E643" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA3E643" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA3E643" Ref="C?"  Part="1" 
F 0 "C?" H 4315 3746 50  0000 L CNN
F 1 "0.1uF" H 4315 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4238 3550 50  0001 C CNN
F 3 "~" H 4200 3700 50  0001 C CNN
	1    4200 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4700 2800 4700 2850
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EA3A141
P 4600 3150
F 0 "U?" H 4700 3000 50  0000 L CNN
F 1 "LTC6228XS8" H 4700 3300 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 4700 2900 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 4750 3300 50  0001 C CNN
	1    4600 3150
	-1   0    0    1   
$EndComp
Connection ~ 4500 800 
Connection ~ 4700 1200
Wire Wire Line
	4700 800  4500 800 
Wire Wire Line
	4700 1200 4700 800 
Wire Wire Line
	4000 1200 3500 1200
Wire Wire Line
	4000 1250 4000 1200
Wire Wire Line
	4500 850  4500 800 
Connection ~ 4000 1200
Wire Wire Line
	4500 1200 4500 1150
Wire Wire Line
	4000 1200 4500 1200
$Comp
L Device:C C?
U 1 1 5EA2E102
P 4500 1000
AR Path="/5E9E88B8/5EA2E102" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA2E102" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA2E102" Ref="C?"  Part="1" 
F 0 "C?" H 4615 1046 50  0000 L CNN
F 1 "10nF" H 4615 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 850 50  0001 C CNN
F 3 "~" H 4500 1000 50  0001 C CNN
	1    4500 1000
	-1   0    0    -1  
$EndComp
Connection ~ 4000 800 
Wire Wire Line
	4000 800  4500 800 
Connection ~ 3500 800 
Wire Wire Line
	3400 800  3500 800 
Wire Wire Line
	3500 1200 3500 1150
Wire Wire Line
	3500 850  3500 800 
Wire Wire Line
	4000 800  3500 800 
Wire Wire Line
	4000 850  4000 800 
Wire Wire Line
	4000 1150 4000 1200
$Comp
L Device:C C?
U 1 1 5EA2CEC3
P 3500 1000
AR Path="/5E9E88B8/5EA2CEC3" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA2CEC3" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA2CEC3" Ref="C?"  Part="1" 
F 0 "C?" H 3615 1046 50  0000 L CNN
F 1 "1.0uF" H 3615 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3538 850 50  0001 C CNN
F 3 "~" H 3500 1000 50  0001 C CNN
	1    3500 1000
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA2CEBD
P 4000 1000
AR Path="/5E9E88B8/5EA2CEBD" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA2CEBD" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EA2CEBD" Ref="C?"  Part="1" 
F 0 "C?" H 4115 1046 50  0000 L CNN
F 1 "0.1uF" H 4115 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4038 850 50  0001 C CNN
F 3 "~" H 4000 1000 50  0001 C CNN
	1    4000 1000
	-1   0    0    -1  
$EndComp
Text GLabel 3400 800  0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	4700 1850 4700 1900
Wire Wire Line
	4600 1200 4600 1250
Wire Wire Line
	4700 1200 4600 1200
Wire Wire Line
	4700 1250 4700 1200
$Comp
L sdr-trx:LTC6228XS8 U?
U 1 1 5EA19BE2
P 4600 1550
F 0 "U?" H 4650 1700 50  0000 L CNN
F 1 "LTC6228XS8" H 4650 1400 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 4700 1300 50  0001 L CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6228-6229.pdf" H 4750 1700 50  0001 C CNN
	1    4600 1550
	-1   0    0    -1  
$EndComp
Connection ~ 5700 3250
Connection ~ 5700 4950
Connection ~ 5700 6750
Connection ~ 7750 1450
Wire Wire Line
	5700 1450 7750 1450
Wire Wire Line
	7900 1750 6300 1750
Connection ~ 7900 1750
Wire Wire Line
	6200 1550 7800 1550
Wire Wire Line
	5700 4950 6200 4950
Connection ~ 7800 1550
Wire Wire Line
	6250 1650 7850 1650
Wire Wire Line
	5700 6750 6250 6750
Connection ~ 7850 1650
Text GLabel 9950 3450 2    50   Input ~ 0
+5.0V-RX
$Comp
L Device:C C?
U 1 1 5EDB9EC7
P 9200 3650
AR Path="/5E9E88B8/5EDB9EC7" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9EC7" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EDB9EC7" Ref="C?"  Part="1" 
F 0 "C?" H 9315 3696 50  0000 L CNN
F 1 "1.0uF" H 9315 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9238 3500 50  0001 C CNN
F 3 "~" H 9200 3650 50  0001 C CNN
	1    9200 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EDB9ED3
P 8300 3700
AR Path="/5E9E88B8/5EDB9ED3" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9ED3" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EDB9ED3" Ref="R?"  Part="1" 
F 0 "R?" H 8400 3750 50  0000 L CNN
F 1 "1K 1%" H 8400 3650 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8230 3700 50  0001 C CNN
F 3 "~" H 8300 3700 50  0001 C CNN
	1    8300 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDB9ED9
P 6800 4100
AR Path="/5E9E88B8/5EDB9ED9" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9ED9" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EDB9ED9" Ref="C?"  Part="1" 
F 0 "C?" H 6915 4146 50  0000 L CNN
F 1 "1.0uF" H 6915 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6838 3950 50  0001 C CNN
F 3 "~" H 6800 4100 50  0001 C CNN
	1    6800 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EDB9EDF
P 8300 4100
AR Path="/5E9E88B8/5EDB9EDF" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9EDF" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EDB9EDF" Ref="R?"  Part="1" 
F 0 "R?" H 8400 4150 50  0000 L CNN
F 1 "1K 1%" H 8400 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8230 4100 50  0001 C CNN
F 3 "~" H 8300 4100 50  0001 C CNN
	1    8300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDB9EE5
P 7300 4100
AR Path="/5E9E88B8/5EDB9EE5" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9EE5" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EDB9EE5" Ref="C?"  Part="1" 
F 0 "C?" H 7415 4146 50  0000 L CNN
F 1 "0.1uF" H 7415 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7338 3950 50  0001 C CNN
F 3 "~" H 7300 4100 50  0001 C CNN
	1    7300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3450 8300 3550
Wire Wire Line
	6800 3900 6800 3950
Wire Wire Line
	7300 3950 7300 3900
Connection ~ 7300 3900
Wire Wire Line
	7300 3900 6800 3900
Wire Wire Line
	6800 4250 6800 4300
Wire Wire Line
	6800 4300 7300 4300
Wire Wire Line
	7300 4250 7300 4300
Connection ~ 7300 4300
$Comp
L Device:C C?
U 1 1 5EDB9EFD
P 7800 4100
AR Path="/5E9E88B8/5EDB9EFD" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDB9EFD" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EDB9EFD" Ref="C?"  Part="1" 
F 0 "C?" H 7915 4146 50  0000 L CNN
F 1 "10nF" H 7915 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7838 3950 50  0001 C CNN
F 3 "~" H 7800 4100 50  0001 C CNN
	1    7800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4300 7800 4300
Wire Wire Line
	7300 3900 7800 3900
Wire Wire Line
	7800 3950 7800 3900
Connection ~ 7800 3900
Wire Wire Line
	7800 4250 7800 4300
$Comp
L power:GNDA #PWR?
U 1 1 5EDB9F0E
P 9200 4450
F 0 "#PWR?" H 9200 4200 50  0001 C CNN
F 1 "GNDA" H 9205 4277 50  0000 C CNN
F 2 "" H 9200 4450 50  0001 C CNN
F 3 "" H 9200 4450 50  0001 C CNN
	1    9200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3250 6300 1750
Wire Wire Line
	5700 3250 6300 3250
$Comp
L Device:C C?
U 1 1 5EEFF0EB
P 6800 4850
AR Path="/5E9E88B8/5EEFF0EB" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEFF0EB" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EEFF0EB" Ref="C?"  Part="1" 
F 0 "C?" H 6915 4896 50  0000 L CNN
F 1 "1.0uF" H 6915 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6838 4700 50  0001 C CNN
F 3 "~" H 6800 4850 50  0001 C CNN
	1    6800 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EEFF0F1
P 7300 4850
AR Path="/5E9E88B8/5EEFF0F1" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEFF0F1" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EEFF0F1" Ref="C?"  Part="1" 
F 0 "C?" H 7415 4896 50  0000 L CNN
F 1 "0.1uF" H 7415 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7338 4700 50  0001 C CNN
F 3 "~" H 7300 4850 50  0001 C CNN
	1    7300 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4650 6800 4700
Wire Wire Line
	7300 4700 7300 4650
Connection ~ 7300 4650
Wire Wire Line
	7300 4650 6800 4650
Wire Wire Line
	6800 5000 6800 5050
Wire Wire Line
	6800 5050 7300 5050
Wire Wire Line
	7300 5000 7300 5050
Connection ~ 7300 5050
Text Label 6800 4650 0    50   ~ 0
BIAS
$Comp
L Device:C C?
U 1 1 5EEFF100
P 7800 4850
AR Path="/5E9E88B8/5EEFF100" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEFF100" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EEFF100" Ref="C?"  Part="1" 
F 0 "C?" H 7915 4896 50  0000 L CNN
F 1 "10nF" H 7915 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7838 4700 50  0001 C CNN
F 3 "~" H 7800 4850 50  0001 C CNN
	1    7800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5050 7800 5050
Wire Wire Line
	7300 4650 7800 4650
Wire Wire Line
	7800 4700 7800 4650
Connection ~ 7800 4650
Wire Wire Line
	7800 5000 7800 5050
$Comp
L Device:C C?
U 1 1 5EF191BA
P 6800 5600
AR Path="/5E9E88B8/5EF191BA" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF191BA" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EF191BA" Ref="C?"  Part="1" 
F 0 "C?" H 6915 5646 50  0000 L CNN
F 1 "1.0uF" H 6915 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6838 5450 50  0001 C CNN
F 3 "~" H 6800 5600 50  0001 C CNN
	1    6800 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF191C0
P 7300 5600
AR Path="/5E9E88B8/5EF191C0" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF191C0" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EF191C0" Ref="C?"  Part="1" 
F 0 "C?" H 7415 5646 50  0000 L CNN
F 1 "0.1uF" H 7415 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7338 5450 50  0001 C CNN
F 3 "~" H 7300 5600 50  0001 C CNN
	1    7300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 5400 6800 5450
Wire Wire Line
	7300 5450 7300 5400
Connection ~ 7300 5400
Wire Wire Line
	7300 5400 6800 5400
Wire Wire Line
	6800 5750 6800 5800
Wire Wire Line
	6800 5800 7300 5800
Wire Wire Line
	7300 5750 7300 5800
Connection ~ 7300 5800
$Comp
L Device:C C?
U 1 1 5EF191CF
P 7800 5600
AR Path="/5E9E88B8/5EF191CF" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF191CF" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EF191CF" Ref="C?"  Part="1" 
F 0 "C?" H 7915 5646 50  0000 L CNN
F 1 "10nF" H 7915 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7838 5450 50  0001 C CNN
F 3 "~" H 7800 5600 50  0001 C CNN
	1    7800 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5800 7800 5800
Wire Wire Line
	7300 5400 7800 5400
Wire Wire Line
	7800 5450 7800 5400
Connection ~ 7800 5400
Wire Wire Line
	7800 5750 7800 5800
Wire Wire Line
	7300 5100 7300 5050
Connection ~ 9200 4400
Wire Wire Line
	8300 4250 8300 4400
Wire Wire Line
	7300 5850 7300 5800
Wire Wire Line
	7300 4350 7300 4300
$Comp
L Device:C C?
U 1 1 5F0FA5F1
P 8750 3650
AR Path="/5E9E88B8/5F0FA5F1" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F0FA5F1" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5F0FA5F1" Ref="C?"  Part="1" 
F 0 "C?" H 8865 3696 50  0000 L CNN
F 1 "10nF" H 8865 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8788 3500 50  0001 C CNN
F 3 "~" H 8750 3650 50  0001 C CNN
	1    8750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3500 8750 3450
Connection ~ 8750 3450
Wire Wire Line
	8750 3800 8750 4400
Connection ~ 8750 4400
Wire Wire Line
	8750 4400 9200 4400
Wire Wire Line
	8300 3450 8750 3450
Wire Wire Line
	8300 4400 8750 4400
Wire Wire Line
	1350 6650 1450 6650
Wire Wire Line
	1450 7000 1450 7050
Wire Wire Line
	1450 7050 1950 7050
Wire Wire Line
	2450 7050 2450 7000
Wire Wire Line
	1950 7000 1950 7050
Connection ~ 1950 7050
Wire Wire Line
	1950 7050 2450 7050
Wire Wire Line
	1950 7100 1950 7050
Wire Wire Line
	2450 6700 2450 6650
Connection ~ 2450 6650
Wire Wire Line
	2450 6650 2650 6650
Wire Wire Line
	1950 6700 1950 6650
Connection ~ 1950 6650
Wire Wire Line
	1950 6650 2450 6650
Wire Wire Line
	1450 6700 1450 6650
Connection ~ 1450 6650
Wire Wire Line
	1450 6650 1950 6650
Wire Wire Line
	1450 3200 1450 3150
Wire Wire Line
	1950 3200 1950 3150
Wire Wire Line
	2450 3200 2450 3150
Wire Wire Line
	1450 3500 1450 3550
Wire Wire Line
	1450 3550 1950 3550
Wire Wire Line
	2450 3550 2450 3500
Wire Wire Line
	1950 3500 1950 3550
Connection ~ 1950 3550
Wire Wire Line
	1950 3550 2450 3550
Wire Wire Line
	1950 3600 1950 3550
Connection ~ 4600 7000
Wire Wire Line
	4700 7050 4700 7000
Connection ~ 4700 7000
Wire Wire Line
	4200 7050 4200 7000
Connection ~ 4200 7000
Wire Wire Line
	4200 7000 4600 7000
Wire Wire Line
	3700 7050 3700 7000
Wire Wire Line
	3700 7000 4200 7000
Wire Wire Line
	3600 7000 3700 7000
Connection ~ 3700 7000
Wire Wire Line
	4200 7450 4200 7400
Wire Wire Line
	4600 3500 4200 3500
Wire Wire Line
	3700 3500 3700 3550
Connection ~ 4600 3500
Wire Wire Line
	4200 3550 4200 3500
Connection ~ 4200 3500
Wire Wire Line
	4200 3500 3700 3500
Wire Wire Line
	4700 3550 4700 3500
Connection ~ 4700 3500
Text GLabel 3600 3500 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	3600 3500 3700 3500
Connection ~ 3700 3500
Wire Wire Line
	4200 3950 4200 3900
Wire Wire Line
	6200 1550 6200 4950
Wire Wire Line
	6250 1650 6250 6750
$Comp
L sdr-trx:LTC6655CHMS8-2.5 U?
U 1 1 5EE92739
P 9200 5500
F 0 "U?" H 9200 5867 50  0000 C CNN
F 1 "LTC6655CHMS8-2.5" H 9200 5776 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 9300 5850 50  0001 L CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6655-6655LN.pdf" H 9250 5150 50  0001 C CIN
	1    9200 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8300 3850 8300 3900
$Comp
L Device:C C?
U 1 1 5EE9C71B
P 8300 5600
AR Path="/5E9E88B8/5EE9C71B" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EE9C71B" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EE9C71B" Ref="C?"  Part="1" 
F 0 "C?" H 8415 5646 50  0000 L CNN
F 1 "1.0uF" H 8415 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8338 5450 50  0001 C CNN
F 3 "~" H 8300 5600 50  0001 C CNN
	1    8300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5600 8750 5600
Wire Wire Line
	8750 5600 8750 5400
Wire Wire Line
	8750 5400 8800 5400
Connection ~ 8750 5400
Wire Wire Line
	8300 5450 8300 5400
Connection ~ 8300 5400
Wire Wire Line
	7800 5400 8300 5400
Wire Wire Line
	8300 5400 8300 4650
Wire Wire Line
	8300 5400 8750 5400
Wire Wire Line
	7800 4650 8300 4650
Wire Wire Line
	9600 5600 9650 5600
Wire Wire Line
	9650 5600 9650 5400
Wire Wire Line
	9650 5400 9600 5400
$Comp
L Device:C C?
U 1 1 5EF4DF2C
P 9850 5600
AR Path="/5E9E88B8/5EF4DF2C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF4DF2C" Ref="C?"  Part="1" 
AR Path="/5EA188E4/5EF4DF2C" Ref="C?"  Part="1" 
F 0 "C?" H 9965 5646 50  0000 L CNN
F 1 "0.1uF" H 9965 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9888 5450 50  0001 C CNN
F 3 "~" H 9850 5600 50  0001 C CNN
	1    9850 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 5400 9850 5400
Wire Wire Line
	9850 5400 9850 5450
Connection ~ 9650 5400
Wire Wire Line
	8300 5850 9200 5850
Wire Wire Line
	9850 5750 9850 5850
Wire Wire Line
	8300 5750 8300 5850
Wire Wire Line
	9200 5800 9200 5850
Connection ~ 9200 5850
Wire Wire Line
	9200 5850 9850 5850
Wire Wire Line
	9200 5900 9200 5850
Wire Wire Line
	7800 3900 8300 3900
Connection ~ 8300 3900
Wire Wire Line
	8300 3900 8300 3950
Text Label 6800 3900 0    50   ~ 0
OFFS
Text Label 9350 1350 0    50   ~ 0
OFFS
Wire Wire Line
	9200 4450 9200 4400
Connection ~ 9850 5400
Wire Wire Line
	9950 3450 9850 3450
Wire Wire Line
	8750 3450 9200 3450
Wire Wire Line
	9200 3500 9200 3450
Connection ~ 9200 3450
Wire Wire Line
	9200 3800 9200 4400
Wire Wire Line
	9200 3450 9850 3450
Wire Wire Line
	9850 5400 9850 3450
Connection ~ 9850 3450
$Comp
L power:GND #PWR?
U 1 1 5EAEFD3E
P 10100 1550
F 0 "#PWR?" H 10100 1300 50  0001 C CNN
F 1 "GND" H 10105 1377 50  0000 C CNN
F 2 "" H 10100 1550 50  0001 C CNN
F 3 "" H 10100 1550 50  0001 C CNN
	1    10100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB0F355
P 9200 5900
F 0 "#PWR?" H 9200 5650 50  0001 C CNN
F 1 "GND" H 9205 5727 50  0000 C CNN
F 2 "" H 9200 5900 50  0001 C CNN
F 3 "" H 9200 5900 50  0001 C CNN
	1    9200 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB2CDA2
P 7300 5850
F 0 "#PWR?" H 7300 5600 50  0001 C CNN
F 1 "GND" H 7305 5677 50  0000 C CNN
F 2 "" H 7300 5850 50  0001 C CNN
F 3 "" H 7300 5850 50  0001 C CNN
	1    7300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB4A567
P 7300 5100
F 0 "#PWR?" H 7300 4850 50  0001 C CNN
F 1 "GND" H 7305 4927 50  0000 C CNN
F 2 "" H 7300 5100 50  0001 C CNN
F 3 "" H 7300 5100 50  0001 C CNN
	1    7300 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB6925E
P 7300 4350
F 0 "#PWR?" H 7300 4100 50  0001 C CNN
F 1 "GND" H 7305 4177 50  0000 C CNN
F 2 "" H 7300 4350 50  0001 C CNN
F 3 "" H 7300 4350 50  0001 C CNN
	1    7300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB90AB2
P 5400 2350
F 0 "#PWR?" H 5400 2100 50  0001 C CNN
F 1 "GND" H 5405 2177 50  0000 C CNN
F 2 "" H 5400 2350 50  0001 C CNN
F 3 "" H 5400 2350 50  0001 C CNN
	1    5400 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBB13CC
P 5400 5850
F 0 "#PWR?" H 5400 5600 50  0001 C CNN
F 1 "GND" H 5405 5677 50  0000 C CNN
F 2 "" H 5400 5850 50  0001 C CNN
F 3 "" H 5400 5850 50  0001 C CNN
	1    5400 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBD3D94
P 4700 1900
AR Path="/5E9F4ACB/5EBD3D94" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EBD3D94" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4700 1650 50  0001 C CNN
F 1 "GND" H 4705 1727 50  0000 C CNN
F 2 "" H 4700 1900 50  0001 C CNN
F 3 "" H 4700 1900 50  0001 C CNN
	1    4700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBF1D07
P 4700 2800
AR Path="/5E9F4ACB/5EBF1D07" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EBF1D07" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4700 2550 50  0001 C CNN
F 1 "GND" H 4705 2627 50  0000 C CNN
F 2 "" H 4700 2800 50  0001 C CNN
F 3 "" H 4700 2800 50  0001 C CNN
	1    4700 2800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBF37D4
P 2650 2050
AR Path="/5E9F4ACB/5EBF37D4" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EBF37D4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2650 1800 50  0001 C CNN
F 1 "GND" H 2655 1877 50  0000 C CNN
F 2 "" H 2650 2050 50  0001 C CNN
F 3 "" H 2650 2050 50  0001 C CNN
	1    2650 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBF4E9A
P 4000 1250
AR Path="/5E9F4ACB/5EBF4E9A" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EBF4E9A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4000 1000 50  0001 C CNN
F 1 "GND" H 4005 1077 50  0000 C CNN
F 2 "" H 4000 1250 50  0001 C CNN
F 3 "" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBF694B
P 4200 3950
AR Path="/5E9F4ACB/5EBF694B" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EBF694B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4200 3700 50  0001 C CNN
F 1 "GND" H 4205 3777 50  0000 C CNN
F 2 "" H 4200 3950 50  0001 C CNN
F 3 "" H 4200 3950 50  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EBF9BB8
P 1950 3600
F 0 "#PWR?" H 1950 3350 50  0001 C CNN
F 1 "GND" H 1955 3427 50  0000 C CNN
F 2 "" H 1950 3600 50  0001 C CNN
F 3 "" H 1950 3600 50  0001 C CNN
	1    1950 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC2BF81
P 4700 5400
F 0 "#PWR?" H 4700 5150 50  0001 C CNN
F 1 "GND" H 4705 5227 50  0000 C CNN
F 2 "" H 4700 5400 50  0001 C CNN
F 3 "" H 4700 5400 50  0001 C CNN
	1    4700 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC4A59F
P 4700 6300
F 0 "#PWR?" H 4700 6050 50  0001 C CNN
F 1 "GND" H 4705 6127 50  0000 C CNN
F 2 "" H 4700 6300 50  0001 C CNN
F 3 "" H 4700 6300 50  0001 C CNN
	1    4700 6300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC689E7
P 2650 5550
F 0 "#PWR?" H 2650 5300 50  0001 C CNN
F 1 "GND" H 2655 5377 50  0000 C CNN
F 2 "" H 2650 5550 50  0001 C CNN
F 3 "" H 2650 5550 50  0001 C CNN
	1    2650 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC86F5D
P 1950 7100
F 0 "#PWR?" H 1950 6850 50  0001 C CNN
F 1 "GND" H 1955 6927 50  0000 C CNN
F 2 "" H 1950 7100 50  0001 C CNN
F 3 "" H 1950 7100 50  0001 C CNN
	1    1950 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ECA521A
P 4200 7450
F 0 "#PWR?" H 4200 7200 50  0001 C CNN
F 1 "GND" H 4205 7277 50  0000 C CNN
F 2 "" H 4200 7450 50  0001 C CNN
F 3 "" H 4200 7450 50  0001 C CNN
	1    4200 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ECC3F30
P 4000 4750
F 0 "#PWR?" H 4000 4500 50  0001 C CNN
F 1 "GND" H 4005 4577 50  0000 C CNN
F 2 "" H 4000 4750 50  0001 C CNN
F 3 "" H 4000 4750 50  0001 C CNN
	1    4000 4750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
