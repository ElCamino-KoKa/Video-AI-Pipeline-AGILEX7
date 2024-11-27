# 0. Prerequesites
- SD-Card programmed with image AND compiled application data ()
- PC or Camera with HDMI output
- Monitor to display results
- Ethernet connection between Host-PC and Board
- Clock Controller GUI

# 1. Clock Controller GUI
Prerequisites: https://www.intel.com/content/www/us/en/docs/programmable/683752/current/setting-up-the-bts-gui-running-environment.html
- OpenJFX and OpenJDK installation
- Quartus Prime Installation
- BTS GUI is included in installation packet https://www.intel.de/content/www/de/de/products/details/fpga/development-kits/agilex/si-agi027.html 


# 2. Starting the Application
## 2.1 Power up and connect the Board
- Connections: USB
## 2.2 Program the clock generators with Clock controller GUI

## 2.3 Program the FPGA with .sof image
```
quartus_pgm -m jtag -o "p;u-boot-spl-dtb.hex.sof@1"
```
## 2.4 connect to Linux application with serial terminal (minicom) 
    - User Root, no password
    - Reset userspace driver : _uio-devices restart_
    - determine hostid
## 2.5 connect to the board from host pc via SSH and start application
```
ssh root@agilex7dksiagi027fa.local
cd /home/root/app
./run_inference_stream.sh
```
- two connections needed
- sometimes, the application hangs immediately after startup. Restarting from step 2.1 will fix the issue 

**Note**: If any changes are made to the Design, a Linux Host PC or the Intel AI Suite Docker container is needed. Changes to applicationsoftware require a recompile and upload to the sdcard. Changes in components or quartus project always require a full recompile of the project and gerating a new .sof file. Changes in memory-mapping require an additional rebuild of the stream controller application and Linux Yocto. 