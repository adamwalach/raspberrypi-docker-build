#!/bin/bash

RASPBIAN_VERSION=2016-02-09
RASPBIAN_FILE=$RASPBIAN_VERSION-raspbian-jessie-lite.zip
RASPBIAN_IMAGE=$RASPBIAN_VERSION-raspbian-jessie-lite.img

#apt-get install kpartx

mkdir -p .build
cp ./Dockerfile ./.build/Dockerfile

cd .build

if [ ! -f "$RASPBIAN_FILE" ]; then
    echo "Downloading Raspbian Lite image"
    wget http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-$RASPBIAN_VERSION/$RASPBIAN_FILE
    unzip $RASPBIAN_FILE
fi

kpartx -v -a $RASPBIAN_IMAGE
LDEVICE=/dev/mapper/loop0p2

mkdir -p ./rootfs
mount $LDEVICE ./rootfs -o ro

docker build -t awalach/raspbian_lite:$RASPBIAN_VERSION ./

umount $LDEVICE
