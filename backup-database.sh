#!/bin/bash
# A BASH Script for Backup MySQL Database
# Author: Tahmid Tanzim (tahmid.tanzim@gmail.com)
# License: GNU GENERAL PUBLIC LICENSE
#
# Prerequisite: Open your Terminal
# $ cd /path/to/bash-scripting
# $ chmod +x backup-database.sh
# $ ./backup-database.sh

# Backup Directory and Date
BACKUP_DIR="$HOME/_backup/mysql"
BACKUP_DATE=$(date +"%d-%b-%Y")
if [ ! -d "$BACKUP_DIR" ]; then
	mkdir -p $BACKUP_DIR
fi
 
# Database Credentials
DB_USERNAME="root"
DB_PASSWORD="root"
DB_HOST="localhost"
DB_NAME="wordpress"

# Set default file permissions
umask 177

# pv (Pipe Viewer) needs to monitor database export progress.
PACKAGE="pv"
if dpkg --get-selections | grep -q "^$PACKAGE[[:space:]]*install$" >/dev/null; then
    echo -e "$PACKAGE is already installed"
elif sudo apt-get -qq install $PACKAGE; then
	echo "Successfully installed $PACKAGE"
else
	echo "Error installing $PACKAGE"
fi

# Dump database into compressed SQL file
mysqldump --user=$DB_USERNAME --password=$DB_PASSWORD --host=$DB_HOST $DB_NAME | pv | gzip > $BACKUP_DIR/$DB_NAME-$BACKUP_DATE.sql.gz

# Delete backup files older than 90 days
find $BACKUP_DIR/* -mtime +90 -exec rm {} \;
