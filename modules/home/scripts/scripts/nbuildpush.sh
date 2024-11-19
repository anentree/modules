#!/usr/bin/env bash

nbuildpush() {
    # Directory of your NixOS configuration
    CONFIG_DIR="/home/neo/nixos-config"
    MODULES_DIR="$CONFIG_DIR/modules"

    # Perform NixOS rebuild
    if sudo nixos-rebuild switch --flake "$CONFIG_DIR#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."

        # Push nixos-config
        cd "$CONFIG_DIR" || exit
        git add .
        git commit -m "Auto-commit after successful NixOS rebuild"
        git push origin main

        # Push modules
        cd "$MODULES_DIR" || exit
        if [ -d .git ]; then
            git add .
            git commit -m "Auto-commit modules after successful NixOS rebuild"
            git push origin main
        else
            echo "Warning: $MODULES_DIR is not a git repository. Skipping push."
        fi

        echo "All changes pushed successfully."
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}

nbuildpush "$@"

