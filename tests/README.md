# Tests

This folder contains projects to check design components functionality. It's not
FW just test project to check HW functionality and test HW/SW approaches.

## sdr-test application

That's very difficult to develop SDR functionality using real HW because in that case lot of HW setups is needed (scopes functional generators and so on). Also debugging functionality is limited due to realtime execution. Additionally it's difficult to visualize DSP calculations data due to big arrays (debug prints are useless and plots consume lot of MCU resources additionally TFT has low resolution to draw plots). Also I should mention about possible BSP bugs which make SDR DSP development very complicated. 

To avoid all above described issues **sdr-test** application is created. The folder **sdr-test/src/dsp_proc/** is exact mirror of firmware folder **../firmware/app/src/dsp_proc/** all another parts of **sdr-test** application is a stubs for real firmware. These stubs are implemented in a way of simulation input SDR signals using simple test patterns and visualizing output SDR signals using plots and debug prints. Since SDR DSP process has nothing relative to HW - it's mathematics it's possible to develop this functionality using PC.

This approach provides the next improvements:

- No realtime - IO data is simulated so you can stop your SW wherever you want.
- No expensive HW and complicated DUT setups.
- Clear data visualization at any stage of DSP processing using scalable plots. No problem with data synchronization.
- BSP bugs are isolated in that case.
- It's faster: no FW flash operations and HW setups.

So all DSP SDR functionality and approaches is developed using this application. Finally the content of folder **sdr-test/src/dsp_proc/** is copied into firmware folder **../firmware/app/src/dsp_proc/** for final testing on HW. For sure final tests on HW are necessarily because not all theoretical approaches works fine in a real word due to complicated processes.