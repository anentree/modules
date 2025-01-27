#!/usr/bin/env bash

nbuildpush() {
    # Directory of your NixOS configuration
    CONFIG_DIR="/home/neo/nixos-config/modules"

    # Perform NixOS rebuild
    if sudo nixos-rebuild switch --flake "/home/neo/nixos-config#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."
        cd "$CONFIG_DIR" || exit
        git add .
        git commit -m "Auto-commit after successful NixOS rebuild"
        git push origin main
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}

nbuildpush "$@"

