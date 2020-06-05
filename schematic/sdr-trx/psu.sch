EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 14
Title "PSU"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 5EE3B931
P 3600 1100
AR Path="/5E9E88B8/5EE3B931" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE3B931" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE3B931" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE3B931" Ref="R129"  Part="1" 
F 0 "R129" H 3550 1150 50  0000 R CNN
F 1 "4.3K" H 3550 1050 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3530 1100 50  0001 C CNN
F 3 "~" H 3600 1100 50  0001 C CNN
	1    3600 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 900  3300 900 
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5EE5C5AF
P 3500 2000
AR Path="/5EA188E4/5EE5C5AF" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5EE5C5AF" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EE5C5AF" Ref="Q10"  Part="1" 
F 0 "Q10" H 3450 2200 50  0000 R CNN
F 1 "BSS138P" H 3450 2100 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3700 2100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 3500 2000 50  0001 C CNN
	1    3500 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE5C5B5
P 3600 2450
AR Path="/5E9F4ACB/5EE5C5B5" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE5C5B5" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE5C5B5" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 3600 2200 50  0001 C CNN
F 1 "GND" H 3605 2277 50  0000 C CNN
F 2 "" H 3600 2450 50  0001 C CNN
F 3 "" H 3600 2450 50  0001 C CNN
	1    3600 2450
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE5C5BC
P 3250 2200
AR Path="/5E9E88B8/5EE5C5BC" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE5C5BC" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE5C5BC" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE5C5BC" Ref="R125"  Part="1" 
F 0 "R125" H 3200 2250 50  0000 R CNN
F 1 "47K" H 3200 2150 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 2200 50  0001 C CNN
F 3 "~" H 3250 2200 50  0001 C CNN
	1    3250 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 2000 3250 2000
Wire Wire Line
	3250 2000 3250 2050
Wire Wire Line
	3250 2350 3250 2400
Wire Wire Line
	3250 2400 3600 2400
Wire Wire Line
	3600 2200 3600 2400
Connection ~ 3600 2400
Wire Wire Line
	3600 2450 3600 2400
Text GLabel 2050 900  0    50   Output ~ 0
+12V-TX
$Comp
L power:GND #PWR?
U 1 1 5EE8AC0E
P 2100 1750
AR Path="/5E9F4ACB/5EE8AC0E" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE8AC0E" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE8AC0E" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 2100 1500 50  0001 C CNN
F 1 "GND" H 2105 1577 50  0000 C CNN
F 2 "" H 2100 1750 50  0001 C CNN
F 3 "" H 2100 1750 50  0001 C CNN
	1    2100 1750
	0    1    -1   0   
$EndComp
Text HLabel 2050 2000 0    50   Input ~ 0
TX-PWR
$Comp
L sdr-trx:LFxxABPT U29
U 1 1 5EEC1864
P 2950 1500
F 0 "U29" H 2950 1650 50  0000 C CNN
F 1 "LF50ABPT" H 2950 1250 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 2950 1725 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 2950 1450 50  0001 C CNN
	1    2950 1500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3250 1500 3300 1500
Wire Wire Line
	3300 1500 3300 900 
Wire Wire Line
	3300 900  3600 900 
Wire Wire Line
	3600 900  3600 950 
Connection ~ 3300 900 
Wire Wire Line
	3250 1650 3600 1650
Wire Wire Line
	3600 1650 3600 1300
Wire Wire Line
	3600 1650 3600 1800
Connection ~ 3600 1650
$Comp
L Device:C C?
U 1 1 5ED7629A
P 2150 1550
AR Path="/5E9E88B8/5ED7629A" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5ED7629A" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5ED7629A" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5ED7629A" Ref="C274"  Part="1" 
F 0 "C274" H 2050 1600 50  0000 R CNN
F 1 "4.7uF" H 2050 1500 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2188 1400 50  0001 C CNN
F 3 "~" H 2150 1550 50  0001 C CNN
	1    2150 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 1400 2150 1350
Wire Wire Line
	2150 1700 2150 1750
Text GLabel 2050 1350 0    50   Output ~ 0
+5.0V-TX
Wire Wire Line
	2150 1350 2050 1350
Connection ~ 2150 1350
Wire Wire Line
	2150 1750 2100 1750
Connection ~ 2150 1750
Wire Wire Line
	3250 2000 2050 2000
Connection ~ 3250 2000
Wire Wire Line
	2900 1200 2900 1300
Wire Wire Line
	2900 1300 3600 1300
Connection ~ 3600 1300
Wire Wire Line
	3600 1300 3600 1250
Connection ~ 3600 900 
Wire Wire Line
	4150 1300 4150 1250
$Comp
L Device:R R?
U 1 1 5EDAF97E
P 3600 3000
AR Path="/5E9E88B8/5EDAF97E" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDAF97E" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EDAF97E" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EDAF97E" Ref="R130"  Part="1" 
F 0 "R130" H 3550 3050 50  0000 R CNN
F 1 "4.3K" H 3550 2950 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3530 3000 50  0001 C CNN
F 3 "~" H 3600 3000 50  0001 C CNN
	1    3600 3000
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5EDAF985
P 3500 3450
AR Path="/5EA188E4/5EDAF985" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5EDAF985" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EDAF985" Ref="Q11"  Part="1" 
F 0 "Q11" H 3450 3650 50  0000 R CNN
F 1 "BSS138P" H 3450 3550 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3700 3550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 3500 3450 50  0001 C CNN
	1    3500 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EDAF98B
P 3600 3900
AR Path="/5E9F4ACB/5EDAF98B" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EDAF98B" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EDAF98B" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 3600 3650 50  0001 C CNN
F 1 "GND" H 3605 3727 50  0000 C CNN
F 2 "" H 3600 3900 50  0001 C CNN
F 3 "" H 3600 3900 50  0001 C CNN
	1    3600 3900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EDAF991
P 3250 3650
AR Path="/5E9E88B8/5EDAF991" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDAF991" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EDAF991" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EDAF991" Ref="R126"  Part="1" 
F 0 "R126" H 3200 3700 50  0000 R CNN
F 1 "47K" H 3200 3600 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 3650 50  0001 C CNN
F 3 "~" H 3250 3650 50  0001 C CNN
	1    3250 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 3450 3250 3450
Wire Wire Line
	3250 3450 3250 3500
Wire Wire Line
	3250 3800 3250 3850
Wire Wire Line
	3250 3850 3600 3850
Wire Wire Line
	3600 3650 3600 3850
Connection ~ 3600 3850
Wire Wire Line
	3600 3900 3600 3850
