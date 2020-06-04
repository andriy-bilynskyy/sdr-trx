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
AR Path="/5ED56EC4/5EE3B931" Ref="R?"  Part="1" 
F 0 "R?" H 3550 1150 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE5C5AF" Ref="Q?"  Part="1" 
F 0 "Q?" H 3450 2200 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE5C5B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 2200 50  0001 C CNN
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
AR Path="/5ED56EC4/5EE5C5BC" Ref="R?"  Part="1" 
F 0 "R?" H 3200 2250 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE8AC0E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 1500 50  0001 C CNN
F 1 "GND" H 2105 1577 50  0000 C CNN
F 2 "" H 2100 1750 50  0001 C CNN
F 3 "" H 2100 1750 50  0001 C CNN
	1    2100 1750
	0    1    -1   0   
$EndComp
Text HLabel 2050 2000 0    50   Input ~ 0
TX-PWR
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EEC1864
P 2950 1500
F 0 "U?" H 2950 1650 50  0000 C CNN
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
AR Path="/5ED56EC4/5ED7629A" Ref="C?"  Part="1" 
F 0 "C?" H 2050 1600 50  0000 R CNN
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
AR Path="/5ED56EC4/5EDAF97E" Ref="R?"  Part="1" 
F 0 "R?" H 3550 3050 50  0000 R CNN
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
AR Path="/5ED56EC4/5EDAF985" Ref="Q?"  Part="1" 
F 0 "Q?" H 3450 3650 50  0000 R CNN
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
AR Path="/5ED56EC4/5EDAF98B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 3650 50  0001 C CNN
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
AR Path="/5ED56EC4/5EDAF991" Ref="R?"  Part="1" 
F 0 "R?" H 3200 3700 50  0000 R CNN
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
AR Path="/5ED56EC4/5EDAF9B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 2950 50  0001 C CNN
F 1 "GND" H 2105 3027 50  0000 C CNN
F 2 "" H 2100 3200 50  0001 C CNN
F 3 "" H 2100 3200 50  0001 C CNN
	1    2100 3200
	0    1    -1   0   
$EndComp
Text HLabel 2050 3450 0    50   Input ~ 0
RX-PWR
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EDAF9BC
P 3000 2800
F 0 "U?" H 3000 2950 50  0000 C CNN
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
AR Path="/5ED56EC4/5EDAF9CB" Ref="C?"  Part="1" 
F 0 "C?" H 2050 3050 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE8D04D" Ref="R?"  Part="1" 
F 0 "R?" H 3550 4450 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE8D053" Ref="Q?"  Part="1" 
F 0 "Q?" H 3450 5050 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE8D059" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 5050 50  0001 C CNN
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
AR Path="/5ED56EC4/5EE8D05F" Ref="R?"  Part="1" 
F 0 "R?" H 3200 5100 50  0000 R CNN
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
AR Path="/5ED56EC4/5EE8D06C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 4350 50  0001 C CNN
F 1 "GND" H 2105 4427 50  0000 C CNN
F 2 "" H 2100 4600 50  0001 C CNN
F 3 "" H 2100 4600 50  0001 C CNN
	1    2100 4600
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EE8D073
P 3000 4200
F 0 "U?" H 3000 4350 50  0000 C CNN
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
AR Path="/5ED56EC4/5EE8D07B" Ref="C?"  Part="1" 
F 0 "C?" H 2050 4450 50  0000 R CNN
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
AR Path="/5ED56EC4/5EEBCDF1" Ref="R?"  Part="1" 
F 0 "R?" H 3550 5850 50  0000 R CNN
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
AR Path="/5ED56EC4/5EEBCDF7" Ref="Q?"  Part="1" 
F 0 "Q?" H 3450 6450 50  0000 R CNN
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
AR Path="/5ED56EC4/5EEBCDFD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 6450 50  0001 C CNN
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
AR Path="/5ED56EC4/5EEBCE03" Ref="R?"  Part="1" 
F 0 "R?" H 3200 6500 50  0000 R CNN
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
AR Path="/5ED56EC4/5EEBCE10" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 5750 50  0001 C CNN
F 1 "GND" H 2105 5827 50  0000 C CNN
F 2 "" H 2100 6000 50  0001 C CNN
F 3 "" H 2100 6000 50  0001 C CNN
	1    2100 6000
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EEBCE16
P 3000 5600
F 0 "U?" H 3000 5750 50  0000 C CNN
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
AR Path="/5ED56EC4/5EEBCE1E" Ref="C?"  Part="1" 
F 0 "C?" H 2050 5850 50  0000 R CNN
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
AR Path="/5ED56EC4/5EF992FE" Ref="C?"  Part="1" 
F 0 "C?" H 7565 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5EF9957B" Ref="C?"  Part="1" 
F 0 "C?" H 7115 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5ED9A193" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 1100 50  0001 C CNN
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
AR Path="/5ED56EC4/5EFB21CE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7450 1100 50  0001 C CNN
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
Text HLabel 9800 4600 2    50   Input ~ 0
PWR-HOLD
Wire Wire Line
	8200 4200 8200 3600
