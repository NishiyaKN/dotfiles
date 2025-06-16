#!bin/bash

if [[ $(xrandr -q | grep -w 'DP-1' | cut -d ' ' -f2) = 'disconnected' ]]; then
echo "hey"
fi
