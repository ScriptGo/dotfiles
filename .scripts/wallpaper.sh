#!/usr/bin/env bash

swww-daemon
while true; do
    DIR=$HOME/Pictures/wallpaper
    PICS=($(ls ${DIR}))
    RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}
    swww img ${DIR}/"${RANDOMPICS}" --transition-fps 30 --transition-type random --transition-duration 3
    sleep 60
done