$Comp
L power:GND #PWR?
U 1 1 5EDAF9B5
P 2100 3200
AR Path="/5E9F4ACB/5EDAF9B5" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EDAF9B5" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EDAF9B5" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 2100 2950 50  0001 C CNN
F 1 "GND" H 2105 3027 50  0000 C CNN
F 2 "" H 2100 3200 50  0001 C CNN
F 3 "" H 2100 3200 50  0001 C CNN
	1    2100 3200
	0    1    -1   0   
$EndComp
Text HLabel 2050 3450 0    50   Input ~ 0
RX-PWR
$Comp
L sdr-trx:LFxxABPT U30
U 1 1 5EDAF9BC
P 3000 2800
F 0 "U30" H 3000 2950 50  0000 C CNN
F 1 "LF50ABPT" H 3000 2550 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 3000 3025 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 3000 2750 50  0001 C CNN
	1    3000 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 2800 3600 2800
Wire Wire Line
	3600 2800 3600 2850
$Comp
L Device:C C?
U 1 1 5EDAF9CB
P 2150 3000
AR Path="/5E9E88B8/5EDAF9CB" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDAF9CB" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDAF9CB" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDAF9CB" Ref="C275"  Part="1" 
F 0 "C275" H 2050 3050 50  0000 R CNN
F 1 "4.7uF" H 2050 2950 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2188 2850 50  0001 C CNN
F 3 "~" H 2150 3000 50  0001 C CNN
	1    2150 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 2850 2150 2800
Wire Wire Line
	2150 3150 2150 3200
Text GLabel 2050 2800 0    50   Output ~ 0
+5.0V-RX
Wire Wire Line
	2150 2800 2050 2800
Wire Wire Line
	2150 3200 2100 3200
Connection ~ 2150 3200
Wire Wire Line
	3250 3450 2050 3450
Connection ~ 3250 3450
Wire Wire Line
	3600 3150 3600 3200
Wire Wire Line
	3300 2950 3300 3200
Wire Wire Line
	3300 3200 3600 3200
Wire Wire Line
	2700 2800 2150 2800
Connection ~ 2150 2800
Wire Wire Line
	3600 3250 3600 3200
Connection ~ 3600 3200
Wire Wire Line
	2700 2950 2650 2950
Wire Wire Line
	2650 2950 2650 3200
Wire Wire Line
	2650 3200 2150 3200
$Comp
L Device:R R?
U 1 1 5EE8D04D
P 3600 4400
AR Path="/5E9E88B8/5EE8D04D" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE8D04D" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE8D04D" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE8D04D" Ref="R131"  Part="1" 
F 0 "R131" H 3550 4450 50  0000 R CNN
F 1 "4.3K" H 3550 4350 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3530 4400 50  0001 C CNN
F 3 "~" H 3600 4400 50  0001 C CNN
	1    3600 4400
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5EE8D053
P 3500 4850
AR Path="/5EA188E4/5EE8D053" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5EE8D053" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EE8D053" Ref="Q12"  Part="1" 
F 0 "Q12" H 3450 5050 50  0000 R CNN
F 1 "BSS138P" H 3450 4950 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3700 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 3500 4850 50  0001 C CNN
	1    3500 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE8D059
P 3600 5300
AR Path="/5E9F4ACB/5EE8D059" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE8D059" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE8D059" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 3600 5050 50  0001 C CNN
F 1 "GND" H 3605 5127 50  0000 C CNN
F 2 "" H 3600 5300 50  0001 C CNN
F 3 "" H 3600 5300 50  0001 C CNN
	1    3600 5300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE8D05F
P 3250 5050
AR Path="/5E9E88B8/5EE8D05F" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE8D05F" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE8D05F" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE8D05F" Ref="R127"  Part="1" 
F 0 "R127" H 3200 5100 50  0000 R CNN
F 1 "47K" H 3200 5000 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 5050 50  0001 C CNN
F 3 "~" H 3250 5050 50  0001 C CNN
	1    3250 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 4850 3250 4850
Wire Wire Line
	3250 4850 3250 4900
Wire Wire Line
	3250 5200 3250 5250
Wire Wire Line
	3250 5250 3600 5250
Wire Wire Line
	3600 5050 3600 5250
Connection ~ 3600 5250
Wire Wire Line
	3600 5300 3600 5250
$Comp
L power:GND #PWR?
U 1 1 5EE8D06C
P 2100 4600
AR Path="/5E9F4ACB/5EE8D06C" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE8D06C" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE8D06C" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 2100 4350 50  0001 C CNN
F 1 "GND" H 2105 4427 50  0000 C CNN
F 2 "" H 2100 4600 50  0001 C CNN
F 3 "" H 2100 4600 50  0001 C CNN
	1    2100 4600
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U31
U 1 1 5EE8D073
P 3000 4200
F 0 "U31" H 3000 4350 50  0000 C CNN
F 1 "LF50ABPT" H 3000 3950 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 3000 4425 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 3000 4150 50  0001 C CNN
	1    3000 4200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 4200 3600 4200
Wire Wire Line
	3600 4200 3600 4250
$Comp
L Device:C C?
U 1 1 5EE8D07B
P 2150 4400
AR Path="/5E9E88B8/5EE8D07B" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EE8D07B" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EE8D07B" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EE8D07B" Ref="C276"  Part="1" 
F 0 "C276" H 2050 4450 50  0000 R CNN
F 1 "4.7uF" H 2050 4350 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2188 4250 50  0001 C CNN
F 3 "~" H 2150 4400 50  0001 C CNN
	1    2150 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 4250 2150 4200
Wire Wire Line
	2150 4550 2150 4600
Wire Wire Line
	2150 4200 2050 4200
Wire Wire Line
	2150 4600 2100 4600
Connection ~ 2150 4600
Wire Wire Line
	3250 4850 2050 4850
Connection ~ 3250 4850
Wire Wire Line
	3600 4550 3600 4600
Wire Wire Line
	3300 4350 3300 4600
Wire Wire Line
	3300 4600 3600 4600
Wire Wire Line
	2700 4200 2150 4200
Connection ~ 2150 4200
Wire Wire Line
	3600 4650 3600 4600
Connection ~ 3600 4600
Wire Wire Line
	2700 4350 2650 4350
Wire Wire Line
	2650 4350 2650 4600
Wire Wire Line
	2650 4600 2150 4600
