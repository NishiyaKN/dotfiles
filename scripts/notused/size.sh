#!bin/bash
read file
size=$(stat "$file" | grep 'Size' | cut -d 'B' -f1 | cut -d ' ' -f4)
sizeint=$(("$size"))

if [ "$sizeint" -lt 1000 ]
then

    result=$(bc -l <<<"${sizeint}")
    type="B"

elif [ "$sizeint" -ge 1000 ] && [ "$sizeint" -lt 1000000 ]
then
    result=$(bc -l <<<"${sizeint}/1024")
    type="KB"

elif [ "$sizeint" -ge 1000000 ] && [ "$sizeint" -lt 1000000000 ]
then
    result=$(bc -l <<<"${sizeint}/1048576")
    type="MB"

elif [ "$sizeint" -ge 1000000000 ] && [ "$sizeint" -lt 1000000000000 ]
then
    result=$(bc -l <<<"${sizeint}/1073741824")
    type="GB"

fi

if [ $type == "B" ]
then
printf "$result $type ($result)\n"

else
printf "%0.2f $type ($sizeint)\n" "$result"

fi
