#!/bin/bash

FAN=0
while true; do

TEMP=$(sensors | grep Tctl | awk '{print $2}' | cut -d '+' -f 2 | cut -d "." -f 1)

    if [ $TEMP -ge 94 ]; then
        echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
        echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable
        # echo "0" | tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
        # echo "0" | tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable
        FAN=1
    fi
    if [ $TEMP -lt 80 ];then
        if [ $FAN == 1 ]; then
            echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
            echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable
            # echo "2" | tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
            # echo "2" | tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable
            FAN=0
        fi
    fi
sleep 5
done