Text GLabel 2050 4200 0    50   Output ~ 0
+5.0V-BL
Text HLabel 2050 4850 0    50   Input ~ 0
BL-PWR
$Comp
L Device:R R?
U 1 1 5EEBCDF1
P 3600 5800
AR Path="/5E9E88B8/5EEBCDF1" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EEBCDF1" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EEBCDF1" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EEBCDF1" Ref="R132"  Part="1" 
F 0 "R132" H 3550 5850 50  0000 R CNN
F 1 "4.3K" H 3550 5750 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3530 5800 50  0001 C CNN
F 3 "~" H 3600 5800 50  0001 C CNN
	1    3600 5800
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5EEBCDF7
P 3500 6250
AR Path="/5EA188E4/5EEBCDF7" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5EEBCDF7" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EEBCDF7" Ref="Q13"  Part="1" 
F 0 "Q13" H 3450 6450 50  0000 R CNN
F 1 "BSS138P" H 3450 6350 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3700 6350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 3500 6250 50  0001 C CNN
	1    3500 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEBCDFD
P 3600 6700
AR Path="/5E9F4ACB/5EEBCDFD" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EEBCDFD" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EEBCDFD" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 3600 6450 50  0001 C CNN
F 1 "GND" H 3605 6527 50  0000 C CNN
F 2 "" H 3600 6700 50  0001 C CNN
F 3 "" H 3600 6700 50  0001 C CNN
	1    3600 6700
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EEBCE03
P 3250 6450
AR Path="/5E9E88B8/5EEBCE03" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EEBCE03" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EEBCE03" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EEBCE03" Ref="R128"  Part="1" 
F 0 "R128" H 3200 6500 50  0000 R CNN
F 1 "47K" H 3200 6400 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 6450 50  0001 C CNN
F 3 "~" H 3250 6450 50  0001 C CNN
	1    3250 6450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 6250 3250 6250
Wire Wire Line
	3250 6250 3250 6300
Wire Wire Line
	3250 6600 3250 6650
Wire Wire Line
	3250 6650 3600 6650
Wire Wire Line
	3600 6450 3600 6650
Connection ~ 3600 6650
Wire Wire Line
	3600 6700 3600 6650
$Comp
L power:GND #PWR?
U 1 1 5EEBCE10
P 2100 6000
AR Path="/5E9F4ACB/5EEBCE10" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EEBCE10" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EEBCE10" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 2100 5750 50  0001 C CNN
F 1 "GND" H 2105 5827 50  0000 C CNN
F 2 "" H 2100 6000 50  0001 C CNN
F 3 "" H 2100 6000 50  0001 C CNN
	1    2100 6000
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U32
U 1 1 5EEBCE16
P 3000 5600
F 0 "U32" H 3000 5750 50  0000 C CNN
F 1 "LF50ABPT" H 3000 5350 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 3000 5825 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 3000 5550 50  0001 C CNN
	1    3000 5600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 5600 3600 5600
Wire Wire Line
	3600 5600 3600 5650
$Comp
L Device:C C?
U 1 1 5EEBCE1E
P 2150 5800
AR Path="/5E9E88B8/5EEBCE1E" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEBCE1E" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EEBCE1E" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EEBCE1E" Ref="C277"  Part="1" 
F 0 "C277" H 2050 5850 50  0000 R CNN
F 1 "4.7uF" H 2050 5750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2188 5650 50  0001 C CNN
F 3 "~" H 2150 5800 50  0001 C CNN
	1    2150 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 5650 2150 5600
Wire Wire Line
	2150 5950 2150 6000
Wire Wire Line
	2150 5600 2050 5600
Wire Wire Line
	2150 6000 2100 6000
Connection ~ 2150 6000
Wire Wire Line
	3250 6250 2050 6250
Connection ~ 3250 6250
Wire Wire Line
	3600 5950 3600 6000
Wire Wire Line
	3300 5750 3300 6000
Wire Wire Line
	3300 6000 3600 6000
Wire Wire Line
	2700 5600 2150 5600
Connection ~ 2150 5600
Wire Wire Line
	3600 6050 3600 6000
Connection ~ 3600 6000
Wire Wire Line
	2700 5750 2650 5750
Wire Wire Line
	2650 5750 2650 6000
Wire Wire Line
	2650 6000 2150 6000
Text GLabel 2050 5600 0    50   Output ~ 0
+5.0V-USB
Text HLabel 2050 6250 0    50   Input ~ 0
USB-PWR
$Comp
L Device:C C?
U 1 1 5EF992FE
P 7450 1100
AR Path="/5E9E88B8/5EF992FE" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF992FE" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF992FE" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF992FE" Ref="C288"  Part="1" 
F 0 "C288" H 7565 1146 50  0000 L CNN
F 1 "0.1uF" H 7565 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7488 950 50  0001 C CNN
F 3 "~" H 7450 1100 50  0001 C CNN
	1    7450 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF9957B
P 7000 1100
AR Path="/5E9E88B8/5EF9957B" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF9957B" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF9957B" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF9957B" Ref="C286"  Part="1" 
F 0 "C286" H 7115 1146 50  0000 L CNN
F 1 "0.1uF" H 7115 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7038 950 50  0001 C CNN
F 3 "~" H 7000 1100 50  0001 C CNN
	1    7000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 950  7000 900 
Wire Wire Line
	7000 900  7450 900 
Wire Wire Line
	7450 950  7450 900 
Wire Wire Line
	7000 1250 7000 1300
Wire Wire Line
	7000 1300 7450 1300
$Comp
L power:GND #PWR?
U 1 1 5ED9A193
P 4150 1350
AR Path="/5E9F4ACB/5ED9A193" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5ED9A193" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5ED9A193" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 4150 1100 50  0001 C CNN
F 1 "GND" H 4155 1177 50  0000 C CNN
F 2 "" H 4150 1350 50  0001 C CNN
F 3 "" H 4150 1350 50  0001 C CNN
	1    4150 1350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFB21CE
P 7450 1350
AR Path="/5E9F4ACB/5EFB21CE" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EFB21CE" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EFB21CE" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 7450 1100 50  0001 C CNN
F 1 "GND" H 7455 1177 50  0000 C CNN
F 2 "" H 7450 1350 50  0001 C CNN
F 3 "" H 7450 1350 50  0001 C CNN
	1    7450 1350
	-1   0    0    -1  
$EndComp
Connection ~ 7450 1300
Wire Wire Line
	7450 1300 7450 1250
Connection ~ 3600 5600
Connection ~ 3600 4200
Connection ~ 3600 2800
Wire Wire Line
	4150 950  4150 900 
Connection ~ 4150 900 
Wire Wire Line
	4150 900  4600 900 
Wire Wire Line
	4600 950  4600 900 
Connection ~ 4600 900 
Wire Wire Line
	4600 900  5050 900 
Wire Wire Line
	5050 950  5050 900 
