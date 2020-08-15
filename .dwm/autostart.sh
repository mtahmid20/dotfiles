#!/bin/sh
xset r rate 300 50 &
numlockx &
wal -R &
nitrogen --restore &
picom -b &
dunst &
thunar --daemon &
xfce4-power-manager &
flameshot &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
qbittorrent &
redshift &
temp_cpu() {
    CEL=$'\xc2\xb0C'
    temp=$( cat /sys/devices/virtual/thermal/thermal_zone0/temp )
    temp=`expr $temp / 1000`
    echo -e "$temp$CEL"
}
clock(){
    clock="$(date +"%a, %b %d -%l:%M %p")"
    echo -e "$clock"
}


vol(){
    vol="$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')"
    echo -e "$vol"
}

while true; do
    xsetroot -name " CPU: $(temp_cpu) VOL: $(vol) | $(clock) | tahmid  "
    sleep 1
done &
