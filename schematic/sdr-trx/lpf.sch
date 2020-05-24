EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 11
Title "LPF"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C?
U 1 1 5FE79785
P 4800 1600
AR Path="/5E9E88B8/5FE79785" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE79785" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE79785" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE79785" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE79785" Ref="C?"  Part="1" 
F 0 "C?" H 4900 1600 50  0000 L CNN
F 1 "1.6nF" H 4900 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 1450 50  0001 C CNN
F 3 "~" H 4800 1600 50  0001 C CNN
	1    4800 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FE79791
P 5150 1400
AR Path="/5EA333CB/5FE79791" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FE79791" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FE79791" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FE79791" Ref="L?"  Part="1" 
F 0 "L?" V 5200 1400 50  0000 C TNN
F 1 "744758327A" V 5100 1400 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5150 1400 50  0001 C CNN
F 3 "~" H 5150 1400 50  0001 C CNN
	1    5150 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FE79797
P 5150 1150
AR Path="/5E9E88B8/5FE79797" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE79797" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE79797" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE79797" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE79797" Ref="C?"  Part="1" 
F 0 "C?" V 5250 1200 50  0000 L CNN
F 1 "220pF" V 5250 1100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 1000 50  0001 C CNN
F 3 "~" H 5150 1150 50  0001 C CNN
	1    5150 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 1450 4800 1400
Wire Wire Line
	4800 1750 4800 1800
$Comp
L power:GND #PWR?
U 1 1 5FE797C4
P 5800 1850
AR Path="/5E9F4ACB/5FE797C4" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FE797C4" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FE797C4" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FE797C4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 1600 50  0001 C CNN
F 1 "GND" H 5805 1677 50  0000 C CNN
F 2 "" H 5800 1850 50  0001 C CNN
F 3 "" H 5800 1850 50  0001 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1800 5450 1800
$Comp
L Device:C C?
U 1 1 5FE797DA
P 6100 1600
AR Path="/5E9E88B8/5FE797DA" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE797DA" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE797DA" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE797DA" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE797DA" Ref="C?"  Part="1" 
F 0 "C?" H 6200 1600 50  0000 L CNN
F 1 "1.3nF" H 6200 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 1450 50  0001 C CNN
F 3 "~" H 6100 1600 50  0001 C CNN
	1    6100 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FE7A9F4
P 5450 1600
AR Path="/5E9E88B8/5FE7A9F4" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE7A9F4" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE7A9F4" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE7A9F4" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE7A9F4" Ref="C?"  Part="1" 
F 0 "C?" H 5550 1600 50  0000 L CNN
F 1 "1.8nF" H 5550 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 1450 50  0001 C CNN
F 3 "~" H 5450 1600 50  0001 C CNN
	1    5450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1400 4800 1400
Connection ~ 4800 1400
Wire Wire Line
	5000 1150 4800 1150
Wire Wire Line
	4800 1150 4800 1400
Wire Wire Line
	5300 1150 5450 1150
Wire Wire Line
	5450 1150 5450 1400
Wire Wire Line
	5300 1400 5450 1400
Connection ~ 5450 1400
Wire Wire Line
	5450 1400 5450 1450
Wire Wire Line
	5450 1750 5450 1800
Connection ~ 5450 1800
Wire Wire Line
	5450 1800 5800 1800
$Comp
L Device:L L?
U 1 1 5FE87E5C
P 5800 1400
AR Path="/5EA333CB/5FE87E5C" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FE87E5C" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FE87E5C" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FE87E5C" Ref="L?"  Part="1" 
F 0 "L?" V 5850 1400 50  0000 C TNN
F 1 "744758318A" V 5750 1400 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5800 1400 50  0001 C CNN
F 3 "~" H 5800 1400 50  0001 C CNN
	1    5800 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FE87E62
P 5800 1150
AR Path="/5E9E88B8/5FE87E62" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE87E62" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE87E62" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE87E62" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE87E62" Ref="C?"  Part="1" 
F 0 "C?" V 5900 1200 50  0000 L CNN
F 1 "1.0nF" V 5900 1100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 1000 50  0001 C CNN
F 3 "~" H 5800 1150 50  0001 C CNN
	1    5800 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 1400 5450 1400
Wire Wire Line
	5650 1150 5450 1150
Wire Wire Line
	5950 1150 6100 1150
Wire Wire Line
	6100 1150 6100 1400
Wire Wire Line
	5950 1400 6100 1400
Connection ~ 5450 1150
Wire Wire Line
	6100 1450 6100 1400
Connection ~ 6100 1400
Wire Wire Line
	6100 1750 6100 1800
Connection ~ 6100 1800
$Comp
L Device:L L?
U 1 1 5FE8E5D0
P 6450 1400
AR Path="/5EA333CB/5FE8E5D0" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FE8E5D0" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FE8E5D0" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FE8E5D0" Ref="L?"  Part="1" 
F 0 "L?" V 6500 1400 50  0000 C TNN
F 1 "744758318A" V 6400 1400 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 6450 1400 50  0001 C CNN
F 3 "~" H 6450 1400 50  0001 C CNN
	1    6450 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FE8E5D6
P 6450 1150
AR Path="/5E9E88B8/5FE8E5D6" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE8E5D6" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE8E5D6" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE8E5D6" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE8E5D6" Ref="C?"  Part="1" 
F 0 "C?" V 6550 1200 50  0000 L CNN
F 1 "750pF" V 6550 1100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 1000 50  0001 C CNN
F 3 "~" H 6450 1150 50  0001 C CNN
	1    6450 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 1400 6100 1400
Wire Wire Line
	6300 1150 6100 1150
Wire Wire Line
	6600 1150 6750 1150
Wire Wire Line
	6750 1150 6750 1400
Wire Wire Line
	6600 1400 6750 1400
Connection ~ 6100 1150
$Comp
L Device:C C?
U 1 1 5FE9181A
P 6750 1600
AR Path="/5E9E88B8/5FE9181A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FE9181A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FE9181A" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FE9181A" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FE9181A" Ref="C?"  Part="1" 
F 0 "C?" H 6850 1600 50  0000 L CNN
F 1 "1nF" H 6850 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 1450 50  0001 C CNN
F 3 "~" H 6750 1600 50  0001 C CNN
	1    6750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1450 6750 1400
Connection ~ 6750 1400
Wire Wire Line
	6750 1750 6750 1800
Wire Wire Line
	6100 1800 6750 1800
