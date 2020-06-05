EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 14
Title ""
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L sdr-trx:INA300 U40
U 1 1 5FDE4D8C
P 6250 5900
F 0 "U40" H 6250 6250 60  0000 C CNN
F 1 "INA300" H 6250 5550 60  0000 C CNN
F 2 "Package_SO:VSSOP-10_3x3mm_P0.5mm" H 6250 5900 60  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/ina300.pdf" H 5650 5900 60  0001 C CNN
	1    6250 5900
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FC927AD
P 10250 1900
AR Path="/5E9E88B8/5FC927AD" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FC927AD" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FC927AD" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FC927AD" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FC927AD" Ref="C306"  Part="1" 
F 0 "C306" H 10350 1950 50  0000 L CNN
F 1 "0.1uF" H 10350 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10288 1750 50  0001 C CNN
F 3 "~" H 10250 1900 50  0001 C CNN
	1    10250 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2150 10250 2050
Wire Wire Line
	10200 1700 10250 1700
Wire Wire Line
	10250 1700 10250 1750
Text Label 10450 1700 2    50   ~ 0
+5V
Wire Wire Line
	10250 1700 10450 1700
Connection ~ 10250 1700
$Comp
L power:GND #PWR?
U 1 1 5FD8222D
P 2550 2800
AR Path="/5E9F4ACB/5FD8222D" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FD8222D" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FD8222D" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FD8222D" Ref="#PWR?"  Part="1" 
AR Path="/5FD8222D" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FD8222D" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 2550 2550 50  0001 C CNN
F 1 "GND" H 2555 2627 50  0000 C CNN
F 2 "" H 2550 2800 50  0001 C CNN
F 3 "" H 2550 2800 50  0001 C CNN
	1    2550 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD4EB59
P 4750 4850
AR Path="/5E9F4ACB/5FD4EB59" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FD4EB59" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FD4EB59" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FD4EB59" Ref="#PWR?"  Part="1" 
AR Path="/5FD4EB59" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FD4EB59" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 4750 4600 50  0001 C CNN
F 1 "GND" H 4755 4677 50  0000 C CNN
F 2 "" H 4750 4850 50  0001 C CNN
F 3 "" H 4750 4850 50  0001 C CNN
	1    4750 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4800 5450 4800
$Comp
L Device:R R?
U 1 1 5FD1D4DC
P 4950 4700
AR Path="/5E9E88B8/5FD1D4DC" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FD1D4DC" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FD1D4DC" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FD1D4DC" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FD1D4DC" Ref="R154"  Part="1" 
F 0 "R154" V 4850 4650 50  0000 R CNN
F 1 "1K" V 4850 4750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 4700 50  0001 C CNN
F 3 "~" H 4950 4700 50  0001 C CNN
	1    4950 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	9600 2200 9600 2150
$Comp
L power:GND #PWR?
U 1 1 5FCDDB22
P 9600 2200
AR Path="/5E9F4ACB/5FCDDB22" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FCDDB22" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FCDDB22" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FCDDB22" Ref="#PWR?"  Part="1" 
AR Path="/5FCDDB22" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FCDDB22" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 9600 1950 50  0001 C CNN
F 1 "GND" H 9605 2027 50  0000 C CNN
F 2 "" H 9600 2200 50  0001 C CNN
F 3 "" H 9600 2200 50  0001 C CNN
	1    9600 2200
	1    0    0    -1  
$EndComp
Connection ~ 8450 1700
Connection ~ 8950 1700
Wire Wire Line
	8950 1700 8450 1700
Wire Wire Line
	8950 1700 8950 1750
Wire Wire Line
	9000 1700 8950 1700
Wire Wire Line
	9600 2150 10250 2150
Connection ~ 9600 2150
Wire Wire Line
	9600 2100 9600 2150
Wire Wire Line
	8950 2150 9600 2150
Wire Wire Line
	8950 2050 8950 2150
Connection ~ 8450 5000
Wire Wire Line
	8450 5450 8450 5400
Wire Wire Line
	5150 2250 5500 2250
Wire Wire Line
	5500 2350 5200 2350
Connection ~ 6900 1700
Connection ~ 4750 1700
Wire Wire Line
	4750 1700 5950 1700
Connection ~ 1950 2350
Wire Wire Line
	1800 3100 4350 3100
Wire Wire Line
	1800 2350 1800 3100
Wire Wire Line
	1950 2350 1800 2350
Connection ~ 4350 1700
Connection ~ 3950 1700
Wire Wire Line
	3950 1700 4350 1700
$Comp
L Device:R R?
U 1 1 5FB831AF
P 4350 2650
AR Path="/5E9E88B8/5FB831AF" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FB831AF" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FB831AF" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FB831AF" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FB831AF" Ref="R151"  Part="1" 
F 0 "R151" H 4400 2700 50  0000 L CNN
F 1 "4.7M" H 4400 2600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4280 2650 50  0001 C CNN
F 3 "~" H 4350 2650 50  0001 C CNN
	1    4350 2650
	1    0    0    -1  
$EndComp
Connection ~ 4750 2100
Wire Wire Line
	4750 2150 4750 2100
Wire Wire Line
	4750 2100 4650 2100
Wire Wire Line
	4750 2050 4750 2100
Wire Wire Line
	4750 1700 4750 1750
Wire Wire Line
	4350 1700 4750 1700
Wire Wire Line
	4350 1700 4350 1900
$Comp
L Device:R R?
U 1 1 5FB73D4B
P 4750 2300
AR Path="/5E9E88B8/5FB73D4B" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FB73D4B" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FB73D4B" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FB73D4B" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FB73D4B" Ref="R153"  Part="1" 
F 0 "R153" H 4800 2350 50  0000 L CNN
F 1 "510K" H 4800 2250 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 2300 50  0001 C CNN
F 3 "~" H 4750 2300 50  0001 C CNN
	1    4750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FB73D45
P 4750 1900
AR Path="/5E9E88B8/5FB73D45" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FB73D45" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FB73D45" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FB73D45" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FB73D45" Ref="R152"  Part="1" 
F 0 "R152" H 4800 1950 50  0000 L CNN
F 1 "1M" H 4800 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 1900 50  0001 C CNN
F 3 "~" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PNP_BEC Q26
U 1 1 5FB73D3F
P 4450 2100
F 0 "Q26" H 4450 1950 50  0000 R CNN
F 1 "2SB1198K" V 4650 2000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4650 2200 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sb1198k.pdf" H 4450 2100 50  0001 C CNN
	1    4450 2100
	-1   0    0    1   
