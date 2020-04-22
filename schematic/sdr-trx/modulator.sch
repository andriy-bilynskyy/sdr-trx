EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Modulator"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Analog_Switch:SN74CBT3253 U?
U 1 1 5E9F4DCD
P 7300 2950
F 0 "U?" H 7250 3550 50  0000 R CNN
F 1 "SN74CBT3253" H 7200 2350 50  0000 R CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7300 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74cbt3253" H 7300 2950 50  0001 C CNN
	1    7300 2950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E9F5E38
P 7300 3600
F 0 "#PWR0107" H 7300 3350 50  0001 C CNN
F 1 "GND" H 7305 3427 50  0000 C CNN
F 2 "" H 7300 3600 50  0001 C CNN
F 3 "" H 7300 3600 50  0001 C CNN
	1    7300 3600
	1    0    0    -1  
$EndComp
Text GLabel 5850 1800 0    50   Input ~ 0
+5.0V-TX
$Comp
L Device:L L?
U 1 1 5E9FD50F
P 6100 1800
AR Path="/5E9E88B8/5E9FD50F" Ref="L?"  Part="1" 
AR Path="/5E9F4ACB/5E9FD50F" Ref="L?"  Part="1" 
F 0 "L?" V 6200 1850 50  0000 L CNN
F 1 "2.2uH" V 6200 1800 50  0000 R CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6100 1800 50  0001 C CNN
F 3 "~" H 6100 1800 50  0001 C CNN
	1    6100 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6600 2250 6600 2200
Connection ~ 6600 2200
$Comp
L Device:C C?
U 1 1 5E9FD517
P 6850 2000
AR Path="/5E9E88B8/5E9FD517" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5E9FD517" Ref="C?"  Part="1" 
F 0 "C?" H 6965 2046 50  0000 L CNN
F 1 "0.1uF" H 6965 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6888 1850 50  0001 C CNN
F 3 "~" H 6850 2000 50  0001 C CNN
	1    6850 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E9FD51D
P 6350 2000
AR Path="/5E9E88B8/5E9FD51D" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5E9FD51D" Ref="C?"  Part="1" 
F 0 "C?" H 6465 2046 50  0000 L CNN
F 1 "1.0uF" H 6465 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6388 1850 50  0001 C CNN
F 3 "~" H 6350 2000 50  0001 C CNN
	1    6350 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9FD523
P 6600 2250
AR Path="/5E9E88B8/5E9FD523" Ref="#PWR?"  Part="1" 
AR Path="/5E9F4ACB/5E9FD523" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 6600 2000 50  0001 C CNN
F 1 "GND" H 6605 2077 50  0000 C CNN
F 2 "" H 6600 2250 50  0001 C CNN
F 3 "" H 6600 2250 50  0001 C CNN
	1    6600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2200 6850 2200
Wire Wire Line
	6350 2150 6350 2200
Wire Wire Line
	6350 2200 6600 2200
Wire Wire Line
	6350 1850 6350 1800
Wire Wire Line
	6350 1800 6850 1800
Wire Wire Line
	6850 1850 6850 1800
Wire Wire Line
	6850 2200 6850 2150
Connection ~ 6850 1800
Text HLabel 9500 3150 2    50   Input ~ 0
TX-EN#
Text HLabel 9500 3050 2    50   Input ~ 0
F90
Text HLabel 9500 2950 2    50   Input ~ 0
F00
Text GLabel 8000 4850 2    50   Input ~ 0
+5.0V-ATX
$Comp
L Device:L L?
U 1 1 5EA54FE1
P 7750 4850
AR Path="/5E9E88B8/5EA54FE1" Ref="L?"  Part="1" 
AR Path="/5E9F4ACB/5EA54FE1" Ref="L?"  Part="1" 
F 0 "L?" V 7850 4900 50  0000 L CNN
F 1 "2.2uH" V 7850 4850 50  0000 R CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 4850 50  0001 C CNN
F 3 "~" H 7750 4850 50  0001 C CNN
	1    7750 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 5300 7250 5250
