#!/bin/bash
# A BASH Script for installing Apache2, PHP5 & MySQL in Ubuntu 12.04 LTS
# Author: Tahmid Tanzim (tahmid.tanzim@gmail.com)
# License: GNU
# 
# Prerequisite: Open your Terminal
# $ cd /path/to/bash-scripting
# $ chmod +x lamp-installer.sh
# $ ./lamp-installer.sh

LOG_FILE="$HOME/lamp-installer.log"

echo "|:~:| Install Linux, Apache, MySQL, PHP (LAMP) Stack on Ubuntu 14.04 LTS |:~:|"
echo "A BASH Script for installing Apache2, PHP5 & MySQL in Ubuntu 12.04 LTS\nAuthor: Tahmid Tanzim (tahmid.tanzim@gmail.com)\nLicense: GNU"

# Install Apache2
echo "1. Install Apache2"
sudo apt-get update >> $LOG_FILE
sudo apt-get install -y apache2 >> $LOG_FILE
echo "Apache2 installation DONE"

# Install PHP5
echo "2. Install PHP5"
sudo apt-get install -y php5 libapache2-mod-php5 php5-mcrypt >> $LOG_FILE
echo "PHP5 Installation DONE"

# Setting Up MySQL
echo "3. Setting Up MySQL"
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev php5-mysql >> $LOG_FILE
sudo apt-get install -y phpmyadmin >> $LOG_FILE
echo "MySQL Setup DONE"

# Install phpmyadmin
echo "4. Install phpmyadmin"
sudo apt-get install -y phpmyadmin >> $LOG_FILE
echo "phpmyadmin Installation DONE"

echo "#####################################################"
echo "##### ..:~:. LAMP Stack Setup Complete  .:~:.. ######"
echo "##### ..:~:..       TAHMID TANZIM      ..:~:.. ######"
echo "##### ..:~:..  tahmid.tanzim@gmail.com ..:~:.. ######"
echo "#####################################################"

echo "NOTE: If something went wrong then checkout the log file $LOG_FILE"