Connection ~ 5050 900 
Wire Wire Line
	5500 950  5500 900 
Wire Wire Line
	5500 1250 5500 1300
Wire Wire Line
	5500 1300 5050 1300
Wire Wire Line
	4150 1350 4150 1300
Connection ~ 4150 1300
Wire Wire Line
	4600 1300 4600 1250
Connection ~ 4600 1300
Wire Wire Line
	4600 1300 4150 1300
Wire Wire Line
	5050 1250 5050 1300
Connection ~ 5050 1300
Wire Wire Line
	5050 1300 4600 1300
Wire Wire Line
	5050 900  5500 900 
Text HLabel 9750 5350 2    50   Input ~ 0
PWR-HOLD
Text GLabel 9750 4800 2    50   Output ~ 0
+3.3VA
Wire Wire Line
	8200 4800 8200 4200
Wire Wire Line
	8250 4800 8200 4800
Wire Wire Line
	8900 4950 8900 5200
Wire Wire Line
	8850 4950 8900 4950
$Comp
L Device:C C?
U 1 1 5EF5A030
P 9700 5000
AR Path="/5E9E88B8/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF5A030" Ref="C295"  Part="1" 
F 0 "C295" H 9815 5046 50  0000 L CNN
F 1 "4.7uF" H 9815 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9738 4850 50  0001 C CNN
F 3 "~" H 9700 5000 50  0001 C CNN
	1    9700 5000
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:LFxxABPT U36
U 1 1 5EF5A02A
P 8550 4800
F 0 "U36" H 8550 4950 50  0000 C CNN
F 1 "LF33CPT" H 8550 4550 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8550 5025 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8550 4750 50  0001 C CNN
	1    8550 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF5A024
P 9750 5200
AR Path="/5E9F4ACB/5EF5A024" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EF5A024" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EF5A024" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 9750 4950 50  0001 C CNN
F 1 "GND" H 9755 5027 50  0000 C CNN
F 2 "" H 9750 5200 50  0001 C CNN
F 3 "" H 9750 5200 50  0001 C CNN
	1    9750 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 4350 8900 4350
$Comp
L sdr-trx:LFxxABPT U35
U 1 1 5EF551EB
P 8550 4200
F 0 "U35" H 8550 4350 50  0000 C CNN
F 1 "LF33CPT" H 8550 3950 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8550 4425 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8550 4150 50  0001 C CNN
	1    8550 4200
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q14
U 1 1 5EDBA598
P 6500 5900
F 0 "Q14" V 6750 5900 50  0000 C CNN
F 1 "Si4909DY" V 6400 6000 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 6550 5900 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 6550 5900 50  0001 C CNN
	1    6500 5900
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q14
U 2 1 5EDBD9C3
P 5250 5900
F 0 "Q14" V 5500 5900 50  0000 C CNN
F 1 "Si4909DY" V 5150 5950 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 5300 5900 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 5300 5900 50  0001 C CNN
	2    5250 5900
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 5EDCC9A2
P 6050 6100
AR Path="/5FDAA718/5EDCC9A2" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EDCC9A2" Ref="Q16"  Part="1" 
F 0 "Q16" H 6100 5900 50  0000 R CNN
F 1 "2SB1198K" V 6300 6100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 6250 6200 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sb1198k.pdf" H 6050 6100 50  0001 C CNN
	1    6050 6100
	1    0    0    1   
$EndComp
Wire Wire Line
	6300 5800 6150 5800
Wire Wire Line
	6150 5800 6150 5900
$Comp
L Diode:BZX84Cxx D?
U 1 1 5EDF51FA
P 5650 6100
AR Path="/5EC388F5/5EDF51FA" Ref="D?"  Part="1" 
AR Path="/5ED56EC4/5EDF51FA" Ref="D6"  Part="1" 
F 0 "D6" V 5450 6150 50  0000 L CNN
F 1 "BZX84-C12" H 5650 6000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5650 6100 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 5650 6100 50  0001 C CNN
	1    5650 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 5800 5650 5800
Connection ~ 6150 5800
Wire Wire Line
	5650 5800 5650 5950
Wire Wire Line
	5650 6250 5650 6350
Wire Wire Line
	5650 6350 6150 6350
Wire Wire Line
	6150 6350 6150 6300
Wire Wire Line
	6150 6350 6500 6350
Wire Wire Line
	6500 6350 6500 6100
Connection ~ 6150 6350
Wire Wire Line
	5450 5800 5650 5800
Connection ~ 5650 5800
Wire Wire Line
	5650 6350 5250 6350
Wire Wire Line
	5250 6350 5250 6100
Connection ~ 5650 6350
$Comp
L Device:R R?
U 1 1 5EE37975
P 6150 6550
AR Path="/5E9E88B8/5EE37975" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE37975" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE37975" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE37975" Ref="R136"  Part="1" 
F 0 "R136" H 6200 6600 50  0000 L CNN
F 1 "10K" H 6200 6500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6080 6550 50  0001 C CNN
F 3 "~" H 6150 6550 50  0001 C CNN
	1    6150 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE40630
P 5800 6550
AR Path="/5E9E88B8/5EE40630" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE40630" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE40630" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE40630" Ref="R134"  Part="1" 
F 0 "R134" H 5850 6600 50  0000 L CNN
F 1 "10K" H 5850 6500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5730 6550 50  0001 C CNN
F 3 "~" H 5800 6550 50  0001 C CNN
	1    5800 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 6100 5800 6100
Wire Wire Line
	5800 6100 5800 6400
Wire Wire Line
	6150 6400 6150 6350
$Comp
L Diode:BZX84Cxx D?
U 1 1 5EE52CFA
P 5800 6900
AR Path="/5EC388F5/5EE52CFA" Ref="D?"  Part="1" 
AR Path="/5ED56EC4/5EE52CFA" Ref="D7"  Part="1" 
F 0 "D7" V 5800 7000 50  0000 L CNN
F 1 "BZX84-C12" H 5800 6800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5800 6900 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 5800 6900 50  0001 C CNN
	1    5800 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 6750 5800 6700
$Comp
L power:GND #PWR?
U 1 1 5EE5E25F
P 5800 7100
AR Path="/5E9F4ACB/5EE5E25F" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE5E25F" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE5E25F" Ref="#PWR0159"  Part="1" 
F 0 "#PWR0159" H 5800 6850 50  0001 C CNN
F 1 "GND" H 5805 6927 50  0000 C CNN
F 2 "" H 5800 7100 50  0001 C CNN
F 3 "" H 5800 7100 50  0001 C CNN
	1    5800 7100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE5F454
