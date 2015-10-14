#!/bin/bash
# A BASH Script for recursively replace all spaces in file and directory names with underscore
# Author: Tahmid Tanzim (tahmid.tanzim@gmail.com)
# License: GNU GENERAL PUBLIC LICENSE
#
# Prerequisite: Open your Terminal
# $ cd /path/to/bash-scripting
# $ chmod +x replace-spaces.sh
# $ ./replace-spaces.sh

RESOURCE_DIR="/home/tanzim/Desktop/Test"

if [ -d "$RESOURCE_DIR" ]; then # Check RESOURCE DIRECTORY existence.
	find $RESOURCE_DIR -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;
	echo "Replace spaces with underscore is DONE."
else
	echo "Sorry! Directory: $RESOURCE_DIR doesnot exists."
fi