$EndComp
Connection ~ 3950 2100
Wire Wire Line
	3950 2150 3950 2100
Wire Wire Line
	3950 2100 3850 2100
Wire Wire Line
	3950 2050 3950 2100
Connection ~ 3550 1700
Wire Wire Line
	3950 1700 3950 1750
Wire Wire Line
	3550 1700 3950 1700
Wire Wire Line
	3050 1700 3550 1700
Wire Wire Line
	3550 1700 3550 1900
Wire Wire Line
	3550 2300 3550 2350
$Comp
L Device:R R?
U 1 1 5FAF80A7
P 3050 1900
AR Path="/5E9E88B8/5FAF80A7" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FAF80A7" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FAF80A7" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FAF80A7" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FAF80A7" Ref="R144"  Part="1" 
F 0 "R144" H 3100 1950 50  0000 L CNN
F 1 "1M" H 3100 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2980 1900 50  0001 C CNN
F 3 "~" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2350 3500 2350
Connection ~ 3150 2350
Wire Wire Line
	3150 2350 3200 2350
$Comp
L Device:R R?
U 1 1 5FADE799
P 3350 2350
AR Path="/5E9E88B8/5FADE799" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FADE799" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FADE799" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FADE799" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FADE799" Ref="R146"  Part="1" 
F 0 "R146" V 3250 2300 50  0000 R CNN
F 1 "4.7M" V 3450 2400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 2350 50  0001 C CNN
F 3 "~" H 3350 2350 50  0001 C CNN
	1    3350 2350
	0    1    1    0   
$EndComp
Connection ~ 3050 1700
Connection ~ 2050 1700
Wire Wire Line
	1650 1700 2050 1700
Text HLabel 1650 1700 0    50   BiDi ~ 0
BAT-V
Wire Wire Line
	2550 2750 2800 2750
Connection ~ 2550 2750
Wire Wire Line
	2550 2800 2550 2750
$Comp
L power:GND #PWR?
U 1 1 5FA923A3
P 8450 5850
AR Path="/5E9F4ACB/5FA923A3" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FA923A3" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FA923A3" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FA923A3" Ref="#PWR?"  Part="1" 
AR Path="/5FA923A3" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FA923A3" Ref="#PWR0172"  Part="1" 
F 0 "#PWR0172" H 8450 5600 50  0001 C CNN
F 1 "GND" H 8455 5677 50  0000 C CNN
F 2 "" H 8450 5850 50  0001 C CNN
F 3 "" H 8450 5850 50  0001 C CNN
	1    8450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2750 2550 2750
Connection ~ 2300 2750
Wire Wire Line
	2300 2550 2300 2750
Wire Wire Line
	2800 2750 3150 2750
Connection ~ 2800 2750
Wire Wire Line
	2800 2550 2800 2750
Wire Wire Line
	3150 2750 3150 2700
Wire Wire Line
	1950 2750 2300 2750
Wire Wire Line
	1950 2700 1950 2750
Wire Wire Line
	1950 2350 1950 2400
Wire Wire Line
	2000 2350 1950 2350
Wire Wire Line
	3150 2350 3150 2400
Wire Wire Line
	3100 2350 3150 2350
$Comp
L Device:R R?
U 1 1 5FA5F55F
P 1950 2550
AR Path="/5E9E88B8/5FA5F55F" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FA5F55F" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FA5F55F" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FA5F55F" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FA5F55F" Ref="R141"  Part="1" 
F 0 "R141" H 2000 2600 50  0000 L CNN
F 1 "1M" H 2000 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1880 2550 50  0001 C CNN
F 3 "~" H 1950 2550 50  0001 C CNN
	1    1950 2550
	1    0    0    -1  
$EndComp
Connection ~ 2300 2100
Wire Wire Line
	2300 2150 2300 2100
Wire Wire Line
	2800 2150 2800 2100
Connection ~ 2800 2100
$Comp
L Device:Q_NPN_BEC Q23
U 1 1 5FA47CAD
P 2900 2350
F 0 "Q23" H 2900 2500 50  0000 R CNN
F 1 "2SC2412K" V 3150 2350 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3100 2450 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1918636.pdf" H 2900 2350 50  0001 C CNN
	1    2900 2350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FA45F23
P 3150 2550
AR Path="/5E9E88B8/5FA45F23" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FA45F23" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FA45F23" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FA45F23" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FA45F23" Ref="R145"  Part="1" 
F 0 "R145" H 3200 2600 50  0000 L CNN
F 1 "1M" H 3200 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3080 2550 50  0001 C CNN
F 3 "~" H 3150 2550 50  0001 C CNN
	1    3150 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q20
U 1 1 5FA4258A
P 2200 2350
F 0 "Q20" H 2150 2500 50  0000 R CNN
F 1 "2SC2412K" V 2450 2350 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2400 2450 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1918636.pdf" H 2200 2350 50  0001 C CNN
	1    2200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2100 3050 2050
Wire Wire Line
	2800 2100 3050 2100
Wire Wire Line
	2800 2000 2800 2100
Wire Wire Line
	2300 2100 2300 2000
Wire Wire Line
	2050 2100 2300 2100
Wire Wire Line
	2050 2050 2050 2100
Wire Wire Line
	2500 1700 2550 1700
Wire Wire Line
	3050 1700 3050 1750
Wire Wire Line
	3000 1700 3050 1700
Wire Wire Line
	2050 1700 2050 1750
Wire Wire Line
	2100 1700 2050 1700
$Comp
L Device:R R?
U 1 1 5FA14826
P 2050 1900
AR Path="/5E9E88B8/5FA14826" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FA14826" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FA14826" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FA14826" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FA14826" Ref="R143"  Part="1" 
F 0 "R143" H 2100 1900 50  0000 L CNN
F 1 "1M" H 2100 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 1900 50  0001 C CNN
F 3 "~" H 2050 1900 50  0001 C CNN
	1    2050 1900
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 2 1 5FA08940
P 2800 1800
AR Path="/5ED56EC4/5FA08940" Ref="Q?"  Part="2" 
AR Path="/5FDAA718/5FA08940" Ref="Q22"  Part="2" 
F 0 "Q22" V 3150 1800 50  0000 C CNN
F 1 "Si4909DY" V 3050 1800 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2850 1800 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 2850 1800 50  0001 C CNN
	2    2800 1800
	0    -1   -1   0   
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 1 1 5F9F06D6
P 2300 1800
AR Path="/5ED56EC4/5F9F06D6" Ref="Q?"  Part="2" 
AR Path="/5FDAA718/5F9F06D6" Ref="Q22"  Part="1" 
F 0 "Q22" V 2650 1800 50  0000 C CNN
F 1 "Si4909DY" V 2550 1800 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2350 1800 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 2350 1800 50  0001 C CNN
	1    2300 1800
	0    1    -1   0   
