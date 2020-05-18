EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
Title "SWR meter"
Date "2020-04-20"
Rev "A"
Comp "EM-DEV"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L sdr-trx:DirectionalCoupler-Bin T?
U 1 1 5EC537D5
P 5100 3350
F 0 "T?" H 5100 3700 50  0000 C CNN
F 1 "BN43-202" H 5100 3000 50  0000 C CNN
F 2 "sdr-trx:BN43-202-8P" H 5100 3350 50  0001 C CNN
F 3 "~" V 5100 3550 50  0001 C CNN
	1    5100 3350
	1    0    0    -1  
$EndComp
Text Notes 4550 2600 0    50   ~ 0
BN43-202\neach transformer uses 1/2 core\npri. 1 turn coax. cable\nsec. 10 turns enameled wire 0.4mm
Text HLabel 3300 3050 0    50   Input ~ 0
IN
Text HLabel 6750 3050 2    50   Output ~ 0
OUT
$Comp
L power:GND #PWR?
U 1 1 5EDFC321
P 4550 3450
AR Path="/5E9F4ACB/5EDFC321" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EDFC321" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EDFC321" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EDFC321" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EDFC321" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4550 3200 50  0001 C CNN
F 1 "GND" H 4555 3277 50  0000 C CNN
F 2 "" H 4550 3450 50  0001 C CNN
F 3 "" H 4550 3450 50  0001 C CNN
	1    4550 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 3450 4600 3450
$Comp
L power:GND #PWR?
U 1 1 5EDFE5EE
P 5650 3250
AR Path="/5E9F4ACB/5EDFE5EE" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EDFE5EE" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EDFE5EE" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EDFE5EE" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EDFE5EE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5650 3000 50  0001 C CNN
F 1 "GND" H 5655 3077 50  0000 C CNN
F 2 "" H 5650 3250 50  0001 C CNN
F 3 "" H 5650 3250 50  0001 C CNN
	1    5650 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 3050 5900 3050
Wire Wire Line
	5600 3250 5650 3250
Wire Wire Line
	5900 3450 5900 3050
Wire Wire Line
	5600 3450 5900 3450
Connection ~ 5900 3050
Wire Wire Line
	4600 3250 4300 3250
Wire Wire Line
	4300 3250 4300 3900
Wire Wire Line
	4300 3900 5700 3900
Wire Wire Line
	5700 3900 5700 3650
Wire Wire Line
	5700 3650 5600 3650
$Comp
L Device:R R?
U 1 1 5EE0AC6B
P 5900 3650
AR Path="/5E9E88B8/5EE0AC6B" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE0AC6B" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE0AC6B" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE0AC6B" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE0AC6B" Ref="R?"  Part="1" 
AR Path="/5EC50630/5EE0AC6B" Ref="R?"  Part="1" 
F 0 "R?" V 5800 3650 50  0000 C CNN
F 1 "51R" V 6000 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5830 3650 50  0001 C CNN
F 3 "~" H 5900 3650 50  0001 C CNN
	1    5900 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EE0AD9C
P 4050 3650
AR Path="/5E9E88B8/5EE0AD9C" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE0AD9C" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE0AD9C" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE0AD9C" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE0AD9C" Ref="R?"  Part="1" 
AR Path="/5EC50630/5EE0AD9C" Ref="R?"  Part="1" 
F 0 "R?" V 3950 3650 50  0000 C CNN
F 1 "51R" V 4150 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3980 3650 50  0001 C CNN
F 3 "~" H 4050 3650 50  0001 C CNN
	1    4050 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 3650 5750 3650
Connection ~ 5700 3650
$Comp
L power:GND #PWR?
U 1 1 5EE0FACD
P 3850 3650
AR Path="/5E9F4ACB/5EE0FACD" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE0FACD" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EE0FACD" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EE0FACD" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EE0FACD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3850 3400 50  0001 C CNN
F 1 "GND" H 3855 3477 50  0000 C CNN
F 2 "" H 3850 3650 50  0001 C CNN
F 3 "" H 3850 3650 50  0001 C CNN
	1    3850 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 3650 4250 3650
Wire Wire Line
	3850 3650 3900 3650
$Comp
L power:GND #PWR?
U 1 1 5EE11652
P 6100 3650
AR Path="/5E9F4ACB/5EE11652" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE11652" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EE11652" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EE11652" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EE11652" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6100 3400 50  0001 C CNN
F 1 "GND" H 6105 3477 50  0000 C CNN
F 2 "" H 6100 3650 50  0001 C CNN
F 3 "" H 6100 3650 50  0001 C CNN
	1    6100 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 3650 6100 3650
$Comp
L Diode:BAT54S D?
U 1 1 5EE12E59
P 4250 4250
F 0 "D?" V 4000 4200 50  0000 R CNN
F 1 "BAT54S" V 4100 4200 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4325 4375 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 4130 4250 50  0001 C CNN
	1    4250 4250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EE261D1
