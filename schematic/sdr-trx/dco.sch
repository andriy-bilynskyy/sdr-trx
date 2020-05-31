EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 12
Title "DCO"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2700 3200 0    50   BiDi ~ 0
SCL
$Comp
L Oscillator:Si5351A-B-GT U?
U 1 1 5EA1D0FA
P 5350 2750
F 0 "U?" H 5550 3250 50  0000 L CNN
F 1 "Si5351A-B-GT" H 5400 2250 50  0000 L CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 5350 1950 50  0001 C CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/Si5351-B.pdf" H 5000 2650 50  0001 C CNN
	1    5350 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA1EEC5
P 5950 1950
F 0 "C?" H 6065 1996 50  0000 L CNN
F 1 "0.1uF" H 6065 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5988 1800 50  0001 C CNN
F 3 "~" H 5950 1950 50  0001 C CNN
	1    5950 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EA2483A
P 6450 2200
F 0 "#PWR0101" H 6450 1950 50  0001 C CNN
F 1 "GND" H 6455 2027 50  0000 C CNN
F 2 "" H 6450 2200 50  0001 C CNN
F 3 "" H 6450 2200 50  0001 C CNN
	1    6450 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA261F1
P 6450 1950
F 0 "C?" H 6565 1996 50  0000 L CNN
F 1 "0.1uF" H 6565 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 1800 50  0001 C CNN
F 3 "~" H 6450 1950 50  0001 C CNN
	1    6450 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA2683A
P 6950 1950
F 0 "C?" H 7065 1996 50  0000 L CNN
F 1 "1.0uF" H 7065 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6988 1800 50  0001 C CNN
F 3 "~" H 6950 1950 50  0001 C CNN
	1    6950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2250 5250 1750
Wire Wire Line
	5250 1750 5450 1750
Wire Wire Line
	5950 2150 6450 2150
Wire Wire Line
	5450 2250 5450 1750
Connection ~ 5450 1750
Wire Wire Line
	5450 1750 5950 1750
Wire Wire Line
	5950 2100 5950 2150
Wire Wire Line
	5950 1800 5950 1750
Connection ~ 5950 1750
Wire Wire Line
	5950 1750 6450 1750
Wire Wire Line
	6450 1800 6450 1750
Connection ~ 6450 1750
Wire Wire Line
	6450 1750 6950 1750
Wire Wire Line
	6950 1800 6950 1750
Wire Wire Line
	6950 2100 6950 2150
Wire Wire Line
	6450 2100 6450 2150
Connection ~ 6450 2150
Wire Wire Line
	6450 2150 6950 2150
Wire Wire Line
	6450 2200 6450 2150
Text GLabel 7050 1750 2    50   Input ~ 0
+3.3V
Wire Wire Line
	6950 1750 7050 1750
Connection ~ 6950 1750
$Comp
L power:GND #PWR0102
U 1 1 5EA607FE
P 5350 3300
F 0 "#PWR0102" H 5350 3050 50  0001 C CNN
F 1 "GND" H 5355 3127 50  0000 C CNN
F 2 "" H 5350 3300 50  0001 C CNN
F 3 "" H 5350 3300 50  0001 C CNN
	1    5350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3250 5350 3300
Text HLabel 2700 3300 0    50   BiDi ~ 0
SDA
$Comp
L power:GND #PWR0103
U 1 1 5EA95B72
P 3200 2900
F 0 "#PWR0103" H 3200 2650 50  0001 C CNN
F 1 "GND" H 3205 2727 50  0000 C CNN
F 2 "" H 3200 2900 50  0001 C CNN
F 3 "" H 3200 2900 50  0001 C CNN
	1    3200 2900
	1    0    0    -1  
$EndComp
Text GLabel 1700 1750 0    50   Input ~ 0
+3.3V
Wire Wire Line
	2050 2200 2050 2150
Connection ~ 2050 2150
$Comp
L Device:C C?
U 1 1 5EAA3180
P 2300 1950
F 0 "C?" H 2415 1996 50  0000 L CNN
F 1 "10nF" H 2415 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2338 1800 50  0001 C CNN
F 3 "~" H 2300 1950 50  0001 C CNN
	1    2300 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAA317A