Wire Wire Line
	5800 1850 5800 1800
Connection ~ 5800 1800
Wire Wire Line
	5800 1800 6100 1800
$Comp
L Device:C C?
U 1 1 5FEA0EA9
P 4800 2700
AR Path="/5E9E88B8/5FEA0EA9" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0EA9" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0EA9" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EA9" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0EA9" Ref="C?"  Part="1" 
F 0 "C?" H 4900 2700 50  0000 L CNN
F 1 "750pF" H 4900 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 2550 50  0001 C CNN
F 3 "~" H 4800 2700 50  0001 C CNN
	1    4800 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FEA0EAF
P 5150 2500
AR Path="/5EA333CB/5FEA0EAF" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEA0EAF" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EAF" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEA0EAF" Ref="L?"  Part="1" 
F 0 "L?" V 5200 2500 50  0000 C TNN
F 1 "744758315A" V 5100 2500 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5150 2500 50  0001 C CNN
F 3 "~" H 5150 2500 50  0001 C CNN
	1    5150 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEA0EB5
P 5150 2250
AR Path="/5E9E88B8/5FEA0EB5" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0EB5" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0EB5" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EB5" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0EB5" Ref="C?"  Part="1" 
F 0 "C?" V 5250 2300 50  0000 L CNN
F 1 "120pF" V 5250 2200 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 2100 50  0001 C CNN
F 3 "~" H 5150 2250 50  0001 C CNN
	1    5150 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 2550 4800 2500
Wire Wire Line
	4800 2850 4800 2900
$Comp
L power:GND #PWR?
U 1 1 5FEA0EBE
P 5800 2950
AR Path="/5E9F4ACB/5FEA0EBE" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FEA0EBE" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EBE" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FEA0EBE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 2700 50  0001 C CNN
F 1 "GND" H 5805 2777 50  0000 C CNN
F 2 "" H 5800 2950 50  0001 C CNN
F 3 "" H 5800 2950 50  0001 C CNN
	1    5800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2900 5450 2900
$Comp
L Device:C C?
U 1 1 5FEA0EC5
P 6100 2700
AR Path="/5E9E88B8/5FEA0EC5" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0EC5" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0EC5" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EC5" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0EC5" Ref="C?"  Part="1" 
F 0 "C?" H 6200 2700 50  0000 L CNN
F 1 "750pF" H 6200 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 2550 50  0001 C CNN
F 3 "~" H 6100 2700 50  0001 C CNN
	1    6100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FEA0ECB
P 5450 2700
AR Path="/5E9E88B8/5FEA0ECB" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0ECB" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0ECB" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0ECB" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0ECB" Ref="C?"  Part="1" 
F 0 "C?" H 5550 2700 50  0000 L CNN
F 1 "910pF" H 5550 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 2550 50  0001 C CNN
F 3 "~" H 5450 2700 50  0001 C CNN
	1    5450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2500 4800 2500
Connection ~ 4800 2500
Wire Wire Line
	5000 2250 4800 2250
Wire Wire Line
	4800 2250 4800 2500
Wire Wire Line
	5300 2250 5450 2250
Wire Wire Line
	5450 2250 5450 2500
Wire Wire Line
	5300 2500 5450 2500
Connection ~ 5450 2500
Wire Wire Line
	5450 2500 5450 2550
Wire Wire Line
	5450 2850 5450 2900
Connection ~ 5450 2900
Wire Wire Line
	5450 2900 5800 2900
$Comp
L Device:L L?
U 1 1 5FEA0EDD
P 5800 2500
AR Path="/5EA333CB/5FEA0EDD" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEA0EDD" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EDD" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEA0EDD" Ref="L?"  Part="1" 
F 0 "L?" V 5850 2500 50  0000 C TNN
F 1 "744758310A" V 5750 2500 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5800 2500 50  0001 C CNN
F 3 "~" H 5800 2500 50  0001 C CNN
	1    5800 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEA0EE3
P 5800 2250
AR Path="/5E9E88B8/5FEA0EE3" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0EE3" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0EE3" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EE3" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0EE3" Ref="C?"  Part="1" 
F 0 "C?" V 5900 2300 50  0000 L CNN
F 1 "620pF" V 5900 2200 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 2100 50  0001 C CNN
F 3 "~" H 5800 2250 50  0001 C CNN
	1    5800 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 2500 5450 2500
Wire Wire Line
	5650 2250 5450 2250
Wire Wire Line
	5950 2250 6100 2250
Wire Wire Line
	6100 2250 6100 2500
Wire Wire Line
	5950 2500 6100 2500
Connection ~ 5450 2250
Wire Wire Line
	6100 2550 6100 2500
Connection ~ 6100 2500
Wire Wire Line
	6100 2850 6100 2900
Connection ~ 6100 2900
$Comp
L Device:L L?
U 1 1 5FEA0EF3
P 6450 2500
AR Path="/5EA333CB/5FEA0EF3" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEA0EF3" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EF3" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEA0EF3" Ref="L?"  Part="1" 
F 0 "L?" V 6500 2500 50  0000 C TNN
F 1 "744758312A" V 6400 2500 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 6450 2500 50  0001 C CNN
F 3 "~" H 6450 2500 50  0001 C CNN
	1    6450 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEA0EF9
P 6450 2250
AR Path="/5E9E88B8/5FEA0EF9" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0EF9" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0EF9" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0EF9" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0EF9" Ref="C?"  Part="1" 
F 0 "C?" V 6550 2300 50  0000 L CNN
F 1 "430pF" V 6550 2200 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 2100 50  0001 C CNN
F 3 "~" H 6450 2250 50  0001 C CNN
	1    6450 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 2500 6100 2500
Wire Wire Line
	6300 2250 6100 2250
Wire Wire Line
	6600 2250 6750 2250
Wire Wire Line
	6750 2250 6750 2500
Wire Wire Line
	6600 2500 6750 2500
Connection ~ 6100 2250
$Comp
L Device:C C?
U 1 1 5FEA0F05
P 6750 2700
AR Path="/5E9E88B8/5FEA0F05" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEA0F05" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEA0F05" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEA0F05" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEA0F05" Ref="C?"  Part="1" 
F 0 "C?" H 6850 2700 50  0000 L CNN
F 1 "560pF" H 6850 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 2550 50  0001 C CNN
F 3 "~" H 6750 2700 50  0001 C CNN
	1    6750 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2550 6750 2500