$EndComp
Wire Wire Line
	6700 2350 7600 2350
$Comp
L Device:R R?
U 1 1 5F9BC23F
P 7350 1900
AR Path="/5E9E88B8/5F9BC23F" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F9BC23F" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F9BC23F" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F9BC23F" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5F9BC23F" Ref="R165"  Part="1" 
F 0 "R165" H 7400 1950 50  0000 L CNN
F 1 "75R 0.25W" H 7400 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7280 1900 50  0001 C CNN
F 3 "~" H 7350 1900 50  0001 C CNN
	1    7350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F9BBD2C
P 7900 1900
AR Path="/5E9E88B8/5F9BBD2C" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F9BBD2C" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F9BBD2C" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F9BBD2C" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5F9BBD2C" Ref="R168"  Part="1" 
F 0 "R168" H 7950 1950 50  0000 L CNN
F 1 "75R 0.25W" H 7950 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7830 1900 50  0001 C CNN
F 3 "~" H 7900 1900 50  0001 C CNN
	1    7900 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F9BB849
P 7900 3000
AR Path="/5E9E88B8/5F9BB849" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F9BB849" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F9BB849" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F9BB849" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5F9BB849" Ref="R169"  Part="1" 
F 0 "R169" H 7950 3050 50  0000 L CNN
F 1 "75R 0.25W" H 7950 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7830 3000 50  0001 C CNN
F 3 "~" H 7900 3000 50  0001 C CNN
	1    7900 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F9BB2F5
P 7350 3000
AR Path="/5E9E88B8/5F9BB2F5" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F9BB2F5" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F9BB2F5" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F9BB2F5" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5F9BB2F5" Ref="R166"  Part="1" 
F 0 "R166" H 7400 3050 50  0000 L CNN
F 1 "75R 0.25W" H 7400 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7280 3000 50  0001 C CNN
F 3 "~" H 7350 3000 50  0001 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
Connection ~ 7900 1700
Wire Wire Line
	7900 1700 8450 1700
Connection ~ 7350 1700
Wire Wire Line
	7350 1700 7900 1700
Wire Wire Line
	7350 2100 7900 2100
Wire Wire Line
	7900 2800 8450 2800
Wire Wire Line
	7350 2800 7900 2800
Wire Wire Line
	7350 3200 7900 3200
Wire Wire Line
	6700 3450 7600 3450
Wire Wire Line
	7900 3900 8450 3900
Wire Wire Line
	7350 3900 7900 3900
Connection ~ 7900 5000
Wire Wire Line
	7900 5000 8450 5000
Connection ~ 7350 5000
Wire Wire Line
	7350 5000 7900 5000
Wire Wire Line
	6700 4550 7600 4550
Wire Wire Line
	7350 4300 7900 4300
$Comp
L Device:R R?
U 1 1 5F960BCB
P 7350 4100
AR Path="/5E9E88B8/5F960BCB" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F960BCB" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F960BCB" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F960BCB" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5F960BCB" Ref="R167"  Part="1" 
F 0 "R167" H 7400 4150 50  0000 L CNN
F 1 "75R 0.25W" H 7400 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7280 4100 50  0001 C CNN
F 3 "~" H 7350 4100 50  0001 C CNN
	1    7350 4100
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:S-812CXXA U41
U 1 1 5FDE4E0D
P 9600 1700
F 0 "U41" H 9600 2000 60  0000 C CNN
F 1 "S-812C50A" H 9600 1900 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 9600 1700 60  0001 C CNN
F 3 "https://www.ablic.com/en/doc/datasheet/voltage_regulator/S812C_E.pdf" H 9000 1600 60  0001 C CNN
	1    9600 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FDE4DDF
P 3950 2300
AR Path="/5E9E88B8/5FDE4DDF" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4DDF" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4DDF" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4DDF" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4DDF" Ref="R148"  Part="1" 
F 0 "R148" H 4000 2350 50  0000 L CNN
F 1 "510K" H 4000 2250 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 2300 50  0001 C CNN
F 3 "~" H 3950 2300 50  0001 C CNN
	1    3950 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FDE4DD9
P 3950 1900
AR Path="/5E9E88B8/5FDE4DD9" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4DD9" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4DD9" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4DD9" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4DD9" Ref="R147"  Part="1" 
F 0 "R147" H 4000 1950 50  0000 L CNN
F 1 "1M" H 4000 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 1900 50  0001 C CNN
F 3 "~" H 3950 1900 50  0001 C CNN
	1    3950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PNP_BEC Q24
U 1 1 5FDE4DD3
P 3650 2100
F 0 "Q24" H 3650 1950 50  0000 R CNN
F 1 "2SB1198K" V 3850 2000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3850 2200 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sb1198k.pdf" H 3650 2100 50  0001 C CNN
	1    3650 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5FDE4DC0
P 8950 1900
AR Path="/5E9E88B8/5FDE4DC0" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4DC0" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4DC0" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4DC0" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4DC0" Ref="C305"  Part="1" 
F 0 "C305" H 9050 1950 50  0000 L CNN
F 1 "0.1uF" H 9050 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8988 1750 50  0001 C CNN
F 3 "~" H 8950 1900 50  0001 C CNN
	1    8950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FDE4D92
P 8450 5600
AR Path="/5E9E88B8/5FDE4D92" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D92" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D92" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D92" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D92" Ref="R173"  Part="1" 
F 0 "R173" H 8500 5650 50  0000 L CNN
F 1 "20mR 0.25W" H 8500 5550 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8380 5600 50  0001 C CNN
F 3 "~" H 8450 5600 50  0001 C CNN
	1    8450 5600
	1    0    0    -1  
$EndComp
Connection ~ 8450 3900
Connection ~ 8450 2800
Wire Wire Line
	5250 2600 5250 2950
Wire Wire Line
	5500 2600 5250 2600
Wire Wire Line
	5450 2500 5450 2650
Wire Wire Line
	5250 3450 5250 3250
