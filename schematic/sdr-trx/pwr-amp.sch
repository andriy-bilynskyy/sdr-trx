EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
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
+5.0V
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
Wire Wire Line
	4100 6150 4550 6150
Wire Wire Line
	4100 6550 4550 6550
Text Label 4550 6550 2    50   ~ 0
BIASL
Text Label 4550 6150 2    50   ~ 0
BIASH
$Comp
L Device:C C?
U 1 1 5EFC0F80
P 4950 5700
AR Path="/5E9E88B8/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC0F80" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC0F80" Ref="C?"  Part="1" 
F 0 "C?" H 5050 5750 50  0000 L CNN
F 1 "0.1uF" H 5050 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4988 5550 50  0001 C CNN
F 3 "~" H 4950 5700 50  0001 C CNN
	1    4950 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EFC1ECB
P 4500 5700
AR Path="/5E9E88B8/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC1ECB" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC1ECB" Ref="C?"  Part="1" 
F 0 "C?" H 4600 5750 50  0000 L CNN
F 1 "10nF" H 4600 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 5550 50  0001 C CNN
F 3 "~" H 4500 5700 50  0001 C CNN
	1    4500 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EFC3669
P 5400 5700
AR Path="/5E9E88B8/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EFC3669" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EFC3669" Ref="C?"  Part="1" 
F 0 "C?" H 5500 5750 50  0000 L CNN
F 1 "1.0uF" H 5500 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5438 5550 50  0001 C CNN
F 3 "~" H 5400 5700 50  0001 C CNN
	1    5400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5850 4500 5900
Wire Wire Line
	4500 5900 4950 5900
Wire Wire Line
	5400 5900 5400 5850
Wire Wire Line
	4950 5850 4950 5900
Connection ~ 4950 5900
Wire Wire Line
	4950 5900 5400 5900
Wire Wire Line
	5400 5550 5400 5500
Wire Wire Line
	5400 5500 4950 5500
Wire Wire Line
	4250 5500 4250 6050
Connection ~ 4250 6050
Wire Wire Line
	4500 5550 4500 5500
Connection ~ 4500 5500
Wire Wire Line
	4500 5500 4250 5500
Wire Wire Line
	4950 5550 4950 5500
Connection ~ 4950 5500
Wire Wire Line
	4950 5500 4500 5500
$Comp
L power:GND #PWR?
U 1 1 5EFF6EEA
P 4950 5950
AR Path="/5EA436AA/5EFF6EEA" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EFF6EEA" Ref="#PWR?"  Part="1" 
AR Path="/5EC388F5/5EFF6EEA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 5700 50  0001 C CNN
F 1 "GND" H 4955 5777 50  0000 C CNN
F 2 "" H 4950 5950 50  0001 C CNN
F 3 "" H 4950 5950 50  0001 C CNN
	1    4950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5950 4950 5900
Text GLabel 4200 5500 0    50   Input ~ 0
+5.0V
Wire Wire Line
	4200 5500 4250 5500
Connection ~ 4250 5500
Text Notes 7950 1900 0    50   ~ 0
BN43-202\npri. 2+2 turns\nsec. 6 turns\nenameled wire 0.4mm
$Comp
L Device:Thermistor_NTC TH?
U 1 1 5F028AF8
P 9250 5500
F 0 "TH?" H 9348 5546 50  0000 L CNN
F 1 "CMFB3435103" H 9348 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 5550 50  0001 C CNN
F 3 "https://www.cantherm.com/wp-content/uploads/2017/05/CMF_11x17_AUGUST_2014.pdf" H 9250 5550 50  0001 C CNN
	1    9250 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:Thermistor_NTC TH?
U 1 1 5F02C76F
P 8350 5500
F 0 "TH?" H 8448 5546 50  0000 L CNN
F 1 "CMFB3435103" H 8448 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8350 5550 50  0001 C CNN
F 3 "https://www.cantherm.com/wp-content/uploads/2017/05/CMF_11x17_AUGUST_2014.pdf" H 8350 5550 50  0001 C CNN
	1    8350 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5650 8350 5700
Wire Wire Line
	8350 5700 8850 5700
Wire Wire Line
	9250 5700 9250 5650
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
Connection ~ 8850 5700
Wire Wire Line
	8850 5700 9250 5700
Wire Wire Line
	9250 5350 9250 5200
Wire Wire Line
	9250 5200 10250 5200
Wire Wire Line
	8350 5350 8350 5100
Wire Wire Line
	8350 5100 10250 5100
Text HLabel 10250 5100 2    50   Output ~ 0
TH
Text HLabel 10250 5200 2    50   Output ~ 0
TL
Text Notes 8300 6100 0    50   ~ 0
Each thermistor routed near its own PD85004 on PCB.
$EndSCHEMATC
