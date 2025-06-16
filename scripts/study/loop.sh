#!/bin/bash
#update system in loop
counter=1
while [ $counter -le 9999 ]
do
echo $counter
sudo pacman -Syu
sleep 20
((counter++))
done
echo Done