Connection ~ 6750 2500
Wire Wire Line
	6750 2850 6750 2900
Wire Wire Line
	6100 2900 6750 2900
Wire Wire Line
	5800 2950 5800 2900
Connection ~ 5800 2900
Wire Wire Line
	5800 2900 6100 2900
$Comp
L Device:C C?
U 1 1 5FEAF1BE
P 4800 3800
AR Path="/5E9E88B8/5FEAF1BE" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF1BE" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF1BE" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1BE" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF1BE" Ref="C?"  Part="1" 
F 0 "C?" H 4900 3800 50  0000 L CNN
F 1 "430pF" H 4900 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 3650 50  0001 C CNN
F 3 "~" H 4800 3800 50  0001 C CNN
	1    4800 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FEAF1C4
P 5150 3600
AR Path="/5EA333CB/5FEAF1C4" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEAF1C4" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1C4" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEAF1C4" Ref="L?"  Part="1" 
F 0 "L?" V 5200 3600 50  0000 C TNN
F 1 "744758310A" V 5100 3600 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5150 3600 50  0001 C CNN
F 3 "~" H 5150 3600 50  0001 C CNN
	1    5150 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEAF1CA
P 5150 3350
AR Path="/5E9E88B8/5FEAF1CA" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF1CA" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF1CA" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1CA" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF1CA" Ref="C?"  Part="1" 
F 0 "C?" V 5250 3400 50  0000 L CNN
F 1 "68pF" V 5250 3300 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 3200 50  0001 C CNN
F 3 "~" H 5150 3350 50  0001 C CNN
	1    5150 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 3650 4800 3600
Wire Wire Line
	4800 3950 4800 4000
$Comp
L power:GND #PWR?
U 1 1 5FEAF1D3
P 5800 4050
AR Path="/5E9F4ACB/5FEAF1D3" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FEAF1D3" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1D3" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FEAF1D3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 3800 50  0001 C CNN
F 1 "GND" H 5805 3877 50  0000 C CNN
F 2 "" H 5800 4050 50  0001 C CNN
F 3 "" H 5800 4050 50  0001 C CNN
	1    5800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4000 5450 4000
$Comp
L Device:C C?
U 1 1 5FEAF1DA
P 6100 3800
AR Path="/5E9E88B8/5FEAF1DA" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF1DA" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF1DA" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1DA" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF1DA" Ref="C?"  Part="1" 
F 0 "C?" H 6200 3800 50  0000 L CNN
F 1 "430pF" H 6200 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 3650 50  0001 C CNN
F 3 "~" H 6100 3800 50  0001 C CNN
	1    6100 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FEAF1E0
P 5450 3800
AR Path="/5E9E88B8/5FEAF1E0" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF1E0" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF1E0" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1E0" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF1E0" Ref="C?"  Part="1" 
F 0 "C?" H 5550 3800 50  0000 L CNN
F 1 "510pF" H 5550 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 3650 50  0001 C CNN
F 3 "~" H 5450 3800 50  0001 C CNN
	1    5450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3600 4800 3600
Connection ~ 4800 3600
Wire Wire Line
	5000 3350 4800 3350
Wire Wire Line
	4800 3350 4800 3600
Wire Wire Line
	5300 3350 5450 3350
Wire Wire Line
	5450 3350 5450 3600
Wire Wire Line
	5300 3600 5450 3600
Connection ~ 5450 3600
Wire Wire Line
	5450 3600 5450 3650
Wire Wire Line
	5450 3950 5450 4000
Connection ~ 5450 4000
Wire Wire Line
	5450 4000 5800 4000
$Comp
L Device:L L?
U 1 1 5FEAF1F2
P 5800 3600
AR Path="/5EA333CB/5FEAF1F2" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEAF1F2" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1F2" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEAF1F2" Ref="L?"  Part="1" 
F 0 "L?" V 5850 3600 50  0000 C TNN
F 1 "744758256A" V 5750 3600 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5800 3600 50  0001 C CNN
F 3 "~" H 5800 3600 50  0001 C CNN
	1    5800 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEAF1F8
P 5800 3350
AR Path="/5E9E88B8/5FEAF1F8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF1F8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF1F8" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF1F8" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF1F8" Ref="C?"  Part="1" 
F 0 "C?" V 5900 3400 50  0000 L CNN
F 1 "360pF" V 5900 3300 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 3200 50  0001 C CNN
F 3 "~" H 5800 3350 50  0001 C CNN
	1    5800 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 3600 5450 3600
Wire Wire Line
	5650 3350 5450 3350
Wire Wire Line
	5950 3350 6100 3350
Wire Wire Line
	6100 3350 6100 3600
Wire Wire Line
	5950 3600 6100 3600
Connection ~ 5450 3350
Wire Wire Line
	6100 3650 6100 3600
Connection ~ 6100 3600
Wire Wire Line
	6100 3950 6100 4000
Connection ~ 6100 4000
$Comp
L Device:L L?
U 1 1 5FEAF208
P 6450 3600
AR Path="/5EA333CB/5FEAF208" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEAF208" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF208" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEAF208" Ref="L?"  Part="1" 
F 0 "L?" V 6500 3600 50  0000 C TNN
F 1 "744758268A" V 6400 3600 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 6450 3600 50  0001 C CNN
F 3 "~" H 6450 3600 50  0001 C CNN
	1    6450 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEAF20E
P 6450 3350
AR Path="/5E9E88B8/5FEAF20E" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF20E" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF20E" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF20E" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF20E" Ref="C?"  Part="1" 
F 0 "C?" V 6550 3400 50  0000 L CNN
F 1 "240pF" V 6550 3300 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 3200 50  0001 C CNN
F 3 "~" H 6450 3350 50  0001 C CNN
	1    6450 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 3600 6100 3600
Wire Wire Line
	6300 3350 6100 3350
Wire Wire Line
	6600 3350 6750 3350
Wire Wire Line
	6750 3350 6750 3600
Wire Wire Line
	6600 3600 6750 3600
Connection ~ 6100 3350
$Comp
L Device:C C?
U 1 1 5FEAF21A
P 6750 3800
AR Path="/5E9E88B8/5FEAF21A" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEAF21A" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEAF21A" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEAF21A" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEAF21A" Ref="C?"  Part="1" 
F 0 "C?" H 6850 3800 50  0000 L CNN
F 1 "330pF" H 6850 3700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 3650 50  0001 C CNN
F 3 "~" H 6750 3800 50  0001 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3650 6750 3600
Connection ~ 6750 3600
Wire Wire Line
	6750 3950 6750 4000
