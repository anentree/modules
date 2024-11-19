#!/usr/bin/env bash

nbuildpush-force() {    # Changed function name to match script
    # Directory of your NixOS configuration
    CONFIG_DIR="/home/neo/nixos-config"

    # Perform NixOS rebuild
    if sudo nixos-rebuild switch --flake "$CONFIG_DIR#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."
        cd "$CONFIG_DIR" || exit
        git add .
        git commit -m "Auto-commit after successful NixOS rebuild"
        git push -f origin main
        echo "Changes pushed successfully."
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}

nbuildpush-force "$@"   # Changed to match function name

