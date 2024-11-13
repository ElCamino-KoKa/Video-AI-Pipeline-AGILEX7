#! /bin/sh
# This script should be run from the /home/root/app folder.

# Run the image streaming app, specifying the folder containing the source
# images, and an upload rate
export COREDLA_ROOT='/home/root/app'
./image_streaming_app -rate=2