P 1800 1950
F 0 "C?" H 1915 1996 50  0000 L CNN
F 1 "0.1uF" H 1915 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1838 1800 50  0001 C CNN
F 3 "~" H 1800 1950 50  0001 C CNN
	1    1800 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EAA3174
P 2050 2200
F 0 "#PWR0104" H 2050 1950 50  0001 C CNN
F 1 "GND" H 2055 2027 50  0000 C CNN
F 2 "" H 2050 2200 50  0001 C CNN
F 3 "" H 2050 2200 50  0001 C CNN
	1    2050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2150 3200 1750
Wire Wire Line
	2050 2150 2300 2150
Wire Wire Line
	1800 2100 1800 2150
Wire Wire Line
	1800 2150 2050 2150
Wire Wire Line
	1800 1800 1800 1750
Wire Wire Line
	1700 1750 1800 1750
Connection ~ 1800 1750
Wire Wire Line
	4850 3050 4750 3050
Text GLabel 9350 1750 2    50   Input ~ 0
+3.3V
Wire Wire Line
	9000 2200 9000 2150
Connection ~ 9000 2150
$Comp
L Device:C C?
U 1 1 5EAD011F
P 8750 1950
F 0 "C?" H 8865 1996 50  0000 L CNN
F 1 "10nF" H 8865 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8788 1800 50  0001 C CNN
F 3 "~" H 8750 1950 50  0001 C CNN
	1    8750 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAD0125
P 9250 1950
F 0 "C?" H 9365 1996 50  0000 L CNN
F 1 "0.1uF" H 9365 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9288 1800 50  0001 C CNN
F 3 "~" H 9250 1950 50  0001 C CNN
	1    9250 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EAD012B
P 9000 2200
F 0 "#PWR0105" H 9000 1950 50  0001 C CNN
F 1 "GND" H 9005 2027 50  0000 C CNN
F 2 "" H 9000 2200 50  0001 C CNN
F 3 "" H 9000 2200 50  0001 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2150 9250 2150
Wire Wire Line
	8750 2100 8750 2150
Wire Wire Line
	8750 2150 9000 2150
Wire Wire Line
	8750 1800 8750 1750
Wire Wire Line
	8750 1750 9250 1750
Connection ~ 8750 1750
Wire Wire Line
	9250 1800 9250 1750
Wire Wire Line
	9250 2150 9250 2100
$Comp
L power:GND #PWR0106
U 1 1 5EADAB45
P 8450 3000
F 0 "#PWR0106" H 8450 2750 50  0001 C CNN
F 1 "GND" H 8455 2827 50  0000 C CNN
F 2 "" H 8450 3000 50  0001 C CNN
F 3 "" H 8450 3000 50  0001 C CNN
	1    8450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2950 8450 3000
Wire Wire Line
	2750 1750 3200 1750
Wire Wire Line
	2800 2450 2750 2450
Wire Wire Line
	1800 1750 2300 1750
Connection ~ 2750 1750
Wire Wire Line
	2300 1800 2300 1750
Connection ~ 2300 1750
Wire Wire Line
	2300 1750 2750 1750
Wire Wire Line
	2300 2150 2300 2100
Wire Wire Line
	8050 4150 8050 4200
Wire Wire Line
	8050 4200 7700 4200
Wire Wire Line
	7700 4200 7700 3500
Wire Wire Line
	7700 3500 8050 3500
Wire Wire Line
	8050 3500 8050 3550
Connection ~ 8050 4200
Wire Wire Line
	8050 4200 8050 4250
Wire Wire Line
	8050 4850 8050 4900
Wire Wire Line
	8050 4900 7700 4900
Wire Wire Line
	7700 4900 7700 4200
Connection ~ 7700 4200
Wire Wire Line
	8450 2150 8450 1750
Wire Wire Line
	8450 1750 8750 1750
Wire Wire Line
	9350 1750 9250 1750
Connection ~ 9250 1750
Wire Wire Line
	8450 1750 8050 1750
Connection ~ 8450 1750
Connection ~ 8050 3500
Wire Wire Line
	7750 4450 7650 4450
Wire Wire Line
	7650 4450 7650 3450
Wire Wire Line
	7650 3450 8400 3450
Wire Wire Line
	8400 3450 8400 3750