Wire Wire Line
	6100 4000 6750 4000
Wire Wire Line
	5800 4050 5800 4000
Connection ~ 5800 4000
Wire Wire Line
	5800 4000 6100 4000
$Comp
L Device:C C?
U 1 1 5FEBF09C
P 4800 4900
AR Path="/5E9E88B8/5FEBF09C" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF09C" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF09C" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF09C" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF09C" Ref="C?"  Part="1" 
F 0 "C?" H 4900 4900 50  0000 L CNN
F 1 "240pF" H 4900 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 4750 50  0001 C CNN
F 3 "~" H 4800 4900 50  0001 C CNN
	1    4800 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FEBF0A2
P 5150 4700
AR Path="/5EA333CB/5FEBF0A2" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEBF0A2" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0A2" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEBF0A2" Ref="L?"  Part="1" 
F 0 "L?" V 5200 4700 50  0000 C TNN
F 1 "744758256A" V 5100 4700 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5150 4700 50  0001 C CNN
F 3 "~" H 5150 4700 50  0001 C CNN
	1    5150 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEBF0A8
P 5150 4450
AR Path="/5E9E88B8/5FEBF0A8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0A8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0A8" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0A8" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0A8" Ref="C?"  Part="1" 
F 0 "C?" V 5250 4500 50  0000 L CNN
F 1 "39pF" V 5250 4400 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 4300 50  0001 C CNN
F 3 "~" H 5150 4450 50  0001 C CNN
	1    5150 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 4750 4800 4700
Wire Wire Line
	4800 5050 4800 5100
$Comp
L power:GND #PWR?
U 1 1 5FEBF0B1
P 5800 5150
AR Path="/5E9F4ACB/5FEBF0B1" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FEBF0B1" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0B1" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FEBF0B1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 4900 50  0001 C CNN
F 1 "GND" H 5805 4977 50  0000 C CNN
F 2 "" H 5800 5150 50  0001 C CNN
F 3 "" H 5800 5150 50  0001 C CNN
	1    5800 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5100 5450 5100
$Comp
L Device:C C?
U 1 1 5FEBF0B8
P 6100 4900
AR Path="/5E9E88B8/5FEBF0B8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0B8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0B8" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0B8" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0B8" Ref="C?"  Part="1" 
F 0 "C?" H 6200 4900 50  0000 L CNN
F 1 "240pF" H 6200 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 4750 50  0001 C CNN
F 3 "~" H 6100 4900 50  0001 C CNN
	1    6100 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FEBF0BE
P 5450 4900
AR Path="/5E9E88B8/5FEBF0BE" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0BE" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0BE" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0BE" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0BE" Ref="C?"  Part="1" 
F 0 "C?" H 5550 4900 50  0000 L CNN
F 1 "270pF" H 5550 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 4750 50  0001 C CNN
F 3 "~" H 5450 4900 50  0001 C CNN
	1    5450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4700 4800 4700
Connection ~ 4800 4700
Wire Wire Line
	5000 4450 4800 4450
Wire Wire Line
	4800 4450 4800 4700
Wire Wire Line
	5300 4450 5450 4450
Wire Wire Line
	5450 4450 5450 4700
Wire Wire Line
	5300 4700 5450 4700
Connection ~ 5450 4700
Wire Wire Line
	5450 4700 5450 4750
Wire Wire Line
	5450 5050 5450 5100
Connection ~ 5450 5100
Wire Wire Line
	5450 5100 5800 5100
$Comp
L Device:L L?
U 1 1 5FEBF0D0
P 5800 4700
AR Path="/5EA333CB/5FEBF0D0" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEBF0D0" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0D0" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEBF0D0" Ref="L?"  Part="1" 
F 0 "L?" V 5850 4700 50  0000 C TNN
F 1 "744762233A" V 5750 4700 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5800 4700 50  0001 C CNN
F 3 "~" H 5800 4700 50  0001 C CNN
	1    5800 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEBF0D6
P 5800 4450
AR Path="/5E9E88B8/5FEBF0D6" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0D6" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0D6" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0D6" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0D6" Ref="C?"  Part="1" 
F 0 "C?" V 5900 4500 50  0000 L CNN
F 1 "200pF" V 5900 4400 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 4300 50  0001 C CNN
F 3 "~" H 5800 4450 50  0001 C CNN
	1    5800 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 4700 5450 4700
Wire Wire Line
	5650 4450 5450 4450
Wire Wire Line
	5950 4450 6100 4450
Wire Wire Line
	6100 4450 6100 4700
Wire Wire Line
	5950 4700 6100 4700
Connection ~ 5450 4450
Wire Wire Line
	6100 4750 6100 4700
Connection ~ 6100 4700
Wire Wire Line
	6100 5050 6100 5100
Connection ~ 6100 5100
$Comp
L Device:L L?
U 1 1 5FEBF0E6
P 6450 4700
AR Path="/5EA333CB/5FEBF0E6" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FEBF0E6" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0E6" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FEBF0E6" Ref="L?"  Part="1" 
F 0 "L?" V 6500 4700 50  0000 C TNN
F 1 "744762233A" V 6400 4700 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 6450 4700 50  0001 C CNN
F 3 "~" H 6450 4700 50  0001 C CNN
	1    6450 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FEBF0EC
P 6450 4450
AR Path="/5E9E88B8/5FEBF0EC" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0EC" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0EC" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0EC" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0EC" Ref="C?"  Part="1" 
F 0 "C?" V 6550 4500 50  0000 L CNN
F 1 "160pF" V 6550 4400 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 4300 50  0001 C CNN
F 3 "~" H 6450 4450 50  0001 C CNN
	1    6450 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 4700 6100 4700
Wire Wire Line
	6300 4450 6100 4450
Wire Wire Line
	6600 4450 6750 4450
Wire Wire Line
	6750 4450 6750 4700
Wire Wire Line
	6600 4700 6750 4700
Connection ~ 6100 4450
$Comp
L Device:C C?
U 1 1 5FEBF0F8
P 6750 4900
AR Path="/5E9E88B8/5FEBF0F8" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FEBF0F8" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FEBF0F8" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FEBF0F8" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FEBF0F8" Ref="C?"  Part="1" 
F 0 "C?" H 6850 4900 50  0000 L CNN
F 1 "180pF" H 6850 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 4750 50  0001 C CNN
F 3 "~" H 6750 4900 50  0001 C CNN
	1    6750 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 4750 6750 4700
