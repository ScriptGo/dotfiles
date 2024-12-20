#!/usr/bin/env bash

swayidle -w \
    timeout 900 "swaylock" \
    timeout 2700 "hyprctl dispatcher dpms off" \
    resume "hyprctl dispatcher dpms on" \
    before-sleep "swaylock"
