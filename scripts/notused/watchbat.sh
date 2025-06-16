#!/bin/bash
AA=100000000
A=0
while [ $A -lt $AA ]
do
    acpi -V | grep -m 1 Battery
    sleep 0.5
done