Connection ~ 6750 4700
Wire Wire Line
	6750 5050 6750 5100
Wire Wire Line
	6100 5100 6750 5100
Wire Wire Line
	5800 5150 5800 5100
Connection ~ 5800 5100
Wire Wire Line
	5800 5100 6100 5100
$Comp
L Device:C C?
U 1 1 5FF70465
P 4800 6000
AR Path="/5E9E88B8/5FF70465" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF70465" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF70465" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF70465" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF70465" Ref="C?"  Part="1" 
F 0 "C?" H 4900 6000 50  0000 L CNN
F 1 "130pF" H 4900 5900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 5850 50  0001 C CNN
F 3 "~" H 4800 6000 50  0001 C CNN
	1    4800 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FF7046B
P 5150 5800
AR Path="/5EA333CB/5FF7046B" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FF7046B" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FF7046B" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FF7046B" Ref="L?"  Part="1" 
F 0 "L?" V 5200 5800 50  0000 C TNN
F 1 "744762233A" V 5100 5800 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5150 5800 50  0001 C CNN
F 3 "~" H 5150 5800 50  0001 C CNN
	1    5150 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FF70471
P 5150 5550
AR Path="/5E9E88B8/5FF70471" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF70471" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF70471" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF70471" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF70471" Ref="C?"  Part="1" 
F 0 "C?" V 5250 5600 50  0000 L CNN
F 1 "18pF" V 5250 5500 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 5400 50  0001 C CNN
F 3 "~" H 5150 5550 50  0001 C CNN
	1    5150 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 5850 4800 5800
Wire Wire Line
	4800 6150 4800 6200
$Comp
L power:GND #PWR?
U 1 1 5FF7047A
P 5800 6250
AR Path="/5E9F4ACB/5FF7047A" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FF7047A" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FF7047A" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FF7047A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 6000 50  0001 C CNN
F 1 "GND" H 5805 6077 50  0000 C CNN
F 2 "" H 5800 6250 50  0001 C CNN
F 3 "" H 5800 6250 50  0001 C CNN
	1    5800 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6200 5450 6200
$Comp
L Device:C C?
U 1 1 5FF70481
P 6100 6000
AR Path="/5E9E88B8/5FF70481" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF70481" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF70481" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF70481" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF70481" Ref="C?"  Part="1" 
F 0 "C?" H 6200 6000 50  0000 L CNN
F 1 "150pF" H 6200 5900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6138 5850 50  0001 C CNN
F 3 "~" H 6100 6000 50  0001 C CNN
	1    6100 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FF70487
P 5450 6000
AR Path="/5E9E88B8/5FF70487" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF70487" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF70487" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF70487" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF70487" Ref="C?"  Part="1" 
F 0 "C?" H 5550 6000 50  0000 L CNN
F 1 "160pF" H 5550 5900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 5850 50  0001 C CNN
F 3 "~" H 5450 6000 50  0001 C CNN
	1    5450 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5800 4800 5800
Connection ~ 4800 5800
Wire Wire Line
	5000 5550 4800 5550
Wire Wire Line
	4800 5550 4800 5800
Wire Wire Line
	5300 5550 5450 5550
Wire Wire Line
	5450 5550 5450 5800
Wire Wire Line
	5300 5800 5450 5800
Connection ~ 5450 5800
Wire Wire Line
	5450 5800 5450 5850
Wire Wire Line
	5450 6150 5450 6200
Connection ~ 5450 6200
Wire Wire Line
	5450 6200 5800 6200
$Comp
L Device:L L?
U 1 1 5FF70499
P 5800 5800
AR Path="/5EA333CB/5FF70499" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FF70499" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FF70499" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FF70499" Ref="L?"  Part="1" 
F 0 "L?" V 5850 5800 50  0000 C TNN
F 1 "744762222A" V 5750 5800 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 5800 5800 50  0001 C CNN
F 3 "~" H 5800 5800 50  0001 C CNN
	1    5800 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FF7049F
P 5800 5550
AR Path="/5E9E88B8/5FF7049F" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF7049F" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF7049F" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF7049F" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF7049F" Ref="C?"  Part="1" 
F 0 "C?" V 5900 5600 50  0000 L CNN
F 1 "91pF" V 5900 5500 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 5400 50  0001 C CNN
F 3 "~" H 5800 5550 50  0001 C CNN
	1    5800 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 5800 5450 5800
Wire Wire Line
	5650 5550 5450 5550
Wire Wire Line
	5950 5550 6100 5550
Wire Wire Line
	6100 5550 6100 5800
Wire Wire Line
	5950 5800 6100 5800
Connection ~ 5450 5550
Wire Wire Line
	6100 5850 6100 5800
Connection ~ 6100 5800
Wire Wire Line
	6100 6150 6100 6200
Connection ~ 6100 6200
$Comp
L Device:L L?
U 1 1 5FF704AF
P 6450 5800
AR Path="/5EA333CB/5FF704AF" Ref="L?"  Part="1" 
AR Path="/5EA436AA/5FF704AF" Ref="L?"  Part="1" 
AR Path="/5EAAFBD4/5FF704AF" Ref="L?"  Part="1" 
AR Path="/5FE5C441/5FF704AF" Ref="L?"  Part="1" 
F 0 "L?" V 6500 5800 50  0000 C TNN
F 1 "744762222A" V 6400 5800 50  0000 C BNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 6450 5800 50  0001 C CNN
F 3 "~" H 6450 5800 50  0001 C CNN
	1    6450 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FF704B5
P 6450 5550
AR Path="/5E9E88B8/5FF704B5" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF704B5" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF704B5" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF704B5" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF704B5" Ref="C?"  Part="1" 
F 0 "C?" V 6550 5600 50  0000 L CNN
F 1 "68pF" V 6550 5500 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6488 5400 50  0001 C CNN
F 3 "~" H 6450 5550 50  0001 C CNN
	1    6450 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 5800 6100 5800
Wire Wire Line
	6300 5550 6100 5550
Wire Wire Line
	6600 5550 6750 5550
Wire Wire Line
	6750 5550 6750 5800
Wire Wire Line
	6600 5800 6750 5800