Connection ~ 7250 5250
$Comp
L Device:C C?
U 1 1 5EA54FE9
P 7000 5050
AR Path="/5E9E88B8/5EA54FE9" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA54FE9" Ref="C?"  Part="1" 
F 0 "C?" H 7115 5096 50  0000 L CNN
F 1 "0.1uF" H 7115 5005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7038 4900 50  0001 C CNN
F 3 "~" H 7000 5050 50  0001 C CNN
	1    7000 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA54FEF
P 7500 5050
AR Path="/5E9E88B8/5EA54FEF" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EA54FEF" Ref="C?"  Part="1" 
F 0 "C?" H 7615 5096 50  0000 L CNN
F 1 "1.0uF" H 7615 5005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7538 4900 50  0001 C CNN
F 3 "~" H 7500 5050 50  0001 C CNN
	1    7500 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA54FF5
P 7250 5300
AR Path="/5E9E88B8/5EA54FF5" Ref="#PWR?"  Part="1" 
AR Path="/5E9F4ACB/5EA54FF5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7250 5050 50  0001 C CNN
F 1 "GND" H 7255 5127 50  0000 C CNN
F 2 "" H 7250 5300 50  0001 C CNN
F 3 "" H 7250 5300 50  0001 C CNN
	1    7250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 5250 7500 5250
Wire Wire Line
	7000 5200 7000 5250
Wire Wire Line
	7000 5250 7250 5250
Wire Wire Line
	7000 4900 7000 4850
Wire Wire Line
	7000 4850 7500 4850
Wire Wire Line
	7500 4900 7500 4850
Wire Wire Line
	7500 5250 7500 5200
Wire Wire Line
	7600 4850 7500 4850
Connection ~ 7500 4850
Wire Wire Line
	7900 4850 8000 4850
Wire Wire Line
	6550 4000 6600 4000
Wire Wire Line
	6600 4000 6600 3650
Wire Wire Line
	6600 3650 5900 3650
Wire Wire Line
	5900 3650 5900 3900
Wire Wire Line
	5900 3900 5950 3900
Wire Wire Line
	6550 5300 6600 5300
Wire Wire Line
	5900 5200 5950 5200
Wire Wire Line
	5900 4950 6600 4950
Wire Wire Line
	5900 4950 5900 5200
$Comp
L power:GNDA #PWR?
U 1 1 5EA8485E
P 6150 5650
F 0 "#PWR?" H 6150 5400 50  0001 C CNN
F 1 "GNDA" H 6155 5477 50  0000 C CNN
F 2 "" H 6150 5650 50  0001 C CNN
F 3 "" H 6150 5650 50  0001 C CNN
	1    6150 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4650 6600 4650
Wire Wire Line
	6600 4650 6600 4300
Wire Wire Line
	6600 4300 5900 4300
Wire Wire Line
	5900 4300 5900 4550
Wire Wire Line
	5900 4550 5950 4550
Wire Wire Line
	6550 3350 6600 3350
Wire Wire Line
	6600 3350 6600 3000
Wire Wire Line
	5900 3250 5950 3250
Wire Wire Line
	6900 2850 6850 2850
Wire Wire Line
	6850 2850 6850 3050
Wire Wire Line
	6850 3050 6900 3050
Wire Wire Line
	6900 2750 6800 2750
Wire Wire Line
	6800 3150 6900 3150
Wire Wire Line
	6900 3250 6750 3250
Wire Wire Line
	6750 2650 6900 2650
Wire Wire Line
	6900 2550 6700 2550
Wire Wire Line
	6700 2550 6700 3350
Wire Wire Line
	6700 3350 6900 3350
Wire Wire Line
	7300 3600 7300 3550
Connection ~ 6800 3150
Connection ~ 6600 5300
Connection ~ 6850 3050
Wire Wire Line
	6600 4950 6600 5300
Wire Wire Line
	5950 3450 5700 3450
Wire Wire Line
	5950 4750 5700 4750
Wire Wire Line
	5950 5400 5700 5400
Wire Wire Line
	5950 4100 5700 4100
Text Label 5800 3450 0    50   ~ 0
I+
Text Label 5800 4750 0    50   ~ 0
Q+
Text Label 5800 5400 0    50   ~ 0
Q-
Text Label 5850 4100 0    50   ~ 0
I-
Wire Wire Line
	6750 4650 6600 4650
Connection ~ 6750 3250
Connection ~ 6600 4650
Wire Wire Line
	6600 3350 6700 3350
