// Copyright 2023 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials,
// and your use of them is governed by the express license under which they
// were provided to you ("License"). Unless the License provides otherwise,
// you may not use, modify, copy, publish, distribute, disclose or transmit
// this software or the related documents without Intel's prior written
// permission.
//
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

#include "image_streaming_app.h"
#include <signal.h>
#include <algorithm>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>
#include <thread>
#include <fcntl.h>
#include <sys/mman.h>
#include "raw_image.h"
#include <unistd.h>

#define LW_BRIDGE_BASE 0xF9000000       // base address of the lightweight bridge according to documentation
#define STREAM_COMPONENT_OFFSET 0x20000 // platform designer component offset
#define SYSID_OFFSET 0x28000
#define BRIDGE_SPAN 0x28008
#define WIDTH 0x0008

int main(int numParams, char *paramValues[])
{
  std::cout << "start main\n";
  ImageStreamingApp imageStreamingApp(numParams, paramValues);
  std::cout << "app run:\n";
  imageStreamingApp.Run();
  return 0;
}

volatile bool ImageStreamingApp::_shutdownEvent;
bool DEBUG=false;
ImageStreamingApp::ImageStreamingApp(int numParams, char *paramValues[]) : _commandLine(numParams, paramValues)
{

  /*std::string nSendStr;
  if (_commandLine.GetOption("send", nSendStr))
    _numToSend = std::strtoul(nSendStr.c_str(), 0, 0);*/

  std::string rateStr;
  if (_commandLine.GetOption("rate", rateStr))
    _sendRate = std::strtoul(rateStr.c_str(), 0, 0);



  _dumpTransformedImages = _commandLine.HaveOption("dump");
  _runLayoutTransform = _commandLine.HaveOption("layout_transform");

  _ltConfiguration._width = GetUintOption("width", 224);
  _ltConfiguration._height = GetUintOption("height", 224);
  _ltConfiguration._cVector = GetUintOption("c_vector", 32);
  _ltConfiguration._blueVariance = GetFloatOption("blue_variance", 1.0f);
  _ltConfiguration._greenVariance = GetFloatOption("green_variance", 1.0f);
  _ltConfiguration._redVariance = GetFloatOption("red_variance", 1.0f);
  _ltConfiguration._blueShift = GetFloatOption("blue_shift", -103.94f);
  _ltConfiguration._greenShift = GetFloatOption("green_shift", -116.78f);
  _ltConfiguration._redShift = GetFloatOption("red_shift", -123.68f);

  signal(SIGINT, SigIntHandler);
}

void ImageStreamingApp::Run()
{
  if (_commandLine.HaveOption("-help"))
  {
    std::cout << "Usage:\n";
    std::cout << " image_streaming_app [Options]\n";
    std::cout << "\nOptions:\n";
    std::cout << "-images_folder=folder     Location of bitmap files. Defaults to working folder.\n";
    std::cout << "-image=path               Location of a single bitmap file for single inference.\n";
    std::cout << "-send=n                   Number of images to stream. Default is 1 if -image is set, otherwise infinite.\n";
    std::cout << "-rate=n                   Rate to stream images, in Hz. n is an integer. Default is 30.\n";
    std::cout << "-width=n                  Image width in pixels, default = 224\n";
    std::cout << "-height=n                 Image height in pixels, default = 224\n";
    std::cout << "-c_vector=n               C vector size, default = 32\n";
    std::cout << "-blue_variance=n          Blue variance, default = 1.0\n";
    std::cout << "-green_variance=n         Green variance, default = 1.0\n";
    std::cout << "-red_variance=n           Red variance, default = 1.0\n";
    std::cout << "-blue_shift=n             Blue shift, default = -103.94\n";
    std::cout << "-green_shift=n            Green shift, default -116.78\n";
    std::cout << "-red_shift=n              Red shift, default = -123.68\n";
    return;
  }
  std::cout << "programLayoutTransform start\n";
  if (not ProgramLayoutTransform())
  {
    return;
  }
  std::cout << "waitForInferenceApp start\n";
  if (not WaitForInferenceApp())
    return;
  std::cout << "waitForInferenceApp end\n";
  if (not OpenLwBridge())
  {
    return;
    std::cout << "OpenLwBridge failed\n";
  }
 /*if(_sendRate == 0) //send rate 0 means permanent sending in hardware
 {
sendComponentMessage(2); // 0010 permanent sending
  std::cout << "permanent sending\n";
  while (not _shutdownEvent);
 }else {*/
  auto sendImageEventThreadCB = [this](){ RunSendImageSignalThread(); };
  std::cout << "sendImageEventThread start\n";
  std::thread sendImageEventThread(sendImageEventThreadCB);
  uint32_t sentCount = 0;

  while (not _shutdownEvent)
  {
    // Wait for the send image event
    _sendNextImageEvent.Wait();
    std::cout << "SendNextImage start\n";
    if (not SendNextImage())
    {
      _shutdownEvent = true;
      break;
    }
    sentCount++;
    std::cout << "gesendet: " << sentCount << "\n";
  }
  sendImageEventThread.join();

 }
  munmap(streambridgeptr, BRIDGE_SPAN);
  close(fd);
  
