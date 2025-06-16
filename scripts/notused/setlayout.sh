#!bin/sh
alacritty -e ncmpcpp & sleep 0.1
alacritty -e cava & sleep 0.2 
alacritty -e btop & sleep 0.4 
#bspc node -z left -140 0 | bspc node -z top 0 -140
bspc node -z left -220 0 | bspc node -z top 0 -240
