#!/bin/bash
# dualsensectl is needed for this script
# git clone https://github.com/nowrep/dualsensectl.git
# sudo dnf in libudev-devel libhid-devel libdbusmenu-devel
while true;do
    R=255
    G=0
    B=0

    # From red to yellow
    while [ $G -lt 255 ];
    do
        dualsensectl lightbar $R $G $B
        G=$(($G + 1))
        echo "set lightbar to $R $G $B"
    done

    # From yellow to green
    while [ $R -gt 0 ];
    do
        dualsensectl lightbar $R $G $B
        R=$(($R - 1))
        echo "set lightbar to $R $G $B"
    done

    # From green to teal
    while [ $B -lt 255 ];
    do
        dualsensectl lightbar $R $G $B
        B=$(($B + 1))
        echo "set lightbar to $R $G $B"
    done

    # From teal to blue
    while [ $G -gt 0 ];
    do
        dualsensectl lightbar $R $G $B
        G=$(($G - 1))
        echo "set lightbar to $R $G $B"
    done

    # From blue to pink
    while [ $R -lt 255 ];
    do
        dualsensectl lightbar $R $G $B
        R=$(($R + 1))
        echo "set lightbar to $R $G $B"
    done

    # From pink to red
    while [ $B -gt 0 ];
    do
        dualsensectl lightbar $R $G $B
        B=$(($B - 1))
        echo "set lightbar to $R $G $B"
    done
done