Wire Wire Line
	5500 3450 5250 3450
Wire Wire Line
	5450 2950 5450 3350
$Comp
L Device:R R?
U 1 1 5FDE4D7E
P 5250 3100
AR Path="/5E9E88B8/5FDE4D7E" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D7E" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D7E" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D7E" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D7E" Ref="R155"  Part="1" 
F 0 "R155" H 5300 3150 50  0000 L CNN
F 1 "1K" H 5300 3050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5180 3100 50  0001 C CNN
F 3 "~" H 5250 3100 50  0001 C CNN
	1    5250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2500 5450 2500
Wire Wire Line
	5500 3350 5450 3350
$Comp
L Device:R R?
U 1 1 5FDE4D76
P 5450 2800
AR Path="/5E9E88B8/5FDE4D76" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D76" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D76" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D76" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D76" Ref="R160"  Part="1" 
F 0 "R160" H 5500 2850 50  0000 L CNN
F 1 "1K" H 5500 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 2800 50  0001 C CNN
F 3 "~" H 5450 2800 50  0001 C CNN
	1    5450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3700 5250 4050
Wire Wire Line
	5500 3700 5250 3700
Wire Wire Line
	5450 3600 5450 3750
Wire Wire Line
	5250 4550 5250 4350
Wire Wire Line
	5500 4550 5250 4550
Wire Wire Line
	5450 4050 5450 4450
$Comp
L Device:R R?
U 1 1 5FDE4D6A
P 5250 4200
AR Path="/5E9E88B8/5FDE4D6A" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D6A" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D6A" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D6A" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D6A" Ref="R156"  Part="1" 
F 0 "R156" H 5300 4250 50  0000 L CNN
F 1 "1K" H 5300 4150 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5180 4200 50  0001 C CNN
F 3 "~" H 5250 4200 50  0001 C CNN
	1    5250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3600 5450 3600
Wire Wire Line
	5500 4450 5450 4450
$Comp
L Device:R R?
U 1 1 5FDE4D62
P 5450 3900
AR Path="/5E9E88B8/5FDE4D62" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D62" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D62" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D62" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D62" Ref="R161"  Part="1" 
F 0 "R161" H 5500 3950 50  0000 L CNN
F 1 "1K" H 5500 3850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 3900 50  0001 C CNN
F 3 "~" H 5450 3900 50  0001 C CNN
	1    5450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4300 7350 4250
Wire Wire Line
	7350 3950 7350 3900
Wire Wire Line
	6900 3950 6900 3900
Wire Wire Line
	6900 4450 7350 4450
Wire Wire Line
	7350 4450 7350 4650
Connection ~ 6900 4450
Wire Wire Line
	6700 4450 6900 4450
Wire Wire Line
	6900 4250 6900 4300
Wire Wire Line
	8450 5000 8450 4650
Wire Wire Line
	8450 3900 8450 4350
Wire Wire Line
	7350 4950 7350 5000
Wire Wire Line
	6900 5000 7350 5000
Connection ~ 6900 5000
Wire Wire Line
	6900 4950 6900 5000
Wire Wire Line
	7900 5000 7900 4750
Wire Wire Line
	6700 5000 6900 5000
Wire Wire Line
	6750 4600 6750 4700
Wire Wire Line
	6900 4600 6750 4600
Wire Wire Line
	6900 4650 6900 4600
Wire Wire Line
	7900 3900 7900 3950
Wire Wire Line
	7900 4300 7900 4350
Connection ~ 7900 4300
Wire Wire Line
	7900 4250 7900 4300
$Comp
L Device:R R?
U 1 1 5FDE4D40
P 6900 4100
AR Path="/5E9E88B8/5FDE4D40" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D40" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D40" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D40" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D40" Ref="R164"  Part="1" 
F 0 "R164" H 6950 4150 50  0000 L CNN
F 1 "470R" H 6950 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6830 4100 50  0001 C CNN
F 3 "~" H 6900 4100 50  0001 C CNN
	1    6900 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FDE4D34
P 7900 4100
AR Path="/5E9E88B8/5FDE4D34" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D34" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4D34" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D34" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4D34" Ref="R170"  Part="1" 
F 0 "R170" H 7950 4150 50  0000 L CNN
F 1 "75R 0.25W" H 7950 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7830 4100 50  0001 C CNN
F 3 "~" H 7900 4100 50  0001 C CNN
	1    7900 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5FDE4D2D
P 7800 4550
AR Path="/5EA188E4/5FDE4D2D" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D2D" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D2D" Ref="Q?"  Part="1" 
AR Path="/5FDAA718/5FDE4D2D" Ref="Q29"  Part="1" 
F 0 "Q29" H 7800 4700 50  0000 R CNN
F 1 "BSS138P" V 8050 4700 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8000 4650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 7800 4550 50  0001 C CNN
	1    7800 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FDE4D27
P 7350 4800
AR Path="/5E9E88B8/5FDE4D27" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D27" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4D27" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D27" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4D27" Ref="C303"  Part="1" 
F 0 "C303" H 7465 4846 50  0000 L CNN
F 1 "0.1uF" H 7465 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7388 4650 50  0001 C CNN
F 3 "~" H 7350 4800 50  0001 C CNN
	1    7350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4800 6700 5000
Wire Wire Line
	6700 4700 6750 4700
$Comp
L Device:C C?
U 1 1 5FDE4D1F
P 6900 4800
AR Path="/5E9E88B8/5FDE4D1F" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4D1F" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4D1F" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4D1F" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4D1F" Ref="C299"  Part="1" 
F 0 "C299" H 7015 4846 50  0000 L CNN
F 1 "10nF" H 7015 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6938 4650 50  0001 C CNN
F 3 "~" H 6900 4800 50  0001 C CNN
	1    6900 4800
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:S-8209A U39
U 1 1 5FDE4D19
P 6100 4650
F 0 "U39" H 6100 5137 60  0000 C CNN
F 1 "S-8209A" H 6100 5031 60  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 6100 4650 60  0001 C CNN
F 3 "https://www.ablic.com/en/doc/datasheet/battery_protection/S8209A_E.pdf" H 5500 4650 60  0001 C CNN
	1    6100 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT4
U 1 1 5FDE4D13
P 8450 4550
F 0 "BT4" V 8350 4650 50  0000 L CNN
F 1 "18650-holder-1042" V 8600 4600 50  0000 C CNN
F 2 "sdr-trx:BATT-18650-1042" V 8450 4610 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p27.pdf" V 8450 4610 50  0001 C CNN
	1    8450 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3200 7350 3150