Connection ~ 6100 5550
$Comp
L Device:C C?
U 1 1 5FF704C1
P 6750 6000
AR Path="/5E9E88B8/5FF704C1" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5FF704C1" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5FF704C1" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5FF704C1" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5FF704C1" Ref="C?"  Part="1" 
F 0 "C?" H 6850 6000 50  0000 L CNN
F 1 "110pF" H 6850 5900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6788 5850 50  0001 C CNN
F 3 "~" H 6750 6000 50  0001 C CNN
	1    6750 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 5850 6750 5800
Connection ~ 6750 5800
Wire Wire Line
	6750 6150 6750 6200
Wire Wire Line
	6100 6200 6750 6200
Wire Wire Line
	5800 6250 5800 6200
Connection ~ 5800 6200
Wire Wire Line
	5800 6200 6100 6200
Wire Wire Line
	4350 1600 4350 2500
Wire Wire Line
	4300 1800 4300 3600
Wire Wire Line
	4250 4700 4250 2000
Wire Wire Line
	4250 2000 4150 2000
Wire Wire Line
	4300 1800 4150 1800
Wire Wire Line
	4350 1600 4150 1600
$Comp
L Relay:G6K-2 K?
U 1 1 6002B9DA
P 3000 1600
F 0 "K?" V 2350 1600 50  0000 C CNN
F 1 "AGQ200A12" V 3650 1600 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 3000 1600 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 3000 1600 50  0001 C CNN
	1    3000 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 1500 3400 1500
Wire Wire Line
	3450 1900 3450 1700
Wire Wire Line
	3450 1700 3300 1700
$Comp
L Relay:G6K-2 K?
U 1 1 5FFBA995
P 3850 1500
F 0 "K?" V 3200 1500 50  0000 C CNN
F 1 "AGQ200A12" V 4500 1500 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 3850 1500 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 3850 1500 50  0001 C CNN
	1    3850 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 1900 3550 1900
Wire Wire Line
	3300 1900 3400 1900
Wire Wire Line
	3400 1900 3400 1500
Connection ~ 3400 1500
Wire Wire Line
	3400 1500 3300 1500
Wire Wire Line
	3300 2100 3450 2100
Wire Wire Line
	3450 2100 3450 1900
Connection ~ 3450 1900
$Comp
L Relay:G6K-2 K?
U 1 1 600953A0
P 2150 2100
F 0 "K?" V 1500 2100 50  0000 C CNN
F 1 "AGQ200A12" V 2800 2100 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 2150 2100 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 2150 2100 50  0001 C CNN
	1    2150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 2000 2600 2000
Wire Wire Line
	2450 2200 2650 2200
Wire Wire Line
	2650 2200 2650 2600
Wire Wire Line
	2650 2600 2450 2600
Wire Wire Line
	2450 2400 2600 2400
Wire Wire Line
	2600 2400 2600 2000
Connection ~ 2600 2000
Wire Wire Line
	2600 2000 2600 1600
Wire Wire Line
	2600 1600 2700 1600
Wire Wire Line
	2600 2000 2700 2000
Wire Wire Line
	4200 5800 4200 2600
Wire Wire Line
	4200 2600 2650 2600
Connection ~ 2650 2600
Wire Wire Line
	1850 2500 1800 2500
Wire Wire Line
	1800 2500 1800 2100
Wire Wire Line
	1800 2100 1850 2100
Connection ~ 1800 2100
Text HLabel 1300 2100 0    50   Input ~ 0
TXIN
Wire Wire Line
	2450 1700 2500 1700
Wire Wire Line
	2500 1700 2500 750 
Wire Wire Line
	2500 750  3350 750 
Wire Wire Line
	4200 750  4200 1100
Wire Wire Line
	4200 1100 4150 1100
Wire Wire Line
	3300 1200 3350 1200
Wire Wire Line
	3350 1200 3350 750 
Connection ~ 3350 750 
Wire Wire Line
	3350 750  4200 750 
Wire Wire Line
	3550 1100 3500 1100
Wire Wire Line
	3500 1100 3500 1350
Text Label 3500 1350 1    50   ~ 0
B0IREL
Wire Wire Line
	1850 1700 1800 1700
Wire Wire Line
	1800 1700 1800 1950
Text Label 1800 1950 1    50   ~ 0
B2IREL
Wire Wire Line
	2700 1200 2650 1200
Wire Wire Line
	2650 1200 2650 1450
Text Label 2650 1450 1    50   ~ 0
B1IREL
Wire Wire Line
	7400 2000 7500 2000
Wire Wire Line
	7350 1800 7500 1800
Wire Wire Line
	7300 1600 7500 1600
$Comp
L Relay:G6K-2 K?
U 1 1 602157AF
P 8650 1600
F 0 "K?" V 8000 1600 50  0000 C CNN
F 1 "AGQ200A12" V 9300 1600 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 8650 1600 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 8650 1600 50  0001 C CNN
	1    8650 1600
	0    -1   1    0   
$EndComp
Wire Wire Line
	8100 1500 8250 1500
Wire Wire Line
	8200 1900 8200 1700
Wire Wire Line
	8200 1700 8350 1700
Wire Wire Line
	8200 1900 8100 1900
Wire Wire Line
	8350 1900 8250 1900
Wire Wire Line
	8250 1900 8250 1500
Connection ~ 8250 1500
Wire Wire Line
	8250 1500 8350 1500
Wire Wire Line
	8350 2100 8200 2100
Wire Wire Line
	8200 2100 8200 1900
Connection ~ 8200 1900
$Comp
L Relay:G6K-2 K?
U 1 1 602157C6
P 9500 2100
F 0 "K?" V 8850 2100 50  0000 C CNN
F 1 "AGQ200A12" V 10150 2100 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 9500 2100 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 9500 2100 50  0001 C CNN
	1    9500 2100
	0    -1   1    0   
$EndComp
Wire Wire Line
	9200 2000 9050 2000
Wire Wire Line
	9200 2200 9000 2200
Wire Wire Line
	9000 2200 9000 2600
Wire Wire Line
	9000 2600 9200 2600
Wire Wire Line
	9200 2400 9050 2400
Wire Wire Line
	9050 2400 9050 2000
Connection ~ 9050 2000
Wire Wire Line
	9050 2000 9050 1600
Wire Wire Line
	9050 1600 8950 1600
Wire Wire Line
	9050 2000 8950 2000
Wire Wire Line
	7450 5800 7450 2600
Wire Wire Line
	7450 2600 9000 2600
Connection ~ 9000 2600
Wire Wire Line
	9800 2500 9850 2500
