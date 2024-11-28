# 0. Prerequesites
- SD-Card programmed with image AND compiled application data 
- PC or Camera with HDMI output
- Monitor to display input and determine required resolution
- Host PC to display solutions (Terminal)
- Ethernet connection between Host-PC and Board
- Bitec HDMI daughtercard
- OOBE14 HPS daughtercard


# I. Clock Controller GUI
Prerequisites: https://www.intel.com/content/www/us/en/docs/programmable/683752/current/setting-up-the-bts-gui-running-environment.html
- OpenJFX and OpenJDK installation
- Quartus Prime Installation
- BTS GUI is included in installation packet https://www.intel.de/content/www/de/de/products/details/fpga/development-kits/agilex/si-agi027.html 


# II. Program SD
## Linux:
wic_image=/path/to/image/coredla-image-agilex7_dk_si_agi027fa.wic
sudo dd if=$wic_image of=/path/to/sd/card bs=1M
## Windows:
Use dd equivalent like Rufus

# 2. Starting the Application
**Every step has to be executed in this exact order**
## 2.1 Power up and connect the Board
Connections: USB Type B (Host PC &rarr; Board), Micro USB (OOBE14 Daughtercard), Ethernet (Host PC &rarr; Board), Source &rarr; HDMI In, HDMI out &rarr; Monitor
## 2.2 Program the clock generators with Clock controller GUI
Tab SI5391B &rarr; set all clocks to 100 MHz &rarr; Confirm with button **set** &rarr; Close application
## 2.3 Program the FPGA with .sof image

```
quartus_pgm -m jtag -o "p;u-boot-spl-dtb.hex.sof@1"
```
## 2.4 connect to Linux application with serial terminal (minicom) 
- User root, no password
- Reset userspace driver : _uio-devices restart_
- determine hostid: agilex7dksiagi027fa

## III. Copy runtime from folder to application (only at first start)

```
TARGET="root@agilex7dksiagi027fa.local:~/app"
runtimedir=/path/to/backup_streaming_application
scp $runtimedir/image_streaming_app/image_streaming_app $TARGET/.
scp $runtimedir/streaming_inference_app/streaming_inference_app $TARGET/.
```

## 2.5 connect to the board from host pc via SSH and start application
_first terminal_
```
ssh root@agilex7dksiagi027fa.local
cd /home/root/app
./run_inference_stream.sh
```
_second terminal_
```
ssh root@agilex7dksiagi027fa.local
cd /home/root/app
./run_image_stream.sh
```

**Note:** 
- sometimes, the application hangs immediately after startup. Restarting from step 2.1 will fix the issue 
- Settings defined in run_image_stream.sh and run_inference_stream.sh can be adjusted (for example different model or speed)
# 3. Additional information
**Note:** To change any part of the Design, a Linux Host PC or the Intel AI Suite Docker container is needed. Changes to application software require a recompile and upload to the sdcard. Changes in components or quartus project always require a full recompile of the project and gerating a new .sof file. Changes in memory-mapping require an additional rebuild of the stream controller application and Linux Yocto. The SD-card image then needs to be regenerated. 