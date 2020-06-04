EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 14
Title "Power Amplifier"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NPN_BCE Q?
U 1 1 5EC3A105
P 4200 3100
F 0 "Q?" H 4391 3146 50  0000 L CNN
F 1 "DZT2222A" H 4391 3055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4400 3200 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30481.pdf" H 4200 3100 50  0001 C CNN
	1    4200 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC5C651
P 4700 3450
AR Path="/5E9E88B8/5EC5C651" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC5C651" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC5C651" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC5C651" Ref="C?"  Part="1" 
F 0 "C?" V 4850 3450 50  0000 C CNN
F 1 "0.1uF" V 4550 3450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4738 3300 50  0001 C CNN
F 3 "~" H 4700 3450 50  0001 C CNN
	1    4700 3450
	0    -1   -1   0   
$EndComp
Text HLabel 1650 3100 0    50   Input ~ 0
IN
$Comp
L Device:R R?
U 1 1 5EC5C658
P 4300 3650
AR Path="/5E9E88B8/5EC5C658" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC5C658" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC5C658" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC5C658" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC5C658" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC5C658" Ref="R?"  Part="1" 
F 0 "R?" H 4400 3700 50  0000 L CNN
F 1 "47R" H 4400 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4230 3650 50  0001 C CNN
F 3 "~" H 4300 3650 50  0001 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC5C6B1
P 4300 3900
AR Path="/5EA436AA/5EC5C6B1" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EC5C6B1" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EC5C6B1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 3650 50  0001 C CNN
F 1 "GND" H 4305 3727 50  0000 C CNN
F 2 "" H 4300 3900 50  0001 C CNN
F 3 "" H 4300 3900 50  0001 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC6209D
P 4950 3650
AR Path="/5E9E88B8/5EC6209D" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC6209D" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC6209D" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC6209D" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC6209D" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC6209D" Ref="R?"  Part="1" 
F 0 "R?" H 5050 3700 50  0000 L CNN
F 1 "22R" H 5050 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 3650 50  0001 C CNN
F 3 "~" H 4950 3650 50  0001 C CNN
	1    4950 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC6395A
P 4100 2650
AR Path="/5E9E88B8/5EC6395A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC6395A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC6395A" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC6395A" Ref="C?"  Part="1" 
F 0 "C?" V 4250 2650 50  0000 C CNN
F 1 "0.1uF" V 3950 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4138 2500 50  0001 C CNN
F 3 "~" H 4100 2650 50  0001 C CNN
	1    4100 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 3800 4950 3850
Wire Wire Line
	4950 3850 4300 3850
Wire Wire Line
	4300 3850 4300 3800
Wire Wire Line
	4300 3900 4300 3850
Connection ~ 4300 3850
Wire Wire Line
	4850 3450 4950 3450
Wire Wire Line
	4950 3450 4950 3500
Wire Wire Line
	4300 3500 4300 3450
Wire Wire Line
	4550 3450 4300 3450
Connection ~ 4300 3450
Wire Wire Line
	4300 3450 4300 3300
$Comp
L Device:R R?
U 1 1 5EC734B0
P 3750 2650
AR Path="/5E9E88B8/5EC734B0" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC734B0" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC734B0" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC734B0" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC734B0" Ref="R?"  Part="1" 
F 0 "R?" V 3650 2650 50  0000 C CNN
F 1 "4.7R" V 3850 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3680 2650 50  0001 C CNN
F 3 "~" H 3750 2650 50  0001 C CNN
	1    3750 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC73582
P 3550 2900
AR Path="/5E9E88B8/5EC73582" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC73582" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC73582" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC73582" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC73582" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC73582" Ref="R?"  Part="1" 
F 0 "R?" H 3650 2950 50  0000 L CNN
F 1 "160R" H 3650 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3480 2900 50  0001 C CNN
F 3 "~" H 3550 2900 50  0001 C CNN
	1    3550 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC76F17
P 3350 2650
AR Path="/5E9E88B8/5EC76F17" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC76F17" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC76F17" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC76F17" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC76F17" Ref="R?"  Part="1" 
F 0 "R?" V 3250 2650 50  0000 C CNN
F 1 "15K" V 3450 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 2650 50  0001 C CNN
F 3 "~" H 3350 2650 50  0001 C CNN
	1    3350 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC778A3
P 3300 3100
AR Path="/5E9E88B8/5EC778A3" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC778A3" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC778A3" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC778A3" Ref="C?"  Part="1" 
F 0 "C?" V 3450 3100 50  0000 C CNN
F 1 "0.1uF" V 3150 3100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 2950 50  0001 C CNN
F 3 "~" H 3300 3100 50  0001 C CNN
	1    3300 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 3100 3550 3100
Wire Wire Line
	3550 3050 3550 3100
Connection ~ 3550 3100
Wire Wire Line
	3550 3100 3450 3100
Wire Wire Line
	4250 2650 4300 2650
Wire Wire Line
	4300 2650 4300 2900
Wire Wire Line
	3950 2650 3900 2650
Wire Wire Line
	3500 2650 3550 2650
Wire Wire Line
	3550 2750 3550 2650
Connection ~ 3550 2650
Wire Wire Line
	3550 2650 3600 2650
$Comp
L Diode:BZX84Cxx D?
U 1 1 5EC7D7E5
P 2900 2550
F 0 "D?" V 2854 2629 50  0000 L CNN
F 1 "BZX84C4V7" V 3150 2550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2900 2550 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 2900 2550 50  0001 C CNN
	1    2900 2550
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC8346E
P 2450 2550
AR Path="/5E9E88B8/5EC8346E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC8346E" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC8346E" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC8346E" Ref="C?"  Part="1" 
F 0 "C?" H 2550 2600 50  0000 L CNN
F 1 "0.1uF" H 2550 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 2400 50  0001 C CNN
F 3 "~" H 2450 2550 50  0001 C CNN
	1    2450 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC83682
P 2000 2550
AR Path="/5E9E88B8/5EC83682" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC83682" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC83682" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC83682" Ref="C?"  Part="1" 
F 0 "C?" H 2100 2600 50  0000 L CNN
F 1 "1.0uF" H 2100 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2038 2400 50  0001 C CNN
F 3 "~" H 2000 2550 50  0001 C CNN
	1    2000 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2700 2000 2750
Wire Wire Line
	2000 2750 2450 2750
Wire Wire Line
	2900 2750 2900 2700
Wire Wire Line
	2450 2700 2450 2750
Connection ~ 2450 2750
Wire Wire Line
	2450 2750 2900 2750
$Comp
L power:GND #PWR?
U 1 1 5EC8CE26
P 2450 2800
AR Path="/5EA436AA/5EC8CE26" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EC8CE26" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EC8CE26" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 2550 50  0001 C CNN
F 1 "GND" H 2455 2627 50  0000 C CNN
F 2 "" H 2450 2800 50  0001 C CNN
F 3 "" H 2450 2800 50  0001 C CNN
	1    2450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2800 2450 2750
Wire Wire Line
	2000 2400 2000 2350
Wire Wire Line
	2000 2350 2450 2350
Wire Wire Line
	2900 2350 2900 2400
Wire Wire Line
	2900 2350 3150 2350
Wire Wire Line
	3150 2350 3150 2650
Wire Wire Line
	3150 2650 3200 2650
Connection ~ 2900 2350
Wire Wire Line
	2450 2400 2450 2350
Connection ~ 2450 2350
Wire Wire Line
	2450 2350 2900 2350
Text GLabel 2350 1800 0    50   Input ~ 0
+12V-TX
$Comp
L Device:R R?
U 1 1 5EC94728
P 2450 2150
AR Path="/5E9E88B8/5EC94728" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC94728" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EC94728" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EC94728" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EC94728" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EC94728" Ref="R?"  Part="1" 
F 0 "R?" H 2550 2200 50  0000 L CNN
F 1 "1.8K" H 2550 2100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2380 2150 50  0001 C CNN
F 3 "~" H 2450 2150 50  0001 C CNN
	1    2450 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2300 2450 2350
$Comp
L sdr-trx:CX2047LANL TR?
U 1 1 5ECAD5A7
P 5150 2850
AR Path="/5E9F4ACB/5ECAD5A7" Ref="TR?"  Part="1" 
AR Path="/5EC388F5/5ECAD5A7" Ref="TR?"  Part="1" 
F 0 "TR?" H 5150 3200 50  0000 C CNN
F 1 "CX2047LANL" H 5100 2550 50  0000 C CNN
F 2 "sdr-trx:CX2047LANL" H 5150 2500 50  0001 C CNN
F 3 "https://productfinder.pulseeng.com/doc_type/WEB301/doc_num/CX2047LANL-01/doc_part/CX2047LANL.pdf" H 5150 2850 50  0001 C CNN
	1    5150 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 1800 4300 1900
Connection ~ 4300 2650
$Comp
L Device:C C?
U 1 1 5ECB296C
P 3000 2000
AR Path="/5E9E88B8/5ECB296C" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECB296C" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECB296C" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECB296C" Ref="C?"  Part="1" 
F 0 "C?" H 3100 2050 50  0000 L CNN
F 1 "1.0uF" H 3100 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3038 1850 50  0001 C CNN
F 3 "~" H 3000 2000 50  0001 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ECB2E17
P 3450 2000
AR Path="/5E9E88B8/5ECB2E17" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECB2E17" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECB2E17" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECB2E17" Ref="C?"  Part="1" 
F 0 "C?" H 3550 2050 50  0000 L CNN
F 1 "0.1uF" H 3550 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3488 1850 50  0001 C CNN
F 3 "~" H 3450 2000 50  0001 C CNN
	1    3450 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ECB317D
P 3900 2000
AR Path="/5E9E88B8/5ECB317D" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECB317D" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECB317D" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECB317D" Ref="C?"  Part="1" 
F 0 "C?" H 4000 2050 50  0000 L CNN
F 1 "10nF" H 4000 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3938 1850 50  0001 C CNN
F 3 "~" H 3900 2000 50  0001 C CNN
	1    3900 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2150 3000 2200
Wire Wire Line
	3000 2200 3450 2200
Wire Wire Line
	3900 2200 3900 2150
Wire Wire Line
	3450 2150 3450 2200
Connection ~ 3450 2200
Wire Wire Line
	3450 2200 3900 2200
$Comp
L power:GND #PWR?
U 1 1 5ECB8661
P 3450 2250
AR Path="/5EA436AA/5ECB8661" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5ECB8661" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5ECB8661" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 2000 50  0001 C CNN
F 1 "GND" H 3455 2077 50  0000 C CNN
F 2 "" H 3450 2250 50  0001 C CNN
F 3 "" H 3450 2250 50  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2250 3450 2200
Wire Wire Line
	3450 1850 3450 1800
Connection ~ 3450 1800
Wire Wire Line
	3450 1800 3900 1800
Wire Wire Line
	3900 1850 3900 1800
Connection ~ 3900 1800
Wire Wire Line
	3000 1850 3000 1800
Wire Wire Line
	3000 1800 3450 1800
Wire Wire Line
	3000 1800 2450 1800
Connection ~ 3000 1800
Wire Wire Line
	2450 1800 2450 2000
Wire Wire Line
	2350 1800 2450 1800
Connection ~ 2450 1800
Wire Wire Line
	3900 1800 4300 1800
Text Notes 5050 2950 1    50   ~ 0
10dBm
$Comp
L power:GND #PWR?
U 1 1 5ECD5CAD
P 5400 2850
AR Path="/5EA436AA/5ECD5CAD" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5ECD5CAD" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5ECD5CAD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5400 2600 50  0001 C CNN
F 1 "GND" H 5405 2677 50  0000 C CNN
F 2 "" H 5400 2850 50  0001 C CNN
F 3 "" H 5400 2850 50  0001 C CNN
	1    5400 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 2850 5350 2850
$Comp
L Device:L L?
U 1 1 5ECE5F5F
P 4300 2050
AR Path="/5EA333CB/5ECE5F5F" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5ECE5F5F" Ref="L?"  Part="1" 
AR Path="/5EC388F5/5ECE5F5F" Ref="L?"  Part="1" 
F 0 "L?" H 4353 2096 50  0000 L CNN
F 1 "LQW32FT470M0HL" H 4353 2005 50  0000 L CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 4300 2050 50  0001 C CNN
F 3 "~" H 4300 2050 50  0001 C CNN
	1    4300 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2200 4300 2650
$Comp
L Device:C C?
U 1 1 5ECF2714
P 4500 2650
AR Path="/5E9E88B8/5ECF2714" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECF2714" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECF2714" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECF2714" Ref="C?"  Part="1" 
F 0 "C?" V 4650 2650 50  0000 C CNN
F 1 "0.1uF" V 4350 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 2500 50  0001 C CNN
F 3 "~" H 4500 2650 50  0001 C CNN
	1    4500 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 2650 4300 2650
$Comp
L power:GND #PWR?
U 1 1 5ECFAAB2
P 4900 3100
AR Path="/5EA436AA/5ECFAAB2" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5ECFAAB2" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5ECFAAB2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 2850 50  0001 C CNN
F 1 "GND" H 4905 2927 50  0000 C CNN
F 2 "" H 4900 3100 50  0001 C CNN
F 3 "" H 4900 3100 50  0001 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2650 4650 2650
Wire Wire Line
	4900 3100 4900 3050
Wire Wire Line
	4900 3050 4950 3050
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5ED21986
P 6250 1800
F 0 "Q?" H 6454 1846 50  0000 L CNN
F 1 "PD85004" H 6454 1755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 6450 1900 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/ec/56/e5/b3/69/ca/4d/d7/CD00178461.pdf/files/CD00178461.pdf/jcr:content/translations/en.CD00178461.pdf" H 6250 1800 50  0001 C CNN
	1    6250 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5ED2361A
P 5950 2050
AR Path="/5E9E88B8/5ED2361A" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED2361A" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5ED2361A" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5ED2361A" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5ED2361A" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5ED2361A" Ref="R?"  Part="1" 
F 0 "R?" H 6050 2100 50  0000 L CNN
F 1 "1.8K" H 6050 2000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5880 2050 50  0001 C CNN
F 3 "~" H 5950 2050 50  0001 C CNN
	1    5950 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ED288EE
P 6150 2350
AR Path="/5E9E88B8/5ED288EE" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED288EE" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED288EE" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED288EE" Ref="C?"  Part="1" 
F 0 "C?" V 6300 2350 50  0000 C CNN
F 1 "0.1uF" V 6000 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6188 2200 50  0001 C CNN
F 3 "~" H 6150 2350 50  0001 C CNN
	1    6150 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED29A27
P 6150 2750
AR Path="/5E9E88B8/5ED29A27" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED29A27" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED29A27" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED29A27" Ref="C?"  Part="1" 
F 0 "C?" V 6300 2750 50  0000 C CNN
F 1 "10nF" V 6000 2750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6188 2600 50  0001 C CNN
F 3 "~" H 6150 2750 50  0001 C CNN
	1    6150 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED2C9DD
P 5950 1550
AR Path="/5E9E88B8/5ED2C9DD" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED2C9DD" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5ED2C9DD" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5ED2C9DD" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5ED2C9DD" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5ED2C9DD" Ref="R?"  Part="1" 
F 0 "R?" H 6050 1600 50  0000 L CNN
F 1 "1K" H 6050 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5880 1550 50  0001 C CNN
F 3 "~" H 5950 1550 50  0001 C CNN
	1    5950 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5ED3A23E
