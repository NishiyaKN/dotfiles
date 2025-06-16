#!bin/sh
lines=$(cat ~/.zsh_history | wc -l)
if (( "$lines" > 999999990 ))
then

cat ~/.zsh_history >> .zsh_historical
rm ~/.zsh_history
echo -e "\e[33mOld terminal history has been merged to the historical file\e[0m"

fi