Connection ~ 6600 3350
Connection ~ 6700 3350
Wire Wire Line
	6800 5300 6600 5300
Wire Wire Line
	6850 3050 6850 4000
Wire Wire Line
	5850 1800 5950 1800
Wire Wire Line
	6250 1800 6350 1800
Connection ~ 6350 1800
Wire Wire Line
	7300 1800 7300 2350
Wire Wire Line
	6850 1800 7300 1800
Wire Wire Line
	7800 2150 7800 3150
Wire Wire Line
	7800 3350 7700 3350
Wire Wire Line
	7700 3250 7800 3250
Connection ~ 7800 3250
Wire Wire Line
	7800 3250 7800 3350
Wire Wire Line
	7300 1800 7800 1800
Wire Wire Line
	7800 1800 7800 1850
Connection ~ 7300 1800
Wire Wire Line
	6600 4000 6850 4000
Connection ~ 6600 4000
Wire Wire Line
	6800 3150 6800 5300
Wire Wire Line
	6750 3250 6750 4650
Wire Wire Line
	6800 2750 6800 3150
Wire Wire Line
	6750 2650 6750 3250
Wire Wire Line
	6150 5600 6150 5650
Wire Wire Line
	7000 4850 6150 4850
Wire Wire Line
	6150 4850 6150 5000
Connection ~ 7000 4850
$Comp
L Device:C C?
U 1 1 5EC66B67
P 5700 3750
AR Path="/5E9E88B8/5EC66B67" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EC66B67" Ref="C?"  Part="1" 
F 0 "C?" H 5550 3800 50  0000 R CNN
F 1 "8.2nF 1%" H 5600 3700 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 3600 50  0001 C CNN
F 3 "~" H 5700 3750 50  0001 C CNN
	1    5700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3600 5700 3450
Connection ~ 5700 3450
Wire Wire Line
	5700 3450 5500 3450
Wire Wire Line
	5700 3900 5700 4100
Connection ~ 5700 4100
Wire Wire Line
	5700 4100 5500 4100
$Comp
L Device:C C?
U 1 1 5EC7867E
P 5700 5050
AR Path="/5E9E88B8/5EC7867E" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EC7867E" Ref="C?"  Part="1" 
F 0 "C?" H 5550 5100 50  0000 R CNN
F 1 "8.2nF 1%" H 5600 5000 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5738 4900 50  0001 C CNN
F 3 "~" H 5700 5050 50  0001 C CNN
	1    5700 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4900 5700 4750
Connection ~ 5700 4750
Wire Wire Line
	5700 4750 5500 4750
Wire Wire Line
	5700 5200 5700 5400
Connection ~ 5700 5400
Wire Wire Line
	5700 5400 5500 5400
$Comp
L Device:R R?
U 1 1 5EC85FEC
P 5350 4100
AR Path="/5E9E88B8/5EC85FEC" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC85FEC" Ref="R?"  Part="1" 
F 0 "R?" V 5450 4200 50  0000 L CNN
F 1 "100R 1%" V 5450 4100 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 4100 50  0001 C CNN
F 3 "~" H 5350 4100 50  0001 C CNN
	1    5350 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC92790
P 5350 3450
AR Path="/5E9E88B8/5EC92790" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC92790" Ref="R?"  Part="1" 
F 0 "R?" V 5450 3550 50  0000 L CNN
F 1 "100R 1%" V 5450 3450 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 3450 50  0001 C CNN
F 3 "~" H 5350 3450 50  0001 C CNN
	1    5350 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC96C29
P 5350 4750
AR Path="/5E9E88B8/5EC96C29" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC96C29" Ref="R?"  Part="1" 
F 0 "R?" V 5450 4850 50  0000 L CNN
F 1 "100R 1%" V 5450 4750 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 4750 50  0001 C CNN
F 3 "~" H 5350 4750 50  0001 C CNN
	1    5350 4750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC974F5
P 5350 5400
AR Path="/5E9E88B8/5EC974F5" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EC974F5" Ref="R?"  Part="1" 
F 0 "R?" V 5450 5500 50  0000 L CNN
F 1 "100R 1%" V 5450 5400 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 5400 50  0001 C CNN
F 3 "~" H 5350 5400 50  0001 C CNN
	1    5350 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 4100 5100 4100
