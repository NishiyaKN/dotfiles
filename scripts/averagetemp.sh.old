#!/bin/bash

COUNTER=1
while true; do
    if [ $COUNTER == 14 ];then
        COUNTER=1
        TEMP=0
    fi
    NEWTEMP=$(sensors | grep "Package id" | awk '{print $4}' | cut -d '.' -f 1 | cut -d '+' -f 2)
    TEMP=$(( $TEMP+$NEWTEMP ))
    AVERAGE=$(( $TEMP/$COUNTER ))
    echo "Average CPU temperature: "$AVERAGE 
    # echo "TEMP: "$TEMP
    # echo "NEWTEMP: "$NEWTEMP
    # echo "COUNTER: "$COUNTER
    COUNTER=$(( $COUNTER+1 ))
    sleep 1
done

