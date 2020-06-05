EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 14
Title "LNA"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NPN_BEC Q4
U 1 1 5EA847C0
P 7100 4150
F 0 "Q4" H 7291 4196 50  0000 L CNN
F 1 "BFU520W" H 7291 4105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7300 4250 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/BFU520W.pdf" H 7100 4150 50  0001 C CNN
	1    7100 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA865FD
P 6250 4150
AR Path="/5E9E88B8/5EA865FD" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EA865FD" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EA865FD" Ref="C72"  Part="1" 
F 0 "C72" V 6400 4150 50  0000 C CNN
F 1 "0.1uF" V 6100 4150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6288 4000 50  0001 C CNN
F 3 "~" H 6250 4150 50  0001 C CNN
	1    6250 4150
	0    -1   -1   0   
$EndComp
Text HLabel 3950 4150 0    50   Input ~ 0
IN
$Comp
L Device:R R?
U 1 1 5EAA72D8
P 6550 4600
AR Path="/5E9E88B8/5EAA72D8" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EAA72D8" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EAA72D8" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EAA72D8" Ref="R57"  Part="1" 
F 0 "R57" H 6650 4650 50  0000 L CNN
F 1 "150R" H 6650 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6480 4600 50  0001 C CNN
F 3 "~" H 6550 4600 50  0001 C CNN
	1    6550 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAADFB8
P 7000 4600
AR Path="/5E9E88B8/5EAADFB8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAADFB8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAADFB8" Ref="C74"  Part="1" 
F 0 "C74" H 7100 4650 50  0000 L CNN
F 1 "0.1uF" H 7100 4550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7038 4450 50  0001 C CNN
F 3 "~" H 7000 4600 50  0001 C CNN
	1    7000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4450 6550 4400
Wire Wire Line
	7000 4400 7000 4450
Wire Wire Line
	6550 4750 6550 4800
Wire Wire Line
	7000 4800 7000 4750
Wire Wire Line
	7200 4850 7200 4800
$Comp
L Device:R R?
U 1 1 5EAB2F05
P 6650 3300
AR Path="/5E9E88B8/5EAB2F05" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EAB2F05" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EAB2F05" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EAB2F05" Ref="R58"  Part="1" 
F 0 "R58" V 6550 3300 50  0000 C CNN
F 1 "470R" V 6750 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6580 3300 50  0001 C CNN
F 3 "~" H 6650 3300 50  0001 C CNN
	1    6650 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EAB36F1
P 7000 3300
AR Path="/5E9E88B8/5EAB36F1" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAB36F1" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAB36F1" Ref="C73"  Part="1" 
F 0 "C73" V 7150 3300 50  0000 C CNN
F 1 "0.1uF" V 6850 3300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7038 3150 50  0001 C CNN
F 3 "~" H 7000 3300 50  0001 C CNN
	1    7000 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EABB034
P 4000 3500
AR Path="/5E9E88B8/5EABB034" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EABB034" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EABB034" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EABB034" Ref="R55"  Part="1" 
F 0 "R55" H 4100 3550 50  0000 L CNN
F 1 "2.2K" H 4100 3450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 3500 50  0001 C CNN
F 3 "~" H 4000 3500 50  0001 C CNN
	1    4000 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EABB03A
P 4450 3500
AR Path="/5E9E88B8/5EABB03A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EABB03A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EABB03A" Ref="C66"  Part="1" 
F 0 "C66" H 4550 3550 50  0000 L CNN
F 1 "0.1uF" H 4550 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 3350 50  0001 C CNN
F 3 "~" H 4450 3500 50  0001 C CNN
	1    4450 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5EABB13A
P 6000 3300
AR Path="/5EA333CB/5EABB13A" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5EABB13A" Ref="L4"  Part="1" 
F 0 "L4" V 6100 3300 50  0000 C CNN
F 1 "MLZ2012N101LT000" V 5900 3300 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 3300 50  0001 C CNN
F 3 "~" H 6000 3300 50  0001 C CNN
	1    6000 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 3650 4000 3700
Wire Wire Line
	4450 3700 4450 3650
Wire Wire Line
	6150 3300 6450 3300
Wire Wire Line
	6450 3300 6450 4150
Connection ~ 6450 3300
Wire Wire Line
	6450 3300 6500 3300
Wire Wire Line
	6900 4150 6450 4150
Connection ~ 6450 4150
Wire Wire Line
	6450 4150 6400 4150