Wire Wire Line
	7350 2850 7350 2800
Wire Wire Line
	6900 2850 6900 2800
Wire Wire Line
	6900 3350 7350 3350
Wire Wire Line
	7350 3350 7350 3550
Connection ~ 6900 3350
Wire Wire Line
	6700 3350 6900 3350
Wire Wire Line
	6900 3150 6900 3200
Connection ~ 7900 3900
Wire Wire Line
	8450 3900 8450 3550
Wire Wire Line
	8450 2800 8450 3250
Connection ~ 7350 3900
Wire Wire Line
	7350 3850 7350 3900
Wire Wire Line
	6900 3900 7350 3900
Connection ~ 6900 3900
Wire Wire Line
	6900 3850 6900 3900
Wire Wire Line
	7900 3900 7900 3650
Wire Wire Line
	6700 3900 6900 3900
Wire Wire Line
	6750 3500 6750 3600
Wire Wire Line
	6900 3500 6750 3500
Wire Wire Line
	6900 3550 6900 3500
Wire Wire Line
	7900 2800 7900 2850
Wire Wire Line
	7900 3200 7900 3250
Connection ~ 7900 3200
Wire Wire Line
	7900 3150 7900 3200
$Comp
L Device:R R?
U 1 1 5FDE4CF1
P 6900 3000
AR Path="/5E9E88B8/5FDE4CF1" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4CF1" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4CF1" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4CF1" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4CF1" Ref="R163"  Part="1" 
F 0 "R163" H 6950 3050 50  0000 L CNN
F 1 "470R" H 6950 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6830 3000 50  0001 C CNN
F 3 "~" H 6900 3000 50  0001 C CNN
	1    6900 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5FDE4CDE
P 7800 3450
AR Path="/5EA188E4/5FDE4CDE" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4CDE" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5FDE4CDE" Ref="Q?"  Part="1" 
AR Path="/5FDAA718/5FDE4CDE" Ref="Q28"  Part="1" 
F 0 "Q28" H 7800 3600 50  0000 R CNN
F 1 "BSS138P" V 8050 3600 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8000 3550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 7800 3450 50  0001 C CNN
	1    7800 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FDE4CD8
P 7350 3700
AR Path="/5E9E88B8/5FDE4CD8" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4CD8" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4CD8" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4CD8" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4CD8" Ref="C302"  Part="1" 
F 0 "C302" H 7465 3746 50  0000 L CNN
F 1 "0.1uF" H 7465 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7388 3550 50  0001 C CNN
F 3 "~" H 7350 3700 50  0001 C CNN
	1    7350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3700 6700 3900
Wire Wire Line
	6700 3600 6750 3600
$Comp
L Device:C C?
U 1 1 5FDE4CD0
P 6900 3700
AR Path="/5E9E88B8/5FDE4CD0" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4CD0" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4CD0" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4CD0" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4CD0" Ref="C298"  Part="1" 
F 0 "C298" H 7015 3746 50  0000 L CNN
F 1 "10nF" H 7015 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6938 3550 50  0001 C CNN
F 3 "~" H 6900 3700 50  0001 C CNN
	1    6900 3700
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:S-8209A U38
U 1 1 5FDE4CCA
P 6100 3550
F 0 "U38" H 6100 4037 60  0000 C CNN
F 1 "S-8209A" H 6100 3931 60  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 6100 3550 60  0001 C CNN
F 3 "https://www.ablic.com/en/doc/datasheet/battery_protection/S8209A_E.pdf" H 5500 3550 60  0001 C CNN
	1    6100 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT3
U 1 1 5FDE4CC4
P 8450 3450
F 0 "BT3" V 8350 3550 50  0000 L CNN
F 1 "18650-holder-1042" V 8600 3500 50  0000 C CNN
F 2 "sdr-trx:BATT-18650-1042" V 8450 3510 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p27.pdf" V 8450 3510 50  0001 C CNN
	1    8450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2100 7350 2050
Wire Wire Line
	7350 1750 7350 1700
Wire Wire Line
	6900 1700 7350 1700
Wire Wire Line
	6900 1750 6900 1700
Wire Wire Line
	6900 2250 7350 2250
Wire Wire Line
	7350 2250 7350 2450
Connection ~ 6900 2250
Wire Wire Line
	6700 2250 6900 2250
Connection ~ 7900 2800
Wire Wire Line
	8450 2800 8450 2450
Wire Wire Line
	8450 1700 8450 2150
Connection ~ 7350 2800
Wire Wire Line
	7350 2750 7350 2800
Wire Wire Line
	6900 2800 7350 2800
Connection ~ 6900 2800
Wire Wire Line
	6900 2750 6900 2800
Wire Wire Line
	7900 2800 7900 2550
Wire Wire Line
	6700 2800 6900 2800
Wire Wire Line
	6750 2400 6750 2500
Wire Wire Line
	6900 2400 6750 2400
Wire Wire Line
	6900 2450 6900 2400
Wire Wire Line
	7900 1700 7900 1750
Wire Wire Line
	7900 2100 7900 2150
Connection ~ 7900 2100
Wire Wire Line
	7900 2050 7900 2100
$Comp
L Device:R R?
U 1 1 5FDE4C9D
P 6900 1900
AR Path="/5E9E88B8/5FDE4C9D" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4C9D" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FDE4C9D" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FDE4C9D" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FDE4C9D" Ref="R162"  Part="1" 
F 0 "R162" H 6950 1950 50  0000 L CNN
F 1 "470R" H 6950 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6830 1900 50  0001 C CNN
F 3 "~" H 6900 1900 50  0001 C CNN
	1    6900 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5FDE4C8A
P 7800 2350
AR Path="/5EA188E4/5FDE4C8A" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4C8A" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5FDE4C8A" Ref="Q?"  Part="1" 
AR Path="/5FDAA718/5FDE4C8A" Ref="Q27"  Part="1" 
F 0 "Q27" H 7800 2500 50  0000 R CNN
F 1 "BSS138P" V 8050 2500 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8000 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 7800 2350 50  0001 C CNN
	1    7800 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FDE4C84
P 7350 2600
AR Path="/5E9E88B8/5FDE4C84" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4C84" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4C84" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4C84" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4C84" Ref="C301"  Part="1" 
F 0 "C301" H 7465 2646 50  0000 L CNN
F 1 "0.1uF" H 7465 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7388 2450 50  0001 C CNN
F 3 "~" H 7350 2600 50  0001 C CNN
	1    7350 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2600 6700 2800
