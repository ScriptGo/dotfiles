#!/usr/bin/env bash

swayidle -w \
  timeout 900 "swaylock" \
  timeout 1800 "hyprctl dispatcher dpms off" \
  resume "hyprctl dispatcher dpms on" \
  before-sleep "swaylock"