Wire Wire Line
	5000 4100 5100 4100
Connection ~ 5100 4100
Wire Wire Line
	5100 4100 5100 4500
Wire Wire Line
	5100 4500 4700 4500
Wire Wire Line
	4400 4500 4300 4500
Wire Wire Line
	4300 4500 4300 4200
Wire Wire Line
	4300 4200 4400 4200
Wire Wire Line
	5000 5400 5100 5400
Wire Wire Line
	5100 5400 5100 5800
Wire Wire Line
	5100 5800 4700 5800
Connection ~ 5100 5400
Wire Wire Line
	5100 5400 5200 5400
Wire Wire Line
	4400 5500 4300 5500
Wire Wire Line
	4300 5500 4300 5800
Wire Wire Line
	4300 5800 4400 5800
$Comp
L Device:R R?
U 1 1 5ECC53E0
P 4550 4500
AR Path="/5E9E88B8/5ECC53E0" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ECC53E0" Ref="R?"  Part="1" 
F 0 "R?" V 4650 4600 50  0000 L CNN
F 1 "10K 1%" V 4650 4500 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4480 4500 50  0001 C CNN
F 3 "~" H 4550 4500 50  0001 C CNN
	1    4550 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5ED29873
P 4550 5800
AR Path="/5E9E88B8/5ED29873" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED29873" Ref="R?"  Part="1" 
F 0 "R?" V 4650 5900 50  0000 L CNN
F 1 "10K 1%" V 4650 5800 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4480 5800 50  0001 C CNN
F 3 "~" H 4550 5800 50  0001 C CNN
	1    4550 5800
	0    -1   -1   0   
$EndComp
Text Label 4200 4000 0    50   ~ 0
BIAS
Wire Wire Line
	4200 4000 4400 4000
Text Label 4200 5300 0    50   ~ 0
BIAS
Wire Wire Line
	4400 5300 4200 5300
Wire Wire Line
	4050 3450 4150 3450
Wire Wire Line
	4150 3450 4150 3850
Wire Wire Line
	4150 4500 4300 4500
Connection ~ 4150 3450
Wire Wire Line
	4150 3450 5200 3450
Connection ~ 4300 4500
$Comp
L Device:R R?
U 1 1 5ED6F427
P 4150 4250
AR Path="/5E9E88B8/5ED6F427" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED6F427" Ref="R?"  Part="1" 
F 0 "R?" H 4050 4250 50  0000 R CNN
F 1 "10K 1%" H 4050 4150 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4080 4250 50  0001 C CNN
F 3 "~" H 4150 4250 50  0001 C CNN
	1    4150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4400 4150 4500
$Comp
L Device:R R?
U 1 1 5ED787F2
P 7800 2000
AR Path="/5E9E88B8/5ED787F2" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED787F2" Ref="R?"  Part="1" 
F 0 "R?" H 7700 2050 50  0000 R CNN
F 1 "10K" H 7700 1950 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7730 2000 50  0001 C CNN
F 3 "~" H 7800 2000 50  0001 C CNN
	1    7800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4750 4150 4750
$Comp
L Device:R R?
U 1 1 5ED93BAC
P 4150 5550
AR Path="/5E9E88B8/5ED93BAC" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5ED93BAC" Ref="R?"  Part="1" 
F 0 "R?" H 4050 5600 50  0000 R CNN
F 1 "10K 1%" H 4050 5500 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4080 5550 50  0001 C CNN
F 3 "~" H 4150 5550 50  0001 C CNN
	1    4150 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5400 4150 5150
Connection ~ 4150 4750
Wire Wire Line
	4150 4750 4050 4750
Wire Wire Line
	4300 5800 4150 5800
Wire Wire Line
	4150 5800 4150 5700
Connection ~ 4300 5800
Text Label 3250 3350 0    50   ~ 0
BIAS
Text Label 3250 4650 0    50   ~ 0
BIAS
Wire Wire Line
	3250 3350 3450 3350
Wire Wire Line
	3250 4650 3450 4650