Wire Wire Line
	8300 4200 8200 4200
Wire Wire Line
	8200 3600 8300 3600
Text GLabel 9800 4050 2    50   Output ~ 0
+3.3VA
Wire Wire Line
	8300 3450 8250 3450
Wire Wire Line
	8250 4050 8250 3450
Wire Wire Line
	8300 4050 8250 4050
Wire Wire Line
	8950 4450 9150 4450
Wire Wire Line
	8950 4200 8950 4450
Wire Wire Line
	8900 4200 8950 4200
Connection ~ 9450 4050
Wire Wire Line
	8900 4050 9450 4050
Connection ~ 9450 4450
Wire Wire Line
	9450 4450 9500 4450
Wire Wire Line
	9450 4400 9450 4450
Wire Wire Line
	9450 4100 9450 4050
$Comp
L Device:C C?
U 1 1 5EF5A030
P 9450 4250
AR Path="/5E9E88B8/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF5A030" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF5A030" Ref="C?"  Part="1" 
F 0 "C?" H 9565 4296 50  0000 L CNN
F 1 "4.7uF" H 9565 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9488 4100 50  0001 C CNN
F 3 "~" H 9450 4250 50  0001 C CNN
	1    9450 4250
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EF5A02A
P 8600 4050
F 0 "U?" H 8600 4200 50  0000 C CNN
F 1 "LF33CPT" H 8600 3800 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8600 4275 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8600 4000 50  0001 C CNN
	1    8600 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF5A024
P 9500 4450
AR Path="/5E9F4ACB/5EF5A024" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EF5A024" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EF5A024" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9500 4200 50  0001 C CNN
F 1 "GND" H 9505 4277 50  0000 C CNN
F 2 "" H 9500 4450 50  0001 C CNN
F 3 "" H 9500 4450 50  0001 C CNN
	1    9500 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 3600 8950 3600
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5EF551EB
P 8600 3450
F 0 "U?" H 8600 3600 50  0000 C CNN
F 1 "LF33CPT" H 8600 3200 50  0000 C CNN
F 2 "sdr-trx:PPAK" H 8600 3675 50  0001 C CIN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 8600 3400 50  0001 C CNN
	1    8600 3450
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 1 1 5EDBA598
P 9450 5000
F 0 "Q?" V 9700 5000 50  0000 C CNN
F 1 "Si4909DY" V 9350 5100 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 9500 5000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 9500 5000 50  0001 C CNN
	1    9450 5000
	0    1    -1   0   
$EndComp
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 2 1 5EDBD9C3
P 8200 5000
F 0 "Q?" V 8450 5000 50  0000 C CNN
F 1 "Si4909DY" V 8100 5050 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 8250 5000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 8250 5000 50  0001 C CNN
	2    8200 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 5EDCC9A2
P 9000 5200
AR Path="/5FDAA718/5EDCC9A2" Ref="Q?"  Part="1" 
AR Path="/5ED56EC4/5EDCC9A2" Ref="Q?"  Part="1" 
F 0 "Q?" H 9050 5000 50  0000 R CNN
F 1 "2SB1198K" V 9250 5200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9200 5300 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sb1198k.pdf" H 9000 5200 50  0001 C CNN
	1    9000 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	9250 4900 9100 4900
Wire Wire Line
	9100 4900 9100 5000
$Comp
L Diode:BZX84Cxx D?
U 1 1 5EDF51FA
P 8600 5200
AR Path="/5EC388F5/5EDF51FA" Ref="D?"  Part="1" 
AR Path="/5ED56EC4/5EDF51FA" Ref="D?"  Part="1" 
F 0 "D?" V 8400 5250 50  0000 L CNN
F 1 "BZX84-C12" H 8600 5100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8600 5200 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 8600 5200 50  0001 C CNN
	1    8600 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 4900 8600 4900
Connection ~ 9100 4900
Wire Wire Line
	8600 4900 8600 5050