P 6150 1150
AR Path="/5EA333CB/5ED3A23E" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5ED3A23E" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5ED3A23E" Ref="L?"  Part="1" 
AR Path="/5EC388F5/5ED3A23E" Ref="L?"  Part="1" 
F 0 "L?" V 6100 1150 50  0000 C BNN
F 1 "MLF2012A1R0" V 6200 1150 50  0000 C TNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 1150 50  0001 C CNN
F 3 "~" H 6150 1150 50  0001 C CNN
	1    6150 1150
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED3C00E
P 6350 1350
AR Path="/5E9E88B8/5ED3C00E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED3C00E" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED3C00E" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED3C00E" Ref="C?"  Part="1" 
F 0 "C?" H 6450 1400 50  0000 L CNN
F 1 "0.1uF" H 6450 1300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6388 1200 50  0001 C CNN
F 3 "~" H 6350 1350 50  0001 C CNN
	1    6350 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ED3FD1C
P 5700 1800
AR Path="/5E9E88B8/5ED3FD1C" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED3FD1C" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED3FD1C" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED3FD1C" Ref="C?"  Part="1" 
F 0 "C?" V 5850 1800 50  0000 C CNN
F 1 "0.1uF" V 5550 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 1650 50  0001 C CNN
F 3 "~" H 5700 1800 50  0001 C CNN
	1    5700 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 2000 6350 2350
Wire Wire Line
	6350 2750 6300 2750
Wire Wire Line
	6300 2350 6350 2350
Connection ~ 6350 2350
Wire Wire Line
	6350 2350 6350 2750
Wire Wire Line
	5950 2200 5950 2350
Wire Wire Line
	5950 2750 6000 2750
Wire Wire Line
	6000 2350 5950 2350
Connection ~ 5950 2350
Wire Wire Line
	5950 2350 5950 2750
Wire Wire Line
	5850 1800 5950 1800
Wire Wire Line
	5950 1700 5950 1800
Connection ~ 5950 1800
Wire Wire Line
	5950 1800 6050 1800
Wire Wire Line
	5950 1900 5950 1800
Wire Wire Line
	6000 1150 5950 1150
Wire Wire Line
	5950 1150 5950 1400
Wire Wire Line
	6300 1150 6350 1150
Wire Wire Line
	6350 1150 6350 1200
Wire Wire Line
	6350 1500 6350 1550
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5ED59A2E
P 6250 3750
F 0 "Q?" H 6454 3796 50  0000 L CNN
F 1 "PD85004" H 6454 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 6450 3850 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/ec/56/e5/b3/69/ca/4d/d7/CD00178461.pdf/files/CD00178461.pdf/jcr:content/translations/en.CD00178461.pdf" H 6250 3750 50  0001 C CNN
	1    6250 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5ED59A34
P 5950 4000
AR Path="/5E9E88B8/5ED59A34" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED59A34" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5ED59A34" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5ED59A34" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5ED59A34" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5ED59A34" Ref="R?"  Part="1" 
F 0 "R?" H 6050 4050 50  0000 L CNN
F 1 "1.8K" H 6050 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5880 4000 50  0001 C CNN
F 3 "~" H 5950 4000 50  0001 C CNN
	1    5950 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ED59A3A
P 6150 4300
AR Path="/5E9E88B8/5ED59A3A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED59A3A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED59A3A" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED59A3A" Ref="C?"  Part="1" 
F 0 "C?" V 6300 4300 50  0000 C CNN
F 1 "0.1uF" V 6000 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6188 4150 50  0001 C CNN
F 3 "~" H 6150 4300 50  0001 C CNN
	1    6150 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED59A40
P 6150 4700
AR Path="/5E9E88B8/5ED59A40" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED59A40" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED59A40" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED59A40" Ref="C?"  Part="1" 
F 0 "C?" V 6300 4700 50  0000 C CNN
F 1 "10nF" V 6000 4700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6188 4550 50  0001 C CNN
F 3 "~" H 6150 4700 50  0001 C CNN
	1    6150 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED59A46
P 5950 3500
AR Path="/5E9E88B8/5ED59A46" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED59A46" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5ED59A46" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5ED59A46" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5ED59A46" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5ED59A46" Ref="R?"  Part="1" 
F 0 "R?" H 6050 3550 50  0000 L CNN
F 1 "1K" H 6050 3450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5880 3500 50  0001 C CNN
F 3 "~" H 5950 3500 50  0001 C CNN
	1    5950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5ED59A4C
P 6150 3100
AR Path="/5EA333CB/5ED59A4C" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5ED59A4C" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5ED59A4C" Ref="L?"  Part="1" 
AR Path="/5EC388F5/5ED59A4C" Ref="L?"  Part="1" 
F 0 "L?" V 6100 3100 50  0000 C BNN
F 1 "MLF2012A1R0" V 6200 3100 50  0000 C TNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 3100 50  0001 C CNN
F 3 "~" H 6150 3100 50  0001 C CNN
	1    6150 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED59A52
P 6350 3300
AR Path="/5E9E88B8/5ED59A52" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED59A52" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED59A52" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED59A52" Ref="C?"  Part="1" 
F 0 "C?" H 6450 3350 50  0000 L CNN
F 1 "0.1uF" H 6450 3250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6388 3150 50  0001 C CNN
F 3 "~" H 6350 3300 50  0001 C CNN
	1    6350 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5ED59A58
P 5700 3750
AR Path="/5E9E88B8/5ED59A58" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ED59A58" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ED59A58" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ED59A58" Ref="C?"  Part="1" 
F 0 "C?" V 5850 3750 50  0000 C CNN
F 1 "0.1uF" V 5550 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 3600 50  0001 C CNN
F 3 "~" H 5700 3750 50  0001 C CNN
	1    5700 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3950 6350 4300
Wire Wire Line
	6350 4700 6300 4700
Wire Wire Line
	6300 4300 6350 4300
Wire Wire Line
	5950 4150 5950 4300
Wire Wire Line
	5950 4700 6000 4700
Wire Wire Line
	6000 4300 5950 4300
Connection ~ 5950 4300
Wire Wire Line
	5950 4300 5950 4700
Wire Wire Line
	5850 3750 5950 3750
Wire Wire Line
	5950 3650 5950 3750
Connection ~ 5950 3750
Wire Wire Line
	5950 3750 6050 3750
Wire Wire Line
	5950 3850 5950 3750
Wire Wire Line
	6000 3100 5950 3100
Wire Wire Line
	5950 3100 5950 3350
Wire Wire Line
	6300 3100 6350 3100
Wire Wire Line
	6350 3100 6350 3150
Wire Wire Line
	6350 3450 6350 3500
Wire Wire Line
	5550 3750 5500 3750
Wire Wire Line
	5500 3750 5500 3050
Wire Wire Line
	5500 3050 5350 3050
Wire Wire Line
	5350 2650 5500 2650
Wire Wire Line
	5500 2650 5500 1800
Wire Wire Line
	5500 1800 5550 1800
$Comp
L power:GND #PWR?
U 1 1 5ED78E4F
P 6350 2750
AR Path="/5EA436AA/5ED78E4F" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5ED78E4F" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5ED78E4F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6350 2500 50  0001 C CNN
F 1 "GND" H 6355 2577 50  0000 C CNN
F 2 "" H 6350 2750 50  0001 C CNN
F 3 "" H 6350 2750 50  0001 C CNN
	1    6350 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED8D6BA
P 6350 4700
AR Path="/5EA436AA/5ED8D6BA" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5ED8D6BA" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5ED8D6BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6350 4450 50  0001 C CNN
F 1 "GND" H 6355 4527 50  0000 C CNN
F 2 "" H 6350 4700 50  0001 C CNN
F 3 "" H 6350 4700 50  0001 C CNN
	1    6350 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 4300 6350 4700
Connection ~ 6350 4300
Text Label 5950 2750 1    50   ~ 0
BIASH
Text Label 5950 4700 1    50   ~ 0
BIASL
$Comp
L Device:Transformer_SP_1S T?
U 1 1 5ED9CA1B
P 8050 2550
F 0 "T?" H 8050 2931 50  0000 C CNN
F 1 "BN43-202" H 8050 2840 50  0000 C CNN
F 2 "sdr-trx:BN-43-202-5P" H 8050 2550 50  0001 C CNN
F 3 "http://www.amidoncorp.com/bn-43-202/" H 8050 2550 50  0001 C CNN
	1    8050 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDA4FEF
P 7050 1950
AR Path="/5E9E88B8/5EDA4FEF" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EDA4FEF" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EDA4FEF" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EDA4FEF" Ref="C?"  Part="1" 
F 0 "C?" V 7200 1950 50  0000 C CNN
F 1 "0.1uF" V 6900 1950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 1800 50  0001 C CNN
F 3 "~" H 7050 1950 50  0001 C CNN
	1    7050 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EDA629E
P 7050 2350
AR Path="/5E9E88B8/5EDA629E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EDA629E" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EDA629E" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EDA629E" Ref="C?"  Part="1" 
F 0 "C?" V 7200 2350 50  0000 C CNN
F 1 "0.1uF" V 6900 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 2200 50  0001 C CNN
F 3 "~" H 7050 2350 50  0001 C CNN
	1    7050 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EDA674F
P 7050 2750
AR Path="/5E9E88B8/5EDA674F" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EDA674F" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EDA674F" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EDA674F" Ref="C?"  Part="1" 
F 0 "C?" V 7200 2750 50  0000 C CNN
F 1 "0.1uF" V 6900 2750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 2600 50  0001 C CNN
F 3 "~" H 7050 2750 50  0001 C CNN
	1    7050 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EDA6CDD
P 7050 3150
AR Path="/5E9E88B8/5EDA6CDD" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EDA6CDD" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EDA6CDD" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EDA6CDD" Ref="C?"  Part="1" 
F 0 "C?" V 7200 3150 50  0000 C CNN
F 1 "0.1uF" V 6900 3150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 3000 50  0001 C CNN
F 3 "~" H 7050 3150 50  0001 C CNN
	1    7050 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 1950 6850 1950
Wire Wire Line
	6850 1950 6850 2350
Wire Wire Line
	6850 3150 6900 3150
Wire Wire Line
	6900 2750 6850 2750
Connection ~ 6850 2750
Wire Wire Line
	6850 2750 6850 3150
Wire Wire Line
	6900 2350 6850 2350
Connection ~ 6850 2350
Wire Wire Line
	6850 2350 6850 2550
Wire Wire Line
	7200 1950 7250 1950
Wire Wire Line
	7250 1950 7250 2350
Wire Wire Line
	7250 3150 7200 3150
Wire Wire Line
	7200 2750 7250 2750
Connection ~ 7250 2750
Wire Wire Line
	7250 2750 7250 3150
Wire Wire Line
	7200 2350 7250 2350
Connection ~ 7250 2350
Connection ~ 6350 2750
Connection ~ 6350 4700
$Comp
L power:GND #PWR?
U 1 1 5EDE2E71
P 6850 2550
AR Path="/5EA436AA/5EDE2E71" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EDE2E71" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EDE2E71" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6850 2300 50  0001 C CNN
F 1 "GND" H 6855 2377 50  0000 C CNN
F 2 "" H 6850 2550 50  0001 C CNN
F 3 "" H 6850 2550 50  0001 C CNN
	1    6850 2550
	0    1    1    0   
$EndComp
Connection ~ 6850 2550
Wire Wire Line
	6850 2550 6850 2750
$Comp
L Device:R R?
U 1 1 5EE09688
P 7450 3150
AR Path="/5E9E88B8/5EE09688" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE09688" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE09688" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE09688" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EE09688" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE09688" Ref="R?"  Part="1" 
F 0 "R?" V 7350 3150 50  0000 C CNN
F 1 "100R 0.5W" V 7550 3300 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7380 3150 50  0001 C CNN
F 3 "~" H 7450 3150 50  0001 C CNN
	1    7450 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 1550 7650 1550
Wire Wire Line
	7650 1550 7650 1950
Connection ~ 6350 1550
Wire Wire Line
	6350 1550 6350 1600
Wire Wire Line
	6350 3500 7650 3500
Wire Wire Line
	7650 3500 7650 3150
Connection ~ 6350 3500
Wire Wire Line
	6350 3500 6350 3550
Wire Wire Line
	7250 2350 7250 2550
Wire Wire Line
	7250 3150 7300 3150
Connection ~ 7250 3150
Wire Wire Line
	7600 3150 7650 3150
Connection ~ 7650 3150
Wire Wire Line
	7650 3150 7650 2750
Wire Wire Line
	7650 2550 7550 2550
Connection ~ 7250 2550
Wire Wire Line
	7250 2550 7250 2750
$Comp
L Device:R R?
U 1 1 5EE4F8F4
P 7450 1950
AR Path="/5E9E88B8/5EE4F8F4" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE4F8F4" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE4F8F4" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE4F8F4" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EE4F8F4" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE4F8F4" Ref="R?"  Part="1" 
F 0 "R?" V 7550 1950 50  0000 C CNN
F 1 "100R 0.5W" V 7350 2100 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7380 1950 50  0001 C CNN
F 3 "~" H 7450 1950 50  0001 C CNN
	1    7450 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 1950 7650 1950
Connection ~ 7650 1950
Wire Wire Line
	7650 1950 7650 2350
Wire Wire Line
	7300 1950 7250 1950
Connection ~ 7250 1950
$Comp
L power:GND #PWR?
U 1 1 5EE5BD72
P 8500 2800
AR Path="/5EA436AA/5EE5BD72" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE5BD72" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EE5BD72" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8500 2550 50  0001 C CNN
F 1 "GND" H 8505 2627 50  0000 C CNN
F 2 "" H 8500 2800 50  0001 C CNN
F 3 "" H 8500 2800 50  0001 C CNN
	1    8500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2750 8500 2750
Wire Wire Line
	8500 2750 8500 2800
$Comp
L Device:C C?
U 1 1 5EE629EC
P 8650 2350
AR Path="/5E9E88B8/5EE629EC" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE629EC" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE629EC" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE629EC" Ref="C?"  Part="1" 
F 0 "C?" V 8800 2350 50  0000 C CNN
F 1 "0.1uF" V 8500 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8688 2200 50  0001 C CNN
F 3 "~" H 8650 2350 50  0001 C CNN
	1    8650 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 2350 8500 2350
Text HLabel 10250 2350 2    50   Output ~ 0
OUT
$Comp
L Device:C C?
U 1 1 5EE7A350
P 7950 3250
AR Path="/5E9E88B8/5EE7A350" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE7A350" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE7A350" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE7A350" Ref="C?"  Part="1" 
F 0 "C?" H 8050 3300 50  0000 L CNN
F 1 "1.0uF" H 8050 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7988 3100 50  0001 C CNN
F 3 "~" H 7950 3250 50  0001 C CNN
	1    7950 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EE7D700
P 8400 3250
AR Path="/5E9E88B8/5EE7D700" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE7D700" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE7D700" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE7D700" Ref="C?"  Part="1" 
F 0 "C?" H 8500 3300 50  0000 L CNN
F 1 "1.0uF" H 8500 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8438 3100 50  0001 C CNN
F 3 "~" H 8400 3250 50  0001 C CNN
	1    8400 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EE7DA09
