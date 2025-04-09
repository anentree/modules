#!/usr/bin/env bash

resize-sws() {
    # Wait for the window to appear or disappear (adjust the sleep time if needed)
    sleep 0.01

    active_class=$(hyprctl activewindow | grep -oP 'class=\K[^ ]+')
    if [ "$active_class" = "Spotify" ] || [ "$active_class" = "teams-for-linux" ] || [ "$active_class" = "kitty" ] || [ "$active_class" = "net.cozic.joplin_desktop" ] || [ "$active_class" = "discord" ]; then
        hyprctl dispatch resizeactive exact 90% 85%
        hyprctl dispatch float
        hyprctl dispatch centerwindow
    fi
    }

resize-sws