P 4250 4750
AR Path="/5E9E88B8/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE261D1" Ref="R?"  Part="1" 
AR Path="/5EC50630/5EE261D1" Ref="R?"  Part="1" 
F 0 "R?" H 4350 4800 50  0000 L CNN
F 1 "10K" H 4350 4700 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 4750 50  0001 C CNN
F 3 "~" H 4250 4750 50  0001 C CNN
	1    4250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4600 4250 4550
$Comp
L Device:C C?
U 1 1 5EE2BAA0
P 4550 4450
AR Path="/5E9E88B8/5EE2BAA0" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE2BAA0" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE2BAA0" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE2BAA0" Ref="C?"  Part="1" 
AR Path="/5EC50630/5EE2BAA0" Ref="C?"  Part="1" 
F 0 "C?" H 4650 4500 50  0000 L CNN
F 1 "0.1uF" H 4650 4400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4588 4300 50  0001 C CNN
F 3 "~" H 4550 4450 50  0001 C CNN
	1    4550 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4250 4550 4250
Wire Wire Line
	4550 4250 4550 4300
Wire Wire Line
	4550 4600 4550 4950
Wire Wire Line
	4550 4950 4250 4950
Wire Wire Line
	4250 4950 4250 4900
Wire Wire Line
	4250 3950 4250 3650
Connection ~ 4250 3650
Wire Wire Line
	4250 3650 4600 3650
$Comp
L power:GND #PWR?
U 1 1 5EE30D0A
P 4250 5000
AR Path="/5E9F4ACB/5EE30D0A" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE30D0A" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EE30D0A" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EE30D0A" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EE30D0A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4250 4750 50  0001 C CNN
F 1 "GND" H 4255 4827 50  0000 C CNN
F 2 "" H 4250 5000 50  0001 C CNN
F 3 "" H 4250 5000 50  0001 C CNN
	1    4250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5000 4250 4950
Connection ~ 4250 4950
$Comp
L Diode:BAT54S D?
U 1 1 5EE34598
P 5700 4250
F 0 "D?" V 5450 4200 50  0000 R CNN
F 1 "BAT54S" V 5550 4200 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5775 4375 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 5580 4250 50  0001 C CNN
	1    5700 4250
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EE3459E
P 5700 4750
AR Path="/5E9E88B8/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5E9F4ACB/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5EA188E4/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5EA436AA/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5EA333CB/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5EC388F5/5EE3459E" Ref="R?"  Part="1" 
AR Path="/5EC50630/5EE3459E" Ref="R?"  Part="1" 
F 0 "R?" H 5800 4800 50  0000 L CNN
F 1 "10K" H 5800 4700 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5630 4750 50  0001 C CNN
F 3 "~" H 5700 4750 50  0001 C CNN
	1    5700 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4600 5700 4550
$Comp
L Device:C C?
U 1 1 5EE345A5
P 6000 4450
AR Path="/5E9E88B8/5EE345A5" Ref="C?"  Part="1" 
AR Path="/5EA333CB/5EE345A5" Ref="C?"  Part="1" 
AR Path="/5EA436AA/5EE345A5" Ref="C?"  Part="1" 
AR Path="/5EC388F5/5EE345A5" Ref="C?"  Part="1" 
AR Path="/5EC50630/5EE345A5" Ref="C?"  Part="1" 
F 0 "C?" H 6100 4500 50  0000 L CNN
F 1 "0.1uF" H 6100 4400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6038 4300 50  0001 C CNN
F 3 "~" H 6000 4450 50  0001 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4250 6000 4250
Wire Wire Line
	6000 4250 6000 4300
Wire Wire Line
	6000 4600 6000 4950
Wire Wire Line
	6000 4950 5700 4950
Wire Wire Line
	5700 4950 5700 4900
$Comp
L power:GND #PWR?
U 1 1 5EE345B0
P 5700 5000
AR Path="/5E9F4ACB/5EE345B0" Ref="#PWR?"  Part="1" 
AR Path="/5EA333CB/5EE345B0" Ref="#PWR?"  Part="1" 
AR Path="/5EAAFBD4/5EE345B0" Ref="#PWR?"  Part="1" 
AR Path="/5FE5C441/5EE345B0" Ref="#PWR?"  Part="1" 
AR Path="/5EC50630/5EE345B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 4750 50  0001 C CNN
F 1 "GND" H 5705 4827 50  0000 C CNN
F 2 "" H 5700 5000 50  0001 C CNN
F 3 "" H 5700 5000 50  0001 C CNN
	1    5700 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5000 5700 4950
Connection ~ 5700 4950
Wire Wire Line
	5700 3950 5700 3900
Connection ~ 5700 3900
Wire Wire Line
	6000 4250 6750 4250
Connection ~ 6000 4250
Wire Wire Line
	4550 4250 5100 4250
Wire Wire Line
	5100 4250 5100 5300
Connection ~ 4550 4250
Wire Wire Line
	5100 5300 6750 5300
Wire Wire Line
	5900 3050 6750 3050
Wire Wire Line
	3300 3050 4600 3050
Text HLabel 6750 4250 2    50   Output ~ 0
FWD
Text HLabel 6750 5300 2    50   Output ~ 0
REV
$EndSCHEMATC
