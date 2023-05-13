#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 100 &
feh --bg-fill ~/Desktop/cyberpunk_city.jpg & 
xset r rate 200 50 &

xfce4-power-manager &
# /usr/lib/xfce4/notifyd/xfce4-notifyd &


picom &
volumeicon &
nm-applet &

~/.config/suckless/dwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
