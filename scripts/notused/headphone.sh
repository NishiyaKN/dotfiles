#!bin/bash

# Assing the filename
file1="/usr/share/alsa-card-profile/mixer/paths/analog-output-headphones.conf"
file2="/usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf"

# Take the search string
#read -p "Enter the search string: " search

# Take the replace string
#read -p "Enter the replace string: " replace

#if [[ $search != "" && $replace != "" ]]; then
#sed -i "s/$search/$replace/" $filename
#fi

sed -i "s/priority = 99/priority = 100/" $file1
sed -i "s/priority = 100/priority = 90/" $file2

systemctl restart --user pipewire-media-session pipewire-pulse pipewire
