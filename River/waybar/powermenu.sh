#!/usr/bin/env bash

choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | fuzzel --dmenu --prompt="Power Menu ❯ ")
case "$choice" in
    "Lock")
        swaylock # o reemplaza con tu herramienta de bloqueo compatible
        ;;
    "Logout")
        pkill -KILL -u "$USER"
        ;;
    "Suspend")
       systemctl suspend
        ;;
    "Reboot")
        reboot
        ;;
    "Shutdown")
        shutdown now
        ;;
esac
