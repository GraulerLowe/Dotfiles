#!/bin/bash 
choice="$(find ~/Música -type f -name "*.mp3" | sort -n | wofi --dmenu --prompt "Play" --insensitive)" 
[ -n "${choice}" ] && mpv --no-video "${choice}" &> /dev/null &
