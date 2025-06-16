#!/bin/bash

# if we don't have a file, start at zero
if [ ! -f "value.dat" ] ; then
  value=0

# otherwise read the value from the file
else
  value=$(cat value.dat)
fi

# increment the value
value=$((value + 1))

# show it to the user
echo "value: ${value}"

# and save it for next time
echo "${value}" > value.dat
