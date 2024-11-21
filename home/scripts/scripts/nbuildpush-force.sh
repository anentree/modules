#!/usr/bin/env bash

nbuildpush-force() {
    # Main config directory containing flake.nix
    FLAKE_DIR="/home/neo/nixos-config"
    # Modules directory for git operations
    MODULES_DIR="/home/neo/nixos-config/modules"

    # Perform NixOS rebuild using the main config directory
    if sudo nixos-rebuild switch --flake "$FLAKE_DIR#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."
        cd "$MODULES_DIR" || exit
        git add .
        git commit -m "Auto-commit after successful NixOS rebuild"
        git push -f origin main
        echo "Changes pushed successfully."
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}

nbuildpush-force "$@"

