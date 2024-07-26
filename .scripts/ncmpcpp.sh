#!/usr/bin/env bash

music_dir="$HOME/Music"
previewdir="$HOME/.ncmpcpp/previews"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/$(mpc --format %album% current | base64).png"

[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$previewname" > /dev/null 2>&1

# notify-send -r 27072 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$previewname"
# dunstify -a "ncmpcpp" "Now Playing" -i "$HOME/.config/dunst/icons/music.svg" "$(mpc current -f "%title% \n%artist% - %album%")" "$previewname"

dunstify -a "ncmpcpp" "Now Playing" "$(mpc current -f "%title% \n%artist%")" -i "$previewname"