Wire Wire Line
	6700 2500 6750 2500
$Comp
L Device:C C?
U 1 1 5FDE4C7C
P 6900 2600
AR Path="/5E9E88B8/5FDE4C7C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FDE4C7C" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FDE4C7C" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FDE4C7C" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FDE4C7C" Ref="C297"  Part="1" 
F 0 "C297" H 7015 2646 50  0000 L CNN
F 1 "10nF" H 7015 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6938 2450 50  0001 C CNN
F 3 "~" H 6900 2600 50  0001 C CNN
	1    6900 2600
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:S-8209A U37
U 1 1 5FDE4C76
P 6100 2450
F 0 "U37" H 6100 2937 60  0000 C CNN
F 1 "S-8209A" H 6100 2831 60  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 6100 2450 60  0001 C CNN
F 3 "https://www.ablic.com/en/doc/datasheet/battery_protection/S8209A_E.pdf" H 5500 2450 60  0001 C CNN
	1    6100 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT2
U 1 1 5FDE4C70
P 8450 2350
F 0 "BT2" V 8350 2450 50  0000 L CNN
F 1 "18650-holder-1042" V 8600 2400 50  0000 C CNN
F 2 "sdr-trx:BATT-18650-1042" V 8450 2410 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p27.pdf" V 8450 2410 50  0001 C CNN
	1    8450 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE157ED
P 7250 6150
AR Path="/5E9F4ACB/5FE157ED" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FE157ED" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FE157ED" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FE157ED" Ref="#PWR?"  Part="1" 
AR Path="/5FE157ED" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FE157ED" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 7250 5900 50  0001 C CNN
F 1 "GND" H 7255 5977 50  0000 C CNN
F 2 "" H 7250 6150 50  0001 C CNN
F 3 "" H 7250 6150 50  0001 C CNN
	1    7250 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5800 6950 5800
Wire Wire Line
	6950 5800 6950 5700
Wire Wire Line
	6950 5700 6900 5700
$Comp
L Device:C C?
U 1 1 5FE333F7
P 7250 5650
AR Path="/5E9E88B8/5FE333F7" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FE333F7" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FE333F7" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FE333F7" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FE333F7" Ref="C300"  Part="1" 
F 0 "C300" V 7100 5650 50  0000 C CNN
F 1 "0.1uF" V 7400 5650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7288 5500 50  0001 C CNN
F 3 "~" H 7250 5650 50  0001 C CNN
	1    7250 5650
	1    0    0    -1  
$EndComp
Connection ~ 6950 5700
Text Label 7250 5400 2    50   ~ 0
+5V
Wire Wire Line
	6900 6000 7700 6000
Wire Wire Line
	6900 5900 7600 5900
Connection ~ 8450 5400
Wire Wire Line
	8450 5400 8450 5000
NoConn ~ 5600 5900
Wire Wire Line
	4350 5800 4350 3100
$Comp
L Device:R R?
U 1 1 5FED61F6
P 5350 5400
AR Path="/5E9E88B8/5FED61F6" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5FED61F6" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5FED61F6" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5FED61F6" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5FED61F6" Ref="R158"  Part="1" 
F 0 "R158" V 5450 5400 50  0000 C CNN
F 1 "510K" V 5250 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 5400 50  0001 C CNN
F 3 "~" H 5350 5400 50  0001 C CNN
	1    5350 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 5800 7250 6100
Wire Wire Line
	6900 6100 7250 6100
Wire Wire Line
	7250 6100 7250 6150
Connection ~ 7250 6100
Wire Wire Line
	6950 5400 7250 5400
Wire Wire Line
	6950 5400 6950 5700
Wire Wire Line
	7250 5400 7250 5500
Text HLabel 1650 5700 0    50   Input ~ 0
~UNPLUG
$Comp
L Device:C C?
U 1 1 5FFC7169
P 1950 5900
AR Path="/5E9E88B8/5FFC7169" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5FFC7169" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5FFC7169" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5FFC7169" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5FFC7169" Ref="C296"  Part="1" 
F 0 "C296" H 2050 5950 50  0000 L CNN
F 1 "10nF" H 2050 5850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1988 5750 50  0001 C CNN
F 3 "~" H 1950 5900 50  0001 C CNN
	1    1950 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFCA63A
P 1950 6100
AR Path="/5E9F4ACB/5FFCA63A" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5FFCA63A" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5FFCA63A" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5FFCA63A" Ref="#PWR?"  Part="1" 
AR Path="/5FFCA63A" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/5FFCA63A" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 1950 5850 50  0001 C CNN
F 1 "GND" H 1955 5927 50  0000 C CNN
F 2 "" H 1950 6100 50  0001 C CNN
F 3 "" H 1950 6100 50  0001 C CNN
	1    1950 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5750 1950 5700
Wire Wire Line
	1950 5700 1650 5700
Wire Wire Line
	1950 6100 1950 6050
Wire Wire Line
	5600 6000 5550 6000
Wire Wire Line
	5550 6000 5550 5400
Wire Wire Line
	5550 5400 6950 5400
Connection ~ 6950 5400
Wire Wire Line
	5500 5400 5550 5400
Connection ~ 5550 5400
Wire Wire Line
	5150 5700 5150 5400
Wire Wire Line
	5150 5700 5600 5700
Wire Wire Line
	5150 5400 5200 5400
$Comp
L Device:R R?
U 1 1 6005E6A2
P 5300 4800
AR Path="/5E9E88B8/6005E6A2" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/6005E6A2" Ref="R?"  Part="1" 
AR Path="/5ECEED15/6005E6A2" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/6005E6A2" Ref="R?"  Part="1" 
AR Path="/5FDAA718/6005E6A2" Ref="R157"  Part="1" 
F 0 "R157" V 5400 4750 50  0000 R CNN
F 1 "1K" V 5400 4850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5230 4800 50  0001 C CNN
F 3 "~" H 5300 4800 50  0001 C CNN
	1    5300 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4700 5500 4700
Wire Wire Line
	4750 4800 4750 4700
Wire Wire Line
	4750 4700 4800 4700
Connection ~ 4750 4800
Wire Wire Line
	4750 4800 5150 4800
