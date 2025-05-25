#!/usr/bin/env bash

resize-sws() {
    # Wait for the window to appear or disappear (adjust the sleep time if needed)
    sleep 0.01
    
    if hyprctl activewindow | grep -q -E "class: (Spotify|teams-for-linux|kitty|obsidian|discord|net.cozic.joplin_desktop)"; then
       hyprctl dispatch bringactivetotop
       hyprctl dispatch resizeactive exact 90% 85%
       hyprctl dispatch float
       hyprctl dispatch centerwindow
    fi
}

resize-sws

