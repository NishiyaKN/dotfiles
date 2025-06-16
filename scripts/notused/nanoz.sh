#!bin/bash
nano ~/.zshrc
echo -e "\e[33mDo you want to save it to the .bak? [Y/n]\e[0m"
read answer
if [ "$answer" == "y" ] || [ -z $answer ]; then
cp ~/.zshrc ~/Documents/zshrc.bak
echo -e "\e[32mSaved on the backup\e[0m"
else
echo -e "\e[31mChanges not saved on .bak\e[0m"
fi
# echo -e "\e[0mTEXT\e[0m"
