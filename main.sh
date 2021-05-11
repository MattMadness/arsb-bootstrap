#!/usr/bin/env bash

echo "* Welcome to Matthew Evan's AR Sandbox Bootstrap Script. *"
echo "https://github.com/MattMadness/arsb-bootstrap"
echo
echo "This script should build and install all the dependencies"
echo "for a Ubuntu/Linux Mint/Debian based computer automatically."
echo
echo "This program is free software: you can redistribute it and/or" 
echo "modify it under the terms of the GNU General Public License as" 
echo "published by the Free Software Foundation, either version 2 of "
echo "the License, or (at your option) any later version."
echo
echo "This program is distributed in the hope that it will be useful,"
echo "but WITHOUT ANY WARRANTY; without even the implied warranty of"
echo "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
echo "See the GNU General Public License (the file LICENSE) for more "
echo "details."
echo
read -r -p "Continue? [y/N] " response
case "$response" in
        [yY][eE][sS]|[yY])
                # continue
                ;;
        *)
                exit 1
                ;;
esac

# Installing dependencies
echo
echo "=> Step One: Installing dependencies.."
echo
sudo apt-get update
sudo apt-get install build-essential g++ libudev-dev libdbus-1-dev libusb-1.0-0-dev zlib1g-dev libssl-dev libpng-dev libjpeg-dev libtiff-dev libasound2-dev libspeex-dev libopenal-dev libv4l-dev libdc1394-22-dev libtheora-dev libbluetooth-dev libfreetype6-dev libxi-dev libxrandr-dev mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev

echo
echo "If any of the packages above were not found, you need to use your"
echo "distro's package manager to find and install them."
echo
read -r -p "Continue? [y/N] " response
case "$response" in
        [yY][eE][sS]|[yY])
                # continue
                ;;
        *)
                exit 1
                ;;
esac

# Preparing build environment
echo "=> Step Two: Preparing build environment"
echo
echo "Going to /tmp"
echo
cd /tmp
echo
echo "Creating and entering build directory..."
mkdir arsbbuild
cd arsbbuild
echo
echo "Downloading Vrui install script and source code to SARndbox and Kinect from internet."
echo
wget --no-clobber http://web.cs.ucdavis.edu/~okreylos/ResDev/Vrui/Build-Ubuntu.sh
wget --no-clobber https://web.cs.ucdavis.edu/~okreylos/ResDev/SARndbox/SARndbox-2.6.tar.gz
wget --no-clobber https://web.cs.ucdavis.edu/~okreylos/ResDev/Kinect/Kinect-3.10.tar.gz
echo
echo "Extracting source code"
echo
tar xfz SARndbox-2.6.tar.gz
echo "SARndbox extracted"
echo
tar xfz Kinect-3.10.tar.gz
echo "Kinect extracted"
echo
echo "If you got any errors, you should investigate them."
echo "Otherwise you may continue."
echo
read -r -p "Continue? [y/N] " response
case "$response" in
        [yY][eE][sS]|[yY])
                # continue
                ;;
        *)
                exit 1
                ;;
esac
echo
# Building packages
echo "=> Step Three: Building and installing programs"
echo
echo "Countdown!"
echo 
echo "3.."
sleep 1
echo "2.."
sleep 1
echo "1..."
sleep 1
echo
echo "Time to heat the box!"
echo 
echo "Building and Installing Vrui"
if test -f "/usr/local/bin/VruiDemo"; then
	echo Nevermind it is already installed, moving on I guess!

else
	bash Build-Ubuntu.sh
	echo "Yeah I hope you had fun with that globe. Now let's continue the build."
fi
cd /tmp/arsbbuild
echo
echo
echo "Building Kinect"
echo
cd Kinect-3.10
make -j $(nproc)
echo
echo "Installing Kinect"
sudo make install
sudo make installudevrules
echo
echo "Building SARndbox" 
cd ../SARndbox-2.6
make -j $(nproc)
echo
echo "Installing SARndbox"
sudo make install
echo
echo "That's all done. Unless there are errors. Then that would be bad."
echo "Please give errors as an Issue on our Github repository."
echo "It's here -> https://github.com/MattMadness/arsb-bootstrap"