$Comp
L Device:R R?
U 1 1 60096AAB
P 5400 6100
AR Path="/5E9E88B8/60096AAB" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/60096AAB" Ref="R?"  Part="1" 
AR Path="/5ECEED15/60096AAB" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/60096AAB" Ref="R?"  Part="1" 
AR Path="/5FDAA718/60096AAB" Ref="R159"  Part="1" 
F 0 "R159" V 5500 6100 50  0000 C CNN
F 1 "3K" V 5300 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5330 6100 50  0001 C CNN
F 3 "~" H 5400 6100 50  0001 C CNN
	1    5400 6100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 6100 5600 6100
$Comp
L power:GND #PWR?
U 1 1 600A949B
P 5200 6100
AR Path="/5E9F4ACB/600A949B" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/600A949B" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/600A949B" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/600A949B" Ref="#PWR?"  Part="1" 
AR Path="/600A949B" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/600A949B" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 5200 5850 50  0001 C CNN
F 1 "GND" H 5205 5927 50  0000 C CNN
F 2 "" H 5200 6100 50  0001 C CNN
F 3 "" H 5200 6100 50  0001 C CNN
	1    5200 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 6100 5250 6100
$Comp
L Device:R R?
U 1 1 600C675D
P 2000 1100
AR Path="/5E9E88B8/600C675D" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/600C675D" Ref="R?"  Part="1" 
AR Path="/5ECEED15/600C675D" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/600C675D" Ref="R?"  Part="1" 
AR Path="/5FDAA718/600C675D" Ref="R142"  Part="1" 
F 0 "R142" H 2050 1150 50  0000 L CNN
F 1 "1M" H 2050 1050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1930 1100 50  0001 C CNN
F 3 "~" H 2000 1100 50  0001 C CNN
	1    2000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 950  2000 900 
Wire Wire Line
	2000 900  2050 900 
Wire Wire Line
	2250 1200 2250 1300
Wire Wire Line
	2250 1300 2000 1300
Wire Wire Line
	2000 1300 2000 1250
Wire Wire Line
	2550 1700 2550 900 
Wire Wire Line
	2550 900  2450 900 
Connection ~ 2550 1700
Wire Wire Line
	2550 1700 2600 1700
$Comp
L Device:R R?
U 1 1 6010CF65
P 4050 2650
AR Path="/5E9E88B8/6010CF65" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/6010CF65" Ref="R?"  Part="1" 
AR Path="/5ECEED15/6010CF65" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/6010CF65" Ref="R?"  Part="1" 
AR Path="/5FDAA718/6010CF65" Ref="R149"  Part="1" 
F 0 "R149" H 4100 2700 50  0000 L CNN
F 1 "4.7M" H 4100 2600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3980 2650 50  0001 C CNN
F 3 "~" H 4050 2650 50  0001 C CNN
	1    4050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2500 4050 2450
Wire Wire Line
	4050 2450 4350 2450
Wire Wire Line
	4350 2450 4350 2500
Wire Wire Line
	4350 2300 4350 2450
Connection ~ 4350 2450
Wire Wire Line
	4350 2800 4350 3100
Connection ~ 4350 3100
Wire Wire Line
	3950 2450 3950 2850
Connection ~ 4050 3400
Wire Wire Line
	3700 3600 3700 3800
Wire Wire Line
	4050 3800 3700 3800
Wire Wire Line
	4050 3750 4050 3800
Wire Wire Line
	4050 3400 4050 3450
Wire Wire Line
	4000 3400 4050 3400
$Comp
L Device:R R?
U 1 1 6015B049
P 4050 3600
AR Path="/5E9E88B8/6015B049" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/6015B049" Ref="R?"  Part="1" 
AR Path="/5ECEED15/6015B049" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/6015B049" Ref="R?"  Part="1" 
AR Path="/5FDAA718/6015B049" Ref="R150"  Part="1" 
F 0 "R150" H 4000 3650 50  0000 R CNN
F 1 "1M" H 4000 3550 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3980 3600 50  0001 C CNN
F 3 "~" H 4050 3600 50  0001 C CNN
	1    4050 3600
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q25
U 1 1 6015B050
P 3800 3400
F 0 "Q25" H 3750 3550 50  0000 R CNN
F 1 "2SC2412K" V 4050 3400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4000 3500 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1918636.pdf" H 3800 3400 50  0001 C CNN
	1    3800 3400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6016DEA7
P 3700 3850
AR Path="/5E9F4ACB/6016DEA7" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/6016DEA7" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/6016DEA7" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/6016DEA7" Ref="#PWR?"  Part="1" 
AR Path="/6016DEA7" Ref="#PWR?"  Part="1" 
AR Path="/5FDAA718/6016DEA7" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 3700 3600 50  0001 C CNN
F 1 "GND" H 3705 3677 50  0000 C CNN
F 2 "" H 3700 3850 50  0001 C CNN
F 3 "" H 3700 3850 50  0001 C CNN
	1    3700 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 3850 3700 3800
Connection ~ 3700 3800
Wire Wire Line
	5200 2350 5200 2850
Wire Wire Line
	3950 2850 5200 2850
Wire Wire Line
	5150 2800 4750 2800
Wire Wire Line
	4750 2450 4750 2800
Wire Wire Line
	5150 2250 5150 2800
Wire Wire Line
	4050 2800 4050 3400
Wire Wire Line
	3700 3200 3700 3150
Wire Wire Line
	1750 3150 1750 1300
Wire Wire Line
	1750 1300 2000 1300
Connection ~ 2000 1300
Wire Wire Line
	2000 900  1650 900 
Connection ~ 2000 900 
Wire Wire Line
	1750 3150 3700 3150
Text HLabel 1650 900  0    50   Input ~ 0
BAT-A
$Comp
L Device:Q_PMOS_GSD Q21
U 1 1 60273879
P 2250 1000
F 0 "Q21" V 2592 1000 50  0000 C CNN
F 1 "DMP3030SN" V 2501 1000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2450 1100 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30787.pdf" H 2250 1000 50  0001 C CNN
	1    2250 1000
	0    1    -1   0   
$EndComp
Wire Wire Line
	4750 4850 4750 4800
$Comp
L Device:Polyfuse F1
U 1 1 6035AC8D
P 6100 1700
F 0 "F1" V 5875 1700 50  0000 C CNN
F 1 "ASMDC300F/24" V 5966 1700 50  0000 C CNN
F 2 "Fuse:Fuse_2920_7451Metric_Pad2.10x5.45mm_HandSolder" H 6150 1500 50  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Littelfuse%20PDFs/ASMDC300F24.pdf" H 6100 1700 50  0001 C CNN
	1    6100 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 1700 6900 1700
