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


# Verilog Code

## 3.1 - Component

Functionality:

	* Bridge between HDMI input and AI Design
	* Receiving messages from embedded Linux 
	* See the Status register definition for possible messages

## 3.2 - Simulation Component

Used for Simulating the Component and Dataflow
*Please See the Thesis .pdf to understand the full simulation flow.*

*Note: Some of the code might not be Bug-free!
feel free to contact me if you have any issues or file a bug-report*

# Others

Important information:

	* The tx_control software needs to be rebuilt after hardware changes
	* Hardware issues might result from **IP Versions!**
	* After uploading app-data to Yocto, a restart of the board is mandatory
	* Starting sequence is relevant -> see thesis 
	


