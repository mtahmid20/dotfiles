#!/usr/bin/env bash

rofi_command="rofi -theme powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shutdown"
reboot="Restart"
lock="Lock"
suspend="Suspend"
logout="Logout"
hibernate="Hibernate"
# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$hibernate\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen --lock dim
        ;;
    $suspend)
        mpc -q pause
        systemctl suspend
        betterlockscreen --lock dim
        ;;
    $hibernate)
        mpc -q pause
        systemctl hibernate
        betterlockscreen --lock dim
        ;;
    $logout)
        killall dwm
        ;;
esac