P 6150 7100
AR Path="/5E9F4ACB/5EE5F454" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE5F454" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE5F454" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 6150 6850 50  0001 C CNN
F 1 "GND" H 6155 6927 50  0000 C CNN
F 2 "" H 6150 7100 50  0001 C CNN
F 3 "" H 6150 7100 50  0001 C CNN
	1    6150 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6150 6700 6150 7100
Wire Wire Line
	5800 7050 5800 7100
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q9
U 1 1 5EEC588C
P 2900 1000
F 0 "Q9" V 3242 1000 50  0000 C CNN
F 1 "Si4909DY" V 3151 1000 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2950 1000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 2950 1000 50  0001 C CNN
	1    2900 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EDBB7B2
P 4150 1100
AR Path="/5E9E88B8/5EDBB7B2" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDBB7B2" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDBB7B2" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDBB7B2" Ref="C279"  Part="1" 
F 0 "C279" H 4265 1146 50  0000 L CNN
F 1 "0.1uF" H 4265 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4188 950 50  0001 C CNN
F 3 "~" H 4150 1100 50  0001 C CNN
	1    4150 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDBC9D5
P 4600 1100
AR Path="/5E9E88B8/5EDBC9D5" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDBC9D5" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDBC9D5" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDBC9D5" Ref="C280"  Part="1" 
F 0 "C280" H 4715 1146 50  0000 L CNN
F 1 "0.1uF" H 4715 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4638 950 50  0001 C CNN
F 3 "~" H 4600 1100 50  0001 C CNN
	1    4600 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDBCC2A
P 5050 1100
AR Path="/5E9E88B8/5EDBCC2A" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDBCC2A" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDBCC2A" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDBCC2A" Ref="C281"  Part="1" 
F 0 "C281" H 5165 1146 50  0000 L CNN
F 1 "0.1uF" H 5165 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5088 950 50  0001 C CNN
F 3 "~" H 5050 1100 50  0001 C CNN
	1    5050 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDBCEE1
P 5500 1100
AR Path="/5E9E88B8/5EDBCEE1" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDBCEE1" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDBCEE1" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDBCEE1" Ref="C282"  Part="1" 
F 0 "C282" H 5615 1146 50  0000 L CNN
F 1 "0.1uF" H 5615 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5538 950 50  0001 C CNN
F 3 "~" H 5500 1100 50  0001 C CNN
	1    5500 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDE9B49
P 2500 1100
AR Path="/5E9E88B8/5EDE9B49" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDE9B49" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EDE9B49" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EDE9B49" Ref="C278"  Part="1" 
F 0 "C278" H 2400 1150 50  0000 R CNN
F 1 "4.7uF" H 2400 1050 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2538 950 50  0001 C CNN
F 3 "~" H 2500 1100 50  0001 C CNN
	1    2500 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 900  2500 900 
Wire Wire Line
	2600 1750 2600 1650
Wire Wire Line
	2600 1650 2650 1650
Wire Wire Line
	2150 1750 2500 1750
Wire Wire Line
	2600 1350 2600 1500
Wire Wire Line
	2600 1500 2650 1500
Wire Wire Line
	2150 1350 2600 1350
Wire Wire Line
	2500 1250 2500 1750
Connection ~ 2500 1750
Wire Wire Line
	2500 1750 2600 1750
Wire Wire Line
	2500 950  2500 900 
Connection ~ 2500 900 
Wire Wire Line
	2500 900  2700 900 
Wire Wire Line
	3600 900  3950 900 
Wire Wire Line
	3950 900  3950 2800
Wire Wire Line
	3600 5600 3950 5600
Connection ~ 3950 900 
Wire Wire Line
	3950 900  4150 900 
Wire Wire Line
	3600 4200 3950 4200
Connection ~ 3950 4200
Wire Wire Line
	3950 4200 3950 5600
Wire Wire Line
	3600 2800 3950 2800
Connection ~ 3950 2800
Wire Wire Line
	3950 2800 3950 4200
$Comp
L Device:R R?
U 1 1 5F0595CB
P 7900 1100
AR Path="/5E9E88B8/5F0595CB" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F0595CB" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F0595CB" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F0595CB" Ref="R137"  Part="1" 
F 0 "R137" H 7950 1150 50  0000 L CNN
F 1 "4.3K" H 7950 1050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 1100 50  0001 C CNN
F 3 "~" H 7900 1100 50  0001 C CNN
	1    7900 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 900  8200 900 
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F0595D2
P 8850 2700
AR Path="/5EA188E4/5F0595D2" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5F0595D2" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5F0595D2" Ref="Q19"  Part="1" 
F 0 "Q19" H 8800 2900 50  0000 R CNN
F 1 "BSS138P" H 8800 2800 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9050 2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 8850 2700 50  0001 C CNN
	1    8850 2700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0595D8
P 9150 3100
AR Path="/5E9F4ACB/5F0595D8" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F0595D8" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F0595D8" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 9150 2850 50  0001 C CNN
F 1 "GND" H 9155 2927 50  0000 C CNN
F 2 "" H 9150 3100 50  0001 C CNN
F 3 "" H 9150 3100 50  0001 C CNN
	1    9150 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F0595DE
P 9100 2900
AR Path="/5E9E88B8/5F0595DE" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F0595DE" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5F0595DE" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F0595DE" Ref="R140"  Part="1" 
F 0 "R140" H 9150 2950 50  0000 L CNN
F 1 "47K" H 9150 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9030 2900 50  0001 C CNN
F 3 "~" H 9100 2900 50  0001 C CNN
	1    9100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2700 9100 2700
Wire Wire Line
	9100 2700 9100 2750
Wire Wire Line
	9100 3050 9100 3100
Wire Wire Line
	9100 3100 8750 3100
Wire Wire Line
	8750 2900 8750 3100
Connection ~ 8750 3100
Text GLabel 9800 900  2    50   Output ~ 0
+12V-RF
$Comp
L sdr-trx:LFxxABPT U33
U 1 1 5F0595F3
P 8550 1500
F 0 "U33" H 8550 1650 50  0000 C CNN
F 1 "LF50ABPT" H 8550 1250 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8550 1725 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8550 1450 50  0001 C CNN
	1    8550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1500 8200 1500
Wire Wire Line
	8200 1500 8200 900 
Wire Wire Line
	8200 900  7900 900 
Wire Wire Line
	7900 900  7900 950 
Connection ~ 8200 900 
Wire Wire Line
	8250 1650 7900 1650
Wire Wire Line
	7900 1650 7900 1300