$Comp
L Device:R R?
U 1 1 5EDAD4C7
P 3600 5150
AR Path="/5E9E88B8/5EDAD4C7" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDAD4C7" Ref="R?"  Part="1" 
F 0 "R?" V 3700 5250 50  0000 L CNN
F 1 "10K 1%" V 3700 5150 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3530 5150 50  0001 C CNN
F 3 "~" H 3600 5150 50  0001 C CNN
	1    3600 5150
	0    -1   -1   0   
$EndComp
Connection ~ 4150 3850
Wire Wire Line
	4150 3850 4150 4100
Wire Wire Line
	3750 5150 4150 5150
Connection ~ 4150 5150
Wire Wire Line
	4150 5150 4150 4750
Wire Wire Line
	3450 4850 3350 4850
Wire Wire Line
	3350 4850 3350 5150
Wire Wire Line
	3350 5150 3450 5150
Wire Wire Line
	3450 3550 3350 3550
$Comp
L Device:R R?
U 1 1 5EDC928A
P 3100 3550
AR Path="/5E9E88B8/5EDC928A" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDC928A" Ref="R?"  Part="1" 
F 0 "R?" V 3200 3650 50  0000 L CNN
F 1 "10K 1%" V 3200 3550 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 3550 50  0001 C CNN
F 3 "~" H 3100 3550 50  0001 C CNN
	1    3100 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EDCB220
P 3100 4850
AR Path="/5E9E88B8/5EDCB220" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EDCB220" Ref="R?"  Part="1" 
F 0 "R?" V 3200 4950 50  0000 L CNN
F 1 "10K 1%" V 3200 4850 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 4850 50  0001 C CNN
F 3 "~" H 3100 4850 50  0001 C CNN
	1    3100 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 4850 3350 4850
Connection ~ 3350 4850
Wire Wire Line
	3250 3550 3350 3550
Connection ~ 3350 3550
Wire Wire Line
	3350 3550 3350 3850
$Comp
L Device:C C?
U 1 1 5EDEF245
P 2850 3800
AR Path="/5E9E88B8/5EDEF245" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDEF245" Ref="C?"  Part="1" 
F 0 "C?" H 2965 3846 50  0000 L CNN
F 1 "1.0uF" H 2965 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2888 3650 50  0001 C CNN
F 3 "~" H 2850 3800 50  0001 C CNN
	1    2850 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EDF1E37
P 2850 5100
AR Path="/5E9E88B8/5EDF1E37" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EDF1E37" Ref="C?"  Part="1" 
F 0 "C?" H 2965 5146 50  0000 L CNN
F 1 "1.0uF" H 2965 5055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2888 4950 50  0001 C CNN
F 3 "~" H 2850 5100 50  0001 C CNN
	1    2850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3550 2850 3550
Wire Wire Line
	2850 3550 2850 3650
Wire Wire Line
	2950 4850 2850 4850
Wire Wire Line
	2850 4850 2850 4950
Wire Wire Line
	5900 3000 6600 3000
Wire Wire Line
	5900 3000 5900 3250
Text HLabel 2100 4050 0    50   Input ~ 0
INP-I
Wire Wire Line
	2850 3950 2850 4050
Text HLabel 2100 5350 0    50   Input ~ 0
INP-Q
Wire Wire Line
	2850 5350 2850 5250
Wire Wire Line
	3650 3800 3650 3750
$Comp
L power:GNDA #PWR?
U 1 1 5EE7400B
P 3650 3800
F 0 "#PWR?" H 3650 3550 50  0001 C CNN
F 1 "GNDA" H 3655 3627 50  0000 C CNN
F 2 "" H 3650 3800 50  0001 C CNN
F 3 "" H 3650 3800 50  0001 C CNN
	1    3650 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EE86C87
P 3350 4000
AR Path="/5E9E88B8/5EE86C87" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE86C87" Ref="R?"  Part="1" 
F 0 "R?" H 3250 4050 50  0000 R CNN
F 1 "10K 1%" H 3250 3950 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 4000 50  0001 C CNN
F 3 "~" H 3350 4000 50  0001 C CNN
	1    3350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4150 3350 4250
Wire Wire Line
	3350 4250 3800 4250
Wire Wire Line
	3800 4250 3800 3850
Wire Wire Line
	3800 3850 4150 3850
