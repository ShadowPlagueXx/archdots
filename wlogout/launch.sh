#!/usr/bin/env bash

# Ask for confirmation
cdialog() {
    yad --title='Confirm?' --center --fixed --undecorated --button=Yes:0 --button=No:1 --text="Are you sure $1?" --text-align=center --align=center --justify=center --buttons-layout=center
}

cdialog "$1"

if [[ "$?" == 0 ]]; then
    sleep 0.25s
    if [[ "$1" == 'shutdown' ]]; then
        systemctl poweroff
    elif [[ "$1" == 'reboot' ]]; then
        systemctl reboot
    elif [[ "$1" == 'hibernate' ]]; then
        systemctl systemctl hibernate
    elif [[ "$1" == 'lock' ]]; then
        ~/.scripts/lock
    elif [[ "$1" == 'suspend' ]]; then
        sleep 0.5s
        systemctl suspend
    elif [[ "$1" == 'logout' ]]; then
        hyprctl dispatch exit none
    fi
else
    exit
fi