Wire Wire Line
	8600 5350 8600 5450
Wire Wire Line
	8600 5450 9100 5450
Wire Wire Line
	9100 5450 9100 5400
Wire Wire Line
	9100 5450 9450 5450
Wire Wire Line
	9450 5450 9450 5200
Connection ~ 9100 5450
Wire Wire Line
	8400 4900 8600 4900
Connection ~ 8600 4900
Wire Wire Line
	8600 5450 8200 5450
Wire Wire Line
	8200 5450 8200 5200
Connection ~ 8600 5450
$Comp
L Device:R R?
U 1 1 5EE37975
P 9100 5650
AR Path="/5E9E88B8/5EE37975" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE37975" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE37975" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE37975" Ref="R?"  Part="1" 
F 0 "R?" H 9150 5700 50  0000 L CNN
F 1 "10K" H 9150 5600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9030 5650 50  0001 C CNN
F 3 "~" H 9100 5650 50  0001 C CNN
	1    9100 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE40630
P 8750 5650
AR Path="/5E9E88B8/5EE40630" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE40630" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5EE40630" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5EE40630" Ref="R?"  Part="1" 
F 0 "R?" H 8800 5700 50  0000 L CNN
F 1 "10K" H 8800 5600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8680 5650 50  0001 C CNN
F 3 "~" H 8750 5650 50  0001 C CNN
	1    8750 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5200 8750 5200
Wire Wire Line
	8750 5200 8750 5500
Wire Wire Line
	9100 5500 9100 5450
$Comp
L Diode:BZX84Cxx D?
U 1 1 5EE52CFA
P 8750 6000
AR Path="/5EC388F5/5EE52CFA" Ref="D?"  Part="1" 
AR Path="/5ED56EC4/5EE52CFA" Ref="D?"  Part="1" 
F 0 "D?" V 8750 6100 50  0000 L CNN
F 1 "BZX84-C12" H 8750 5900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8750 6000 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds18001.pdf" H 8750 6000 50  0001 C CNN
	1    8750 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5850 8750 5800
$Comp
L power:GND #PWR?
U 1 1 5EE5E25F
P 8750 6200
AR Path="/5E9F4ACB/5EE5E25F" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE5E25F" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE5E25F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8750 5950 50  0001 C CNN
F 1 "GND" H 8755 6027 50  0000 C CNN
F 2 "" H 8750 6200 50  0001 C CNN
F 3 "" H 8750 6200 50  0001 C CNN
	1    8750 6200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE5F454
P 9100 6200
AR Path="/5E9F4ACB/5EE5F454" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5EE5F454" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5EE5F454" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9100 5950 50  0001 C CNN
F 1 "GND" H 9105 6027 50  0000 C CNN
F 2 "" H 9100 6200 50  0001 C CNN
F 3 "" H 9100 6200 50  0001 C CNN
	1    9100 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9100 5800 9100 6200
Wire Wire Line
	8750 6150 8750 6200
Wire Wire Line
	9650 4900 9800 4900
$Comp
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 1 1 5EEC588C
P 2900 1000
F 0 "Q?" V 3242 1000 50  0000 C CNN
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
AR Path="/5ED56EC4/5EDBB7B2" Ref="C?"  Part="1" 
F 0 "C?" H 4265 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5EDBC9D5" Ref="C?"  Part="1" 
F 0 "C?" H 4715 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5EDBCC2A" Ref="C?"  Part="1" 
F 0 "C?" H 5165 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5EDBCEE1" Ref="C?"  Part="1" 
F 0 "C?" H 5615 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5EDE9B49" Ref="C?"  Part="1" 
F 0 "C?" H 2400 1150 50  0000 R CNN
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
AR Path="/5ED56EC4/5F0595CB" Ref="R?"  Part="1" 
F 0 "R?" H 7950 1150 50  0000 L CNN
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
AR Path="/5ED56EC4/5F0595D2" Ref="Q?"  Part="1" 
F 0 "Q?" H 8800 2900 50  0000 R CNN
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
AR Path="/5ED56EC4/5F0595D8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9150 2850 50  0001 C CNN
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
AR Path="/5ED56EC4/5F0595DE" Ref="R?"  Part="1" 
F 0 "R?" H 9150 2950 50  0000 L CNN
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
L sdr-trx:LFxxABPT U?
U 1 1 5F0595F3
P 8550 1500
F 0 "U?" H 8550 1650 50  0000 C CNN
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
AR Path="/5ED56EC4/5F059602" Ref="C?"  Part="1" 
F 0 "C?" H 9250 1600 50  0000 R CNN
F 1 "4.7uF" H 9250 1500 50  0000 R CNN
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
L sdr-trx:Q_DUAL_PMOS_SO8 Q?
U 2 1 5F059616
P 8600 1000
F 0 "Q?" V 8942 1000 50  0000 C CNN
F 1 "Si4909DY" V 8851 1000 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 8650 1000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/67077/si4909dy.pdf" H 8650 1000 50  0001 C CNN
	2    8600 1000
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F05961C
P 9000 1100
AR Path="/5E9E88B8/5F05961C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F05961C" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F05961C" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F05961C" Ref="C?"  Part="1" 
F 0 "C?" H 8900 1150 50  0000 R CNN
F 1 "4.7uF" H 8900 1050 50  0000 R CNN
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
AR Path="/5ED56EC4/5F0C108F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9750 2100 50  0001 C CNN
F 1 "GND" H 9755 2177 50  0000 C CNN
F 2 "" H 9750 2350 50  0001 C CNN
F 3 "" H 9750 2350 50  0001 C CNN
	1    9750 2350
	0    -1   -1   0   
