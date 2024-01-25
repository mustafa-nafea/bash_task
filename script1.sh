#!/bin/bash

#read the file path from the user
read -p "Enter the File path: " path

if [[  -f "$path" ]]; then

	#Getting the file info 
	size=$(du -h "$path" | cut -f1)
	type=$(file -b "$path")
	permissions=$(stat -c '%A' "$path")

	#displaying the file info 
	echo "File Information..."
	echo "File size: " $size
	echo "File type: " $type
	echo "File permissions: " $permissions
else 
	echo "File doesn't exsit buddy....!"
fi