Connection ~ 7900 1650
$Comp
L Device:C C?
U 1 1 5F059602
P 9350 1550
AR Path="/5E9E88B8/5F059602" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F059602" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F059602" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F059602" Ref="C292"  Part="1" 
F 0 "C292" H 9450 1600 50  0000 L CNN
F 1 "4.7uF" H 9450 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9388 1400 50  0001 C CNN
F 3 "~" H 9350 1550 50  0001 C CNN
	1    9350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1400 9350 1350
Text GLabel 9800 1350 2    50   Output ~ 0
+5.0V-RF
Connection ~ 9350 1350
Wire Wire Line
	8600 1200 8600 1300
Wire Wire Line
	8600 1300 7900 1300
Connection ~ 7900 1300
Wire Wire Line
	7900 1300 7900 1250
Connection ~ 7900 900 
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q9
U 2 1 5F059616
P 8600 3700
F 0 "Q9" V 8942 3700 50  0000 C CNN
F 1 "Si4909DY" V 8851 3700 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 8650 3700 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 8650 3700 50  0001 C CNN
	2    8600 3700
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F05961C
P 9000 1100
AR Path="/5E9E88B8/5F05961C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F05961C" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F05961C" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F05961C" Ref="C290"  Part="1" 
F 0 "C290" H 9100 1150 50  0000 L CNN
F 1 "4.7uF" H 9100 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9038 950 50  0001 C CNN
F 3 "~" H 9000 1100 50  0001 C CNN
	1    9000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1650 8850 1650
Wire Wire Line
	8900 1350 8900 1500
Wire Wire Line
	8900 1500 8850 1500
Wire Wire Line
	9350 1350 8900 1350
Wire Wire Line
	9000 950  9000 900 
Connection ~ 9000 900 
Wire Wire Line
	9000 900  8800 900 
$Comp
L power:GND #PWR?
U 1 1 5F0C108F
P 9750 2350
AR Path="/5E9F4ACB/5F0C108F" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F0C108F" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F0C108F" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 9750 2100 50  0001 C CNN
F 1 "GND" H 9755 2177 50  0000 C CNN
F 2 "" H 9750 2350 50  0001 C CNN
F 3 "" H 9750 2350 50  0001 C CNN
	1    9750 2350
	0    -1   -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U34
U 1 1 5F0C1095
P 8550 2100
F 0 "U34" H 8550 2250 50  0000 C CNN
F 1 "LF33CPT" H 8550 1850 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8550 2325 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8550 2050 50  0001 C CNN
	1    8550 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2100 8200 2100
Wire Wire Line
	8250 2250 7900 2250
$Comp
L Device:C C?
U 1 1 5F0C109E
P 9700 2150
AR Path="/5E9E88B8/5F0C109E" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F0C109E" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F0C109E" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F0C109E" Ref="C294"  Part="1" 
F 0 "C294" H 9800 2200 50  0000 L CNN
F 1 "4.7uF" H 9800 2100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9738 2000 50  0001 C CNN
F 3 "~" H 9700 2150 50  0001 C CNN
	1    9700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2000 9700 1950
Wire Wire Line
	9700 2300 9700 2350
Text GLabel 9800 1950 2    50   Output ~ 0
+3.3V-RF
Wire Wire Line
	9700 1950 9800 1950
Wire Wire Line
	9700 2350 9750 2350
Connection ~ 9700 2350
Wire Wire Line
	8900 2350 8900 2250
Wire Wire Line
	8900 2250 8850 2250
Wire Wire Line
	8200 2100 8200 1500
Connection ~ 8200 1500
Wire Wire Line
	7900 1650 7900 2250
Wire Wire Line
	8900 2350 9000 2350
Connection ~ 8900 2250
Wire Wire Line
	8900 1650 8900 2250
Wire Wire Line
	9000 1250 9000 2350
Wire Wire Line
	9350 2350 9700 2350
Wire Wire Line
	9350 2350 9000 2350
Connection ~ 9000 2350
Connection ~ 9350 2350
Wire Wire Line
	8850 2100 8950 2100
Wire Wire Line
	8950 2100 8950 1950
Wire Wire Line
	8950 1950 9700 1950
Connection ~ 9700 1950
Wire Wire Line
	9350 1700 9350 2350
Wire Wire Line
	9350 1350 9800 1350
Wire Wire Line
	9000 900  9800 900 
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F1AB817
P 8400 2700
AR Path="/5EA188E4/5F1AB817" Ref="Q?"  Part="1" 
AR Path="/5E9F4ACB/5F1AB817" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5F1AB817" Ref="Q17"  Part="1" 
F 0 "Q17" H 8350 2900 50  0000 R CNN
F 1 "BSS138P" H 8350 2800 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8600 2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BSS138P.pdf" H 8400 2700 50  0001 C CNN
	1    8400 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F1AD112
P 8150 2900
AR Path="/5E9E88B8/5F1AD112" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F1AD112" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5F1AD112" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F1AD112" Ref="R139"  Part="1" 
F 0 "R139" H 8200 2950 50  0000 L CNN
F 1 "47K" H 8200 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8080 2900 50  0001 C CNN
F 3 "~" H 8150 2900 50  0001 C CNN
	1    8150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2700 8150 2700
Wire Wire Line
	8150 2700 8150 2750
Wire Wire Line
	8750 3100 8500 3100
Wire Wire Line
	8150 3100 8150 3050
Wire Wire Line
	8500 2900 8500 3100
Connection ~ 8500 3100
Wire Wire Line
	8500 3100 8150 3100
Wire Wire Line
	8500 2500 8500 2450
Wire Wire Line
	8500 2450 8750 2450
Wire Wire Line
	8750 2450 8750 2500
Wire Wire Line
	9100 3100 9150 3100
Connection ~ 9100 3100
Wire Wire Line
	8150 2700 7900 2700
Wire Wire Line
	7900 2700 7900 3200
Connection ~ 8150 2700
Text HLabel 9800 3200 2    50   Input ~ 0
RX-PWR
Text GLabel 9800 4200 2    50   Output ~ 0
+3.3V
Wire Wire Line
	8500 2450 7900 2450
Wire Wire Line
	7900 2450 7900 2250
Connection ~ 8500 2450
Connection ~ 7900 2250
Wire Wire Line
	9100 2700 9800 2700
Connection ~ 9100 2700
Wire Wire Line
	7900 3200 9800 3200
Text HLabel 9800 2700 2    50   Input ~ 0
TX-PWR
Wire Wire Line
	7450 1350 7450 1300
Wire Wire Line
	7450 900  7900 900 
