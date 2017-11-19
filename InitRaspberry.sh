#!/bin/sh

# GUI-related packages
pkgs="
xserver-xorg-video-fbdev
xserver-xorg xinit
gstreamer1.0-x gstreamer1.0-omx gstreamer1.0-plugins-base
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-alsa
gstreamer1.0-libav
epiphany-browser
lxde lxtask menu-xdg gksu
xserver-xorg-video-fbturbo
xpdf gtk2-engines alsa-utils
netsurf-gtk zenity
desktop-base lxpolkit
weston
omxplayer
raspberrypi-artwork
lightdm gnome-themes-standard-data gnome-icon-theme
qt50-snapshot qt50-quick-particle-examples
"

# Edu-related packages
pkgs="$pkgs
idle python3-pygame python-pygame python-tk
idle3 python3-tk
python3-rpi.gpio
python-serial python3-serial
python-picamera python3-picamera
debian-reference-en dillo x2x
scratch nuscratch
raspberrypi-ui-mods
timidity
smartsim penguinspuzzle
pistore
sonic-pi
python3-numpy
python3-pifacecommon python3-pifacedigitalio python3-pifacedigital-scratch-handler python-pifacecommon python-pifacedigitalio
oracle-java8-jdk
minecraft-pi python-minecraftpi
wolfram-engine
libreoffice*
"

# Remove packages
for i in $pkgs; do
	echo apt-get -y remove --purge $i
done

# Remove automatically installed dependency packages
echo apt-get -y clean
echo apt-get -y autoremove
echo apt-get -y check
echo apt-get -y clean

# Updating
echo apt-get -y update
echo apt-get -y upgrade
echo apt-get -y dist-upgrade

# Remove Folders
echo rm -r /usr/lib/xorg/modules/linux /usr/lib/xorg/modules/extensions /usr/lib/xorg/modules /usr/lib/xorg ~/Desktop ~/python_games

# Updating Keys
echo rm /etc/ssh/ssh_host_* && sudo dpkg-reconfigure openssh-server

# Instaling LCD 3.5 https://www.waveshare.com/wiki/3.5inch_RPi_LCD_(A)
echo wget http://www.waveshare.com/w/upload/0/00/LCD-show-170703.tar.gz
echo tar xvf LCD-show-*.tar.gz
echo cd LCD-show/
echo chmod +x LCD35-show
echo ./LCD35-show 180