Text GLabel 4900 2700 2    50   Input ~ 0
+5.0V-ATX
$Comp
L Device:L L?
U 1 1 5EE99AC2
P 4650 2700
AR Path="/5E9E88B8/5EE99AC2" Ref="L?"  Part="1" 
AR Path="/5E9F4ACB/5EE99AC2" Ref="L?"  Part="1" 
F 0 "L?" V 4750 2750 50  0000 L CNN
F 1 "2.2uH" V 4750 2700 50  0000 R CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4650 2700 50  0001 C CNN
F 3 "~" H 4650 2700 50  0001 C CNN
	1    4650 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 3150 4150 3100
Connection ~ 4150 3100
$Comp
L Device:C C?
U 1 1 5EE99ACA
P 3900 2900
AR Path="/5E9E88B8/5EE99ACA" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EE99ACA" Ref="C?"  Part="1" 
F 0 "C?" H 4015 2946 50  0000 L CNN
F 1 "0.1uF" H 4015 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3938 2750 50  0001 C CNN
F 3 "~" H 3900 2900 50  0001 C CNN
	1    3900 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EE99AD0
P 4400 2900
AR Path="/5E9E88B8/5EE99AD0" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EE99AD0" Ref="C?"  Part="1" 
F 0 "C?" H 4515 2946 50  0000 L CNN
F 1 "1.0uF" H 4515 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4438 2750 50  0001 C CNN
F 3 "~" H 4400 2900 50  0001 C CNN
	1    4400 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EE99AD6
P 4150 3150
AR Path="/5E9E88B8/5EE99AD6" Ref="#PWR?"  Part="1" 
AR Path="/5E9F4ACB/5EE99AD6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 2900 50  0001 C CNN
F 1 "GND" H 4155 2977 50  0000 C CNN
F 2 "" H 4150 3150 50  0001 C CNN
F 3 "" H 4150 3150 50  0001 C CNN
	1    4150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3100 4400 3100
Wire Wire Line
	3900 3050 3900 3100
Wire Wire Line
	3900 3100 4150 3100
Wire Wire Line
	3900 2750 3900 2700
Wire Wire Line
	3900 2700 4400 2700
Wire Wire Line
	4400 2750 4400 2700
Wire Wire Line
	4400 3100 4400 3050
Wire Wire Line
	4500 2700 4400 2700
Connection ~ 4400 2700
Wire Wire Line
	4800 2700 4900 2700
Wire Wire Line
	3900 2700 3650 2700
Connection ~ 3900 2700
Wire Wire Line
	3650 3150 3650 2700
Text GLabel 4650 1250 2    50   Input ~ 0
+5.0V-ATX
$Comp
L Device:L L?
U 1 1 5EEFE3F4
P 4400 1250
AR Path="/5E9E88B8/5EEFE3F4" Ref="L?"  Part="1" 
AR Path="/5E9F4ACB/5EEFE3F4" Ref="L?"  Part="1" 
F 0 "L?" V 4500 1300 50  0000 L CNN
F 1 "2.2uH" V 4500 1250 50  0000 R CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4400 1250 50  0001 C CNN
F 3 "~" H 4400 1250 50  0001 C CNN
	1    4400 1250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EEFE3FC
P 3650 1450
AR Path="/5E9E88B8/5EEFE3FC" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEFE3FC" Ref="C?"  Part="1" 
F 0 "C?" H 3765 1496 50  0000 L CNN
F 1 "0.1uF" H 3765 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3688 1300 50  0001 C CNN
F 3 "~" H 3650 1450 50  0001 C CNN
	1    3650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EEFE402
P 4150 1450
AR Path="/5E9E88B8/5EEFE402" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EEFE402" Ref="C?"  Part="1" 
F 0 "C?" H 4265 1496 50  0000 L CNN
F 1 "1.0uF" H 4265 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4188 1300 50  0001 C CNN
F 3 "~" H 4150 1450 50  0001 C CNN
	1    4150 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1300 3650 1250
Wire Wire Line
	3650 1250 4150 1250
Wire Wire Line
	4150 1300 4150 1250
Wire Wire Line
	4250 1250 4150 1250
Connection ~ 4150 1250
Wire Wire Line
	4550 1250 4650 1250