Connection ~ 7450 900 
$Comp
L Device:C C?
U 1 1 5F35A825
P 6550 1100
AR Path="/5E9E88B8/5F35A825" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F35A825" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F35A825" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F35A825" Ref="C285"  Part="1" 
F 0 "C285" H 6665 1146 50  0000 L CNN
F 1 "0.1uF" H 6665 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6588 950 50  0001 C CNN
F 3 "~" H 6550 1100 50  0001 C CNN
	1    6550 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F35AD01
P 5950 1100
AR Path="/5E9E88B8/5F35AD01" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F35AD01" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F35AD01" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F35AD01" Ref="C283"  Part="1" 
F 0 "C283" H 6065 1146 50  0000 L CNN
F 1 "0.1uF" H 6065 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5988 950 50  0001 C CNN
F 3 "~" H 5950 1100 50  0001 C CNN
	1    5950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 900  5950 900 
Wire Wire Line
	5950 900  5950 950 
Connection ~ 5500 900 
Wire Wire Line
	5950 1250 5950 1300
Wire Wire Line
	5950 1300 5500 1300
Connection ~ 5500 1300
Wire Wire Line
	7000 900  6550 900 
Wire Wire Line
	6550 900  6550 950 
Connection ~ 7000 900 
Wire Wire Line
	6550 1250 6550 1300
Wire Wire Line
	6550 1300 7000 1300
Connection ~ 7000 1300
Wire Wire Line
	5950 900  6350 900 
Connection ~ 5950 900 
Connection ~ 6550 900 
Connection ~ 6350 900 
Wire Wire Line
	6350 900  6550 900 
Connection ~ 8900 4950
Wire Wire Line
	8900 4350 8900 4950
$Comp
L Device:C C?
U 1 1 5EF551F1
P 9350 4400
AR Path="/5E9E88B8/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF551F1" Ref="C293"  Part="1" 
F 0 "C293" H 9465 4446 50  0000 L CNN
F 1 "4.7uF" H 9465 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9388 4250 50  0001 C CNN
F 3 "~" H 9350 4400 50  0001 C CNN
	1    9350 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4200 8200 4200
$Comp
L Device:R R?
U 1 1 5F5613C0
P 7900 3800
AR Path="/5E9E88B8/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F5613C0" Ref="R138"  Part="1" 
F 0 "R138" H 7950 3850 50  0000 L CNN
F 1 "4.3K" H 7950 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 3800 50  0001 C CNN
F 3 "~" H 7900 3800 50  0001 C CNN
	1    7900 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3650 7900 3600
$Comp
L Device:C C?
U 1 1 5F58FF8F
P 7500 3800
AR Path="/5E9E88B8/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F58FF8F" Ref="C289"  Part="1" 
F 0 "C289" H 7615 3846 50  0000 L CNN
F 1 "0.1uF" H 7615 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7538 3650 50  0001 C CNN
F 3 "~" H 7500 3800 50  0001 C CNN
	1    7500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F5911DD
P 7050 3800
AR Path="/5E9E88B8/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F5911DD" Ref="C287"  Part="1" 
F 0 "C287" H 7165 3846 50  0000 L CNN
F 1 "0.1uF" H 7165 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 3650 50  0001 C CNN
F 3 "~" H 7050 3800 50  0001 C CNN
	1    7050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3600 7050 3650
Wire Wire Line
	7050 3600 7500 3600
Wire Wire Line
	7500 3650 7500 3600
Connection ~ 7500 3600
Wire Wire Line
	7500 3600 7900 3600
Wire Wire Line
	7050 3950 7050 4000
Wire Wire Line
	7050 4000 7500 4000
Wire Wire Line
	7500 4000 7500 3950
$Comp
L power:GND #PWR?
U 1 1 5F5BFBC7
P 7500 4050
AR Path="/5E9F4ACB/5F5BFBC7" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F5BFBC7" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F5BFBC7" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 7500 3800 50  0001 C CNN
F 1 "GND" H 7505 3877 50  0000 C CNN
F 2 "" H 7500 4050 50  0001 C CNN
F 3 "" H 7500 4050 50  0001 C CNN
	1    7500 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 4050 7500 4000
Connection ~ 7500 4000
Connection ~ 7050 3600
Wire Wire Line
	7050 3600 6350 3600
$Comp
L Device:Q_PNP_BCE Q15
U 1 1 5F68896D
P 5750 4650
F 0 "Q15" V 6078 4650 50  0000 C CNN
F 1 "BCP52" V 5987 4650 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 5950 4750 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/BCP51_52_53.pdf" H 5750 4650 50  0001 C CNN
	1    5750 4650
	0    -1   -1   0   
$EndComp
$Comp
L Diode:BZX84Cxx D?
U 1 1 5F68EAE2
P 5950 4900
AR Path="/5EC388F5/5F68EAE2" Ref="D?"  Part="1" 
AR Path="/5ED56EC4/5F68EAE2" Ref="D8"  Part="1" 
F 0 "D8" H 5950 4800 50  0000 C CNN
F 1 "BZX84-C2V4" H 5950 5000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5950 4900 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 5950 4900 50  0001 C CNN
	1    5950 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F694701
P 5550 4900
AR Path="/5E9E88B8/5F694701" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F694701" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F694701" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F694701" Ref="R133"  Part="1" 
F 0 "R133" V 5650 4900 50  0000 C CNN
F 1 "4.3K" V 5450 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5480 4900 50  0001 C CNN
F 3 "~" H 5550 4900 50  0001 C CNN
	1    5550 4900
	0    1    -1   0   
$EndComp
Wire Wire Line
	5700 4900 5750 4900
Wire Wire Line
	5750 4850 5750 4900
Connection ~ 5750 4900
Wire Wire Line
	5750 4900 5800 4900
$Comp
L Device:R R?
U 1 1 5F6B7283
P 6150 4550
AR Path="/5E9E88B8/5F6B7283" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F6B7283" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F6B7283" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F6B7283" Ref="R135"  Part="1" 
F 0 "R135" V 6250 4550 50  0000 C CNN
F 1 "15R 0.25W" V 6050 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6080 4550 50  0001 C CNN
F 3 "~" H 6150 4550 50  0001 C CNN
	1    6150 4550
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6B7BFA
P 5350 4900
AR Path="/5E9F4ACB/5F6B7BFA" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F6B7BFA" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F6B7BFA" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 5350 4650 50  0001 C CNN
F 1 "GND" H 5355 4727 50  0000 C CNN
F 2 "" H 5350 4900 50  0001 C CNN
F 3 "" H 5350 4900 50  0001 C CNN
	1    5350 4900
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 4900 5400 4900
Wire Wire Line
	5950 4550 6000 4550
