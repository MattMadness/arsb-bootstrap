# arsb-bootstrap
A quick bootstrap script for the AR Sandbox software and dependencies made by KeckCAVES at UC Davis

## Explaination
This bash script is designed in hopes to simplify and speed up the setup process of an AR Sandbox on a Linux Mint machine, but it should work on Ubuntu and Debian as well.
The process goes like this:

* Step One: Install build and use dependenies (from software repositories)
* Step Two: Prepare the build environment (by downloading build scripts and source tarballs)
* Step Three: Build and install programs

# Installation for Mere Mortals

First we need to install our Linux distro. It can be any Linux distro based on Debian or Ubuntu, but if you have no idea what any of those are, just choose Linux Mint. You have to go over to the [Linux Mint download page](https://linuxmint.com/download.php) and get a installation image. It does not matter what desktop you choose (Cinnamon, MATE, or Xfce), it is all according to your preferences. Cinnamon is a slightly heavier but beautiful and functional desktop while MATE and Xfce are lightweight and efficient.

Next, we need to get a program to burn our install image. For this, either [Balena Etcher](https://www.balena.io/etcher/) or [Rufus](https://rufus.ie/) are fantastic choices. Install the program you want, insert a USB stick with 4GB or more of storage, select the installation image you downloaded and then the installation image (a `.iso` file) then press Burn or Start. ***WARNING! ALL DATA ON THE USB STICK WILL BE ERASED! BACK IT UP!***

Then we have to install the operating system onto the computer [with hardware specs as seen here](https://web.cs.ucdavis.edu/~okreylos/ResDev/SARndbox/index.html). Insert the USB stick. Then boot into USB stick by:

*There might be extra steps, such as you may need to enable USB boot or disable Secure Boot or something weird that OEMs enable to keep the Microsoft Windows monopoly rolling.*
* HP: Powering on from being turned off completely, spam-pressing the Escape key until a menu appears, choosing F9 for Boot Device Options, then USB Storage Device.
* Dell: Powering on from being turned off completely, spam-pressing the F12 key until a menu appears, then choosing USB Storage Device.
* Asus: Powering on from being turned off completely, spam-pressing the F8 key until a menu appears, then choosing USB Storage Device.

Once you have booted your OS, you need to choose to install it. For Linux Mint, just choose to *Start Linux Mint* when that TUI menu appears (or just wait and it will be chosen automatically) then wait to see your desktop. On the desktop, you'll have a program called *Install Linux Mint*. Run that program and follow the instructions. You'll have an installed system in no time.

Finally, power off the computer, pull out the USB stick, then power the computer on normally *in that order*. You will then be able to log in and use the desktop.

When on the desktop, open the Terminal and run these commands:

```bash
curl https://raw.githubusercontent.com/MattMadness/arsb-bootstrap/main/main.sh -o main.sh 
bash main.sh
```

When you run that last command, it will launch my bootstrap script that is in this repository and it will take care of everything for you. It will take a couple minutes to build, so go grab a coffee or something.

When the entire installation is finished with no errors, insert the Xbox 360 Kinect and run `KinectUtil getCalib 0` and then you can activate the AR Sandbox by inserting your Xbox 360 Kinect and a projector, then run `SARndbox` in the Terminal. That should start the AR Sandbox.
