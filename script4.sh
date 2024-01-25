#!/bin/bash

#reading the directory path
read -p "please Enter the directory path..." directory

#display data using ExifTool
display_data_exif(){
	local file=$1
	echo "file:  $file"
	exiftool "$file"
}

#display data using Strings
display_data_strings(){
	local file=$1
	echo "file:  $file"
	strings "$file"
}

#display data using Mediainfo
display_data_mediainfo(){
	local file=$1
	echo "file:  $file"
	mediainfo "$file"
}

#display data using Tcpdump
display_data_tcpdump(){
	local file=$1
	echo "file:  $file"
	tcpdump "$file"
} 

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        # Check file type and extract/display metadata accordingly
        if [[ $file == *.jpg || $file == *.jpeg || $file == *.png ]]; then
            display_data_exif "$file"
        elif [[ $file == *.mp3 || $file == *.wav || $file == *.mp4 || $file == *.avi ]]; then
            display_data_mediainfo "$file"
        elif [[ $file == *.pcap || $file == *.cap ]]; then
            display_data_tcpdump "$file"
        else
            display_data_strings "$file"
        fi
    fi
done