Wire Wire Line
	6100 4900 6350 4900
Wire Wire Line
	6300 4550 6350 4550
Connection ~ 6350 4550
Wire Wire Line
	6350 4550 6350 4900
Wire Wire Line
	5550 4550 5300 4550
Wire Wire Line
	4350 4550 4350 7150
Wire Wire Line
	4350 7150 2050 7150
Text HLabel 2050 7150 0    50   Output ~ 0
BAT-A
Text HLabel 2050 7450 0    50   BiDi ~ 0
BAT-V
Text HLabel 9800 5800 2    50   Input ~ 0
VIN
$Comp
L Device:CP1 C?
U 1 1 5F809EBF
P 6000 3600
AR Path="/5EC388F5/5F809EBF" Ref="C?"  Part="1" 
AR Path="/5EC652B9/5F809EBF" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F809EBF" Ref="C284"  Part="1" 
F 0 "C284" V 5850 3600 50  0000 C CNN
F 1 "330uF 16V" V 6150 3650 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 6000 3600 50  0001 C CNN
F 3 "~" H 6000 3600 50  0001 C CNN
	1    6000 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 3600 6350 3600
$Comp
L power:GND #PWR?
U 1 1 5F82E4F3
P 5800 3600
AR Path="/5E9F4ACB/5F82E4F3" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F82E4F3" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F82E4F3" Ref="#PWR0158"  Part="1" 
F 0 "#PWR0158" H 5800 3350 50  0001 C CNN
F 1 "GND" H 5805 3427 50  0000 C CNN
F 2 "" H 5800 3600 50  0001 C CNN
F 3 "" H 5800 3600 50  0001 C CNN
	1    5800 3600
	0    1    -1   0   
$EndComp
Wire Wire Line
	5800 3600 5850 3600
$Comp
L Device:D D5
U 1 1 6036F661
P 5150 4550
F 0 "D5" H 5150 4766 50  0000 C CNN
F 1 "PMEG2010ER" H 5150 4675 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 5150 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PMEG2010ER.pdf" H 5150 4550 50  0001 C CNN
	1    5150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4550 4350 4550
Wire Wire Line
	8400 3600 8200 3600
Text GLabel 9800 3600 2    50   Output ~ 0
+12V
Wire Wire Line
	8200 3600 7900 3600
Connection ~ 8200 3600
Wire Wire Line
	8600 3900 8600 4000
$Comp
L Device:C C?
U 1 1 5F18B736
P 9000 3800
AR Path="/5E9E88B8/5F18B736" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F18B736" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F18B736" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F18B736" Ref="C291"  Part="1" 
F 0 "C291" H 9100 3850 50  0000 L CNN
F 1 "4.7uF" H 9100 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9038 3650 50  0001 C CNN
F 3 "~" H 9000 3800 50  0001 C CNN
	1    9000 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3650 9000 3600
Connection ~ 9000 3600
Wire Wire Line
	9000 3600 8800 3600
Wire Wire Line
	9000 3600 9800 3600
Wire Wire Line
	6350 4900 6350 5350
Wire Wire Line
	6350 5350 4650 5350
Wire Wire Line
	4650 5350 4650 5800
Connection ~ 6350 4900
Wire Wire Line
	4650 7450 2050 7450
Wire Wire Line
	5050 5800 4650 5800
Connection ~ 4650 5800
Wire Wire Line
	4650 5800 4650 7450
Wire Wire Line
	6700 5800 9800 5800
$Comp
L Device:Q_PMOS_GSD Q?
U 1 1 5F1FC213
P 8600 1000
AR Path="/5FDAA718/5F1FC213" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5F1FC213" Ref="Q18"  Part="1" 
F 0 "Q18" V 8942 1000 50  0000 C CNN
F 1 "DMP3030SN" V 8851 1000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8800 1100 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30787.pdf" H 8600 1000 50  0001 C CNN
	1    8600 1000
	0    1    -1   0   
$EndComp
Wire Wire Line
	8600 4000 7900 4000
Connection ~ 8200 4200
Connection ~ 7900 4350
Wire Wire Line
	7900 4350 7900 4950
Wire Wire Line
	7900 4350 8250 4350
Wire Wire Line
	7900 5350 9750 5350
Wire Wire Line
	7900 4950 8250 4950
Connection ~ 7900 4950
Wire Wire Line
	7900 4950 7900 5350
Wire Wire Line
	8200 3600 8200 4200
Wire Wire Line
	7900 4000 7900 4350
Wire Wire Line
	7900 3950 7900 4000
Connection ~ 7900 4000
Wire Wire Line
	8850 4800 9700 4800
Wire Wire Line
	8850 4200 9350 4200
Wire Wire Line
	8900 5200 9000 5200
Wire Wire Line
	9000 3950 9000 5200
Connection ~ 9000 5200
Wire Wire Line
	9000 5200 9350 5200
Wire Wire Line
	9350 4200 9350 4250
Connection ~ 9350 4200
Wire Wire Line
	9350 4200 9800 4200
Wire Wire Line
	9350 4550 9350 5200
Connection ~ 9350 5200
Wire Wire Line
	9700 4800 9700 4850
Connection ~ 9700 4800
Wire Wire Line
	9700 4800 9750 4800
Wire Wire Line
	9350 5200 9700 5200
Wire Wire Line
	9700 5150 9700 5200
Connection ~ 9700 5200
Wire Wire Line
	9700 5200 9750 5200
Connection ~ 6350 3600
Wire Wire Line
	6350 3600 6350 4550
Connection ~ 7900 3600
Wire Wire Line
	6350 900  6350 3600
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F71917E
P 9000 3550
AR Path="/5F71917E" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F71917E" Ref="#FLG0107"  Part="1" 
F 0 "#FLG0107" H 9000 3625 50  0001 C CNN
F 1 "PWR_FLAG" H 9000 3723 50  0000 C CNN
F 2 "" H 9000 3550 50  0001 C CNN
F 3 "~" H 9000 3550 50  0001 C CNN
	1    9000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3550 9000 3600
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F742B91
P 4650 5300
AR Path="/5F742B91" Ref="#FLG?"  Part="1" 
AR Path="/5ED56EC4/5F742B91" Ref="#FLG0108"  Part="1" 
F 0 "#FLG0108" H 4650 5375 50  0001 C CNN
F 1 "PWR_FLAG" H 4650 5473 50  0000 C CNN
F 2 "" H 4650 5300 50  0001 C CNN
F 3 "~" H 4650 5300 50  0001 C CNN
	1    4650 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5300 4650 5350
Connection ~ 4650 5350
$EndSCHEMATC
