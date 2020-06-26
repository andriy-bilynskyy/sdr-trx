# SDR transceiver schematic

## Folder structure

- **sdr-trx/** - KiCad PCB project, [KiCad](https://kicad-pcb.org/).  The folder contains schematics and PCB routing. Used KiCad version 5.1.5. Standard KiCad libraries are involved, so please check your version if you have troubles with standard components.
- **mcu-pinout.ioc** - STM32 MCU pinout. [STM32CubeMX](https://www.st.com/en/development-tools/stm32cubemx.html). Used version 5.6.1.
- **pa-transformer.odg** - RF power amplifier push-pull transformer winding. LibreOffice Draw document. Used version 6.4.3.2.
- **swr-transformer.odg** - SWR meter transformer winding. LibreOffice Draw document. Used version 6.4.3.2.
- **doc/** - generated schematic/PCB documentation extracted from KiCad. Folder containing manufacturing documents. [PCB Manufacturing](https://www.elecrow.com/pcb-manufacturing.html)

## Main features

- Single board design, size 239 x 145 mm.
- Only SMD components are used. Avoid using components with pins under package (BGA, QFN, PLCC) due difficulties during hand soldering. Same situation with components with huge pins count.
- Avoid manual inductors/transformer winding. Only two components need manual winding (PA transformer and SWR meter directional coupler).
- Four sides PCB for better EMI. Shield for low power RF part to avoid influence from MCU and UI digital part.
- No chassis mounted components to avoid using wired connections which are not reliable at lest during development stage.
- Switching DC-DC are not used to decrease their EMI on RF part.
- Reduced mechanical buttons due to using capacitive touchscreen.
- On-board Li-batteries. Batteries protection and cell balancing are used.
- Flexible power management. MCU controls powering of RF circuit.
- Covers all HF bands 1.8 - 30 MHz.
- 5W RF power amplifies. Compromise between PCB size and transmitted power. MCU controls the temperature of output RF LDMOS transistors. Output power is also MCU controlled.
- On-board SWR meter. Specialized detector IC is used to increase accuracy.
- Input power supply and ESD protection on inputs.
- Low harmonic distortion due to direct conversion and 2 stages filtration (5-th order Chebyshev BPF after modulator and 7-th order Elliptic LPF after power amplifier).
- Low noise RF-receiver.
- On-board audio amplifier to use cheap headsets for PC.
- USB OTG and SD card interface.
