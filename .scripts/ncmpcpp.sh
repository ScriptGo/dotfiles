#!/usr/bin/env bash

music_dir="$HOME/Music"
previewdir="$HOME/.ncmpcpp/previews"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/$(mpc --format %album% current | base64).png"

[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$previewname" >/dev/null 2>&1

dunstify -a "ncmpcpp" "Now Playing" "$(mpc current -f "%title% \n%artist%")" -i "$previewname"