//}


void ImageStreamingApp::RunSendImageSignalThread()
{
  int64_t microSeconds = 1000000 / _sendRate;
  if (_sendRate == 59)
  {
    microSeconds = 16683; // 59.94 Hz
  }
  while (not _shutdownEvent)
  {
    std::this_thread::sleep_for(std::chrono::microseconds(microSeconds));
    _sendNextImageEvent.Set();
  }
}

bool ImageStreamingApp::OpenLwBridge()
{
  fd = open("/dev/mem", O_RDWR | O_SYNC);
  if (fd < 0)
  {
    std::cout << "Error: could not open /dev/mem\n";
    return false;
  }

  streambridgeptr = mmap(NULL, BRIDGE_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED, fd, LW_BRIDGE_BASE);
  std::cout << "streambridgeptr assigned\n";
  if (streambridgeptr == MAP_FAILED)
  {
    std::cout << "Error: mmap failed\n";
    return false;
  }
  return true;
}


bool ImageStreamingApp::sendComponentMessage(uint32_t Component_Message)
{
 uint8_t *Component_Message_ptr = NULL;
 uint8_t *sysidptr = NULL;
  if (streambridgeptr == NULL)
  {
    std::cerr << "Error: streambridgeptr is NULL\n";
    return false;
  }
  sysidptr = static_cast<uint8_t *>(streambridgeptr) + SYSID_OFFSET;
  Component_Message_ptr = static_cast<uint8_t *>(streambridgeptr) + STREAM_COMPONENT_OFFSET;
  if (sysidptr < streambridgeptr || sysidptr >= static_cast<uint8_t *>(streambridgeptr) + BRIDGE_SPAN)
  {
    std::cerr << "Error: sysidptr is out of the mapped range\n";
    munmap(streambridgeptr, BRIDGE_SPAN);
    close(fd);
    return false;
  }

  if (reinterpret_cast<uint8_t *>(Component_Message_ptr) < static_cast<uint8_t *>(streambridgeptr) ||
      reinterpret_cast<uint8_t *>(Component_Message_ptr) >= static_cast<uint8_t *>(streambridgeptr) + BRIDGE_SPAN)
  {
    std::cerr << "Error: Component_Message_ptr is out of the mapped range\n";
    munmap(streambridgeptr, BRIDGE_SPAN);
    close(fd);
    return false;
  }
  //read from sysidptr -> SYSID Component in Platform Designer to ensure everything is working
  //uint32_t Address = *reinterpret_cast<uint32_t *>(sysidptr);
  //std::cout << "SYSID ADDRESS: " << std::hex << Address << std::endl;
  
  //uint32_t message = *reinterpret_cast<uint32_t *>(Component_Message_ptr);
  //std::cout << "ID from Component: " << std::hex << message << std::endl;

  //uint32_t Component_Message = 5; // 0b00000001: start-flag, led on
  *reinterpret_cast<uint32_t *>(Component_Message_ptr) = Component_Message;
  std::cout << "Wrote Value " << Component_Message << " at Component \n";
return true;
}


bool ImageStreamingApp::SendNextImage()
{
  if(not sendComponentMessage(1)){
    return false;
  } 
 
  return true;
}

bool ImageStreamingApp::ProgramLayoutTransform()
{
  auto spLayoutTransform = ILayoutTransform::Create();
  spLayoutTransform->SetConfiguration(_ltConfiguration);
  return true;
}

uint32_t ImageStreamingApp::GetUintOption(const char *optionName, uint32_t defaultValue)
{
  std::string optionValue;
  if (_commandLine.GetOption(optionName, optionValue))
  {
    return std::strtoul(optionValue.c_str(), nullptr, 0);
  }
  else
  {
    return defaultValue;
  }
}

float ImageStreamingApp::GetFloatOption(const char *optionName, float defaultValue)
{
  std::string optionValue;
  if (_commandLine.GetOption(optionName, optionValue))
  {
    return std::strtof(optionValue.c_str(), nullptr);
  }
  else
  {
    return defaultValue;
  }
}

void ImageStreamingApp::SigIntHandler(int)
{
  std::cout << "\nShutting down application\n";
  _shutdownEvent = true;
}

bool ImageStreamingApp::WaitForInferenceApp()
{
  bool isReady = false;
  bool firstTime = true;
  std::cout << "take semaphore:\n";
  sem_t *pSemaphore = ::sem_open("/CoreDLA_ready_for_streaming", O_CREAT, 0644, 0);
  std::cout << "semaphore opened\n";
  if (!pSemaphore)
  {
    return isReady;
  }
  while (not _shutdownEvent)
  {
    // Don't use a wait timeout because we need to break
    // if the user presses Ctrl+C
    timespec waitTimeout = {};
    int r = ::sem_timedwait(pSemaphore, &waitTimeout);
    if (r == 0)
    {
      isReady = true;
      ::sem_post(pSemaphore);
      std::cout << "r was 0\n";
      break;
    }

    if (firstTime)
    {
      firstTime = false;
      std::cout << "Waiting for streaming_inference_app to become ready." << std::endl;
    }

    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }

  ::sem_close(pSemaphore);

  return isReady;
}

