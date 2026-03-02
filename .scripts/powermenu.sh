#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
# Current Theme
theme="$HOME/.config/rofi/power"

# CMDs
lastlogin="$(last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7)"
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
lock="  Lock"
logout="  Logout"
reboot="  Restart"
shutdown="  Shutdown"

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "  $USER" \
        -theme ${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
    rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
        -theme-str 'mainbox {children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 2; lines: 1;}' \
        -theme-str 'element-text {horizontal-align: 0.5;}' \
        -theme-str 'textbox {horizontal-align: 0.5;}' \
        -theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    if [[ $1 == '--shutdown' ]]; then
        systemctl poweroff
    elif [[ $1 == '--reboot' ]]; then
        systemctl reboot
    elif [[ $1 == '--logout' ]]; then
        if [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
            hyprctl dispatch exit
        fi
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
    run_cmd --shutdown
    ;;
$reboot)
    run_cmd --reboot
    ;;
$lock)
    hyprlock
    ;;
$logout)
    run_cmd --logout
    ;;
esac
