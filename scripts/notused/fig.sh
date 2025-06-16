#!bin/sh

#una=$(uname -r)
#fig1=$(figlet "GNU / LINUX")
#fig2=$(figlet $una)
toi=$(toilet -t "マスタ-スパ-ク")
toi2=$(toilet -t "   マスタ-スパ-ク")

num=$[ $RANDOM % 516 + 1 ]
ws=$(bspc query -M -d focused --names)

#kin='\e[33m'
#ao='\e[36m'
bold=$(tput bold)
norm=$(tput sgr0)

if [ $ws == "DP-1" ]; then
echo "                                                                                                   " | lolcat -i -S $num
echo ${bold}"$toi"${norm} | lolcat -S $num
echo "                                                                                                   " | lolcat -i -S $num

else
echo "                                                                                                                                      " | lolcat -i -S $num
echo ${bold}"$toi2"${norm} | lolcat -S $num
echo "                                                                                                                                      " | lolcat -i -S $num
fi

#echo -e $kin"$fig1"
#echo -e $ao"$fig2"
