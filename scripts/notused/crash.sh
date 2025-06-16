#!/bin/bash

DAY=$(date +"%Y-%m-%dT%H%M%S")
sudo journalctl -f > /home/yori/crash/journalctl-$DAY &
sudo dmesg -wH > /home/yori/crash/dmesg-$DAY