Wire Wire Line
	9850 2500 9850 2100
Wire Wire Line
	9850 2100 9800 2100
Connection ~ 9850 2100
Text HLabel 10500 2100 2    50   Output ~ 0
TXOUT
Wire Wire Line
	9200 1700 9150 1700
Wire Wire Line
	9150 1700 9150 750 
Wire Wire Line
	9150 750  8300 750 
Wire Wire Line
	7450 750  7450 1100
Wire Wire Line
	7450 1100 7500 1100
Wire Wire Line
	8350 1200 8300 1200
Wire Wire Line
	8300 1200 8300 750 
Connection ~ 8300 750 
Wire Wire Line
	8300 750  7450 750 
Text Label 8200 1400 1    50   ~ 0
B0OREL
Text Label 9900 2000 1    50   ~ 0
B2OREL
Text Label 9050 1500 1    50   ~ 0
B10REL
Wire Wire Line
	7300 1600 7300 2500
Wire Wire Line
	7350 1800 7350 3600
Wire Wire Line
	7400 4700 7400 2000
Wire Wire Line
	9850 2100 10500 2100
$Comp
L Transistor_Array:ULN2003 U?
U 1 1 603BA23D
P 2550 3650
F 0 "U?" H 2250 4200 50  0000 L CNN
F 1 "ULN2003V12T16-13" H 2450 3100 50  0000 R CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 2600 3100 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ULN2003V12.pdf" H 2650 3450 50  0001 C CNN
	1    2550 3650
	1    0    0    -1  
$EndComp
Text GLabel 3050 3250 2    50   Input ~ 0
+12V
Wire Wire Line
	2950 3250 3050 3250
$Comp
L power:GND #PWR?
U 1 1 603EACCB
P 2550 4300
AR Path="/5E9F4ACB/603EACCB" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/603EACCB" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/603EACCB" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/603EACCB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 4050 50  0001 C CNN
F 1 "GND" H 2555 4127 50  0000 C CNN
F 2 "" H 2550 4300 50  0001 C CNN
F 3 "" H 2550 4300 50  0001 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4250 2550 4300
Wire Wire Line
	2950 3450 3600 3450
Wire Wire Line
	2950 3550 3600 3550
Wire Wire Line
	2950 3650 3600 3650
Wire Wire Line
	2950 3750 3600 3750
Wire Wire Line
	2950 3850 3600 3850
Wire Wire Line
	2950 3950 3600 3950
Wire Wire Line
	2150 3750 2050 3750
Wire Wire Line
	2050 3750 2050 3450
Wire Wire Line
	2050 3450 2150 3450
Wire Wire Line
	2000 3850 2150 3850
Wire Wire Line
	2150 3950 1950 3950
Wire Wire Line
	1950 3950 1950 3650
Wire Wire Line
	8200 1400 8200 1100
$Comp
L Relay:G6K-2 K?
U 1 1 602157B8
P 7800 1500
F 0 "K?" V 7150 1500 50  0000 C CNN
F 1 "AGQ200A12" V 8450 1500 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 7800 1500 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 7800 1500 50  0001 C CNN
	1    7800 1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	8100 1100 8200 1100
Wire Wire Line
	9050 1200 9050 1500
Wire Wire Line
	8950 1200 9050 1200
Wire Wire Line
	9900 1700 9900 2000
Wire Wire Line
	9800 1700 9900 1700
Text Label 3600 3450 2    50   ~ 0
B0IREL
Text Label 3600 3550 2    50   ~ 0
B1IREL
Text Label 3600 3650 2    50   ~ 0
B2IREL
Text Label 3600 3750 2    50   ~ 0
B0OREL
Text Label 3600 3850 2    50   ~ 0
B10REL
Text Label 3600 3950 2    50   ~ 0
B2OREL
Text Label 1600 3650 0    50   ~ 0
BAND2
Text Label 1600 3550 0    50   ~ 0
BAND1
Text Label 1600 3450 0    50   ~ 0
BAND0
Entry Wire Line
	1450 3350 1550 3450
Entry Wire Line
	1450 3450 1550 3550
Entry Wire Line
	1450 3550 1550 3650
Wire Bus Line
	1450 3200 1300 3200
Text HLabel 1300 3200 0    50   Input ~ 0
BAND[0..2]
Wire Wire Line
	2150 3650 1950 3650
Connection ~ 1950 3650
Wire Wire Line
	1950 3650 1550 3650
Wire Wire Line
	2150 3550 2000 3550
Wire Wire Line
	1550 3450 2050 3450
Connection ~ 2050 3450
Wire Wire Line
	2000 3850 2000 3550
Connection ~ 2000 3550
Wire Wire Line
	2000 3550 1550 3550
Wire Wire Line
	1300 2100 1800 2100
$Comp
L Relay:G6K-2 K?
U 1 1 5EC33834
P 8800 3750
F 0 "K?" V 8150 3750 50  0000 C CNN
F 1 "AGQ200A12" V 9450 3750 50  0000 C CNN
F 2 "Relay_SMD:Relay_DPDT_Omron_G6K-2F-Y" H 8800 3750 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/ae/search_num/index.jsp?c=detail&part_no=AGQ200A12" H 8800 3750 50  0001 C CNN
	1    8800 3750
	0    -1   1    0   
$EndComp
Wire Wire Line
	2400 750  2500 750 
Connection ~ 2500 750 
Wire Wire Line
	9150 750  9250 750 
Connection ~ 9150 750 
Text GLabel 8400 3350 0    50   Input ~ 0
+12V
Text Label 3600 4050 2    50   ~ 0
TXREL
Wire Wire Line
	2950 4050 3600 4050
Text Label 9400 3350 2    50   ~ 0
TXREL
$Comp
L power:GND #PWR?
U 1 1 5EE32E20
P 9150 4200
AR Path="/5E9F4ACB/5EE32E20" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE32E20" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EE32E20" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EE32E20" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9150 3950 50  0001 C CNN
F 1 "GND" H 9155 4027 50  0000 C CNN
F 2 "" H 9150 4200 50  0001 C CNN
F 3 "" H 9150 4200 50  0001 C CNN
	1    9150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4050 1300 4050
Text HLabel 1300 4050 0    50   Input ~ 0
TX-EN
Text HLabel 10500 5100 2    50   Output ~ 0
RXANT
Wire Wire Line
	9100 3350 9400 3350
Wire Wire Line
	8500 3350 8400 3350
