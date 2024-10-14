#!/usr/bin/env bash

nixos_rebuild_and_push() {
    # Directory of your NixOS configuration
    CONFIG_DIR="/home/neo/nixos-config"

    # Perform NixOS rebuild
    if sudo nixos-rebuild switch --flake "$CONFIG_DIR#$1" --option show-trace true --fast; then
        echo "NixOS rebuild successful. Pushing changes..."
        cd "$CONFIG_DIR/modules" || exit
        git add .
        git commit -m "Auto-commit after successful NixOS rebuild"
        git push origin main
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}


resize_sws() {
    # Wait for the window to appear or disappear (adjust the sleep time if needed)
    sleep 0.1
    
    if hyprctl activewindow | grep -q -E "class: (Spotify|thunderbird|teams-for-linux|kitty)"; then
       hyprctl dispatch resizeactive exact 90% 85%
       hyprctl dispatch float
       hyprctl dispatch centerwindow
    fi
}

# Check the first argument to determine which function to run
case "$1" in
    "nixos-rebuild-and-push")
        shift  # Remove the first argument
        nixos_rebuild_and_push "$@"
        ;;
    "resize-sws")
        resize_sws
        ;;
    *)
        echo "Usage: $0 [nixos-rebuild-and-push|resize-sws]"
        echo "  nixos-rebuild-and-push: Rebuild NixOS and push changes"
        echo "  resize-sws: Resize and center Spotify window"
        exit 1
        ;;
esac