$EndComp
$Comp
L sdr-trx:LFxxABPT U?
U 1 1 5F0C1095
P 8550 2100
F 0 "U?" H 8550 2250 50  0000 C CNN
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
AR Path="/5ED56EC4/5F0C109E" Ref="C?"  Part="1" 
F 0 "C?" H 9600 2200 50  0000 R CNN
F 1 "4.7uF" H 9600 2100 50  0000 R CNN
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
AR Path="/5ED56EC4/5F1AB817" Ref="Q?"  Part="1" 
F 0 "Q?" H 8350 2900 50  0000 R CNN
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
AR Path="/5ED56EC4/5F1AD112" Ref="R?"  Part="1" 
F 0 "R?" H 8200 2950 50  0000 L CNN
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
Text GLabel 9800 3450 2    50   Output ~ 0
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
AR Path="/5ED56EC4/5F35A825" Ref="C?"  Part="1" 
F 0 "C?" H 6665 1146 50  0000 L CNN
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
AR Path="/5ED56EC4/5F35AD01" Ref="C?"  Part="1" 
F 0 "C?" H 6065 1146 50  0000 L CNN
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
Connection ~ 8950 4200
Wire Wire Line
	8950 3600 8950 4200
$Comp
L Device:C C?
U 1 1 5EF551F1
P 9150 3650
AR Path="/5E9E88B8/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5EF551F1" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5EF551F1" Ref="C?"  Part="1" 
F 0 "C?" H 9265 3696 50  0000 L CNN
F 1 "4.7uF" H 9265 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9188 3500 50  0001 C CNN
F 3 "~" H 9150 3650 50  0001 C CNN
	1    9150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3450 9150 3450
Wire Wire Line
	9150 3500 9150 3450
Connection ~ 9150 3450
Wire Wire Line
	9150 3800 9150 4450
Connection ~ 9150 4450
Wire Wire Line
	9150 4450 9450 4450
Wire Wire Line
	8250 3450 7900 3450
Connection ~ 8250 3450
Wire Wire Line
	9150 3450 9800 3450
Wire Wire Line
	9450 4050 9800 4050
$Comp
L Device:R R?
U 1 1 5F5613C0
P 7900 3650
AR Path="/5E9E88B8/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5ECEED15/5F5613C0" Ref="R?"  Part="1" 
AR Path="/5ED56EC4/5F5613C0" Ref="R?"  Part="1" 
F 0 "R?" H 7950 3700 50  0000 L CNN
F 1 "4.3K" H 7950 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 3650 50  0001 C CNN
F 3 "~" H 7900 3650 50  0001 C CNN
	1    7900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3500 7900 3450
Connection ~ 7900 3450
Wire Wire Line
	7900 3800 7900 4200
Wire Wire Line
	7900 4200 8200 4200
Connection ~ 8200 4200
Wire Wire Line
	9800 4600 8200 4600
Wire Wire Line
	8200 4600 8200 4200
$Comp
L Device:C C?
U 1 1 5F58FF8F
P 7500 3650
AR Path="/5E9E88B8/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F58FF8F" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F58FF8F" Ref="C?"  Part="1" 
F 0 "C?" H 7615 3696 50  0000 L CNN
F 1 "0.1uF" H 7615 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7538 3500 50  0001 C CNN
F 3 "~" H 7500 3650 50  0001 C CNN
	1    7500 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F5911DD