P 8850 3250
AR Path="/5E9E88B8/5EE7DA09" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE7DA09" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE7DA09" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE7DA09" Ref="C?"  Part="1" 
F 0 "C?" H 8950 3300 50  0000 L CNN
F 1 "1.0uF" H 8950 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8888 3100 50  0001 C CNN
F 3 "~" H 8850 3250 50  0001 C CNN
	1    8850 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EE7DEA9
P 9300 3250
AR Path="/5E9E88B8/5EE7DEA9" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE7DEA9" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE7DEA9" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE7DEA9" Ref="C?"  Part="1" 
F 0 "C?" H 9400 3300 50  0000 L CNN
F 1 "1.0uF" H 9400 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9338 3100 50  0001 C CNN
F 3 "~" H 9300 3250 50  0001 C CNN
	1    9300 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2550 7550 3050
Wire Wire Line
	7550 3050 7950 3050
Connection ~ 7550 2550
Wire Wire Line
	7550 2550 7250 2550
Wire Wire Line
	7950 3100 7950 3050
Connection ~ 7950 3050
Wire Wire Line
	7950 3050 8400 3050
Wire Wire Line
	8400 3100 8400 3050
Connection ~ 8400 3050
Wire Wire Line
	8400 3050 8850 3050
Wire Wire Line
	8850 3100 8850 3050
Connection ~ 8850 3050
Wire Wire Line
	8850 3050 9300 3050
Wire Wire Line
	9300 3100 9300 3050
Connection ~ 9300 3050
$Comp
L Device:CP1 C?
U 1 1 5EEA4D21
P 9750 3250
F 0 "C?" H 9865 3296 50  0000 L CNN
F 1 "47uF 16V" H 9865 3205 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.8" H 9750 3250 50  0001 C CNN
F 3 "~" H 9750 3250 50  0001 C CNN
	1    9750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 3050 9750 3100
Wire Wire Line
	9300 3050 9750 3050
Wire Wire Line
	7950 3400 7950 3450
Wire Wire Line
	7950 3450 8400 3450
Wire Wire Line
	9750 3450 9750 3400
Wire Wire Line
	9300 3400 9300 3450
Connection ~ 9300 3450
Wire Wire Line
	9300 3450 9750 3450
Wire Wire Line
	8850 3400 8850 3450
Connection ~ 8850 3450
Wire Wire Line
	8850 3450 9300 3450
Wire Wire Line
	8400 3400 8400 3450
Connection ~ 8400 3450
Wire Wire Line
	8400 3450 8850 3450
$Comp
L power:GND #PWR?
U 1 1 5EEBE888
P 8850 3500
AR Path="/5EA436AA/5EEBE888" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EEBE888" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EEBE888" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 3250 50  0001 C CNN
F 1 "GND" H 8855 3327 50  0000 C CNN
F 2 "" H 8850 3500 50  0001 C CNN
F 3 "" H 8850 3500 50  0001 C CNN
	1    8850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3500 8850 3450
Text GLabel 9950 3050 2    50   Input ~ 0
+12V-TX
Wire Wire Line
	9750 3050 9950 3050
Connection ~ 9750 3050
Wire Wire Line
	1650 3100 3150 3100
Wire Wire Line
	8800 2350 10250 2350
$Comp
L sdr-trx:AD5243BRMZ U?
U 1 1 5EF0B586
P 3500 6350
F 0 "U?" H 3500 6937 60  0000 C CNN
F 1 "AD5243BRMZ" H 3500 6831 60  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 3500 5900 60  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5243_5248.pdf" H 2900 6450 60  0001 C CNN
	1    3500 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF118EB
P 2500 7000
AR Path="/5EA436AA/5EF118EB" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EF118EB" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EF118EB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 6750 50  0001 C CNN
F 1 "GND" H 2505 6827 50  0000 C CNN
F 2 "" H 2500 7000 50  0001 C CNN
F 3 "" H 2500 7000 50  0001 C CNN
	1    2500 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6650 2850 6650
$Comp
L Device:C C?
U 1 1 5EF19D75
P 2050 6750
AR Path="/5E9E88B8/5EF19D75" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EF19D75" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EF19D75" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EF19D75" Ref="C?"  Part="1" 
F 0 "C?" H 2150 6800 50  0000 L CNN
F 1 "1.0uF" H 2150 6700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2088 6600 50  0001 C CNN
F 3 "~" H 2050 6750 50  0001 C CNN
	1    2050 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF1E3CD
P 2500 6750
AR Path="/5E9E88B8/5EF1E3CD" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EF1E3CD" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EF1E3CD" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EF1E3CD" Ref="C?"  Part="1" 
F 0 "C?" H 2600 6800 50  0000 L CNN
F 1 "0.1uF" H 2600 6700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2538 6600 50  0001 C CNN
F 3 "~" H 2500 6750 50  0001 C CNN
	1    2500 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6550 2050 6600
Wire Wire Line
	2500 6600 2500 6550
Wire Wire Line
	2500 6550 2050 6550
Wire Wire Line
	2050 6900 2050 6950
Wire Wire Line
	2050 6950 2500 6950
Wire Wire Line
	2500 6950 2500 6900
Wire Wire Line
	2500 6950 2850 6950
Wire Wire Line
	2850 6650 2850 6950
Connection ~ 2500 6950
Wire Wire Line
	2500 7000 2500 6950
Wire Wire Line
	2900 6550 2500 6550
Connection ~ 2500 6550
Text GLabel 2000 6550 0    50   Input ~ 0
+5.0V-TX
Wire Wire Line
	2000 6550 2050 6550
Connection ~ 2050 6550
Text HLabel 1800 6050 0    50   BiDi ~ 0
SCL
Text HLabel 1800 6150 0    50   BiDi ~ 0
SDA
Wire Wire Line
	2900 6050 1800 6050
Wire Wire Line
	2900 6150 1800 6150
Wire Wire Line
	2850 6950 4200 6950
Wire Wire Line
	4200 6950 4200 6650
Wire Wire Line
	4200 6250 4100 6250
Connection ~ 2850 6950
Wire Wire Line
	4100 6650 4200 6650
Connection ~ 4200 6650
Wire Wire Line
	4200 6650 4200 6250
Wire Wire Line
	4100 6450 4250 6450
Wire Wire Line
	4250 6450 4250 6050
Wire Wire Line
	4250 6050 4100 6050
Text Label 5300 6550 2    50   ~ 0
BIASL
$Comp
L Device:C C?
U 1 1 5EFC0F80
P 4950 5550
AR Path="/5E9E88B8/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC0F80" Ref="C?"  Part="1" 
F 0 "C?" H 5050 5600 50  0000 L CNN
F 1 "0.1uF" H 5050 5500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4988 5400 50  0001 C CNN
F 3 "~" H 4950 5550 50  0001 C CNN
	1    4950 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EFC1ECB
P 4500 5550
AR Path="/5E9E88B8/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC1ECB" Ref="C?"  Part="1" 
F 0 "C?" H 4600 5600 50  0000 L CNN
F 1 "10nF" H 4600 5500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 5400 50  0001 C CNN
F 3 "~" H 4500 5550 50  0001 C CNN
	1    4500 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EFC3669
P 5400 5550
AR Path="/5E9E88B8/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC3669" Ref="C?"  Part="1" 
F 0 "C?" H 5500 5600 50  0000 L CNN
F 1 "1.0uF" H 5500 5500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5438 5400 50  0001 C CNN
F 3 "~" H 5400 5550 50  0001 C CNN
	1    5400 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5700 4500 5750
Wire Wire Line
	4500 5750 4950 5750
Wire Wire Line
	5400 5750 5400 5700
Wire Wire Line
	4950 5700 4950 5750
Connection ~ 4950 5750
Wire Wire Line
	4950 5750 5400 5750
Wire Wire Line
	5400 5400 5400 5350
Wire Wire Line
	5400 5350 4950 5350
Connection ~ 4250 6050
Wire Wire Line
	4500 5400 4500 5350
Connection ~ 4500 5350
Wire Wire Line
	4950 5400 4950 5350
Connection ~ 4950 5350
Wire Wire Line
	4950 5350 4500 5350
$Comp
L power:GND #PWR?
U 1 1 5EFF6EEA
P 4950 5800
AR Path="/5EA436AA/5EFF6EEA" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EFF6EEA" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EFF6EEA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 5550 50  0001 C CNN
F 1 "GND" H 4955 5627 50  0000 C CNN
F 2 "" H 4950 5800 50  0001 C CNN
F 3 "" H 4950 5800 50  0001 C CNN
	1    4950 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5800 4950 5750
Text GLabel 4200 5350 0    50   Input ~ 0
+5.0V-TX
Text Notes 7950 1900 0    50   ~ 0
BN43-202\npri. 2+2 turns\nsec. 6 turns\nenameled wire 0.4mm
$Comp
L Device:Thermistor_NTC TH?
U 1 1 5F028AF8
P 9250 5450
F 0 "TH?" H 9348 5496 50  0000 L CNN
F 1 "CMFB3435103" H 9348 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 5500 50  0001 C CNN
F 3 "https://www.cantherm.com/wp-content/uploads/2017/05/CMF_11x17_AUGUST_2014.pdf" H 9250 5500 50  0001 C CNN
	1    9250 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:Thermistor_NTC TH?
U 1 1 5F02C76F
P 7950 5450
F 0 "TH?" H 8048 5496 50  0000 L CNN
F 1 "CMFB3435103" H 8048 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 5500 50  0001 C CNN
F 3 "https://www.cantherm.com/wp-content/uploads/2017/05/CMF_11x17_AUGUST_2014.pdf" H 7950 5500 50  0001 C CNN
	1    7950 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F03665C
P 8850 5750
AR Path="/5EA436AA/5F03665C" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5F03665C" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5F03665C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 5500 50  0001 C CNN
F 1 "GND" H 8855 5577 50  0000 C CNN
F 2 "" H 8850 5750 50  0001 C CNN
F 3 "" H 8850 5750 50  0001 C CNN
	1    8850 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5750 8850 5700
Wire Wire Line
	8850 5700 9250 5700
Wire Wire Line
	9250 5200 10250 5200
Wire Wire Line
	7950 5300 7950 5050
Text HLabel 10250 5050 2    50   Output ~ 0
TH
Text HLabel 10250 5200 2    50   Output ~ 0
TL
Text Notes 8300 6100 0    50   ~ 0
Each thermistor routed near its own PD85004 on PCB.
$Comp
L Device:C C?
U 1 1 5EC9E971
P 7550 5400
AR Path="/5E9E88B8/5EC9E971" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC9E971" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC9E971" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EC9E971" Ref="C?"  Part="1" 
F 0 "C?" V 7400 5400 50  0000 C CNN
F 1 "0.1uF" V 7700 5400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7588 5250 50  0001 C CNN
F 3 "~" H 7550 5400 50  0001 C CNN
	1    7550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5050 7550 5050
Wire Wire Line
	7550 5050 7550 5250
Connection ~ 7950 5050
$Comp
L Device:C C?
U 1 1 5ECC3C3A
P 8850 5400
AR Path="/5E9E88B8/5ECC3C3A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECC3C3A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECC3C3A" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECC3C3A" Ref="C?"  Part="1" 
F 0 "C?" V 8700 5400 50  0000 C CNN
F 1 "0.1uF" V 9000 5400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8888 5250 50  0001 C CNN
F 3 "~" H 8850 5400 50  0001 C CNN
	1    8850 5400
	1    0    0    -1  
$EndComp
Connection ~ 8850 5700
Wire Wire Line
	8850 5700 7950 5700
Wire Wire Line
	7550 5550 7550 5700
Wire Wire Line
	7950 5600 7950 5700
Connection ~ 7950 5700
Wire Wire Line
	7950 5700 7550 5700
Wire Wire Line
	9250 5300 9250 5200
Wire Wire Line
	9250 5600 9250 5700
Wire Wire Line
	8850 5550 8850 5700
