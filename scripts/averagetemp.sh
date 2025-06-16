#!/bin/bash

COUNTER=1
MAX=0
MAX15=0
MIN=0
MIN15=0
FAN=0
SEC=${1:-1}

R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
N='\033[0m'

DOTS=""

while true; do
    if [ $COUNTER == 16 ];then
        COUNTER=1
        TEMP=0
        MAX15=0
        MIN15=0
        DOTS=""
    fi

    NEWTEMP=$(sensors | grep Tctl | awk '{print $2}' | cut -d '+' -f 2 | cut -d "." -f 1)
    TEMP=$(( $TEMP+$NEWTEMP ))

    if [ $NEWTEMP -ge 85 ]; then
        sudo sh -c "echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable"
        sudo sh -c "echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable"
        FAN=1
    fi
    if [ $NEWTEMP -lt 45 ];then
        if [ $FAN == 1 ]; then
            sudo sh -c "echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable"
            sudo sh -c "echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon7/pwm1_enable"
            FAN=0
        fi
    fi

    AVERAGE=$(( $TEMP/$COUNTER ))

    if [ $MAX == 0 ] || [ $MAX -lt $NEWTEMP ]; then
        MAX=$NEWTEMP
    fi
    if [ $MIN == 0 ] || [ $MIN -gt $NEWTEMP ]; then
        MIN=$NEWTEMP
    fi

    if [ $MAX15 == 0 ] || [ $MAX15 -lt $NEWTEMP ]; then
        MAX15=$NEWTEMP
    fi
    if [ $MIN15 == 0 ] || [ $MIN15 -gt $NEWTEMP ]; then
        MIN15=$NEWTEMP
    fi
    DOTS+="."

    clear
    echo -e "\033[0;36m$DOTS${N}"
    echo -e "+--------------+"
    echo -e "|${Y}    Temp  $NEWTEMP  ${N}|"
    echo -e "|${Y} Avg 15s  $AVERAGE  ${N}|"
    echo -e "+--------------+"
    echo -e "|${R}     Max  $MAX  ${N}|"
    echo -e "|${R} Max 15s  $MAX15  ${N}|"
    echo -e "+--------------+"
    echo -e "|${G}     Min  $MIN  ${N}|"
    echo -e "|${G} Min 15s  $MIN15  ${N}|"
    echo -e "+--------------+"

    # echo "TEMP: "$TEMP
    # echo "NEWTEMP: "$NEWTEMP
    # echo "COUNTER: "$COUNTER
    COUNTER=$(( $COUNTER+1 ))
    sleep $SEC
done

