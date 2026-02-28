#!/bin/bash


# So we can colour code outputs
RED='\033[0;31m'
WHITE='\033[0;37m'
GREEN='\033[0;32m'

if [ ! -e "/dev/video10" ]; then #if the virtual camera hasn't been setup yet
	echo -e ${RED} /dev/video10 not found
	sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="S23U_Camera" exclusive_caps=1
	echo -e ${GREEN} Loaded v4l2loopback and created virtual camera at /dev/video10 ${WHITE}
fi

if [ $# -eq 1 ]; then # process args / if we want custom camera or rotation
	camnum=$1
	rotation=0
elif [ $# -eq 2 ]; then
	camnum=$1
	rotation=$2
else
	camnum=1
	rotation=0
fi
adb start-server # start android debugging server
echo -e ${GREEN} Starting webcam using camera ${camnum} with rotation ${rotation} ${WHITE}

#change camera-size if you want a different size camera
#remove --no-audio if you want a mic
#remove --no-window and --no-playback for it to auto show preview screen
scrcpy --video-source=camera --camera-id=$camnum --orientation=$rotation --v4l2-sink=/dev/video10 --no-audio --no-playback --no-window --camera-size=1920x1080

adb kill-server # Stop the android debugging server

echo -e ${RED} Webcam killed ${WHITE}