Connection ~ 3650 1250
$Comp
L Device:R R?
U 1 1 5EF0E215
P 3100 1500
AR Path="/5E9E88B8/5EF0E215" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EF0E215" Ref="R?"  Part="1" 
F 0 "R?" H 3200 1550 50  0000 L CNN
F 1 "1K 1%" H 3200 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 1500 50  0001 C CNN
F 3 "~" H 3100 1500 50  0001 C CNN
	1    3100 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF1253C
P 2150 1900
AR Path="/5E9E88B8/5EF1253C" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF1253C" Ref="C?"  Part="1" 
F 0 "C?" H 2265 1946 50  0000 L CNN
F 1 "1.0uF" H 2265 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2188 1750 50  0001 C CNN
F 3 "~" H 2150 1900 50  0001 C CNN
	1    2150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EF14F2D
P 3100 1900
AR Path="/5E9E88B8/5EF14F2D" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EF14F2D" Ref="R?"  Part="1" 
F 0 "R?" H 3200 1950 50  0000 L CNN
F 1 "1K 1%" H 3200 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 1900 50  0001 C CNN
F 3 "~" H 3100 1900 50  0001 C CNN
	1    3100 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF1528E
P 2650 1900
AR Path="/5E9E88B8/5EF1528E" Ref="C?"  Part="1" 
AR Path="/5E9F4ACB/5EF1528E" Ref="C?"  Part="1" 
F 0 "C?" H 2765 1946 50  0000 L CNN
F 1 "0.1uF" H 2765 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2688 1750 50  0001 C CNN
F 3 "~" H 2650 1900 50  0001 C CNN
	1    2650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1250 3100 1350
Wire Wire Line
	3100 1250 3650 1250
Wire Wire Line
	3100 1650 3100 1700
Wire Wire Line
	3100 1700 2650 1700
Wire Wire Line
	2150 1700 2150 1750
Connection ~ 3100 1700
Wire Wire Line
	3100 1700 3100 1750
Wire Wire Line
	2650 1750 2650 1700
Connection ~ 2650 1700
Wire Wire Line
	2650 1700 2150 1700
Wire Wire Line
	2150 2050 2150 2100
Wire Wire Line
	2150 2100 2650 2100
Wire Wire Line
	4150 2100 4150 1600
Wire Wire Line
	3100 2050 3100 2100
Connection ~ 3100 2100
Wire Wire Line
	3100 2100 3650 2100
Wire Wire Line
	2650 2050 2650 2100
Connection ~ 2650 2100
Wire Wire Line
	2650 2100 3100 2100
$Comp
L power:GND #PWR?
U 1 1 5EEFE408
P 4150 2100
AR Path="/5E9E88B8/5EEFE408" Ref="#PWR?"  Part="1" 
AR Path="/5E9F4ACB/5EEFE408" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 1850 50  0001 C CNN
F 1 "GND" H 4155 1927 50  0000 C CNN
F 2 "" H 4150 2100 50  0001 C CNN
F 3 "" H 4150 2100 50  0001 C CNN
	1    4150 2100
	1    0    0    -1  
$EndComp
Connection ~ 4150 2100
Wire Wire Line
	3650 1600 3650 2100
Connection ~ 3650 2100
Wire Wire Line
	3650 2100 4150 2100
Text Label 2150 1700 0    50   ~ 0
BIAS
NoConn ~ 8550 2450
$Comp
L Device:R R?
U 1 1 5EFCAB39
P 8100 2650
AR Path="/5E9E88B8/5EFCAB39" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EFCAB39" Ref="R?"  Part="1" 
F 0 "R?" V 8200 2750 50  0000 L CNN
F 1 "100R 1%" V 8200 2650 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8030 2650 50  0001 C CNN
F 3 "~" H 8100 2650 50  0001 C CNN
	1    8100 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EFCAF30
P 8100 2250
AR Path="/5E9E88B8/5EFCAF30" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EFCAF30" Ref="R?"  Part="1" 
F 0 "R?" V 8200 2350 50  0000 L CNN
F 1 "100R 1%" V 8200 2250 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8030 2250 50  0001 C CNN
F 3 "~" H 8100 2250 50  0001 C CNN
	1    8100 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 2550 7850 2550
Wire Wire Line
	7850 2250 7950 2250
Wire Wire Line
	8550 2250 8250 2250
Wire Wire Line
	8250 2650 8550 2650
