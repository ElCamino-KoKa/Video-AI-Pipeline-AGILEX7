# Contents for Repository Video-AI-Pipeline-AGILEX7

# 1. C-Code

## 1.1 - Image_streaming_App

Changes to original Version: 

	* Removed Code dedicated to simulating the streaming aplication
	* Added /sys/mem acces to Verilog streaming component
	* Added prototypes for sending images in full speed or fixed frequency
	
*Note: Frequency highly depends on HDMI Design and RAM Bandwidth*

## 1.2 - Streaming_inference_APP

Removed Code dedicated to simulating the streaming aplication, added some debugging messages


# 2. Verilog Code -Bridge Component

Functionality:
- Bridge between HDMI input and AI Design
- Receiving messages from embedded Linux 
- See the Status register definition for possible messages

# 3. Quartus Project

# 4. Programming Files

- SD-Card image
- sof File for FPGA
- original streaming inference app (ed4 root)


# TODO
- merge application files with programming files &rarr; no separate upload is needed
- automate clock controller programming upon startup to simplify sequence
- improve application software: support Yolo results
- Improve hardware: achieve flexibility in bridge component for different models
- Extend functionality: draw overlays in hdmi output

# Others

Important information:

	* The tx_control software needs to be rebuilt after hardware changes
	* Hardware issues might result from IP Versions!
	* After uploading app-data to Yocto, a restart of the board is mandatory
	* Starting sequence is relevant -> see thesis 

Legal Disclaimer: None of the published code is approved for commercial use or distribution unless written approval is provided by ElCamino GmbH and Intel Altera


