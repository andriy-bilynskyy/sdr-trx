EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 10
Title "Preamplifier"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 5EBBE1E4
P 6850 3950
F 0 "Q?" H 7040 3996 50  0000 L CNN
F 1 "MMBT2222A" H 7040 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7050 4050 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30041.pdf" H 6850 3950 50  0001 C CNN
	1    6850 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC2DBA0
P 5550 3950
AR Path="/5E9E88B8/5EC2DBA0" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DBA0" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DBA0" Ref="C?"  Part="1" 
F 0 "C?" V 5700 3950 50  0000 C CNN
F 1 "0.1uF" V 5400 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5588 3800 50  0001 C CNN
F 3 "~" H 5550 3950 50  0001 C CNN
	1    5550 3950
	0    -1   -1   0   
$EndComp
Text HLabel 3700 3950 0    50   Input ~ 0
IN
$Comp
L Device:R R?
U 1 1 5EC2DBA7
P 6950 4500
AR Path="/5E9E88B8/5EC2DBA7" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC2DBA7" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC2DBA7" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC2DBA7" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC2DBA7" Ref="R?"  Part="1" 
F 0 "R?" H 7050 4550 50  0000 L CNN
F 1 "47R" H 7050 4450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6880 4500 50  0001 C CNN
F 3 "~" H 6950 4500 50  0001 C CNN
	1    6950 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC2DBBE
P 6750 3100
AR Path="/5E9E88B8/5EC2DBBE" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DBBE" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DBBE" Ref="C?"  Part="1" 
F 0 "C?" V 6900 3100 50  0000 C CNN
F 1 "0.1uF" V 6600 3100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 2950 50  0001 C CNN
F 3 "~" H 6750 3100 50  0001 C CNN
	1    6750 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC2DBCA
P 3750 3300
AR Path="/5E9E88B8/5EC2DBCA" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC2DBCA" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC2DBCA" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC2DBCA" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC2DBCA" Ref="R?"  Part="1" 
F 0 "R?" H 3850 3350 50  0000 L CNN
F 1 "2.2K" H 3850 3250 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3680 3300 50  0001 C CNN
F 3 "~" H 3750 3300 50  0001 C CNN
	1    3750 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC2DBD0
P 4200 3300
AR Path="/5E9E88B8/5EC2DBD0" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DBD0" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DBD0" Ref="C?"  Part="1" 
F 0 "C?" H 4300 3350 50  0000 L CNN
F 1 "0.1uF" H 4300 3250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4238 3150 50  0001 C CNN
F 3 "~" H 4200 3300 50  0001 C CNN
	1    4200 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5EC2DBD6
P 5300 3100
AR Path="/5EA333CB/5EC2DBD6" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5EC2DBD6" Ref="L?"  Part="1" 
F 0 "L?" V 5400 3100 50  0000 C CNN
F 1 "MLZ2012N101LT000" V 5200 3100 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 3100 50  0001 C CNN
F 3 "~" H 5300 3100 50  0001 C CNN
	1    5300 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 3450 3750 3500
Wire Wire Line
	4200 3500 4200 3450
Wire Wire Line
	5750 3950 5700 3950
Wire Wire Line
	6900 3100 6950 3100
Connection ~ 6950 3100
Wire Wire Line
	6950 3100 6950 3750
Wire Wire Line
	3750 3100 3750 3150
Wire Wire Line
	4200 3150 4200 3100
Connection ~ 4200 3100
Wire Wire Line
	4200 3100 3750 3100
$Comp
L Device:C C?
U 1 1 5EC2DC0C
P 4650 3300
AR Path="/5E9E88B8/5EC2DC0C" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DC0C" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DC0C" Ref="C?"  Part="1" 
F 0 "C?" H 4750 3350 50  0000 L CNN
F 1 "10nF" H 4750 3250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4688 3150 50  0001 C CNN
F 3 "~" H 4650 3300 50  0001 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3100 4400 3100
Wire Wire Line
	4650 3150 4650 3100
Connection ~ 4650 3100
Wire Wire Line
	4200 3500 4400 3500
