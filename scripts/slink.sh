#!/bin/bash


ORIGIN=""
TARGET="$HOME/Music/on/"
NEW=0
CT=1

#if [ $(ls $HOME/Music/on | wc -l) != 0 ]; then
#rm $HOME/Music/on/*
#fi

mkdir -p "$HOME/Music/on"

echo -e "\033[1;33mUpdating database..."

while [ $CT -le 4 ]
do
    if [ $CT == 1 ];then
        echo -e "\033[1;33mUpdating directory　アニメ"
    ORIGIN="$HOME/Music/音楽/アニメ/"

    elif [ $CT == 2 ];then
        echo -e "Updating directory　インストルメンタル"
    ORIGIN="$HOME/Music/音楽/インストルメンタル/"

    elif [ $CT == 3 ];then
        echo -e "Updating directory　他"
    ORIGIN="$HOME/Music/音楽/他/"

    elif [ $CT == 4 ];then
        echo -e "Updating directory　東方"
    ORIGIN="$HOME/Music/音楽/東方/"
    fi

    COUNTFILES="$( ls $ORIGIN | wc -l )"
    COUNTER=1

    while [ $COUNTER -le $COUNTFILES ]
    do

        FILEPATH=$( ls $ORIGIN | nl -s "..," | grep -m 1 "$COUNTER..," )
        FILE=${FILEPATH#*..,}

            if [ ! -f "$TARGET$FILE" ];then
                ln -s "$ORIGIN$FILE" $TARGET
                NEW=$(( $NEW+1 ))
            fi

    COUNTER=$(( $COUNTER+1 ))
    done

CT=$(( CT+1 ))
done

TOTAL=$(ls $TARGET | wc -l)

echo -e "\033[0;32mDatabase updated"
echo "Total files: $TOTAL"

if [ $NEW -gt 1 ];then
    echo "$NEW new files added\033[0m"

elif [ $NEW == 1 ];then
    echo "1 new file added\033[0m"

elif [ $NEW == 0 ];then
    echo -e "\033[0;31mNo new file was added"
fi

mpc update
