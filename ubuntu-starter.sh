#!/bin/bash
# A BASH Script for installing Pre-requisite Library after installing Ubuntu 12.04 LTS
# Author: Tahmid Tanzim (tahmid.tanzim@gmail.com)
# License: GNU
#
# Prerequisite: Open your Terminal
# $ cd /path/to/bash-scripting
# $ chmod +x ubuntu-starter.sh
# $ ./ubuntu-starter.sh

LOG_FILE="$HOME/ubuntu-starter-installer.log"

echo "|:~:| Ubuntu 14.04 LTS Starter |:~:|"
echo "A BASH Script for installing Pre-requisite Library after installing Ubuntu 12.04 LTS\nAuthor: Tahmid Tanzim (tahmid.tanzim@gmail.com)\nLicense: GNU"

# Enable Partner Repositories
echo "1. Enable Partner Repositories....."
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
if [[ $(lsb_release -si) = "elementary OS" ]]
then
	echo "elementary OS Luna, Modifying to be Precise" &&
	sudo sed -i 's/luna/precise/g' /etc/apt/sources.list &&
	sudo rm -f /etc/apt/sources.list.bck >> $LOG_FILE
fi
echo "Enable Partner Repositories DONE"

# Download and Install GetDeb and PlayDeb
echo "2. Download and Install GetDeb and PlayDeb"
echo "Downloading GetDeb and PlayDeb" &&
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb &&

echo "Installing GetDeb" &&
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb &&

echo "Installing PlayDeb" &&
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb &&

if [[ $(lsb_release -si) = "elementary OS" ]]
then
	echo "elementary OS Luna, Modifying to be Precise" &&
	sudo sed -i 's/luna/precise/g' /etc/apt/sources.list.d/getdeb.list &&
	sudo rm -f /etc/apt/sources.list.d/getdeb.list.bck &&
	sudo sed -i 's/luna/precise/g' /etc/apt/sources.list.d/playdeb.list &&
	sudo rm -f /etc/apt/sources.list.d/playdeb.list.bck
fi &&

echo "Deleting Downloads" &&
rm -f getdeb-repository_0.1-1~getdeb1_all.deb &&
rm -f playdeb_0.3-1~getdeb1_all.deb >> $LOG_FILE
echo "GetDeb and PlayDeb Installation DONE"

# Add Personal Package Archives
echo "3. Add PPA"
sudo add-apt-repository -y ppa:videolan/stable-daily >> $LOG_FILE
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp >> $LOG_FILE
sudo add-apt-repository -y ppa:webupd8team/java >> $LOG_FILE
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager >> $LOG_FILE
sudo add-apt-repository -y ppa:transmissionbt/ppa >> $LOG_FILE
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily >> $LOG_FILE
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2 >> $LOG_FILE

echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -
echo "Add PPA DONE"

# Update Dependencies
echo "4. Check for Repositories Updates"
sudo apt-get update >> $LOG_FILE
echo "Update Repositories DONE"

# Upgrade Dependencies
echo "5. Upgrade Packages"
sudo apt-get -y upgrade >> $LOG_FILE
echo "Packages Upgrade DONE"

# Major Upgrades
echo "6. Major Upgrades"
sudo apt-get -y dist-upgrade >> $LOG_FILE
echo "Major Upgrades DONE"

# Disable Guest
echo "7. Disable Guest"
sudo /usr/lib/lightdm/lightdm-set-defaults -l false >> $LOG_FILE
echo "Disable Guest DONE"

# Install Essentials
echo "8. Install Essentials"
sudo apt-get install -y synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager firestarter bleachbit oracle-java7-installer flashplugin-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack lha arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 ffmpeg totem-mozilla icedax lame libmad0 libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libavcodec-extra-53 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2 ubuntu-restricted-extras indicator-multiload sublime-text vim wget build-essential >> $LOG_FILE
echo "Essentials Installation DONE"

# Install Google Chrome
echo "9. Install Google Chrome"
if [[ $(getconf LONG_BIT) = "64" ]]
then
	echo "64bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb >> $LOG_FILE
else
	echo "32bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb >> $LOG_FILE
fi
echo "Google Chrome Installation DONE."

# Install Skype
echo "10. Install Skype"
sudo dpkg --add-architecture i386 >> $LOG_FILE
sudo apt-get update >> $LOG_FILE
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb >> $LOG_FILE
sudo dpkg -i skype-install.deb >> $LOG_FILE
sudo rm -f skype-install.deb >> $LOG_FILE
echo "Skype Installation DONE"

# Install Adobe Flash
echo "10. Install Adobe Flash"
sudo apt-add-repository -y "deb http://archive.canonical.com/ubuntu trusty partner"
sudo apt-add-repository -y "deb-src http://archive.canonical.com/ubuntu trusty partner"
sudo apt-get update
sudo apt-get install -y adobe-flashplugin >> $LOG_FILE
echo "Adobe Flash Installation DONE"


# Clean Up
echo "12. Clean Up"
echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean >> $LOG_FILE
echo "Clean Up DONE."

echo "######################################################"
echo "##### ..:~:.Ubuntu Starter Setup Complete.:~:.. ######"
echo "##### ..:~:..       TAHMID TANZIM       ..:~:.. ######"
echo "##### ..:~:..  tahmid.tanzim@gmail.com ..:~:.. #######"
echo "######################################################"

echo "NOTE: If something went wrong then checkout the log file $LOG_FILE"
