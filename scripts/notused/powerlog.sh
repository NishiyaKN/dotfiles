#!/bin/bash
DATE=$(date +%Y-%m-%d)

UPDATE_INTERVAL=1
LOG_FILE=~/Documents/$DATE.txt
touch $LOG_FILE

START_TIME=""
LAST_BATTERY=""
TOTAL_TIME=0
LAST_TOTAL_TIME=0
LAST_SEC=0
DID_HEADER=0
IS_DISCHARGING=0
AVG_DISCHARGE=0
LAST_AVG_DISCHARGE=0
BATTERY_CHANGE=0

while true; do
    STATUS=$(acpi | awk '{print $3}' | cut -d ',' -f 1)
    if [[ $STATUS == "Discharging" ]]; then

        if [[ $DID_HEADER == 0 ]]; then
            SESSION_COUNT=$(($(cat "$LOG_FILE" | grep -i Total | wc -l)+1))
            if [[ -n $(cat "$LOG_FILE" | grep -i $DATE) ]]; then
                echo $DATE >> "$LOG_FILE"
            fi
            echo "-------------------------------------------------------" >> "$LOG_FILE"
            echo "$SESSION_COUNT- Total time: $TOTAL_TIME | Average s per %: $AVG_DISCHARGE" >> "$LOG_FILE"
            DID_HEADER=1;
        fi

        IS_DISCHARGING=1;
        TIME=$(date "+%s")
        CURRENT_BATTERY=$(acpi | awk '{print $4}' | cut -d '%' -f 1)

        if [[ $START_TIME == "" ]]; then
            START_TIME=$TIME
        fi

        if [[ $CURRENT_BATTERY != $LAST_BATTERY ]]; then
            LAST_BATTERY=$CURRENT_BATTERY
            SEC=$(($TOTAL_TIME-$LAST_SEC))
            echo "$CURRENT_BATTERY% after $SEC seconds" >> "$LOG_FILE"
            LAST_SEC=$(($SEC+$LAST_SEC))
            BATTERY_CHANGE=$(($BATTERY_CHANGE+1))
            LAST_AVG_DISCHARGE=$AVG_DISCHARGE
            AVG_DISCHARGE=$(($TOTAL_TIME/$BATTERY_CHANGE))
        fi
        LAST_TOTAL_TIME=$TOTAL_TIME
        TOTAL_TIME=$(($TOTAL_TIME+$UPDATE_INTERVAL))
        sed -i "s/$SESSION_COUNT- Total time: $LAST_TOTAL_TIME \| Average s per %: $LAST_AVG_DISCHARGE/$SESSION_COUNT- Total time: $TOTAL_TIME \| Average s per %: $AVG_DISCHARGE/" "$LOG_FILE"
    else
        if [[ $IS_DISCHARGING == 1 ]]; then
            echo "...battery is charging..." >> "$LOG_FILE"
            DID_HEADER=0
            IS_DISCHARGING=0
            TOTAL_TIME=0
            LAST_TOTAL_TIME=0
            SEC=0
            LAST_SEC=0
            AVG_DISCHARGE=0
            LAST_AVG_DISCHARGE=0
        fi
    fi
    sleep $UPDATE_INTERVAL
done