Wire Wire Line
	9100 3750 10500 3750
Wire Wire Line
	8500 3650 8350 3650
Wire Wire Line
	8350 3650 8350 4250
Wire Wire Line
	8350 5100 8650 5100
Wire Wire Line
	8500 4250 8350 4250
Wire Wire Line
	8500 3850 8400 3850
Wire Wire Line
	8400 3850 8400 4750
Text HLabel 10500 4750 2    50   Input ~ 0
TXANT
Text HLabel 10500 3750 2    50   BiDi ~ 0
ANT
Wire Wire Line
	9100 4150 9150 4150
Wire Wire Line
	9150 4150 9150 4200
NoConn ~ 8500 4050
$Comp
L Device:C C?
U 1 1 5F0D4560
P 2200 6300
AR Path="/5E9E88B8/5F0D4560" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5F0D4560" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5F0D4560" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5F0D4560" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5F0D4560" Ref="C?"  Part="1" 
F 0 "C?" H 2300 6350 50  0000 L CNN
F 1 "1.0uF" H 2300 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2238 6150 50  0001 C CNN
F 3 "~" H 2200 6300 50  0001 C CNN
	1    2200 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6150 2200 6100
$Comp
L Device:CP1 C?
U 1 1 5F0D4569
P 2650 6300
F 0 "C?" H 2765 6346 50  0000 L CNN
F 1 "47uF 16V" H 2765 6255 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.8" H 2650 6300 50  0001 C CNN
F 3 "~" H 2650 6300 50  0001 C CNN
	1    2650 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6100 2650 6150
Wire Wire Line
	2200 6100 2650 6100
Wire Wire Line
	2650 6500 2650 6450
Wire Wire Line
	2200 6450 2200 6500
Wire Wire Line
	2200 6500 2450 6500
Text GLabel 2850 6100 2    50   Input ~ 0
+12V-TX
Wire Wire Line
	2650 6100 2850 6100
Connection ~ 2650 6100
$Comp
L power:GND #PWR?
U 1 1 5F0F1269
P 2450 6550
AR Path="/5E9F4ACB/5F0F1269" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5F0F1269" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5F0F1269" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5F0F1269" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 6300 50  0001 C CNN
F 1 "GND" H 2455 6377 50  0000 C CNN
F 2 "" H 2450 6550 50  0001 C CNN
F 3 "" H 2450 6550 50  0001 C CNN
	1    2450 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6550 2450 6500
Connection ~ 2450 6500
Wire Wire Line
	2450 6500 2650 6500
$Comp
L Device:C C?
U 1 1 5F149CDC
P 8800 5100
AR Path="/5E9E88B8/5F149CDC" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5F149CDC" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5F149CDC" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5F149CDC" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5F149CDC" Ref="C?"  Part="1" 
F 0 "C?" V 8950 5150 50  0000 L CNN
F 1 "0.1uF" V 8950 5100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8838 4950 50  0001 C CNN
F 3 "~" H 8800 5100 50  0001 C CNN
	1    8800 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 5100 10500 5100
Wire Wire Line
	8350 4250 8350 5100
Connection ~ 8350 4250
$Comp
L Device:C C?
U 1 1 5EC81FA4
P 8800 4750
AR Path="/5E9E88B8/5EC81FA4" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EC81FA4" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EC81FA4" Ref="C?"  Part="1" 
AR Path="/5EAAFBD4/5EC81FA4" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5EC81FA4" Ref="C?"  Part="1" 
F 0 "C?" V 8950 4800 50  0000 L CNN
F 1 "0.1uF" V 8950 4750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8838 4600 50  0001 C CNN
F 3 "~" H 8800 4750 50  0001 C CNN
	1    8800 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 4750 8400 4750
Wire Wire Line
	8950 4750 10500 4750
Wire Wire Line
	4150 1400 4800 1400
Wire Wire Line
	4350 2500 4800 2500
Wire Wire Line
	4300 3600 4800 3600
Wire Wire Line
	4250 4700 4800 4700
Wire Wire Line
	4200 5800 4800 5800
Wire Wire Line
	6750 5800 7450 5800
Wire Wire Line
	6750 4700 7400 4700
Wire Wire Line
	6750 3600 7350 3600
Wire Wire Line
	6750 2500 7300 2500
Wire Wire Line
	6750 1400 7500 1400
Text GLabel 9250 750  2    50   Input ~ 0
+12V-TX
Text GLabel 2400 750  0    50   Input ~ 0
+12V-TX
$Comp
L Device:C C?
U 1 1 5F70CAA1
P 950 6300
AR Path="/5E9E88B8/5F70CAA1" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5F70CAA1" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5F70CAA1" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5F70CAA1" Ref="C?"  Part="1" 
AR Path="/5FE5C441/5F70CAA1" Ref="C?"  Part="1" 
F 0 "C?" H 1050 6350 50  0000 L CNN
F 1 "1.0uF" H 1050 6250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 988 6150 50  0001 C CNN
F 3 "~" H 950 6300 50  0001 C CNN
	1    950  6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6150 950  6100
$Comp
L Device:CP1 C?
U 1 1 5F70CAA8
P 1400 6300
F 0 "C?" H 1515 6346 50  0000 L CNN
F 1 "47uF 16V" H 1515 6255 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.8" H 1400 6300 50  0001 C CNN
F 3 "~" H 1400 6300 50  0001 C CNN
	1    1400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6100 1400 6150
Wire Wire Line
	950  6100 1400 6100
Wire Wire Line
	1400 6500 1400 6450
Wire Wire Line
	950  6450 950  6500
Wire Wire Line
	950  6500 1200 6500
Text GLabel 1600 6100 2    50   Input ~ 0
+12V
Wire Wire Line
	1400 6100 1600 6100
Connection ~ 1400 6100
$Comp
L power:GND #PWR?
U 1 1 5F70CAB6
P 1200 6550
AR Path="/5E9F4ACB/5F70CAB6" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5F70CAB6" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5F70CAB6" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5F70CAB6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1200 6300 50  0001 C CNN
F 1 "GND" H 1205 6377 50  0000 C CNN
F 2 "" H 1200 6550 50  0001 C CNN
F 3 "" H 1200 6550 50  0001 C CNN
	1    1200 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6550 1200 6500
Connection ~ 1200 6500
Wire Wire Line
	1200 6500 1400 6500
Wire Bus Line
	1450 3200 1450 3650
$EndSCHEMATC
