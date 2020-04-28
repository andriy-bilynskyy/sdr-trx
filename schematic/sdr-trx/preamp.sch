EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L sdr-trx:HMC589AST89E U?
U 1 1 5EA34409
P 5300 3800
F 0 "U?" H 5250 4000 50  0000 L CNN
F 1 "HMC589AST89E" H 5250 3550 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 5350 4200 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/hmc589a.pdf" H 5300 3800 50  0001 C CNN
	1    5300 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA39D16
P 4450 3800
AR Path="/5E9E88B8/5EA39D16" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA39D16" Ref="C?"  Part="1" 
F 0 "C?" V 4600 3800 50  0000 C CNN
F 1 "0.1uF" V 4300 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 3650 50  0001 C CNN
F 3 "~" H 4450 3800 50  0001 C CNN
	1    4450 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3A56D
P 5900 3800
AR Path="/5E9E88B8/5EA3A56D" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA3A56D" Ref="C?"  Part="1" 
F 0 "C?" V 6050 3800 50  0000 C CNN
F 1 "0.1uF" V 5750 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5938 3650 50  0001 C CNN
F 3 "~" H 5900 3800 50  0001 C CNN
	1    5900 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3ABD1
P 4750 4000
AR Path="/5E9E88B8/5EA3ABD1" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA3ABD1" Ref="C?"  Part="1" 
F 0 "C?" H 4650 3950 50  0000 R CNN
F 1 "10pF" H 4650 4050 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4788 3850 50  0001 C CNN
F 3 "~" H 4750 4000 50  0001 C CNN
	1    4750 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 3800 4750 3800
Wire Wire Line
	4750 3850 4750 3800
Connection ~ 4750 3800
Wire Wire Line
	4750 3800 4600 3800
Wire Wire Line
	5200 4100 5200 4200
Wire Wire Line
	4750 4150 4750 4200
Wire Wire Line
	4750 4200 5200 4200
Connection ~ 5200 4200
Wire Wire Line
	5200 4200 5200 4250
Text HLabel 4200 3800 0    50   Input ~ 0
IN
Wire Wire Line
	4300 3800 4200 3800
$Comp
L Device:L L?
U 1 1 5EA3E088
P 5700 3300
F 0 "L?" H 5753 3346 50  0000 L CNN
F 1 "NLCV32T-101K-EF" H 5753 3255 50  0000 L CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 5700 3300 50  0001 C CNN
F 3 "~" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3EFFF
P 5300 3100
AR Path="/5E9E88B8/5EA3EFFF" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA3EFFF" Ref="C?"  Part="1" 
F 0 "C?" H 5200 3050 50  0000 R CNN
F 1 "100pF" H 5200 3150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5338 2950 50  0001 C CNN
F 3 "~" H 5300 3100 50  0001 C CNN
	1    5300 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3F35E
P 4900 3100
AR Path="/5E9E88B8/5EA3F35E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA3F35E" Ref="C?"  Part="1" 
F 0 "C?" H 4800 3050 50  0000 R CNN
F 1 "1nF" H 4800 3150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4938 2950 50  0001 C CNN
F 3 "~" H 4900 3100 50  0001 C CNN
	1    4900 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5EA3F674
P 4450 3100
AR Path="/5E9E88B8/5EA3F674" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA3F674" Ref="C?"  Part="1" 
F 0 "C?" H 4350 3050 50  0000 R CNN
F 1 "1.0uF" H 4350 3150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 2950 50  0001 C CNN
F 3 "~" H 4450 3100 50  0001 C CNN
	1    4450 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 3800 5700 3800
Connection ~ 5700 3800
Wire Wire Line
	5700 3800 5750 3800
Wire Wire Line
	5700 2900 5300 2900
Wire Wire Line
	4450 2950 4450 2900
Connection ~ 4450 2900
Wire Wire Line
	4450 2900 4350 2900
Wire Wire Line
	4900 2950 4900 2900
Connection ~ 4900 2900
Wire Wire Line
	4900 2900 4450 2900
Wire Wire Line
	5300 2950 5300 2900
Connection ~ 5300 2900
Wire Wire Line
	5300 2900 4900 2900
Wire Wire Line
	4450 3250 4450 3300
Wire Wire Line
	4450 3300 4900 3300
Wire Wire Line
	5300 3300 5300 3250
Wire Wire Line
	4900 3250 4900 3300
Connection ~ 4900 3300
Wire Wire Line
	4900 3300 5300 3300
Wire Wire Line
	4900 3350 4900 3300
Wire Wire Line
	5700 3150 5700 2900
Wire Wire Line
	5700 3450 5700 3800
Text HLabel 6150 3800 2    50   Output ~ 0
OUT
Wire Wire Line
	6050 3800 6150 3800
$Comp
L Device:R R?
U 1 1 5EA52F92
P 4200 2900
AR Path="/5E9E88B8/5EA52F92" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EA52F92" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EA52F92" Ref="R?"  Part="1" 
F 0 "R?" V 4300 2950 50  0000 L CNN
F 1 "10R" V 4300 2850 50  0000 R CNN
F 2 "Resistor_SMD:R_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 4130 2900 50  0001 C CNN
F 3 "~" H 4200 2900 50  0001 C CNN
F 4 "*" H 4200 2900 50  0000 C CNN "Optional"
	1    4200 2900
	0    -1   -1   0   
$EndComp
Text GLabel 3950 2900 0    50   Input ~ 0
+5.0V-TX
Wire Wire Line
	3950 2900 4050 2900
Text Notes 3450 2550 0    50   ~ 0
* Limit gain to 17dB to reach max IC output power 20dBm, P>0.3W
$Comp
L power:GND #PWR?
U 1 1 5EACF610
P 5200 4250
AR Path="/5E9F4ACB/5EACF610" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EACF610" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5200 4000 50  0001 C CNN
F 1 "GND" H 5205 4077 50  0000 C CNN
F 2 "" H 5200 4250 50  0001 C CNN
F 3 "" H 5200 4250 50  0001 C CNN
	1    5200 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EACFE76
P 4900 3350
AR Path="/5E9F4ACB/5EACFE76" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EACFE76" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 3100 50  0001 C CNN
F 1 "GND" H 4905 3177 50  0000 C CNN
F 2 "" H 4900 3350 50  0001 C CNN
F 3 "" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