$Comp
L power:GNDA #PWR?
U 1 1 5EFFC949
P 9050 2650
F 0 "#PWR?" H 9050 2400 50  0001 C CNN
F 1 "GNDA" H 9055 2477 50  0000 C CNN
F 2 "" H 9050 2650 50  0001 C CNN
F 3 "" H 9050 2650 50  0001 C CNN
	1    9050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2650 9050 2650
Wire Wire Line
	7850 2250 7850 2550
Wire Wire Line
	7700 2650 7950 2650
Text HLabel 9500 2250 2    50   Output ~ 0
RF
Wire Wire Line
	7700 2950 9500 2950
Wire Wire Line
	9500 3050 7700 3050
Wire Wire Line
	9500 3150 7800 3150
Connection ~ 7800 3150
Wire Wire Line
	7800 3150 7800 3250
Wire Wire Line
	8950 2250 9500 2250
Wire Wire Line
	2100 4050 2850 4050
Wire Wire Line
	2100 5350 2850 5350
$Comp
L sdr-trx:CX2047LANL TR?
U 1 1 5EA1D2F1
P 8750 2450
F 0 "TR?" H 8750 2750 50  0000 C CNN
F 1 "CX2047LANL" H 8700 2150 50  0000 C CNN
F 2 "" H 8750 2450 50  0001 C CNN
F 3 "https://productfinder.pulseeng.com/doc_type/WEB301/doc_num/CX2047LANL-01/doc_part/CX2047LANL.pdf" H 8750 2450 50  0001 C CNN
	1    8750 2450
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 1 1 5EA4FE21
P 4700 4100
F 0 "U?" H 4750 4250 50  0000 L CNN
F 1 "AD8604" H 4750 3950 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4650 4200 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 4750 4300 50  0001 C CNN
	1    4700 4100
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 4 1 5EA51027
P 4700 5400
F 0 "U?" H 4700 5550 50  0000 L CNN
F 1 "AD8604" H 4700 5676 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4650 5500 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 4750 5600 50  0001 C CNN
	4    4700 5400
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 1 1 5EA5E4BE
P 6250 4000
F 0 "U?" H 6300 4150 50  0000 L CNN
F 1 "AD8604" H 6300 3850 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 4100 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 6300 4200 50  0001 C CNN
	1    6250 4000
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 2 1 5EA3EF93
P 3750 3450
F 0 "U?" H 3800 3600 50  0000 L CNN
F 1 "AD8604" H 3750 3726 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3700 3550 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 3800 3650 50  0001 C CNN
	2    3750 3450
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 2 1 5EA5FD4E
P 6250 5300
F 0 "U?" H 6300 5450 50  0000 L CNN
F 1 "AD8604" H 6250 5576 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 5400 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 6300 5500 50  0001 C CNN
	2    6250 5300
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 5 1 5EA455BA
P 3750 3450
F 0 "U?" H 3708 3496 50  0001 L CNN
F 1 "AD8604" H 3708 3405 50  0001 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3700 3550 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 3800 3650 50  0001 C CNN
	5    3750 3450
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 5 1 5EA62EC4
P 6250 5300
F 0 "U?" H 6208 5346 50  0001 L CNN
F 1 "AD8604" H 6208 5255 50  0001 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 5400 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 6300 5500 50  0001 C CNN
	5    6250 5300
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 3 1 5EA4E81F
P 3750 4750
F 0 "U?" H 3750 4900 50  0000 L CNN
F 1 "AD8604" H 3750 5026 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3700 4850 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 3800 4950 50  0001 C CNN
	3    3750 4750
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 3 1 5EA665D7
P 6250 4650
F 0 "U?" H 6250 4800 50  0000 L CNN
F 1 "AD8604" H 6250 4926 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 4750 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 6300 4850 50  0001 C CNN
	3    6250 4650
	1    0    0    -1  
$EndComp
$Comp
L sdr-trx:AD8604 U?
U 4 1 5EA6790A
P 6250 3350
F 0 "U?" H 6250 3500 50  0000 L CNN
F 1 "AD8604" H 6250 3626 50  0001 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6200 3450 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8601_8602_8604.pdf" H 6300 3550 50  0001 C CNN
	4    6250 3350
	1    0    0    -1  
$EndComp
$EndSCHEMATC