$Bitmap
Pos 9800 1450
Scale 1.000000
Data
89 50 4E 47 0D 0A 1A 0A 00 00 00 0D 49 48 44 52 00 00 02 00 00 00 01 70 08 02 00 00 00 41 D0 54 
F1 00 00 00 03 73 42 49 54 08 08 08 DB E1 4F E0 00 00 00 09 70 48 59 73 00 00 0A F0 00 00 0A F0 
01 42 AC 34 98 00 00 20 00 49 44 41 54 78 9C ED DD 67 7C 14 55 DB 06 F0 FB CC 6C 4D 2F 84 84 84 
12 AA 01 A4 88 54 41 10 A4 0A 22 8A F8 80 A8 A8 60 45 EC 82 85 57 54 14 04 3B 8A 28 0A 58 00 11 
41 BA 14 29 0A 28 BD 05 08 10 7A 49 80 F4 B6 29 BB 3B 73 DE 0F 41 11 C8 EE 4E C2 26 5B CE F5 FF 
F9 01 77 CF CC DE BB D9 9D 6B E6 CC CC 39 8C 73 4E 00 00 20 1E C9 D3 05 00 00 80 67 20 00 00 00 
04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 
50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 
85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 
08 00 00 00 41 E9 3C 5D 00 5C ED FC 85 D4 FC C2 22 4F 57 01 E0 BD 02 CC 21 35 6B 44 79 BA 0A 7F 
80 00 F0 3A BF AD 9C DD 2F 72 29 71 4F D7 01 3E 89 79 BA 80 32 B9 F9 DB FC 47 EE A3 FF 7B E8 51 
F7 AE 53 4C 08 00 AF 63 36 28 D1 21 7F 79 BA 0A 00 EF 15 52 32 CC D3 25 F8 09 9C 03 00 00 10 14 
02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 
00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 
00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 
00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 
00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 
00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 
40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 
04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 
50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 
85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 
08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 94 CE D3 05 00 00 40 C5 E5 5C 38 FE F5 37 73 6C CC 
E1 DE 3C AF 76 D3 AB 8F F5 D5 CB 65 3C 85 00 00 00 F0 61 85 96 D4 29 6F 8E 4B 75 D2 62 E8 17 A3 
47 94 FD 0C 02 00 00 C0 87 D9 6D 39 A9 44 54 BD E9 DC 6F BE 8A 8F 2A 6B 3F DF 14 A9 73 70 78 80 
00 00 00 F0 61 F6 DC 3C 22 32 46 56 6F DD B1 53 C3 C8 F2 2D 8B 93 C0 00 00 3E 4C C9 B1 10 51 58 
80 C9 60 2A F7 B2 08 00 00 00 1F 66 C9 2B 22 A2 A0 80 60 53 40 B9 97 45 00 00 00 F8 B0 9C 7C 2B 
11 05 1A C3 4D AC DC CB E2 1C 00 00 80 0F CB 2D 2A 26 A2 C0 A0 28 33 B7 1E 3B 9C B4 77 CF BE 8B 
59 F9 B2 C1 5C 2F A1 59 93 84 46 35 AB 87 39 59 16 01 00 00 E0 BB EC 79 25 19 44 94 79 E1 F8 1B 
23 EE F9 70 E6 8A FF 3E 57 A3 49 87 D1 6F 8C 7B EA BE 9E 46 5D D9 47 07 BE 1A 00 E7 33 F2 CF A7 
E7 7B BA 0A F7 93 65 F9 6C A6 71 B7 D4 9B A8 FC 87 73 00 62 38 91 4D FB 92 2F 28 8A EA E9 42 2A 
5D DD B8 F0 F0 10 B3 D3 26 8A C5 7A 91 88 92 B7 FE F4 C5 C9 FA F7 3F F6 62 9F 9E 9D 63 C3 CD 49 
3B 37 2F 98 FF D3 9F BB B7 BC 30 B4 F7 45 CB 6F E3 47 F4 29 33 02 18 E7 BC 52 0A AF 4C E7 33 F2 
3F FA F1 EF 8F B7 9F E7 AA EF 15 EF 02 A7 1B 82 8C 47 94 B2 2E E6 05 00 22 22 AA 2F 2B C7 0B 4A 
FC 7F 1F 89 D3 8E 71 3D 5A 37 AD E9 AC 8D 5A 3C FB 8B D7 D6 EC CC 34 86 C6 8E 78 7A 64 BB C6 B5 
FE 7D C6 92 75 E6 83 57 9E 7A 7B D6 4A E2 7C 43 D2 F9 DB 1A C7 5C BB B4 4F 06 C0 81 63 69 B7 8D 
5B F9 E7 B8 EE 31 51 A1 9E AE C5 CD 64 59 9A 3F FF CB 81 35 7E C7 11 00 80 23 6B 33 06 F5 BA 7B 
88 08 47 00 41 81 26 A3 C1 45 3F 8D DD 66 55 54 2E C9 3A BD EE EA 1D C7 C2 F4 43 9D AB 37 D9 45 
74 D7 BB 0B 16 BF 31 F0 DA 65 7D B5 0B C8 CA 79 78 68 40 64 78 90 A7 0B 71 BF 20 B3 2D 32 70 8D 
A7 AB 00 F0 5E 21 96 81 61 21 E5 BF E6 D1 4F E9 F4 0E 23 22 20 B2 E1 C8 D7 3A 3C 3A 71 CB 92 39 
EB 8B DE 18 78 6D 5F 12 2E 03 05 00 F0 53 92 14 D2 F0 26 22 A2 43 A7 0B CA 7A DE 57 8F 00 FC 98 
C4 38 72 19 C0 09 09 3F 10 8D 38 B7 66 A7 12 11 D5 89 2E F3 88 C9 7F 02 60 EC D4 75 56 BB CF F7 
09 32 C6 4E 9C 8D DE 7D 68 B2 A7 0B 01 F0 5E E7 AC 86 F5 A9 6B BD FC FC A5 AC D7 BD FB 44 17 59 
AE DC B0 B2 A4 1C 9E 35 7F D9 C9 93 C7 07 8F 9A D8 A6 61 F8 55 CF AA 4A C1 96 EF 16 13 51 CB 01 
5D 02 CB 5A DC 4F 02 E0 AD 69 EB 37 1C 4C 6B 51 27 CC BB BF 12 AE 31 C6 AC 0A CB B7 E3 2A 20 00 
87 8A ED 94 5F 64 F3 E6 1F 3B 63 74 EE A2 E5 78 4A 76 A3 DA E5 1C 9E AD BC 2F 64 96 E7 BF 38 7A 
13 D1 D9 D0 D6 B3 C7 8F 30 5C F9 EC 81 DF E7 7D BE 9F 88 E8 E5 BB DB 94 B9 B8 9F 04 00 63 54 3B 
2A F0 CB 31 7D 3C 5D 88 1B CC 9B 3B 61 70 CD 37 3C 5D 05 80 F7 5A 9D 36 BD D7 BD DE FE 63 1F 37 
65 F5 57 BF EE F9 F8 F9 EE 95 FA 2A 01 E1 75 5F 9C FA CA A6 91 1F FC F2 EE 63 0D 22 4C 4F 0E EE 
15 19 1A AC 93 78 51 61 7E E2 A6 A5 77 0F 78 92 11 B5 1A 32 AE 6F 87 1B CA 5C DC 4F 02 80 88 BC 
79 77 A0 5C 54 CE C8 E7 BB B2 00 2A 91 EA 0B 3F 10 95 48 27 57 FE C5 DC 4C D7 6F D8 2B 93 8E 1E 
1B F3 E9 A2 89 2F 3E 38 F1 C5 90 3B 06 F4 0C 35 F2 C4 BF 96 1C 3C 67 27 A2 16 7D 9F 9E F7 C9 0B 
61 86 B2 7B A2 70 32 05 00 C0 87 E9 02 A3 5E F9 60 CE DF AB E6 DF D7 B5 A5 C9 58 BC 66 F9 A2 F9 
0B 96 1C 4D 97 EB B7 EC 3A E3 97 55 EB E7 7F DA 20 DA E1 FD 52 FE 73 04 E0 37 18 89 7A 13 98 E6 
63 38 5E 9E 03 BE 72 1D 19 96 EB D6 F2 72 1D 74 72 CD BF 35 CE 75 DA 7F 98 9C F4 DA BF 2E 9C 1B 
35 7F 1E 8C 93 5E E3 6A 89 4B DA DF 1D 91 AC 7D BF 93 73 5D 99 EF AE C8 46 45 C5 36 FB 55 37 82 
95 E7 EF 51 BE 3F 9D 36 66 A3 41 5F E6 C4 BB 95 8F E9 CC 1D 7A 0D EA D0 6B 50 7E 76 7A 5A 66 8E 
C2 59 50 58 64 6C D4 D5 E7 84 AF E5 9F 01 60 B3 2B 6B B7 1E 2B 2C B1 EB 1D CD 84 46 C4 39 A9 8A 
D6 3F AD 5D 55 55 CD DB 06 45 51 B5 5F 9F 60 B3 AB FF FD 82 33 89 ED 38 1E 6E 4D 7F 85 F8 D5 DF 
7B 4E 4C 51 B5 7E BD 38 31 55 D5 F8 03 E6 2A 97 39 D7 B8 66 AE AA 06 CD 3F 1E C6 55 AD 5F 30 95 
C8 AA F9 B8 5E E1 64 D3 DC D8 A6 32 45 5B 4B CE A9 44 D5 FA 73 E7 C4 AC 1A D7 4B A4 70 66 D3 FC 
A9 D9 39 B3 A9 5A B7 E9 36 4E FC 9A AF 8A 23 45 97 56 EB BA 3D E7 54 C2 19 11 71 0D 8D 55 4E 25 
AA 44 DA B6 94 36 95 D9 89 71 6D 65 94 A8 4C E1 EC DA D5 06 91 FC F2 BA F9 57 2C CF 28 CF A6 72 
22 45 C3 4F 8F 13 E5 2A 9C B8 B6 92 55 4E 5C 43 43 46 7B DF BA BD 45 93 DA AE 57 58 99 82 C3 A3 
82 C3 A3 B4 B7 F7 CF 00 28 2A B6 DF F1 C5 96 46 26 39 C7 E9 85 A1 8C 91 C2 5D F7 B7 F3 7F F6 58 
8C 92 E4 38 50 AE 66 D6 49 32 73 FD 15 67 44 8C 91 59 FF 4F 67 21 63 4C 09 DC 7E A1 91 A3 F6 3A 
A6 1A 24 AD 1B 3F 3D 53 F5 9A 1B 9B 24 55 2A E3 B7 76 35 46 44 C4 8D B2 A6 4D 14 23 95 31 6E 96 
B5 D6 20 33 2E 6B A8 A1 94 41 E2 3A 49 43 63 89 88 C8 AC AD E0 D2 5B 25 CD B2 D6 00 67 8C 02 64 
AD 05 CB 8C 0C 5A 0A 26 22 22 A3 4C 92 B6 0D 3B 23 6E 92 B5 1F 34 72 26 D9 B5 B6 25 2E 31 AB C6 
A6 8C 29 4C 6B D4 92 24 D9 B4 9E E9 62 24 31 DB 95 EF 8E EF CC EB D8 B6 E3 6D 65 EC 93 31 D2 7E 
D9 A5 C4 98 A4 F9 86 02 59 62 CC E9 DF E3 F0 A9 8C 6F 56 24 BD 15 1B 59 2D AC CC EB 2D BD 94 7F 
06 00 31 22 95 4F 1B D9 A9 D3 4D 75 9C 47 B7 2C 33 59 E3 EF AC AA CC 9D 33 F1 FE B8 D7 3D 5D 05 
80 F7 B2 A6 75 E8 DA B6 BE A7 AB B8 92 AA 7E BA EC 90 CD A6 F9 A8 D0 3B F8 69 00 10 11 91 4E 66 
06 ED 7B EC 00 00 82 F1 E7 00 F0 51 E2 9E 04 06 D0 46 43 DF 2A 68 22 50 00 2C 5C 97 94 91 6D 71 
F3 4A DD 7D F3 81 24 B1 DD 47 23 F2 2E BC E6 E6 F5 02 F8 91 C3 16 DD D9 85 3B B5 5F 97 51 19 A2 
AB 05 F5 EF 92 20 79 59 07 72 79 F9 4D 00 B8 F8 33 2C FE E3 F0 94 C5 FB 63 43 0C 5E FE F7 62 44 
69 B9 E6 FC DC FA FE 72 5B 1B 80 FB 65 29 FA F4 BD 67 3D 78 EF A7 AA F2 5A D1 C1 3D DB D7 0F 30 
1B 5C B7 F6 62 7E 12 00 2E B7 EA 05 96 E2 00 1D 9B F6 7A 5F B3 C1 AB 87 D9 91 65 79 EE 9C 89 FF 
8B 7B DD ED C7 16 00 7E 63 75 FA D7 77 DC F7 80 A2 78 EC 8C AB A5 C8 F6 C8 84 95 CB 37 24 DD 77 
47 4B 4F D5 E0 16 7E 12 00 5A 30 22 83 4E 32 7A E8 4E 0D ED 74 12 19 71 EA 1A C0 31 BD C4 74 12 
E9 24 8F FD 96 6D 76 85 11 C9 55 30 D2 43 25 C3 96 06 00 40 50 02 1D 01 5C 45 51 D4 82 22 9B A7 
AB B8 9A 2C 4B 45 56 29 AF A4 36 7A 80 00 1C 29 B4 92 A5 E8 9A A1 20 2A 17 0F 34 1B 74 95 3C B8 
7F D5 13 34 00 54 95 EF 38 70 EE FF BE DF EE 85 87 70 C5 C5 35 7E 96 C7 7A BA 0A 00 EF 55 AC 9A 
BE DE BD A4 2A 5F 91 13 BD 31 E4 E6 4E AD EA F8 59 06 08 1A 00 25 36 FB BB 73 77 DD DA 30 BC 43 
B3 58 4F D7 72 05 49 92 D6 6F 5A 7F 5B F8 29 4F 17 02 E0 BD 76 E6 35 6E 7B 4B 33 F5 9A 51 A1 B5 
0E E0 51 EE 17 64 9B 13 53 3E FE 79 57 AB 26 71 21 81 BE 7D D9 CF 55 04 0D 00 22 22 E2 CD 1B 44 
F5 E8 D4 D8 D3 65 5C ED E2 C9 5F 7B C4 61 4A 48 00 87 EC 69 D3 6F BF A5 EC 19 4E 2A 49 6E A1 6D 
CF 89 EC AA 7C C5 AA E1 57 87 33 00 20 04 2F EC BA F5 4D 08 00 00 00 41 89 DC 05 74 B5 13 67 33 
53 2E E6 FE F7 11 26 31 A6 65 48 67 46 92 24 69 E9 80 94 64 C9 F9 FA 64 49 3E 9D 61 DA C9 FA CB 
92 A6 61 78 65 66 63 CC F5 B5 10 8C A9 92 B6 A1 7A 75 DA C6 E9 95 98 2A 4B 5A 57 A8 A5 6F 56 66 
AA AC 6D E4 6A 83 B6 D1 8C 25 C6 75 5A 57 A8 6A DB A3 D4 32 2A 3C 11 11 23 AD 13 10 90 D6 C9 3F 
B5 37 D3 D6 0D AE 79 8A 04 8D 2F 5D 9E B7 AC B1 A3 DE D9 EB 96 8E 01 A1 AA 5A 66 2B B8 A4 02 0D 
45 18 71 48 98 00 70 F5 AD 3B 7E 36 F3 D3 D9 5B B7 9D CE 2B FD 02 A8 9C EC 5C D3 B4 2E 56 85 73 
72 DD B2 74 85 AA AB 4A 38 51 A8 3E FA 53 75 B0 CB DF 93 CA 99 42 64 23 17 9B 7F 46 64 24 52 35 
FC 8E 65 22 99 C8 E6 6A 56 2C 89 91 8E 48 25 72 39 C3 89 8E 91 44 64 75 35 E3 02 23 D2 33 B2 71 
72 99 78 A5 15 16 BB 6A 46 44 92 E6 4D 26 91 B6 2D 12 23 62 AA CB B9 0A 4A 6F 4C 8A D2 10 51 8C 
B8 59 52 0D 5A 26 60 60 64 96 14 A6 A1 4A A3 A4 EA B4 CD A6 10 A8 D3 16 DE 8C EB 35 EC 5E 48 8C 
4C 92 A6 E9 16 F4 12 D7 32 E7 04 11 99 65 D5 C9 46 3B B5 C4 B0 2E E5 77 95 73 93 5E D2 32 1A 8F 
44 CC A8 D7 D4 DB 61 32 C8 12 63 9C 73 46 D4 EF B6 84 1B E2 CB 31 B9 8A 2F 12 26 00 5C C9 CC B1 
6C 3B 9D FB CD 0B 5D 63 AB 87 10 91 86 4D FA 25 5C EB 88 54 9A D6 28 CB F2 2F 0B BE BE 27 66 BD 
EB D5 91 F4 CF 06 C7 45 BB 12 85 69 D9 C8 29 9C 69 B9 AE 5A 25 AD F3 55 D9 55 A6 6A 98 AC 8A 13 
D9 14 4D 3F 4E 85 4B 5A 56 48 44 56 45 D3 17 5B E5 92 96 E9 B4 54 CE 14 6D 33 A6 29 AA CC 35 74 
AB AA 9C A9 DA E6 4A D3 B8 42 CE 25 8D 73 BA 29 AA A6 29 24 39 67 9C 6B 9A 51 8E AB 3A 2D FB E1 
76 4E 4E 27 67 BA AC 58 F9 F7 CB EA F0 4B 5B 4C 14 1B 66 2C D1 B6 C6 62 AB C2 89 97 B8 1A A9 DF 
AE A8 76 85 E7 5A 88 88 6C 76 F5 F7 A4 F4 36 CD 6A 21 00 84 C1 89 11 8B 08 0D 88 0A F7 F0 84 3E 
A1 01 25 31 21 2B 3C 5B 03 80 A7 68 D9 9F 5A 99 36 FD 8E FB 3A AB DA 76 D2 CA 31 66 DC 3F 4D 0B 
0A 4B A6 3C 3E 5F F3 62 3E 0C 01 70 5D 6C 76 ED 53 BD 6A 22 CB B2 A2 AA 36 55 D3 5C AC 00 62 52 
B8 A2 72 C5 BD 77 02 1B 74 97 8F 8D 64 49 D3 41 B3 1F 40 00 5C 97 D1 DF BE 9D 9E 9F 55 FA EF 32 
77 34 CA 3B BB 0B 63 EC 6C DA 89 35 C9 AD DC 50 1C 80 9F BA 68 5B 31 FF EC 7E CD DD B4 AE 15 D9 
4A E6 8D FE 4A AF D3 D4 EB E5 4F 10 00 15 94 57 54 60 53 6C 89 67 0F 1F CB 49 75 FB CA 4F 5A 8C 
6E 5F 27 80 1F C9 4C 2E C8 74 E3 EA CE 58 73 2F E6 66 98 0D A6 C8 E0 70 37 AE D6 FB 95 E3 3E 00 
55 55 4A 55 5E 35 3E E4 D7 DF 17 77 7C 7D C0 F1 4A D8 FA 03 40 15 AB 6D 08 ED FE F6 E0 77 66 4E 
52 F8 3F DD 4A 42 F4 00 69 3D 02 E0 E7 8E EC 1E FF C2 9D D3 57 9E 27 BA 35 A3 78 7D A4 D1 BB 0F 
1D 98 44 8C 71 E9 72 BC 71 49 52 19 73 E3 95 BD 2A E7 45 8A 8D 88 C2 0D 81 77 34 ED E2 AE A1 C9 
19 63 07 8F EF 68 12 70 D4 2D 6B 03 F0 4B C7 8B 9B 35 A8 DB CC 2D 5D 40 8C B1 6D C7 F6 1C CA 39 
5B A4 D8 54 5E 95 C3 8B 7A 05 D7 DB 71 6E B3 AC 59 30 EB 89 FB 47 9D BE F4 40 44 E5 56 54 21 0A 
63 05 8C 51 66 06 65 66 D1 85 0B C6 C3 C9 EB 0F AD 6D 32 E3 10 C5 86 11 11 E9 E4 76 C9 19 61 29 
C5 BA AD 35 28 36 86 42 43 29 2C C2 CE DC 73 17 74 A3 F0 5A 6F 3F FA AA 5E 72 5B 22 FE 34 E7 FD 
21 B5 7E 75 D7 DA 00 FC CF EA B4 E7 7A DD 3B DC 5D 6B FB 74 CE D4 43 7F CF 71 D7 DA 7C 8B 8B CD 
56 76 6A F2 27 E3 5E 18 FF ED 6F A4 EF F8 DC 73 0D 3E FB F0 FB AA 29 AB 1C 0A 0B 29 E9 E0 E0 AD 
8B 9F DF B4 85 16 16 D0 C1 24 22 32 12 75 25 A2 FD 97 5B 35 22 6A 44 44 2B 3F 27 22 6A DA D4 D0 
B0 D1 3B 99 C1 86 DA BD E9 96 FA 14 78 5D D7 7D 72 22 45 55 4B EF 32 B1 14 17 1E 3D 77 42 CB CD 
C3 8E C8 B2 74 3A 37 23 D1 58 4D CB F5 E9 00 62 3A 9E 7D FE C0 A9 43 CA 75 5C 05 14 13 59 3D 3A 
EC D2 35 FE 5C BC 1D FF 7F 39 0F 80 82 B1 83 FB 7F B9 E9 C8 80 A7 FE EF C3 37 47 9F DF 35 F5 B3 
0F AB A8 2C 17 18 35 64 8A B4 73 37 6D DF 48 EF BC 43 44 E5 1B D2 F3 E0 41 F9 E0 C1 B6 44 B4 E9 
07 1A 49 34 76 2C F5 EF CF 28 D4 5E 9E 4D AE AA 2A 44 A4 70 95 73 95 88 73 CE A7 FC FA 4D 8B FA 
4D BB 7E FE 68 AC F1 BA CE 23 C9 8C 7D 7E A0 E1 F5 AC 01 BC 8E 28 57 15 56 11 89 AD 78 6F EF F2 
0A 2F 6E E3 CA 37 43 DF BE AB D3 1D CE 1A 89 B1 03 E6 3C 00 78 71 89 E1 C3 1F 7E 7B 72 70 AF 40 
BD 74 BE 8A 4A 72 25 37 37 66 DB C6 35 BF 7D 10 39 F7 88 A3 26 9C 28 27 38 C6 DC B8 9E 29 2A 9C 
24 89 F2 F3 8B 93 0E 49 69 17 CB 18 C9 9B 31 7A F7 5D 7A F7 DD 26 14 FD 7E D7 81 C6 AC B6 14 13 
EA B2 84 AC FC EC EF B6 2E B2 71 E5 B9 2E 0F DC 10 D7 C0 20 1B 16 6F 5A F1 C1 BA 99 CD F7 D7 AF 
61 0C D3 5D 77 E7 92 4E 8C 2F 9F 20 18 63 2C C7 CA C2 8D CA 35 E3 D7 43 45 31 17 83 6A 39 25 11 
DB 72 78 97 4D B1 77 69 D9 31 2A 34 D2 8D 65 F9 1C E7 01 60 7C 75 CE F2 FA 0D 6A 7B CB 90 A1 56 
2B AD 5A 45 93 26 55 FB FB EF AB 9E E1 44 A9 4D DB C7 BD F6 0C 45 47 53 E3 C6 05 5C EE FA EC AF 
53 5F BA AD E3 4D F1 A5 CF 2F 5B BE 67 F3 86 E4 49 2F 74 31 9D 3E 41 E7 CE F1 DF 7E 63 0B 16 10 
5D BE 7A 3F 90 2E F6 D8 F0 25 0D DA 40 4F 3D 4D F7 DE 4B 31 31 4E 0A 99 B1 7C F6 99 FC 34 3D 93 
0F 9D 3E F2 EC 80 11 19 B9 99 93 96 4D 93 99 74 30 FD 24 23 96 6D D7 32 5C 8D 43 81 B2 C1 A2 ED 
B6 7E F0 09 06 59 EE 65 6E BC 3F E7 D4 85 50 56 A2 68 1D 39 04 9C 08 60 4A A1 A2 69 B4 C4 6B 99 
24 D9 2C E9 67 EF 5E 31 69 EB DC A4 BA 4B 11 00 4E 18 1A 36 A8 5D 45 85 B8 74 E0 00 BD F1 06 2D 
5D 7A C5 83 91 91 74 DF 7D F4 E0 03 93 FF BC 98 68 61 73 86 0E 28 7D 98 5B 4A F6 E9 CC 8A 39 80 
02 02 4A 1F 29 09 08 3A 6A 0A 52 EB D4 A1 46 F5 89 A8 78 F0 D0 A7 6A DE F5 64 4C 71 FB 93 3B 69 
E1 42 CA C8 B8 B4 C2 A4 43 34 6A 14 4D 9A 44 AF BD 46 0F 3D 44 41 41 D7 16 72 E2 FC E9 4F 37 CD 
29 DD CD CF 28 CA 95 64 79 F9 E6 55 E7 2C 99 32 93 0A 55 DB FB 77 3E DF 3A A1 65 85 DF A5 24 49 
2B 7E 9B D1 A7 FA 2C 51 0E 41 05 20 CB BA 93 EA 23 C3 82 E3 0E 6C 19 D9 FD C6 1C 37 DE BE 24 AC 
CD D9 CF 77 E9 31 B0 62 47 54 87 4E 27 8F 5E F0 81 CC 24 92 F4 F8 91 79 F7 D5 9C A5 14 85 BE FB 
8E 46 8C F8 EF 63 F9 14 63 98 F9 BE B1 57 0F 8A 8D 25 A2 92 7D 1B 94 C2 FC 72 AC 53 62 19 86 80 
0B AD 9A D3 98 11 F4 F6 DB B4 79 B3 7D C6 4C DD CA DF 2E 3D 7B EE 1C 8D 1C 49 D3 A7 D3 D8 B1 14 
12 72 C5 82 4C DA 70 72 57 E9 D6 FF 0C F1 E5 B5 DA DB 37 6C F8 66 F3 42 99 49 44 D4 57 1F F6 00 
0B 33 9E BA 48 92 44 3A 0D 9F AD 4E 47 D2 95 C7 57 92 94 9D 5E D8 82 65 5D D9 4C 43 1C 68 19 1A 
8E 69 5B 15 23 D2 72 47 A4 A6 51 C5 AA 9C 7B 4B D2 B8 36 E7 CD 64 39 CB 66 6C D6 A6 4D 56 D6 3B 
25 59 63 DA D4 4C 25 EE E0 66 1A B7 BC 5C B9 9A 31 CD CD B4 D0 D2 57 A0 FD 15 1D 37 3B 47 35 6E 
8C AF E0 5C 7E 8A CD 4E C4 BD F2 BB EB 01 55 12 00 5B B6 D0 1F 7F 54 FC 1A FC 82 02 7A EF BD CB 
FF 1B 10 90 32 EE 83 47 76 B0 59 7D 07 C4 55 77 DD 5F EF 5A 74 34 0D 1C 98 58 AF C5 1E 7D EB FB 
73 B6 9B 37 AE BA F4 F8 BE 7D 34 68 D0 B5 CD D7 3D D2 8A CC 46 22 1A 52 60 6B 3A FC 99 E4 FA B4 
B5 F7 2D B5 89 EC 44 43 F7 1F 33 7E DE EF 3A CB E9 7C 9D CB 83 7B B9 FC DA 9A 88 02 9C 36 D0 11 
7D 4C 81 81 81 6D DB B6 5B BD 72 8C E1 D5 89 2D F2 53 CB 3E 29 CC 88 B4 CC 38 6B D0 F0 C3 2D 1D 
07 5C CB 7E 83 96 57 D4 B2 AA D2 57 74 49 D6 B6 7B E1 F4 15 3B 15 2C A3 E3 E9 2E 06 2E BF 5C 18 
23 93 89 9E 7D F6 EA 9D 2D A8 A2 00 48 49 A1 D7 5F BF AE 35 B4 6F 4F A9 A9 74 E6 0C BD FA 2A BD 
FC 72 76 8E BA 75 EF 0A E6 D6 8B B7 14 9D E1 AB D8 84 9E 9F 3F 53 EB 64 12 0D 1D 4A A9 A9 D4 A5 
0B 9D 3C 49 A7 4F FF B7 59 7A 90 FE 84 5E 4F 44 2A 51 BF DC 42 89 E8 64 CD BA D1 C4 89 28 58 E5 
8D 4E 66 95 BD 76 F0 5D 2E 37 32 45 44 45 4E 1B C8 44 44 06 83 C1 60 30 48 06 C3 1B F1 37 4F D8 
66 6F 7E F1 A2 9B EA 13 51 28 2D A1 9F 97 94 63 81 9B 6E A2 E7 9F AF B4 72 7C 58 95 04 C0 F5 DF 
7F 2B CB B4 6C 19 9D 3F 4F BD 7A 11 11 65 A7 5D 7F 51 D7 92 38 91 C1 40 5D BA 50 72 32 CD 9C 49 
35 6A D0 F8 F1 94 7A C5 60 0F D6 B0 80 7C 46 44 54 CC 28 2C BB 88 88 AC A6 4B 23 48 99 89 4C 99 
CE B7 04 9A E0 E8 D4 DF A8 44 44 DB B7 6D CB CB CF 0F 48 4A 5A 9E 93 43 E1 E1 84 00 A8 4A FB F6 
91 C1 40 AF BE 5A 7A D5 38 FC AB 4A 02 20 28 88 06 0D BA AE E3 AF 88 08 6A D2 84 9A 37 77 5F 4D 
4E 05 04 D0 33 CF 90 DD 4E AD 5A 5D 35 C8 A7 DE 92 13 38 EB F5 82 92 3C 23 E7 F9 C3 5F A2 19 BD 
F5 07 B6 D8 D7 7C 61 60 72 A1 4E 57 BC 66 2D 45 C5 5E 6A AA E5 0C D5 B5 E7 03 65 F9 CF 45 5F DE 
16 F3 C9 95 CD 2A FE 56 2A C2 4E 9A 26 F8 B3 13 69 99 9C 51 CB C5 1A AA B6 55 69 99 5C 92 13 D9 
35 34 53 34 CC 19 C6 B5 7D 0E 2E A7 5B 93 69 DB FA 25 1D 8F 5C 38 67 6D 14 D9 E3 9E 94 DC C5 71 
4D 4F 51 57 C7 AF E8 32 FF 35 CE FC A8 E5 08 59 FB 14 8D 5A 56 A5 85 4D DB 27 6F 75 B6 C2 82 C2 
CE 41 09 2D C8 66 23 AB AB AF 97 A2 D0 E2 C5 94 9B 4B AA 4A 18 C7 EC 1A 55 12 00 B7 DF 4E 5D BA 
5C D7 1A 18 D3 74 4E D5 BD 74 3A AA 5B F7 AA C7 AA 71 B5 6E 78 DC C5 0B 79 32 B1 B9 A7 76 0C 18 
F2 78 BC 4E B9 B0 3C AF 8E 29 C2 A2 D8 F7 58 F3 EB 34 68 70 9D 2F 9B 52 23 8A 6A 5E E7 3A AA 8A 
DF 1F AA B8 E5 0D 32 F5 BE CC DD 75 AA E5 D6 4A DB BF 64 8F AD C3 D0 68 D2 9F 72 C7 7A 7D 93 C6 
C8 71 1A 12 1B D3 EE BF 63 F0 E3 64 57 5C EF 66 95 94 50 52 12 ED D8 A1 BD 40 A1 54 C9 56 55 A7 
F3 C0 E6 BB 72 48 4C EA D3 BA FB D6 E5 87 88 68 E7 85 23 73 7E FF 65 F0 ED F7 74 8D B9 F1 78 76 
8A CC D8 C4 E5 5F B6 68 D4 AC 6E 0D C7 D7 CE 2A 0A 65 66 3A 9B A3 48 96 03 72 0B C8 C3 93 92 81 
7B F1 3A 74 9C D2 79 2D C6 46 DE B8 84 E5 59 3C 5D 8F CF 33 E4 17 50 46 06 39 19 0A 22 34 94 4C 
26 22 22 CE 71 EE D7 09 3F D9 2E 57 A5 7E B7 F4 FC 68 CD 8C 3C 6B A1 8E 49 63 57 7C D1 A9 59 FB 
51 3D 87 3D 35 6F BC 91 C9 A9 96 AC F7 7E FE F4 EB 67 3F 90 1D 0D 0E 9A 96 56 7A DD AA 13 77 BB 
BF 64 F0 B8 D2 C8 E7 8C 72 3C 5C 88 5F E8 4E 2F D3 E3 2F 3B 6B B1 67 0F B5 AC F8 ED 38 E2 40 36 
96 5B B5 D0 C8 CF 1E 1C 77 C6 5E A0 70 F5 A9 F6 03 4B AC 25 7D 3A F4 F8 5F E3 6E 44 14 1D 10 76 
57 DB 9E E9 D9 19 65 2F B9 6B 17 ED DD 5B A5 B5 02 88 E9 E0 41 DA B6 8D EC 5A CE 2C 09 0D 01 50 
11 5D 6F EA F4 61 E7 C7 64 26 7D F1 F7 FC 37 7F 7C 9F 31 F6 F2 90 51 9C F3 B4 A2 DC 07 7E 78 63 
DF E1 FD 65 2F D6 BD 3B DD E1 74 FC 29 00 70 8B 07 1E A0 F6 ED C9 66 F3 74 1D DE CE 59 17 50 FA 
E9 C4 5D 49 A9 FF 9C 07 63 07 76 1E 26 22 A2 F3 EB D6 AC 0E D1 5F EA E2 30 84 D6 E9 D6 A1 82 B7 
E4 F9 2E C6 58 78 50 18 11 99 24 9D 4E D2 71 A2 90 C0 60 CE 48 22 0A 95 8D 0E 87 83 0E 0D A5 9C 
1C 22 A2 BB EF A6 97 5E 2A FB FC 95 24 ED 5F F9 5D B3 EA DF 62 F0 48 00 47 92 73 5E 6E D4 7D 40 
19 BF 20 C6 E8 CF 3F 69 EC 58 4F 14 E5 93 9C 05 C0 85 63 1B FB DC 31 EA 9A 87 B7 FF AF FF E5 9B 
5D BB 3D FB A3 80 01 70 BD 6A D6 A4 8E 1D 1D 3D B9 FF E4 C6 66 BE 72 15 10 80 27 1C 4F 6B D4 C8 
D1 2F 28 C3 41 07 2C 94 C5 59 00 84 C7 B5 FC EE BB EF 9C 2F 6F AA 76 83 3B CB 01 12 E0 DA 4A 00 
F0 0E CE 02 A0 66 42 A7 61 09 9D AA AC 14 00 00 A8 4A 38 09 0C 00 20 28 04 00 00 80 A0 10 00 00 
00 82 42 00 00 00 08 0A 01 00 00 20 28 8C 05 E4 75 18 A9 24 55 F9 10 D0 00 BE 83 31 77 4E 06 25 
32 04 80 D7 D1 47 F7 FE 31 BB 83 A7 AB F0 56 DC 9D C9 78 FD 33 15 01 95 35 AB 45 85 69 FC 8B 18 
43 C3 DD F6 92 62 43 00 78 9D 7B BB DF EC E9 12 00 40 08 38 07 00 00 20 28 04 00 00 80 A0 10 00 
00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 
00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 34 0F 07 
AD D8 B2 73 F3 EC 0A D7 1B 4D 61 21 41 95 59 12 00 00 54 05 D7 01 60 C9 4A 59 B1 78 E1 DA 8D 5B 
F6 1F 38 94 95 5F 52 2D B6 4E D3 A6 4D BA F6 19 D0 AF 7B C7 60 A3 5C 05 25 02 00 40 65 70 11 00 
29 49 1B EE EF DD 7B E3 59 2B 11 45 44 C5 04 99 F5 49 3B 36 FC FD C7 EA 6F A6 7E D2 E3 A1 D7 BE 
FF E2 AD 1A C1 86 2A A9 13 00 00 DC CC D9 39 80 82 F3 07 87 76 EF B6 E9 AC B5 61 9B BE 0B D7 FC 
B5 6B F7 EE 3D 7B F6 EC DE BB F7 BB 0F 5E 22 A2 B5 3F 4C 7C FD F3 C5 98 9A 13 00 C0 47 39 39 02 
50 57 CD FB E6 CF F3 44 F5 3A 7D 3F 67 66 87 86 D5 4B 1F 8D 88 88 AC FB D2 44 2A C9 7C 78 EC 77 
DF BD F1 C4 E8 27 07 36 8E 40 47 10 00 80 EF 71 7C 04 60 C9 DC B8 E6 33 22 7A F0 BE E1 ED FE D9 
FA 5F C2 F4 7D EE B8 8F 88 88 72 52 4F 5C AC CC F2 00 00 A0 B2 38 3E 02 30 87 8F F9 EA D8 88 9C 
3C 43 58 AD 6B 53 C2 1C 79 E9 42 20 C5 56 54 59 A5 01 00 40 65 72 1C 00 92 2E AE 4E FD B8 3A 65 
3F 99 77 3E A7 F4 1F 41 51 D1 95 50 15 00 00 54 3A CD F7 01 5C C1 BE 6A D9 4C 22 46 3D C7 B4 A8 
87 7B 02 00 00 7C 52 45 02 E0 F0 BA 39 23 DE 5B 4C 44 BF 8E 1F 11 A8 E5 56 62 CE 89 73 67 0D 18 
23 C6 2A 50 09 00 00 54 58 B9 87 82 38 B1 73 79 FF 7B 1E 26 A2 31 53 16 F5 6B 5D 5F D3 32 DF 7E 
4B B2 EC EC BF 0F 3F 2C 6F 19 00 00 70 9D CA 15 00 EA EE 35 73 EF EC 75 E7 D1 3C 1A F5 EE AC 37 
9E EC AF D7 B8 B4 5E EF A2 41 4E 0E 1D 3F 4E 99 99 E5 29 06 00 00 AE 8B E6 00 50 0A 17 7E FD 5E 
B7 5E 43 93 B2 E8 B5 29 8B 26 BD 3A 2C 58 EB E6 5F 83 09 13 A8 41 03 DA BA D5 6D 2B 04 00 00 57 
34 9D 03 B0 5B B2 BF 9E F8 EC 33 EF CD 26 39 E6 B3 9F 7F 19 79 4F 27 B9 5C 3D F6 2D 5B D2 C2 85 
65 3F 65 B5 D2 90 21 97 FE 8D D3 00 00 00 55 C8 75 00 58 F3 33 A6 8C 1D FE CA 94 A5 54 AB F3 B2 
9F A7 F5 ED D0 A4 DC DB E9 96 2D A9 65 CB B2 9F 2A 29 29 EF CA 00 00 C0 2D 5C 05 80 35 6F DA 5B 
C3 5F 99 B2 94 12 FA 6F 5F FC 55 9B 1B 6A B8 F9 F5 9D 5F 1D 04 00 00 95 C6 79 00 28 BF 4C 1D FB 
FC C7 4B A9 4E 9F 5D 2B 66 B4 AA 57 AD 8A 8A 02 00 80 CA E7 EC 44 EE A9 ED 2B 9E 1E FD 39 51 AD 
C5 F3 3E C5 D6 1F 00 C0 CF 38 3C 02 E0 25 B9 DF 7D 31 39 C3 4E B7 0E 1A D4 A0 9A E1 C4 89 13 65 
36 93 4D 61 75 62 23 2A AD 3C 00 00 A8 2C 0E 03 20 37 3B 75 F9 8F 7F 11 D1 A6 5F 3E BE F1 97 8F 
1D 35 EB 3D 76 E9 CA F1 77 56 4A 69 00 00 50 99 1C 9F 03 60 52 DD 5B 3B 45 9A 03 9C 2F 5F 2B C4 
E8 E6 8A 00 00 A0 4A 38 0C 80 B0 E8 1B 7E D9 B8 A9 2A 4B 01 00 80 AA E4 BE BB 79 01 00 C0 A7 20 
00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 55 B1 39 81 A1 12 E5 
E5 E7 59 ED AA A7 AB 00 F0 5E 3A 9D 21 2C D8 C5 2D 4A A0 05 02 C0 EB CC 5B 38 BD 95 61 09 86 49 
85 8A F3 9B 99 35 1C FC 0A F6 DB 1F 7F 74 D8 83 55 5B 8A 7F 42 00 78 9D 20 BD AD 75 EC 66 4F 57 
01 E0 BD 32 D2 1E F2 74 09 7E C2 4F 02 80 13 29 8C 11 71 B2 14 92 A2 C8 27 CE 8C 4B 4B 8E DA 66 
A0 B4 C3 C4 18 19 0D B1 87 CE B4 CE CB 67 05 05 A4 18 C8 68 24 26 71 FF D9 4D 02 00 A8 08 BF 08 
80 8C F4 76 E7 0E F7 DC B9 8F 5E DD 4C 53 3E A7 A2 A2 40 A2 B7 88 E8 CF CB 4D BA 11 75 23 A2 99 
A3 A8 51 23 BA F3 4E 5D FD 86 83 CE 65 07 E4 47 7A A8 62 00 00 CF F3 D5 00 C8 97 24 9E 9E 49 3B 
FF A6 A5 4B 69 C3 86 DE 47 8F 12 11 AD D6 B0 64 72 32 7D F4 91 9E E8 61 22 FB 8E 46 B4 FA 36 1A 
30 80 5A B7 E6 52 39 2E 88 E2 9C A7 64 5D 20 A2 33 B6 FC A6 D6 42 CC 6B 06 00 BE C8 07 03 40 55 
03 B3 D3 76 24 2E A9 D1 6A 38 D9 EC 0E 5B 11 31 A3 91 05 05 91 AA 52 61 21 2F 29 B9 B6 C7 47 77 
34 99 8E 26 D3 F4 E9 A4 D3 D5 E9 FB 60 5F 43 23 A6 6A BA FC 66 77 72 E2 F8 AD 73 C2 24 C3 D2 87 
3F EC D5 B6 9B 41 A7 2F B1 5B 5D 2F 86 59 EF 01 C0 9B F8 5A 00 9C 3A 45 D3 A6 D5 9D 3C B9 EE 35 
CF 14 07 06 9B FE 37 88 E2 E3 29 21 A1 B0 4E FD B7 DF 5C F9 BF 27 6F 69 D5 22 9E 38 27 45 D9 F4 
7B 62 EA 9F C9 03 7B C7 EA CF 9C A2 13 27 E8 87 1F AE 58 D8 6E 8F 5E 32 EB 4D 22 1E 72 94 1E 7F 
82 6E BA 89 F4 7A 47 25 D8 55 E5 CD 79 1F D4 D0 05 10 D1 F0 9F DE 3A D8 B4 75 54 E8 BF 5D 49 0E 
0E 05 4A 4A 28 35 95 2E 5E BC F4 BF 47 8F D2 91 23 54 BB 36 99 CD E5 FF 08 00 00 DC C3 77 02 20 
27 87 66 CF A6 51 A3 CA 78 6A DA 97 8B 0E 96 6C 31 56 9B 3C 79 08 49 32 11 D9 2D 25 93 43 F6 F5 
AD 5D 97 EA C6 97 36 39 73 C4 32 37 56 E9 FF C0 BD 7A BD 44 36 5B C9 BB 13 67 8F 9D DD 43 97 56 
7B E6 47 FF 5D 13 9B 31 93 66 CC A4 C7 1F A7 11 23 A8 75 EB 32 F7 D9 B7 1E D8 B1 FF E2 71 C6 18 
E7 FC 9D DB 1F FF 77 EB 1F 2A DF 4C 6A A0 55 CD B9 62 21 55 A5 0D 1B 68 E6 4C 9A 3B F7 F2 DA 56 
AD A2 84 04 1A 30 80 9E 7E 9A 6E BF 9D CA D3 FB 04 00 E0 2E DE 14 00 99 99 94 92 52 F6 53 C9 C9 
34 76 2C FD FD F7 15 0F 0E 1F 4E C3 86 51 DB B6 64 34 26 7E B5 E1 4C 6A 7E E9 D6 DF 19 55 25 92 
48 AF 57 AB 47 2D 8A 69 18 79 7B AF DA 5F 8C A7 5D BB 68 DE 3C 9A 3A F5 72 B3 E9 D3 69 FA 74 1A 
33 86 86 0D A3 90 90 2B D6 20 C9 8B FF 58 C4 18 23 A2 0B 64 BF B7 61 2B 4A 49 E1 8C CD D9 74 AE 
63 A3 A1 01 01 C6 E2 62 DB D6 83 45 DD 6A A5 C8 8C C8 62 A1 8F 3E A2 E9 D3 2F 2D 7B D5 A9 82 C5 
8B 69 F1 62 1A 3D 9A 9E 7C 92 0C 86 4B 0F CA 72 40 56 2E 61 96 1D 00 C7 0C 59 D9 74 E1 3C 29 D7 
74 D8 32 46 59 59 9E A8 C8 57 79 53 00 3C A4 E1 DA 5E C6 88 F3 BC 7E 83 3E B3 37 7B 74 C2 A8 B8 
EA 61 97 1E AE C8 EB 71 62 8C CC 66 EA D4 89 3A 75 3A 7C F7 03 85 AF 7E 7A D3 FE D5 AC 24 E7 D2 
F3 93 26 D1 A4 49 57 2D 53 44 74 E8 B1 36 A4 D7 11 D1 F8 2C 6B E4 8D 2D 89 28 B9 C5 A0 9D C3 9F 
0F 0F 0E 20 A2 80 00 63 7A 09 DB D6 E7 C5 5B 0E CC D7 54 C5 E4 C9 34 79 F2 7F 1F 18 50 91 F7 02 
20 90 DB 69 0C 3D 35 C6 D3 55 F8 03 4F 77 3E 48 12 BD FF 3E BD F6 9A 8B 66 09 09 97 FE D1 B3 27 
FD FD F7 E9 0F 3F FB 20 BC 16 73 EB B5 37 F9 D5 63 1F 69 3D E0 DC 9F 7F D2 87 1F 12 11 31 46 0D 
1A 50 58 D8 55 CD 72 AA 99 53 24 89 88 AC 8C 6E C8 B4 94 06 CF F1 EA D1 81 66 D3 BF 6D F4 46 C3 
B1 B0 C0 4B FF D3 A1 C3 A5 7F 4C 9D 4A F5 EB 5F FA F7 D0 A1 34 6B D6 A5 7F 47 45 B9 F1 5D 00 00 
11 D1 0B 2F D0 84 09 E8 5C 75 C9 D3 1F 90 C1 40 63 C6 D0 E3 8F BB 68 16 15 45 3B 76 D0 94 29 B4 
60 01 75 E8 C0 64 57 5D 3D 15 62 E2 9C EA D4 A1 17 5F A4 43 87 E8 FE FB 69 D4 28 AA 57 EF AA 36 
5C A6 D2 0B 8F 54 62 3A AB 52 FA 60 7C 4C 9D 70 23 00 00 14 3B 49 44 41 54 C6 85 12 EB E5 AB 80 
8C 96 BC D8 7F 2F 4F 9A 30 81 56 AE A4 63 C7 E8 E9 A7 C9 FE CF 83 11 11 F4 F0 C3 B4 6B 17 3D F5 
14 4D 9B 56 19 EF 05 40 68 8F 3C 42 AF BD 46 46 F4 A5 BA E0 1D 5D 40 61 61 B4 6E 9D B3 AB 24 F5 
7A BA E9 26 6A DD BA 2A 8A 61 8C 12 12 E8 FB EF A9 A8 88 5A B6 24 45 F9 EF 93 81 76 6B F4 AA 29 
F9 C5 D9 26 CE 0F DF DA B9 EF B8 19 8C B1 04 C6 9A 9E B4 1E B7 E9 F4 7A 9D 41 C7 E4 E2 82 8E 93 
86 93 FA 08 11 51 E3 C6 14 1D 5D F6 0B B5 6A 45 53 A7 D2 E9 D3 B4 7E FD E5 07 65 39 71 D5 0F CD 
A3 66 54 DE FB 03 F0 75 87 B3 5F 4C E8 DE BF 8C 73 00 FF 8A 89 A9 C2 72 7C 98 D7 04 40 B7 6E 9E 
2E E2 4A B2 4C 41 41 D4 B9 F3 55 0F 87 12 35 3D F2 E7 B1 43 7F 10 D1 9B D9 49 43 9A 37 8E AB 56 
43 22 7A FA 56 75 7B E2 99 53 69 96 98 70 D3 2D 83 7A 9A 8D 4E 3F D8 7F A3 8E 31 8A 8F A7 F8 F8 
FF 3E B9 FF DC DF CD 6B BA ED 7D 00 F8 9F 13 69 8D 13 3A 77 D1 D4 14 BD 40 4E 79 47 00 F8 94 41 
B7 DE B9 28 69 83 C4 58 14 E9 5F 9D 31 FE B3 A7 27 44 04 87 E9 65 A9 E3 4D F1 1D 35 AE 62 F7 6E 
9A 3A 95 CA BC E9 4C 92 DA 6F DB 4C 57 9F 7A 00 80 CB 9A E6 AF A5 8B 25 65 FF 82 AE 62 B7 3B BC 
B6 10 10 00 15 D0 B1 79 BB BB 12 3A 2F 3B B2 89 88 14 55 E5 DA CF 45 FF 7B 0E 60 F3 66 DA EC 70 
BC CF FA 8E 9E 00 00 22 22 AA 43 3F D3 77 3F 7B BA 0A 7F 50 8E E3 23 9B D5 5A 5C 5C 5C 52 62 55 
C5 1E F9 46 62 D2 D8 07 5F 6A 18 56 D3 CE 55 C9 20 7F B0 60 AA 55 B1 69 5A 72 DD 3A DA B0 A1 92 
AB 03 80 6B 24 24 50 62 22 3D F1 84 A7 EB F0 3A 1A 8E 00 14 EB 91 C4 ED 7F 6E DE B6 6D EB DF C9 
A7 CE 07 44 D4 68 DB A1 43 8B 16 37 77 ED DC 21 32 D8 E4 7A 71 7F 14 13 5E 7D 68 DB 3B DF 5A 33 
6D D3 89 3D 6D A3 8B 54 8D 07 01 37 DC 40 A1 A1 14 1F 4F 36 67 81 51 6C C9 35 C9 05 EE 29 14 C0 
1F 95 A8 21 C6 80 E0 72 2C 10 17 47 4D 9B E2 7C C0 B5 5C 04 80 62 C9 9A 36 69 F4 A8 F1 57 5C 94 
B2 66 F9 AF 44 D4 BC FB 43 B3 A6 4F 6E 55 D7 C1 25 2E 1E 55 7A 8E 55 FA CF 65 45 CC DD 03 B1 55 
F0 28 A8 7A 75 DA B7 CF 59 03 59 5E F1 D3 E4 81 B1 EF 54 6C F5 00 22 D8 98 3E BE C7 BD 8F 3A BB 
0A E8 2A 92 84 AD 7F 99 9C 07 40 C9 B7 EF 3D 31 6A E2 02 22 7A 65 F2 B7 83 7A B4 AB 11 15 5E 98 
9B 99 B4 63 ED 93 4F BE 94 B8 F6 87 9B FB AB 29 5B BF 8F 0D F4 8A 4F 96 13 B7 AB F6 63 29 27 33 
B2 33 33 33 72 82 83 77 7D FF C7 E9 B5 07 02 89 28 D0 60 4E 3E 63 C9 51 4A B6 1F DA 59 3B A6 46 
AD 6A B1 AA FB BA B1 38 E7 AA AA 28 AA E2 BA 69 A9 A0 40 27 4F CA 92 5C 64 32 AA 66 86 F9 6A 00 
1C B1 9A 8C 14 18 54 8E 1F 1D 11 FD D3 58 FD EF A9 63 E1 07 72 77 16 00 29 89 7F BE 35 69 01 11 
4D 9A FB C7 2B 43 BA 5C DA 20 C5 C5 35 6A D2 BC 61 5C D8 8D 3D 86 D3 81 D9 8B 36 BE 30 B2 4F AB 
AA A8 B4 0C 8C 88 F2 2C F9 A7 2F 9C 39 94 B6 69 5F F6 01 FD D3 AF 4B AA 2E 5A 36 E9 25 39 DC 44 
6B 8E 11 1D BB 62 81 21 5F 2F BF 60 2F 24 A6 0C 6E 70 7B 5A 71 60 56 81 39 D7 12 1F 1A 18 52 F6 
EA B5 D9 9E 76 24 E4 E5 DB 14 07 DF A4 F2 1E 79 70 A2 38 AE 7B 88 DA 5C 4F 49 00 FE AD 3A FF FE 
E2 5F 33 2B B6 8B 14 CE A5 A0 CB 7B 57 A2 EF 66 39 0B 80 BD EB D7 5C 50 49 D7 69 C8 90 BE 9D AE 
FA 9C 6E B8 65 C0 C8 E6 C3 A7 26 D2 8A 3F 4F 78 20 00 18 05 C9 EA 9E A3 89 3F AE DD 33 77 EF CA 
C4 9C B3 B5 0C 21 8C 58 6D 39 94 9C DE 23 6C 90 74 B5 0D 21 44 F4 F7 E9 DD 44 F4 F4 EA D5 1F 6E 
8E 1A 76 53 DF EE AD 6F CB 2D 2C 3D 9F A1 75 8F 20 2A 22 EA DE 1B BB FF 76 78 53 A1 BD 24 4E 71 
EF 9D C9 BC 96 F3 B7 01 20 BC DA D7 F1 A3 E3 44 37 47 37 BC 2B 3C D6 6C 14 F4 2C E6 BF 9C 05 40 
8B 7E 8F 6C 6A D5 CF 2E 07 C5 84 5C FD 59 EB F4 C6 7A 6D E3 28 31 A5 20 A3 AA C7 DE 2B 2C 29 DA 
75 78 8B 1C F4 CB F0 B9 D9 06 C6 18 B1 DA 86 D0 7F 9F E5 44 56 D5 5E CC 95 50 59 1F 64 0A 31 EA 
F5 8C B1 5C 6B A1 A5 B8 40 4F 4C E1 24 33 F9 DF 30 8B 96 03 2C C5 96 A9 5B 7E FE F8 EF 9F E2 4C 
31 45 52 C3 22 6B 67 D2 76 11 7E DF 4E 3D EF BC B5 F7 C1 FF 1B 7C 28 EB 4C 25 BC 4B 00 A8 2C 76 
AE 3E D8 75 D0 80 4E 77 30 BF 3E 02 C8 CF 4C D9 7F F8 14 27 5E 3D EE 86 86 F1 65 8F 39 E6 2C 00 
6A 36 68 5A B3 41 D9 4F 29 76 FB C5 E4 14 22 AA D5 B8 D6 75 D7 A9 95 D5 66 DD 94 B8 F5 B5 79 EF 
5F 28 CC 91 24 32 FE 73 0D 6B 31 B7 9B 98 39 44 17 35 F2 F6 7E 2D E2 9B 44 46 46 1A 75 C1 F1 CF 
AE DC F4 EA 6D 9D 6E AA 53 DA 66 CE 8A 7D 33 D7 EC 9E FC 4C BB 92 C2 FC DD 27 0E FC 75 68 FB 96 
94 23 0A 15 4B 24 31 62 26 26 67 96 A4 13 4B EF FA C1 96 71 3D 1E BB F7 B6 BB 22 42 C2 9D 17 23 
31 89 88 86 74 1A 50 54 52 EC C6 F7 28 49 D2 8E BD BF B7 0E D9 29 7A DF 24 80 63 49 05 9D 6F 6C 
7E CB 75 9C C9 E3 F5 6A C4 97 FE 84 FD 96 5A F8 C3 C4 51 CF 7C B4 88 88 A6 2F D8 59 91 00 70 E2 
D8 CE 55 93 37 12 11 3D D0 A3 59 45 0B 2C 9F A4 53 47 3E 59 38 6D 5E F2 C6 08 9D A9 34 B5 AD AA 
92 27 F1 D1 37 0F EC DE A6 CB C2 B5 A9 E7 B3 0D 4F F6 EF 57 DA 38 CF 52 42 5C FD EF D5 99 9C 73 
A3 14 D8 B8 76 A3 00 A3 EE 96 16 ED 1E EB F7 F0 9D AF CF 6E 19 6F 0D 0A C8 FA 62 CF 12 B2 D9 CC 
92 9E 88 74 2A 7F 77 F5 D7 EF AF 9F F5 5E DF 67 FB 75 EC 15 1C 10 E4 BC AA 61 BD 06 BB FD 9D 06 
E7 A6 0E A9 39 DB ED AB 05 F0 1B AB D3 5E EA D5 6F 98 FB D6 E7 87 C7 01 FB D6 2D 7C FE A3 45 2E 
9B 95 33 00 54 DB 85 94 73 89 5B D7 8E 7D E9 71 22 7A F1 F3 25 DD 9B B9 1E B6 E6 6C 5A 6A CA 85 
94 0A 7F C8 8C 58 E2 C9 A4 F7 7E 9F CE 55 35 42 67 22 22 4E BC 40 61 9F F6 7F A9 4F 87 6E D5 C2 
AB 31 A2 B5 7F 6D 48 CD CE 2F C7 FB 50 55 83 14 DC F1 86 86 FD BB 37 1B 79 CF 63 7F ED DF F6 F9 
EA 59 C9 59 67 88 24 46 4C B1 D9 9E FB 75 D2 BC BF 16 3F DE E3 C1 48 57 87 02 EE 25 4B D2 D1 F4 
F3 DB 78 3D 1C 01 00 38 92 94 73 3A E2 E0 2E 45 DB 0C DE CE 49 8C 9D CE 38 77 FD EB F1 2A 85 69 
47 FF 6F D4 43 76 43 93 E6 61 47 12 D3 9C 5D 2B A5 35 00 F6 6D 99 FE C0 E3 9F AB 8A 2D 3B E3 E2 
F9 F4 DC 96 DD 06 2D FA F1 B5 BE 9D 5A EA 35 6C D6 F7 1C 4B 7C E4 87 B1 01 B2 C3 59 76 5D 62 FF 
0C 9F C6 89 02 75 C6 81 2D 06 7F BD 41 EE 7E 73 8F A8 F0 F0 7F 1A 54 04 E7 9C 11 45 86 46 F4 EF 
D4 27 3A B8 F1 E3 5F CD 0E 08 D9 97 5A 90 42 44 66 49 B7 37 FD F8 53 73 C7 55 FD 86 98 11 FB E6 
A8 37 DE 5D 01 E0 25 18 AD FB F8 D0 5A 77 AD 4D 22 46 44 9C B8 D3 4B 40 B8 CA 79 6A 46 FE A9 54 
5B 61 A1 35 DF 52 6C 29 B6 1D 3D 97 B3 E7 70 6A 58 48 40 4C 64 A0 D6 BB 41 AB 00 B7 CD FE 74 F4 
B2 23 F4 D6 77 6F A7 7C F8 58 62 5A 8E 93 B6 5A 03 40 55 AC 07 0E 1C B8 F4 3F C1 F5 BB 76 6A A3 
53 8A 8B AC 76 BD 59 D3 66 5D 66 4C BA 8E E3 AC 1B AA D5 4E 2F C8 4E 2F CE 1B D9 FE BE C7 FA 0F 
BB 98 A1 4C 59 BB A2 C2 6B 2B 93 24 49 26 5E 7F F6 A8 27 4F A7 1D FA 78 F1 B4 ED E9 C7 DA C5 26 
9C CD 3A 9F 6D B5 B8 F7 85 B4 F0 C3 23 52 00 B7 72 EF F9 DB 33 76 CB B6 67 66 04 07 04 FD 77 33 
C5 18 59 8A 6C 67 2F 64 1F 48 BE B0 F8 AF 93 17 F2 AD B7 8F 5D AE 12 55 33 E9 4C B2 C4 B8 3A 7F 
DB B9 AF 36 9E 2E B4 F3 1C CE DB 44 9A 65 A2 BF F6 9C BE B5 55 7C 58 48 80 D1 20 7B EA 57 9C B4 
7E CE 13 13 17 D7 E9 F1 F4 93 F7 76 7F F3 63 17 8D B5 06 C0 0D 2D 87 9C 39 73 17 71 E5 E2 B9 93 
FB F7 EE 9C 34 72 F4 27 44 B7 0D 7E 69 D6 D4 77 E2 23 02 9C 2F AB 28 4A BA 25 89 A4 50 E7 CD 9C 
A8 57 AD E6 7B 83 5E 09 31 07 76 6C D1 81 11 5D 48 4F AB F0 AA 9C 33 E8 74 DD 5A DD DA 3A A1 E5 
D2 8D 2B 23 22 23 5E 98 FD EE 19 CB A9 4A 7A 2D 07 54 9D A9 96 5D 35 B8 6E 08 20 2C A9 98 8A 53 
DD B9 A7 54 7C BE 45 E3 E6 46 DD A5 DF 9D 24 49 24 B1 A5 1B 8F 7E F2 CB 9E 65 A7 72 6F 8E 30 C5 
05 1B 42 8C F2 E4 11 ED 1B D4 0C D7 EB 75 45 25 F6 67 3F DB 70 77 BB 5A BD 3B 35 4C CF 29 4A 4D 
CF DF 9A 78 76 E5 BE 8B CF CF DE 63 FF 71 4F FF 84 88 3B 3B D6 CB CC B7 06 85 54 BC DB A3 62 8A 
D2 8F BC FE DC 0B 44 F1 53 27 BC 1C 1D E8 7A 33 A2 35 00 02 82 22 03 82 22 89 A8 56 ED F8 D6 B7 
DC 76 67 9F 9E 4F DD D7 72 C1 BC 8F 9E 89 8A FF 75 CA 33 CE 5F A7 77 DB DB B3 5A 5E D7 88 AC 8C 
49 21 81 41 EE 3E 6B 5F E6 B7 87 11 51 48 40 F0 03 BD EF 53 54 65 6B 42 9B 0A 0F FA 50 31 B2 24 
FF 3C FF A3 7B 6B 7C 8C C3 00 00 47 D6 66 8C EF 75 CF C3 8A F6 A1 20 5C E1 9C 0C FF 6C FD 53 D3 
F3 E7 FE B6 AF A5 59 5E 97 94 3E B4 63 ED B7 1F ED D0 A0 56 E4 D2 3F 0E CD 59 9B DC BA 69 AD 90 
40 03 11 15 14 59 75 B2 14 16 6C 8C 8B 09 8F 8B 09 6F 99 40 11 A1 E6 65 FB D2 D6 8C EB 95 99 53 
B8 76 C7 A9 57 7E D8 15 24 4B 35 23 6C 49 C7 2F 36 A9 5F 55 3D BA 4A F1 DC 2F DE 5F 72 30 E7 E9 
0F A7 F5 6A 5D 97 C8 75 EF 45 C5 AE 02 62 D5 EA B6 78 65 CC A7 0B 06 3D BF 62 FE 37 C9 2F 3F 7A 
63 6D 67 07 01 66 A3 C9 17 6F B8 90 25 39 3C B8 E2 47 2D 15 16 68 30 86 9B CA 71 42 1B 40 34 41 
06 73 48 C0 75 DD C0 5F 26 4B 91 75 FE EA FD 53 56 1C 8E 34 EB 54 4E 9F 8E 68 D7 B5 ED A5 D1 D9 
65 C9 D5 0E 19 E7 9C 28 3C C4 DC A4 7E F4 AD 37 D7 7D 6E 48 D1 EB 53 D6 EE 4D C9 1F 32 F1 F7 DE 
CD A2 47 DE D7 A6 56 4C 98 BB 07 24 BB DA A1 2D CB 46 BC F3 5D D4 CD 83 5F 7B EC 5E 8D 5B 76 87 
CD B8 AA 64 67 65 59 ED 76 D9 18 12 15 5E C6 F0 35 31 0D 6B 12 11 5D 4C CF CE CF 24 72 D1 0B E4 
2B 64 8F 75 DC 5D 26 31 EE F1 A9 9A 01 BC 99 24 B9 FF B8 3C 31 F9 FC 3B B3 B6 1E CD 28 7C E9 CE 
C6 B7 B5 A9 57 E7 A5 25 F2 75 CC 3D 1E 11 6A 8E 0A 35 B4 0D A8 76 77 A7 7A 33 96 1F EC 30 66 E9 
3B 03 9A DC D3 BD 69 78 88 D9 8D 35 FF 57 71 F6 A9 B7 47 DD 47 44 DF 7C F5 7E CD 10 AD 7B F6 8E 
DB 15 66 BE FD 60 EC 94 55 CA E0 D1 33 E7 4C 7A E4 DA 2D 52 51 5A 2E 11 91 DE 64 96 FD 61 E6 65 
26 49 9C D1 A4 19 9B 82 4D 9E 9C 24 87 31 3A 72 36 F6 C0 41 CC 14 0F E0 D0 69 AB 79 73 EA 6A EE 
B6 1E 20 52 38 5F 7E 30 F3 D6 06 E1 1F 3C D3 A5 6E 5C 44 81 A5 D8 2D E3 C4 99 0C 72 D7 76 0D 5A 
37 AB BD 6A D3 E1 37 E7 27 AE DE 79 B6 51 74 80 F6 4E 65 4E FC C1 FE AD 12 EA 55 D7 D0 D6 F6 F3 
A7 6F FC BC 97 9E 9A FC CB 1D 37 D7 D1 5E A1 C3 8D 1D 0B 0A 6F DE 76 18 AD 9A 39 6F D1 DC 57 9F 
19 D8 A2 D6 15 07 5C DC 5E B4 7A D5 12 22 8A 6C 54 2F 32 56 4B 7D 5E E8 8A BF C3 CD 4D E2 DE 7D 
B0 F5 BA DD 67 B5 CD ED 52 59 24 C6 98 64 B7 EB 32 BD E6 9A 32 00 AF C3 15 93 5D 36 A8 EE 3B 0E 
50 14 FE CD B3 B7 DE D4 38 CE A8 77 FF 30 5C C1 01 86 41 BD 9A 77 6C 15 BF 7E C7 C9 C4 63 19 4C 
7B 37 03 27 E6 B2 EB 89 88 88 92 37 2E 7C FC 9D B9 91 5D 1E 1A 33 A2 9F 96 4B F3 FF E5 64 6F 57 
DF 6F F0 83 37 BC 3F 33 F9 E8 DA 27 46 BD 3C 65 C2 EB 4D EA 54 D7 EB 75 5C B1 17 17 64 2D 99 F5 
C9 73 1F 2F 25 A2 A1 4F BE 58 D7 FD 7D 71 1E C0 18 EB 79 4B C3 9E B7 34 F4 74 21 F4 D3 9C 2D 43 
6A 8E F5 74 15 00 DE 6B 55 DA F4 DE 83 BA 7A BA 8A F2 89 8D 0A 79 E0 8E 16 95 B1 E6 E2 AC 93 6F 
BE FA 9A 95 55 FB EA DD D7 EB 84 97 EF 6C AB B3 EE 8E E8 C6 9D 7F 58 32 A3 5D 9F E1 DB 97 7D DB 
6E C9 37 F5 5A 75 BE E5 C6 BA 45 D9 A9 0B 97 FD 5E DA E0 AE 91 93 C7 3D DA B3 E2 85 43 59 38 B1 
AA BD F2 08 C0 C7 78 CF 4D 57 9E A7 5A 17 CF 9C FC F3 96 53 BD 9F 7C BF 75 DD D0 94 94 CB D7 5B 
4A 52 91 C5 AA 12 51 76 56 5A 6A 6A 2A 27 16 59 AD BA C9 70 C5 21 8E F3 FE 6E A9 6D EF 87 CF 25 
B7 FA E9 FB E9 AF BC 37 ED C4 EE 8D 27 76 6F 2C 7D A2 6E C7 BB 27 BC F1 62 BF 6E ED 83 8C 98 56 
1E 00 C0 33 6C 45 85 1B 67 7C 45 44 3B 97 7C D6 71 E9 94 2B 9F E4 19 17 F2 88 E8 9D 97 1F FC EC 
2D 63 BA AD E6 CE 6D CB 9B D7 BD 62 54 38 97 9B 6F 29 AE 61 CB 97 DF FD F2 C5 71 1F 9F 3D 7B 36 
DF 52 2C E9 0C 91 D1 71 D1 11 2E 46 49 F3 06 CE BB C2 38 A7 8C DC A2 D3 E7 9D DD 27 5D F5 64 59 
CE B2 E8 CE E4 DD 8C 7D 1C 00 47 D2 0B F8 B9 B4 3C 37 DE 07 70 95 C2 22 6B B0 C4 AA F8 1E A0 8A 
61 C4 C2 12 DA F4 AC 5D E6 90 65 F6 BD E9 17 D2 54 1E 57 BB 7E 7C 6C 98 4D 0D 92 AE 39 A3 A0 75 
FF 5D D2 9B EA D4 F3 7C FF B8 BB E8 64 E9 AE 76 B5 C7 2E 4E 7A 6C 41 92 A7 6B B9 12 A7 84 C0 9A 
A3 94 57 70 1F 18 80 23 0D 24 65 D8 EA 85 95 F9 1B 61 C3 1A 47 C6 45 7B E0 36 A0 F2 D2 05 86 4E 
58 B4 DD C1 93 25 4F B5 AC F1 D5 BE EC D1 E3 BF 1E 3E A0 65 D9 8B 57 5E 65 DE 4C AF 93 1F BA B3 
65 FB 66 35 BD 2D E4 25 49 FE 6D E5 9C DE D5 FF C0 9D C0 00 8E FC 95 D5 AF 73 CF 3B 2B EF 08 80 
88 C2 82 CD B5 6B 68 9A 1B CA 8B D9 4B 87 A8 53 15 87 03 82 0A 1A 00 44 64 32 E8 9A 37 8A F1 74 
15 65 48 8C 28 6E 1E BD D4 D3 55 00 78 AF 14 D6 B7 69 95 8D AF E0 D7 70 CB 29 00 80 7F B2 65 E5 
10 91 93 A9 D3 04 3A 02 60 44 B2 E4 03 81 C7 4A 87 82 F0 AE AE 29 00 2F A2 ED EE 28 B7 BE A2 0F 
6C 39 AE 65 1A BF F9 E4 9B 9C 02 43 AA 39 6A E1 CF 01 F0 DF 4D A8 CA 79 76 B1 FD F3 79 5B F5 B2 
57 FF 25 25 C6 12 0F 45 A6 9D 7B 1D 01 00 E0 C8 D1 42 5D B2 B2 ED 3A E6 04 2E 1F 46 74 E0 54 96 
4D A9 AA D7 73 1B 39 AE 4E BC F3 16 FE 1C 00 FF 35 B0 C7 8D 7B 8F 65 6C 49 BC AE 51 A9 AB 04 CB 
B2 04 66 E5 34 F2 74 19 00 DE 2B 57 95 2F EC 3A 53 95 9B 63 CE E9 ED 11 1D 83 B5 CD 7F E5 43 44 
09 80 40 93 FE E3 17 7A 78 BA 0A 4D E6 CD 9D 30 B8 D6 1B 38 02 00 70 64 75 DA D7 BD EE 7D C0 D3 
55 F8 03 51 02 C0 87 A8 9C 91 B3 69 9C 01 44 A7 AA B8 48 DA 3D BC BA 43 1C 00 00 2A 8F 3F 1F 01 
14 97 D8 2C 85 25 BE D5 95 22 CB 72 89 4D B2 58 6F F4 AD B2 01 AA 52 B1 8D 8A 4B 6C F6 CA BC 11 
CC 39 4B 91 AD CA 4E 41 57 2A FF 0C 00 9D 2C 8D BA 39 FA D9 6F B7 59 B9 A3 9B A4 2B A8 B2 27 75 
E3 44 A1 72 DC BB FC E5 CA 7D 19 00 5F 16 44 F2 4B EB E7 7B B0 1B 48 22 4A 08 33 C4 56 F7 F9 A1 
F0 FD 33 00 02 4C FA D7 87 77 EE 97 9C CA 2A 7B 83 ED 6E 92 24 FD B1 F1 B7 CE 11 FB 70 12 18 C0 
91 5D 79 1D DA 76 EC E2 D9 CB 32 C3 82 CD 6D 6E AC E9 C1 02 DC C2 3F 03 80 88 62 AA 05 C5 54 F3 
C9 8B 29 2F 1E 2B E8 11 37 C3 D3 55 00 78 2F 7B 5A BB 6E ED 1A 78 BA 0A 7F 80 93 C0 00 00 82 42 
00 00 00 08 CA 4F BA 80 38 51 AE C5 BA 61 4B B2 E2 E3 13 A9 C8 92 74 E8 5C E8 BA C2 97 7D FB 6D 
00 54 A6 7D 79 7A D3 D6 A3 8A EA B1 AB 80 AE 75 F8 54 A6 AF 9D 70 24 F2 9B 00 78 A0 5F 8B 5D 9F 
AD 9F 38 7F AF A7 0B B9 5E 8C A8 B0 24 78 FB D9 26 08 00 00 47 8A 55 DD 86 73 7B CA F5 1B 29 D7 
C6 B9 22 BF 3E 4E 6F 0E 6A 16 1E 1A 50 81 45 3D C8 4F 02 A0 7E CD 88 59 63 FB FA C1 46 53 96 A4 
5F 7E F9 74 60 8D 8F 39 26 84 01 70 60 5D C6 3B 3D EF 1E 54 A9 13 C2 54 40 90 59 6F 32 F8 D8 16 
D5 C7 CA 75 22 32 D4 EC E9 12 DC 23 C8 A8 46 9A D3 3C 5D 05 80 F7 0A 31 B2 F0 20 A3 A7 AB F0 07 
38 09 0C 00 20 28 5F 3D 02 D0 31 56 62 55 8A AD 76 4F 17 E2 66 B2 2C DB 14 2A 56 30 21 0C 80 43 
56 85 DB 14 AE 38 9E EA D6 E3 64 49 52 54 4E B2 A7 EB 70 85 71 1F BC 6C 26 F9 4C E6 33 9F AC 8F 
0A D2 9B 0C 5E FF 01 97 13 23 76 3E 33 A3 86 BE D0 F7 FE 2A 00 55 25 C3 16 54 3D 32 42 F5 E2 BD 
24 46 EC 78 5A 41 BF F6 F1 2F 0D 6D EF E9 5A 9C F1 C9 00 E0 9C EF 4A 4A D9 7B F8 BC A7 0B 71 3F 
49 62 3B F7 ED 6A 15 9C EA E9 42 00 BC D7 21 4B DD A6 CD 6E F4 F2 E1 D8 64 9D 3C F4 8E 16 06 BD 
57 EF A4 FA 64 17 10 63 AC 75 D3 9A AD 9B FA FC 40 1C 65 32 15 FE 7E 7F CD 77 BC 78 E7 06 C0 C3 
56 A6 4D EF 73 77 6B 4F 57 E1 0F 70 12 D8 2B 61 EB 0F 00 95 0F 01 00 00 20 28 04 00 00 80 A0 10 
00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 
00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 
00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 
00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 
00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 
20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 E0 
6B 98 A7 0B F0 17 08 00 00 00 41 21 00 BC 0E E7 9E AE 00 00 C4 80 00 00 00 10 14 02 00 00 40 50 
08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 
00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 
00 00 00 41 21 00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 00 04 85 00 
00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 00 00 C0 D7 70 4F 17 E0 2F 10 00 00 00 82 42 00 78 
1D E6 E9 02 00 40 10 08 00 EF 83 04 00 80 2A 81 00 00 00 10 14 02 00 00 40 50 08 00 00 00 41 21 
00 00 00 04 85 00 00 00 10 14 02 00 00 40 50 08 00 2F C4 71 25 28 80 53 B8 15 D8 3D 74 9E 2E 00 
AE 96 27 DD B8 F8 F4 FB F8 82 3B 55 05 1F 0F 42 B8 5C AA F4 2F 72 51 AA 59 F9 2F 27 04 C6 39 36 
35 00 00 22 42 17 10 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 
00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 
00 00 20 28 04 00 00 80 A0 10 00 00 00 82 42 00 00 00 08 0A 01 00 00 20 28 04 00 00 80 A0 10 00 
00 00 82 42 00 00 00 08 0A 01 00 00 20 A8 FF 07 16 60 5D 2F 85 B4 04 BB 00 00 00 00 49 45 4E 44 
AE 42 60 82 
EndData
$EndBitmap
Text Notes 2500 6300 0    50   ~ 0
addr = 0x2F
Text Label 5300 6150 2    50   ~ 0
BIASH
Wire Wire Line
	4200 5350 4250 5350