Wire Wire Line
	7150 3300 7200 3300
Connection ~ 7200 3300
Wire Wire Line
	7200 3300 7200 3950
Wire Wire Line
	6800 3300 6850 3300
Wire Wire Line
	4000 3300 4000 3350
Wire Wire Line
	4450 3350 4450 3300
Connection ~ 4450 3300
Wire Wire Line
	4450 3300 4000 3300
$Comp
L Device:C C?
U 1 1 5EAD0450
P 7450 4600
AR Path="/5E9E88B8/5EAD0450" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAD0450" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAD0450" Ref="C76"  Part="1" 
F 0 "C76" H 7550 4650 50  0000 L CNN
F 1 "10nF" H 7550 4550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7488 4450 50  0001 C CNN
F 3 "~" H 7450 4600 50  0001 C CNN
	1    7450 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAD05F6
P 7900 4600
AR Path="/5E9E88B8/5EAD05F6" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAD05F6" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAD05F6" Ref="C77"  Part="1" 
F 0 "C77" H 8000 4650 50  0000 L CNN
F 1 "1.0nF" H 8000 4550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7938 4450 50  0001 C CNN
F 3 "~" H 7900 4600 50  0001 C CNN
	1    7900 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4400 7200 4400
Wire Wire Line
	7900 4400 7900 4450
Connection ~ 7000 4400
Wire Wire Line
	7450 4450 7450 4400
Connection ~ 7450 4400
Wire Wire Line
	7450 4400 7900 4400
Wire Wire Line
	7000 4800 7200 4800
Wire Wire Line
	7900 4800 7900 4750
Connection ~ 7000 4800
Wire Wire Line
	7450 4750 7450 4800
Connection ~ 7450 4800
Wire Wire Line
	7450 4800 7900 4800
Connection ~ 7200 4800
Wire Wire Line
	7200 4800 7450 4800
Wire Wire Line
	6550 4800 7000 4800
Wire Wire Line
	7200 4350 7200 4400
Connection ~ 7200 4400
Wire Wire Line
	7200 4400 7450 4400
Wire Wire Line
	6550 4400 7000 4400
$Comp
L Device:C C?
U 1 1 5EADF13D
P 4900 3500
AR Path="/5E9E88B8/5EADF13D" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EADF13D" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EADF13D" Ref="C67"  Part="1" 
F 0 "C67" H 5000 3550 50  0000 L CNN
F 1 "10nF" H 5000 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4938 3350 50  0001 C CNN
F 3 "~" H 4900 3500 50  0001 C CNN
	1    4900 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EADF3EF
P 5350 3500
AR Path="/5E9E88B8/5EADF3EF" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EADF3EF" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EADF3EF" Ref="C69"  Part="1" 
F 0 "C69" H 5450 3550 50  0000 L CNN
F 1 "1.0nF" H 5450 3450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5388 3350 50  0001 C CNN
F 3 "~" H 5350 3500 50  0001 C CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3300 4650 3300
Wire Wire Line
	4900 3350 4900 3300
Connection ~ 4900 3300
Wire Wire Line
	4900 3300 5350 3300
Wire Wire Line
	5350 3350 5350 3300
Connection ~ 5350 3300
Wire Wire Line
	5350 3300 5850 3300
Wire Wire Line
	4450 3700 4650 3700
Wire Wire Line
	5350 3700 5350 3650
Connection ~ 4450 3700
Wire Wire Line
	4900 3650 4900 3700
Connection ~ 4900 3700
Wire Wire Line
	4900 3700 5350 3700
Wire Wire Line
	4000 3700 4450 3700
Wire Wire Line
	4650 3750 4650 3700
Connection ~ 4650 3700
Wire Wire Line
	4650 3700 4900 3700
$Comp
L Device:R R?
U 1 1 5EAE996B
P 4650 3100
AR Path="/5E9E88B8/5EAE996B" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EAE996B" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EAE996B" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EAE996B" Ref="R56"  Part="1" 
F 0 "R56" H 4750 3150 50  0000 L CNN
F 1 "4.3K" H 4750 3050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4580 3100 50  0001 C CNN
F 3 "~" H 4650 3100 50  0001 C CNN
	1    4650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3250 4650 3300
Connection ~ 4650 3300
Wire Wire Line
	4650 3300 4900 3300
Wire Wire Line
	3950 4150 6100 4150
