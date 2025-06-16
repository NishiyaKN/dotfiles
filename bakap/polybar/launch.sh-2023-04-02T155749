#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch first bar
polybar bar1 &

# Launch second bar, with delay so the first one has the system tray
if [[ $(xrandr -q | grep -w 'DP-1' | cut -d ' ' -f2) = 'connected' ]]; then
sleep 0.1; polybar bar2 &
fi
