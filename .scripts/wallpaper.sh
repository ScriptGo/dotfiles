#!/usr/bin/env bash

sleep 10
DIR="$HOME/Pictures/wallpaper"

while true; do
    PICS=("$DIR"/*)
    RANDOMPIC="${PICS[RANDOM % ${#PICS[@]}]}"
    swww img "$RANDOMPIC" --transition-fps 30 --transition-type random --transition-duration 3
    sleep 120
done
