#!/bin/bash
# I need to rewrite the code later
echo "Hello World"
parent=./Writing
a=24
#newfolder=/newfolder
#mkdir "$newfolder"
for folder in "$parent"/*; do
if [[ -d $folder ]]; then
foldername="${folder##*/}"
for file in "$parent"/"$foldername"/*; do
filename="${file##*/}"
newfilename="$a"_"$foldername"_"$filename"
cp "$file" /home/tanzim/Developer/Videos/Processed/"$newfilename"
echo "$file"
done
fi
a=$((a+1))
done
echo "End"
