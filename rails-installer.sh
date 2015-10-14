#!/bin/bash
# A BASH Script for installing Ruby on Rails & MySQL in Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Tahmid Tanzim (tahmid.tanzim@gmail.com)
# License: GNU
# 
# Prerequisite: Open your Terminal
# $ cd /path/to/bash-scripting
# $ chmod +x rails-installer.sh
# $ ./rails-installer.sh

# DEFAULT_RUBY_VERSION="1.9.3-p484"
LOG_FILE="$HOME/rails-installer.log"

echo "|:~:| Setup Ruby on Rails Development Environment in Ubuntu 14.04 LTS |:~:|"
echo "A BASH Script for installing Ruby on Rails & MySQL in Ubuntu 12.04 LTS\nAuthor: Tahmid Tanzim (tahmid.tanzim@gmail.com)\nLicense: GNU"

# Installing Dependencies
echo "1. Installing Dependencies"
sudo apt-get update >> $LOG_FILE
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties >>$LOG_FILE
echo "Dependencies Installation DONE"

# Installing RVM & Ruby
echo "2. Installing RVM & Ruby"
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev libmysqlclient-dev >> $LOG_FILE
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
# Install Defined version of Ruby
echo "2.1. Installing Ruby v $RUBY_VERSION ."
rvm install 1.9.3-p484 >> $LOG_FILE
echo "2.2. Setting the default version of Ruby."
rvm --default use 1.9.3-p484 >> $LOG_FILE
echo "Your Default Ruby Version is: "
ruby -v >> $LOG_FILE

echo "Command for Rubygems not to install the documentation for each package locally"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
echo "RVM & Ruby Installation DONE"

echo "3. Installing Git"
sudo apt-get -y install git >> $LOG_FILE
echo "Git Installation DONE"

# Installing Rails
echo "4. Installing Rails"
sudo add-apt-repository ppa:chris-lea/node.js -y >> $LOG_FILE
sudo apt-get update >> $LOG_FILE
sudo apt-get install -y nodejs >> $LOG_FILE
gem install rails >> $LOG_FILE
rbenv rehash >> $LOG_FILE
echo "Your Default Rails Version is: "
rails -v >> $LOG_FILE
echo "Rails Installation DONE"

# Setting Up MySQL
echo "5. Setting Up MySQL"
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev php5-mysql >> $LOG_FILE
echo "MySQL Setup DONE"

# Install phpmyadmin
echo "4. Install phpmyadmin"
sudo apt-get install -y apache2 >> $LOG_FILE
sudo apt-get install -y phpmyadmin >> $LOG_FILE
echo "phpmyadmin Installation DONE"

echo "#####################################################"
echo "##### ..:~:.Ruby on Rails Setup Complete.:~:.. ######"
echo "##### ..:~:..       TAHMID TANZIM      ..:~:.. ######"
echo "##### ..:~:..  tahmid.tanzim@gmail.com ..:~:.. ######"
echo "#####################################################"

echo "NOTE: If something went wrong then checkout the log file $LOG_FILE"