$Comp
L Device:C C?
U 1 1 5EAF38BB
P 5200 2700
AR Path="/5E9E88B8/5EAF38BB" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAF38BB" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAF38BB" Ref="C68"  Part="1" 
F 0 "C68" H 5300 2750 50  0000 L CNN
F 1 "0.1uF" H 5300 2650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5238 2550 50  0001 C CNN
F 3 "~" H 5200 2700 50  0001 C CNN
	1    5200 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2500 5200 2550
Wire Wire Line
	5200 2900 5200 2850
$Comp
L Device:C C?
U 1 1 5EAF38CA
P 5650 2700
AR Path="/5E9E88B8/5EAF38CA" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAF38CA" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAF38CA" Ref="C70"  Part="1" 
F 0 "C70" H 5750 2750 50  0000 L CNN
F 1 "10nF" H 5750 2650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5688 2550 50  0001 C CNN
F 3 "~" H 5650 2700 50  0001 C CNN
	1    5650 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EAF38D0
P 6100 2700
AR Path="/5E9E88B8/5EAF38D0" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EAF38D0" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EAF38D0" Ref="C71"  Part="1" 
F 0 "C71" H 6200 2750 50  0000 L CNN
F 1 "1.0nF" H 6200 2650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 2550 50  0001 C CNN
F 3 "~" H 6100 2700 50  0001 C CNN
	1    6100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2500 6100 2550
Wire Wire Line
	5650 2550 5650 2500
Wire Wire Line
	6100 2900 6100 2850
Wire Wire Line
	5650 2850 5650 2900
Connection ~ 5650 2900
Wire Wire Line
	5650 2900 6100 2900
Wire Wire Line
	5200 2900 5650 2900
Wire Wire Line
	5650 2900 5650 2950
Wire Wire Line
	6100 2500 5650 2500
Wire Wire Line
	4650 2500 4650 2950
Connection ~ 5200 2500
Wire Wire Line
	5200 2500 4650 2500
Connection ~ 5650 2500
Wire Wire Line
	5650 2500 5200 2500
Wire Wire Line
	6100 2500 7200 2500
Connection ~ 6100 2500
Wire Wire Line
	7200 2500 7200 2700
Wire Wire Line
	7200 3000 7200 3300
$Comp
L Device:C C?
U 1 1 5EB022C8
P 7400 3300
AR Path="/5E9E88B8/5EB022C8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EB022C8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EB022C8" Ref="C75"  Part="1" 
F 0 "C75" V 7550 3300 50  0000 C CNN
F 1 "0.1uF" V 7250 3300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7438 3150 50  0001 C CNN
F 3 "~" H 7400 3300 50  0001 C CNN
	1    7400 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 3300 7200 3300
Text HLabel 8350 3300 2    50   Output ~ 0
OUT
Wire Wire Line
	7550 3300 8350 3300
Text GLabel 4350 2500 0    50   Input ~ 0
+5.0V-RX
Wire Wire Line
	4350 2500 4650 2500
Connection ~ 4650 2500
$Comp
L power:GND #PWR047
U 1 1 5EAA811D
P 7200 4850
F 0 "#PWR047" H 7200 4600 50  0001 C CNN
F 1 "GND" H 7205 4677 50  0000 C CNN
F 2 "" H 7200 4850 50  0001 C CNN
F 3 "" H 7200 4850 50  0001 C CNN
	1    7200 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5EAAA05F
P 4650 3750
F 0 "#PWR045" H 4650 3500 50  0001 C CNN
F 1 "GND" H 4655 3577 50  0000 C CNN
F 2 "" H 4650 3750 50  0001 C CNN
F 3 "" H 4650 3750 50  0001 C CNN
	1    4650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR046
U 1 1 5EAAC212
P 5650 2950
F 0 "#PWR046" H 5650 2700 50  0001 C CNN
F 1 "GND" H 5655 2777 50  0000 C CNN
F 2 "" H 5650 2950 50  0001 C CNN
F 3 "" H 5650 2950 50  0001 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5ED1C3BE
P 7200 2850
AR Path="/5EA333CB/5ED1C3BE" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5ED1C3BE" Ref="L5"  Part="1" 
F 0 "L5" H 7253 2896 50  0000 L CNN
F 1 "LQW32FT470M0HL" H 7253 2805 50  0000 L CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 7200 2850 50  0001 C CNN
F 3 "~" H 7200 2850 50  0001 C CNN
	1    7200 2850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
