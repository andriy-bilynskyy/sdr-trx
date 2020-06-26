# HW Simulation

All spice simulations are done using [LTspice](https://www.analog.com/en/design-center/design-tools-and-calculators/ltspice-simulator.html) SW. Available Windows version but there is no serious issues to run on Linux under [WINE](https://appdb.winehq.org/objectManager.php?sClass=application&iId=2000). Used version Mar 25 2020.

## Components

- **modulator.asc** - SDR RF modulator.
- **tayloe-detector.asc** - SDR RF demodulator.
- **BPF.asc** - set of RX/TX band pass filters.
- **lp-amp.asc** - RF class AB power RF amplifier.
- **LPF.asc** - set of TX amplifier LPF.
- **pre-amp.asc** - TX preamplifier.
- **LNA.asc** - low noise RX amplifier.
- **SWR-metr.asc** - SWR meter.
- **audio-amp.asc** - headphone and loudspeaker audio amplifier.
- **supply-protection.asc** - power supply protection circuit.