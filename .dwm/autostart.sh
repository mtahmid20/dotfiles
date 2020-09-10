#!/bin/sh
xset r rate 300 50 &
numlockx &
picom -b &
dunst &
xfce4-power-manager &
nitrogen --restore &
flameshot &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
qbittorrent &
redshift &
temp_cpu() {
    CEL=$'\xc2\xb0C'
    temp=$( cat /sys/devices/virtual/thermal/thermal_zone0/temp )
    temp=`expr $temp / 1000`
    echo "$temp$CEL"
}
cal(){
    cal="$(date '+%a, %b %d')"
    echo "$cal"
}
clock() {
    clock="$(date '+%I:%M %p')"
    echo "$clock"
}
vol(){
    vol="$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')"
    echo "$vol"
}

while true; do
    xsetroot -name " CPU: $(temp_cpu) VOL: $(vol) | $(cal) - $(clock) "
    sleep 1
done &
