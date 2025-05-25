#!/usr/bin/env bash

# Takes class name and sws name as arguments
app_class="$1"
sws_name="$2"

# Toggle the special workspace
hyprctl dispatch togglespecialworkspace "$sws_name"

# Give it time to appear
sleep 0.1

# Get window IDs on the SWS with that class
win_ids=$(hyprctl clients -j | jq -r --arg class "$app_class" --arg ws "special:$sws_name" \
  '.[] | select(.class == $class and .workspace.name == $ws) | .address')

for win in $win_ids; do
  hyprctl dispatch focuswindow address:$win
  hyprctl dispatch float
  hyprctl dispatch resizeactive exact 90% 85%
  hyprctl dispatch centerwindow
done
