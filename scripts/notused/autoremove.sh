#!/bin/bash

echo -e "\e[1;33mEnter the term which the target file(s) contain\e[0m"
echo -e "\e[1;33me.g. *windows*\e[0m"
read NAME

rm /tmp/findquery.txt;
echo -e "\e[1;33mSEARCHING...\e[0m"
find ~/ -iname "$NAME" > /tmp/findquery.txt
FOUND=$(wc -l /tmp/findquery.txt | cut -d ' ' -f1)

echo -e "\e[31mMAKE SURE TO NOT DELETE ANYTHING IMPORTANT\e[0m"
cat /tmp/findquery.txt
echo -e "\e[31mDO YOU WANT TO DELETE THESE FILES? [y/n]\e[0m"

read YN
if [ "$YN" == "Y" ] || [ "$YN" == "y" ];then 
while read LINE; do
    cp -r -v "$LINE" /home/teruyo/re/tmp/ >> /home/teruyo/re/tmp/log.txt && rm -rf "$LINE"
    done < /tmp/findquery.txt
    echo -e "\e[32mTHE FILES WERE SUCCESSFULLY DELETED"
else
echo -e "\e[1;33mNO FILES WERE DELETED\e[0m"
fi