Connection ~ 4200 3500
Wire Wire Line
	4650 3450 4650 3500
Wire Wire Line
	3750 3500 4200 3500
Wire Wire Line
	4400 3550 4400 3500
Connection ~ 4400 3500
Wire Wire Line
	4400 3500 4650 3500
$Comp
L Device:R R?
U 1 1 5EC2DC29
P 4400 2900
AR Path="/5E9E88B8/5EC2DC29" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC2DC29" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC2DC29" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC2DC29" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC2DC29" Ref="R?"  Part="1" 
F 0 "R?" H 4500 2950 50  0000 L CNN
F 1 "1.8K" H 4500 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4330 2900 50  0001 C CNN
F 3 "~" H 4400 2900 50  0001 C CNN
	1    4400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3050 4400 3100
Connection ~ 4400 3100
Wire Wire Line
	4400 3100 4650 3100
$Comp
L Device:C C?
U 1 1 5EC2DC33
P 4950 2500
AR Path="/5E9E88B8/5EC2DC33" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DC33" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DC33" Ref="C?"  Part="1" 
F 0 "C?" H 5050 2550 50  0000 L CNN
F 1 "0.1uF" H 5050 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4988 2350 50  0001 C CNN
F 3 "~" H 4950 2500 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2300 4950 2350
Wire Wire Line
	4950 2700 4950 2650
$Comp
L Device:C C?
U 1 1 5EC2DC3B
P 5400 2500
AR Path="/5E9E88B8/5EC2DC3B" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DC3B" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DC3B" Ref="C?"  Part="1" 
F 0 "C?" H 5500 2550 50  0000 L CNN
F 1 "10nF" H 5500 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5438 2350 50  0001 C CNN
F 3 "~" H 5400 2500 50  0001 C CNN
	1    5400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC2DC41
P 5850 2500
AR Path="/5E9E88B8/5EC2DC41" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DC41" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DC41" Ref="C?"  Part="1" 
F 0 "C?" H 5950 2550 50  0000 L CNN
F 1 "1.0nF" H 5950 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5888 2350 50  0001 C CNN
F 3 "~" H 5850 2500 50  0001 C CNN
	1    5850 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2300 5850 2350
Wire Wire Line
	5400 2350 5400 2300
Wire Wire Line
	5850 2700 5850 2650
Wire Wire Line
	5400 2650 5400 2700
Connection ~ 5400 2700
Wire Wire Line
	5400 2700 5850 2700
Wire Wire Line
	4950 2700 5400 2700
Wire Wire Line
	5400 2700 5400 2750
Wire Wire Line
	5850 2300 5400 2300
Wire Wire Line
	4400 2300 4400 2750
Connection ~ 4950 2300
Wire Wire Line
	4950 2300 4400 2300
Connection ~ 5400 2300
Wire Wire Line
	5400 2300 4950 2300
Wire Wire Line
	5850 2300 6950 2300
Connection ~ 5850 2300
Wire Wire Line
	6950 2300 6950 2500
Wire Wire Line
	6950 2800 6950 3100
$Comp
L Device:C C?
U 1 1 5EC2DC59
P 7150 3100
AR Path="/5E9E88B8/5EC2DC59" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC2DC59" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC2DC59" Ref="C?"  Part="1" 
F 0 "C?" V 7300 3100 50  0000 C CNN
F 1 "0.1uF" V 7000 3100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7188 2950 50  0001 C CNN
F 3 "~" H 7150 3100 50  0001 C CNN
	1    7150 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 3100 6950 3100
Text HLabel 8100 3100 2    50   Output ~ 0
OUT
Wire Wire Line
	7300 3100 8100 3100
Text GLabel 4100 2300 0    50   Input ~ 0
+5.0V-TX
Wire Wire Line
	4100 2300 4400 2300
Connection ~ 4400 2300
$Comp
L power:GND #PWR?
U 1 1 5EC2DC65
P 6950 4750
AR Path="/5EA436AA/5EC2DC65" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EC2DC65" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6950 4500 50  0001 C CNN
F 1 "GND" H 6955 4577 50  0000 C CNN
F 2 "" H 6950 4750 50  0001 C CNN
F 3 "" H 6950 4750 50  0001 C CNN
	1    6950 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC2DC6B