P 7050 3650
AR Path="/5E9E88B8/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5ECEED15/5F5911DD" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F5911DD" Ref="C?"  Part="1" 
F 0 "C?" H 7165 3696 50  0000 L CNN
F 1 "0.1uF" H 7165 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 3500 50  0001 C CNN
F 3 "~" H 7050 3650 50  0001 C CNN
	1    7050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3450 7050 3500
Wire Wire Line
	7050 3450 7500 3450
Wire Wire Line
	7500 3500 7500 3450
Connection ~ 7500 3450
Wire Wire Line
	7500 3450 7900 3450
Wire Wire Line
	7050 3800 7050 3850
Wire Wire Line
	7050 3850 7500 3850
Wire Wire Line
	7500 3850 7500 3800
$Comp
L power:GND #PWR?
U 1 1 5F5BFBC7
P 7500 3900
AR Path="/5E9F4ACB/5F5BFBC7" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F5BFBC7" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F5BFBC7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 3650 50  0001 C CNN
F 1 "GND" H 7505 3727 50  0000 C CNN
F 2 "" H 7500 3900 50  0001 C CNN
F 3 "" H 7500 3900 50  0001 C CNN
	1    7500 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 3900 7500 3850
Connection ~ 7500 3850
Connection ~ 7050 3450
Wire Wire Line
	8000 4900 6350 4900
Wire Wire Line
	7050 3450 6350 3450
Connection ~ 6350 3450
Wire Wire Line
	6350 3450 6350 4550
Wire Wire Line
	6350 900  6350 3450
$Comp
L Device:Q_PNP_BCE Q?
U 1 1 5F68896D
P 5750 4650
F 0 "Q?" V 6078 4650 50  0000 C CNN
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
AR Path="/5ED56EC4/5F68EAE2" Ref="D?"  Part="1" 
F 0 "D?" H 5950 4800 50  0000 C CNN
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
AR Path="/5ED56EC4/5F694701" Ref="R?"  Part="1" 
F 0 "R?" V 5650 4900 50  0000 C CNN
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
AR Path="/5ED56EC4/5F6B7283" Ref="R?"  Part="1" 
F 0 "R?" V 6250 4550 50  0000 C CNN
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
AR Path="/5ED56EC4/5F6B7BFA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5350 4650 50  0001 C CNN
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
Connection ~ 6350 4900
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
Wire Wire Line
	6350 4900 6350 7450
Wire Wire Line
	6350 7450 2050 7450
Text HLabel 2050 7150 0    50   Output ~ 0
BAT-A
Text HLabel 2050 7450 0    50   BiDi ~ 0
BAT-V
Text HLabel 9800 4900 2    50   Input ~ 0
VIN
$Comp
L Device:CP1 C?
U 1 1 5F809EBF
P 6000 3450
AR Path="/5EC388F5/5F809EBF" Ref="C?"  Part="1" 
AR Path="/5EC652B9/5F809EBF" Ref="C?"  Part="1" 
AR Path="/5ED56EC4/5F809EBF" Ref="C?"  Part="1" 
F 0 "C?" V 5850 3450 50  0000 C CNN
F 1 "330uF 16V" V 6150 3500 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 6000 3450 50  0001 C CNN
F 3 "~" H 6000 3450 50  0001 C CNN
	1    6000 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 3450 6350 3450
$Comp
L power:GND #PWR?
U 1 1 5F82E4F3
P 5800 3450
AR Path="/5E9F4ACB/5F82E4F3" Ref="#PWR?"  Part="1" 
AR Path="/5EA188E4/5F82E4F3" Ref="#PWR?"  Part="1" 
AR Path="/5ED56EC4/5F82E4F3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 3200 50  0001 C CNN
F 1 "GND" H 5805 3277 50  0000 C CNN
F 2 "" H 5800 3450 50  0001 C CNN
F 3 "" H 5800 3450 50  0001 C CNN
	1    5800 3450
	0    1    -1   0   
$EndComp
Wire Wire Line
	5800 3450 5850 3450
$Comp
L Device:D D?
U 1 1 6036F661
P 5150 4550
F 0 "D?" H 5150 4766 50  0000 C CNN
F 1 "PMEG2010ER" H 5150 4675 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 5150 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PMEG2010ER.pdf" H 5150 4550 50  0001 C CNN
	1    5150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4550 4350 4550
$EndSCHEMATC