Wire Wire Line
	8400 3750 8350 3750
Wire Wire Line
	8350 4650 8450 4650
Wire Wire Line
	8450 4650 8450 3400
Wire Wire Line
	8450 3400 7600 3400
Wire Wire Line
	7600 3400 7600 3750
Wire Wire Line
	7600 3750 7750 3750
Wire Wire Line
	7750 3850 7600 3850
Wire Wire Line
	7600 3850 7600 4550
Wire Wire Line
	7600 4550 7750 4550
Wire Wire Line
	8350 4450 8750 4450
Wire Wire Line
	8450 4650 8750 4650
Connection ~ 8450 4650
Wire Wire Line
	8350 3950 8750 3950
Wire Wire Line
	8400 3750 8750 3750
Connection ~ 8400 3750
Text HLabel 8750 4650 2    50   Output ~ 0
RF-000
Text HLabel 8750 3750 2    50   Output ~ 0
RF-090
Text HLabel 8750 4450 2    50   Output ~ 0
RF-180
Text HLabel 8750 3950 2    50   Output ~ 0
RF-270
Wire Wire Line
	5850 2550 7100 2550
Wire Wire Line
	5850 2750 6650 2750
Wire Wire Line
	7100 4550 7600 4550
Connection ~ 7600 4550
Wire Wire Line
	6650 5300 7100 5300
Text HLabel 8750 5300 2    50   Output ~ 0
CLK
Wire Wire Line
	7100 2550 7100 4550
$Comp
L sdr-trx:ASTX-H11 X?
U 1 1 5EA0CF3A
P 3200 2450
F 0 "X?" H 3250 2700 50  0000 L CNN
F 1 "ASTX-H11-27.000MHZ" H 3100 2150 50  0000 R CNN
F 2 "Oscillator:Oscillator_SMD_Abracon_ASE-4Pin_3.2x2.5mm_HandSoldering" H 3300 2100 50  0001 C CNN
F 3 "https://abracon.com/Oscillators/ASTX-H11.pdf" H 2975 2575 50  0001 C CNN
	1    3200 2450
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:PO74G74A U?
U 3 1 5EA155A8
P 8450 2550
F 0 "U?" H 8700 2600 50  0000 L CNN
F 1 "PO74G74A" H 8700 2500 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8450 2550 50  0001 C CNN
F 3 "http://www.potatosemi.com/potatosemiweb/datasheet/PO74G74A.pdf" H 8450 2550 50  0001 C CNN
	3    8450 2550
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:PO74G74A U?
U 1 1 5EA1616E
P 8050 3850
F 0 "U?" H 8100 4100 50  0000 L CNN
F 1 "PO74G74A" H 8050 4240 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8050 3850 50  0001 C CNN
F 3 "http://www.potatosemi.com/potatosemiweb/datasheet/PO74G74A.pdf" H 8050 3850 50  0001 C CNN
	1    8050 3850
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:PO74G74A U?
U 2 1 5EA16E2E
P 8050 4550
F 0 "U?" H 8100 4800 50  0000 L CNN
F 1 "PO74G74A" H 8050 4940 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8050 4550 50  0001 C CNN
F 3 "http://www.potatosemi.com/potatosemiweb/datasheet/PO74G74A.pdf" H 8050 4550 50  0001 C CNN
	2    8050 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EA3E8A2
P 4200 2700
AR Path="/5E9E88B8/5EA3E8A2" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA3E8A2" Ref="R?"  Part="1" 
F 0 "R?" H 4100 2650 50  0000 R CNN
F 1 "100R" H 4100 2750 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4130 2700 50  0001 C CNN
F 3 "~" H 4200 2700 50  0001 C CNN
	1    4200 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4750 3300 4750 3050
Wire Wire Line
	2700 3300 4750 3300
Wire Wire Line
	4650 3200 4650 2950
Wire Wire Line
	4650 2950 4850 2950
Wire Wire Line
	2700 3200 4650 3200
$Comp
L power:GND #PWR?
U 1 1 5EA4FE0F
P 4200 2900
F 0 "#PWR?" H 4200 2650 50  0001 C CNN
F 1 "GND" H 4205 2727 50  0000 C CNN
F 2 "" H 4200 2900 50  0001 C CNN
F 3 "" H 4200 2900 50  0001 C CNN
	1    4200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 2550 4200 2450