Connection ~ 4250 5350
Wire Wire Line
	4250 5350 4500 5350
Wire Wire Line
	4250 5350 4250 6050
$Comp
L Device:C C?
U 1 1 5ECB9805
P 4450 6750
AR Path="/5E9E88B8/5ECB9805" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECB9805" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECB9805" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECB9805" Ref="C?"  Part="1" 
F 0 "C?" H 4350 6700 50  0000 R CNN
F 1 "0.1uF" H 4350 6800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 6600 50  0001 C CNN
F 3 "~" H 4450 6750 50  0001 C CNN
	1    4450 6750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5ECC0502
P 4900 6750
AR Path="/5E9E88B8/5ECC0502" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5ECC0502" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5ECC0502" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5ECC0502" Ref="C?"  Part="1" 
F 0 "C?" H 4800 6700 50  0000 R CNN
F 1 "0.1uF" H 4800 6800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4938 6600 50  0001 C CNN
F 3 "~" H 4900 6750 50  0001 C CNN
	1    4900 6750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4100 6150 4900 6150
Wire Wire Line
	4100 6550 4450 6550
Wire Wire Line
	4200 6950 4450 6950
Wire Wire Line
	4900 6950 4900 6900
Connection ~ 4200 6950
Wire Wire Line
	4450 6900 4450 6950
Connection ~ 4450 6950
Wire Wire Line
	4450 6950 4900 6950
Wire Wire Line
	4450 6600 4450 6550
Connection ~ 4450 6550
Wire Wire Line
	4450 6550 5300 6550
Wire Wire Line
	4900 6600 4900 6150
Connection ~ 4900 6150
Wire Wire Line
	4900 6150 5300 6150
Wire Wire Line
	7950 5050 10250 5050
Wire Wire Line
	9250 5200 8850 5200
Wire Wire Line
	8850 5200 8850 5250
Connection ~ 9250 5200
$EndSCHEMATC