Wire Wire Line
	8400 5400 8450 5400
$Comp
L Device:R R?
U 1 1 5EDC226A
P 8250 5400
AR Path="/5E9E88B8/5EDC226A" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDC226A" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EDC226A" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EDC226A" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5EDC226A" Ref="R171"  Part="1" 
F 0 "R171" V 8150 5400 50  0000 C CNN
F 1 "470R" V 8350 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8180 5400 50  0001 C CNN
F 3 "~" H 8250 5400 50  0001 C CNN
	1    8250 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 5750 8450 5800
Wire Wire Line
	8400 5800 8450 5800
Connection ~ 8450 5800
Wire Wire Line
	8450 5800 8450 5850
$Comp
L Device:R R?
U 1 1 5EDE49D5
P 8250 5800
AR Path="/5E9E88B8/5EDE49D5" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDE49D5" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EDE49D5" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EDE49D5" Ref="R?"  Part="1" 
AR Path="/5FDAA718/5EDE49D5" Ref="R172"  Part="1" 
F 0 "R172" V 8150 5800 50  0000 C CNN
F 1 "470R" V 8350 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8180 5800 50  0001 C CNN
F 3 "~" H 8250 5800 50  0001 C CNN
	1    8250 5800
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EDF9702
P 7900 5600
AR Path="/5E9E88B8/5EDF9702" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDF9702" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDF9702" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDF9702" Ref="C?"  Part="1" 
AR Path="/5FDAA718/5EDF9702" Ref="C304"  Part="1" 
F 0 "C304" V 7750 5600 50  0000 C CNN
F 1 "0.1uF" V 8050 5600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7938 5450 50  0001 C CNN
F 3 "~" H 7900 5600 50  0001 C CNN
	1    7900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5700 5150 5700
Connection ~ 1950 5700
Connection ~ 5150 5700
Wire Wire Line
	5600 5800 4350 5800
Wire Wire Line
	7600 5400 7600 5900
Wire Wire Line
	7600 5400 7900 5400
Wire Wire Line
	7700 6000 7700 5800
Wire Wire Line
	7700 5800 7900 5800
Wire Wire Line
	7900 5450 7900 5400
Connection ~ 7900 5400
Wire Wire Line
	7900 5400 8100 5400
Wire Wire Line
	7900 5750 7900 5800
Connection ~ 7900 5800
Wire Wire Line
	7900 5800 8100 5800
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F7BBD59
P 8450 1650
AR Path="/5F7BBD59" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F7BBD59" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F7BBD59" Ref="#FLG0112"  Part="1" 
F 0 "#FLG0112" H 8450 1725 50  0001 C CNN
F 1 "PWR_FLAG" H 8450 1823 50  0000 C CNN
F 2 "" H 8450 1650 50  0001 C CNN
F 3 "~" H 8450 1650 50  0001 C CNN
	1    8450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1650 8450 1700
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F7F0BD2
P 6650 3900
AR Path="/5F7F0BD2" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F7F0BD2" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F7F0BD2" Ref="#FLG0109"  Part="1" 
F 0 "#FLG0109" H 6650 3975 50  0001 C CNN
F 1 "PWR_FLAG" V 6650 4027 50  0000 L CNN
F 2 "" H 6650 3900 50  0001 C CNN
F 3 "~" H 6650 3900 50  0001 C CNN
	1    6650 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 3900 6700 3900
Connection ~ 6700 3900
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F80843D
P 6650 5000
AR Path="/5F80843D" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F80843D" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F80843D" Ref="#FLG0110"  Part="1" 
F 0 "#FLG0110" H 6650 5075 50  0001 C CNN
F 1 "PWR_FLAG" V 6650 5127 50  0000 L CNN
F 2 "" H 6650 5000 50  0001 C CNN
F 3 "~" H 6650 5000 50  0001 C CNN
	1    6650 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 5000 6700 5000
Connection ~ 6700 5000
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F81B42C
P 6650 2800
AR Path="/5F81B42C" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F81B42C" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F81B42C" Ref="#FLG0111"  Part="1" 
F 0 "#FLG0111" H 6650 2875 50  0001 C CNN
F 1 "PWR_FLAG" V 6650 2927 50  0000 L CNN
F 2 "" H 6650 2800 50  0001 C CNN
F 3 "~" H 6650 2800 50  0001 C CNN
	1    6650 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 2800 6700 2800
Connection ~ 6700 2800
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F830A75
P 6600 2050
AR Path="/5F830A75" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F830A75" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F830A75" Ref="#FLG0113"  Part="1" 
F 0 "#FLG0113" H 6600 2125 50  0001 C CNN
F 1 "PWR_FLAG" H 6600 2223 50  0000 C CNN
F 2 "" H 6600 2050 50  0001 C CNN
F 3 "~" H 6600 2050 50  0001 C CNN
	1    6600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2050 6900 2100
Wire Wire Line
	6600 2050 6600 2100
Wire Wire Line
	6600 2100 6900 2100
Connection ~ 6900 2100
Wire Wire Line
	6900 2100 6900 2250
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F860BFD
P 6600 3150
AR Path="/5F860BFD" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F860BFD" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F860BFD" Ref="#FLG0114"  Part="1" 
F 0 "#FLG0114" H 6600 3225 50  0001 C CNN
F 1 "PWR_FLAG" H 6600 3323 50  0000 C CNN
F 2 "" H 6600 3150 50  0001 C CNN
F 3 "~" H 6600 3150 50  0001 C CNN
	1    6600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3150 6600 3200
Wire Wire Line
	6600 3200 6900 3200
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F8733DD
P 6600 4250
AR Path="/5F8733DD" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F8733DD" Ref="#FLG?"  Part="1" 
AR Path="/5FDAA718/5F8733DD" Ref="#FLG0115"  Part="1" 
F 0 "#FLG0115" H 6600 4325 50  0001 C CNN
F 1 "PWR_FLAG" H 6600 4423 50  0000 C CNN
F 2 "" H 6600 4250 50  0001 C CNN
F 3 "~" H 6600 4250 50  0001 C CNN
	1    6600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4250 6600 4300
Wire Wire Line
	6600 4300 6900 4300
Connection ~ 6900 4300
Wire Wire Line
	6900 4300 6900 4450
Connection ~ 6900 3200
Wire Wire Line
	6900 3200 6900 3350
$EndSCHEMATC
