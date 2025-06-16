#!bin/bash
day=$(date +"%Y-%m-%d@%H:%M")
kin='\e[33m'
nc='\e[0m'
mid='\e[32m'
aka='\e[31m'

cp ~/.zshrc ~/Documents/dotfiles/zshrcbak/zshrc."$day"
cp ~/.zshrc ~/Documents/dotfiles/zshrc

echo -e "$kin"'Previous .zshrc saved on backup folder\n'"$nc"
vim ~/.zshrc

quant=$(ls /home/teruyo/Documents/dotfiles/zshrcbak -1q | wc -l)
if (( "$quant" > 20 ))
then
        echo -e "$kin"'There are more than 20 backups files, do you want to keep only the 10 newest files? ['"$mid"'Y'"$kin"'/'"$aka"'n'"$kin"']'"$nc"

        res=0
        while [ "$res" -eq 0 ]
        do

        read yn
        yn="${yn:-y}"

        if [ "$yn" == 'y' ] || [ "$yn" == 'Y' ]
        then

        res=1
        cd ~/Documents/dotfiles/zshrcbak
        ls -1t | tail -n +11 | xargs -d '\n' rm -f
        cd ~
        echo -e "$mid"'Old backups successfully removed'

        elif [ "$yn" == 'n' ] || [ "$yn" == 'N' ]
        then

        res=1
        echo -e "$aka"'Old backups not removed'

        else
        echo -e "$kin"'Type '"$mid"'Y'"$kin"'/'"$aka"'n'"$nc"
        fi
    done
fi

#find ~/Documents/dotfiles/zshrcbak/* -mtime +90 -delete
#find . -type d -mmin -60 -empty -delete