NoConn ~ 4850 2650
Wire Wire Line
	4200 2900 4200 2850
$Comp
L Device:R R?
U 1 1 5EA58237
P 3700 2700
AR Path="/5E9E88B8/5EA58237" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA58237" Ref="R?"  Part="1" 
F 0 "R?" H 3600 2650 50  0000 R CNN
F 1 "100R" H 3600 2750 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3630 2700 50  0001 C CNN
F 3 "~" H 3700 2700 50  0001 C CNN
	1    3700 2700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EA589BC
P 3950 2450
AR Path="/5E9E88B8/5EA589BC" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA589BC" Ref="R?"  Part="1" 
F 0 "R?" V 4050 2550 50  0000 L CNN
F 1 "68R" V 4050 2450 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 2450 50  0001 C CNN
F 3 "~" H 3950 2450 50  0001 C CNN
	1    3950 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 2450 4200 2450
Wire Wire Line
	3800 2450 3700 2450
Wire Wire Line
	3700 2450 3700 2550
$Comp
L power:GND #PWR?
U 1 1 5EA6032A
P 3700 2900
F 0 "#PWR?" H 3700 2650 50  0001 C CNN
F 1 "GND" H 3705 2727 50  0000 C CNN
F 2 "" H 3700 2900 50  0001 C CNN
F 3 "" H 3700 2900 50  0001 C CNN
	1    3700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2900 3700 2850
Wire Wire Line
	3600 2450 3700 2450
Connection ~ 3700 2450
Wire Wire Line
	3200 2750 3200 2900
$Comp
L Device:R R?
U 1 1 5EA781B1
P 7100 4800
AR Path="/5E9E88B8/5EA781B1" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA781B1" Ref="R?"  Part="1" 
F 0 "R?" H 7000 4750 50  0000 R CNN
F 1 "51R" H 7000 4850 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7030 4800 50  0001 C CNN
F 3 "~" H 7100 4800 50  0001 C CNN
F 4 "*" H 7100 4800 50  0000 C CNN "Optional"
	1    7100 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 4650 7100 4550
Connection ~ 7100 4550
$Comp
L power:GND #PWR?
U 1 1 5EA81FDE
P 7100 5000
F 0 "#PWR?" H 7100 4750 50  0001 C CNN
F 1 "GND" H 7105 4827 50  0000 C CNN
F 2 "" H 7100 5000 50  0001 C CNN
F 3 "" H 7100 5000 50  0001 C CNN
	1    7100 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5000 7100 4950
$Comp
L Device:R R?
U 1 1 5EA8A01A
P 7100 5550
AR Path="/5E9E88B8/5EA8A01A" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA8A01A" Ref="R?"  Part="1" 
F 0 "R?" H 7000 5500 50  0000 R CNN
F 1 "51R" H 7000 5600 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7030 5550 50  0001 C CNN
F 3 "~" H 7100 5550 50  0001 C CNN
F 4 "*" H 7100 5550 50  0000 C CNN "Optional"
	1    7100 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA8A021
P 7100 5750
F 0 "#PWR?" H 7100 5500 50  0001 C CNN
F 1 "GND" H 7105 5577 50  0000 C CNN
F 2 "" H 7100 5750 50  0001 C CNN
F 3 "" H 7100 5750 50  0001 C CNN
	1    7100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5750 7100 5700
Wire Wire Line
	7100 5400 7100 5300
Connection ~ 7100 5300
Wire Wire Line
	7100 5300 8750 5300
Wire Wire Line
	6650 2750 6650 5300
Wire Wire Line
	2750 1750 2750 2450
Wire Wire Line
	8050 1750 8050 3500
$Comp
L Device:C C?
U 1 1 60308A67
P 4600 2450
F 0 "C?" V 4450 2450 50  0000 C CNN
F 1 "0.1uF" V 4750 2450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4638 2300 50  0001 C CNN
F 3 "~" H 4600 2450 50  0001 C CNN
	1    4600 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 2450 4850 2450
Wire Wire Line
	4450 2450 4200 2450
Connection ~ 4200 2450
Text Notes 4350 3450 0    50   ~ 0
addr = 0x60
$EndSCHEMATC