P 4400 3550
AR Path="/5EA436AA/5EC2DC6B" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EC2DC6B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4400 3300 50  0001 C CNN
F 1 "GND" H 4405 3377 50  0000 C CNN
F 2 "" H 4400 3550 50  0001 C CNN
F 3 "" H 4400 3550 50  0001 C CNN
	1    4400 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC2DC71
P 5400 2750
AR Path="/5EA436AA/5EC2DC71" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EC2DC71" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5400 2500 50  0001 C CNN
F 1 "GND" H 5405 2577 50  0000 C CNN
F 2 "" H 5400 2750 50  0001 C CNN
F 3 "" H 5400 2750 50  0001 C CNN
	1    5400 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC3769E
P 7350 4300
AR Path="/5E9E88B8/5EC3769E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC3769E" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC3769E" Ref="C?"  Part="1" 
F 0 "C?" V 7500 4300 50  0000 C CNN
F 1 "0.1uF" V 7200 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7388 4150 50  0001 C CNN
F 3 "~" H 7350 4300 50  0001 C CNN
	1    7350 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC38AD2
P 7600 4500
AR Path="/5E9E88B8/5EC38AD2" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC38AD2" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC38AD2" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC38AD2" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC38AD2" Ref="R?"  Part="1" 
F 0 "R?" H 7700 4550 50  0000 L CNN
F 1 "18R" H 7700 4450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7530 4500 50  0001 C CNN
F 3 "~" H 7600 4500 50  0001 C CNN
	1    7600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 4300 7600 4350
Wire Wire Line
	7600 4700 7600 4650
Wire Wire Line
	6950 4650 6950 4700
Wire Wire Line
	6950 4700 7600 4700
Connection ~ 6950 4700
Wire Wire Line
	6950 4700 6950 4750
Wire Wire Line
	7500 4300 7600 4300
Wire Wire Line
	7200 4300 6950 4300
Connection ~ 6950 4300
Wire Wire Line
	6950 4300 6950 4350
Wire Wire Line
	6950 4150 6950 4300
Wire Wire Line
	5750 3100 5750 3400
Connection ~ 5750 3950
$Comp
L Device:R R?
U 1 1 5EC64C2F
P 5750 3550
AR Path="/5E9E88B8/5EC64C2F" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC64C2F" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC64C2F" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC64C2F" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC64C2F" Ref="R?"  Part="1" 
F 0 "R?" H 5850 3600 50  0000 L CNN
F 1 "180R" H 5850 3500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 3550 50  0001 C CNN
F 3 "~" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3700 5750 3950
Wire Wire Line
	4650 3100 5150 3100
$Comp
L Device:L L?
U 1 1 5EC67166
P 6250 3100
AR Path="/5EA333CB/5EC67166" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5EC67166" Ref="L?"  Part="1" 
F 0 "L?" V 6350 3100 50  0000 C CNN
F 1 "MLF2012DR22" V 6150 3100 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 3100 50  0001 C CNN
F 3 "~" H 6250 3100 50  0001 C CNN
	1    6250 3100
	0    -1   -1   0   
$EndComp
Connection ~ 5750 3100
Wire Wire Line
	5750 3100 6100 3100
Wire Wire Line
	6400 3100 6600 3100
Wire Wire Line
	5450 3100 5750 3100
Wire Wire Line
	5750 3950 6650 3950
Wire Wire Line
	5400 3950 3700 3950
$Comp
L Device:L L?
U 1 1 5EC2DBC4
P 6950 2650
AR Path="/5EA333CB/5EC2DBC4" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5EC2DBC4" Ref="L?"  Part="1" 
F 0 "L?" H 7003 2696 50  0000 L CNN
F 1 "LQW32FT470M0HL" H 7003 2605 50  0000 L CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6950 2650 50  0001 C CNN
F 3 "~" H 6950 2650 50  0001 C CNN
	1    6950 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
