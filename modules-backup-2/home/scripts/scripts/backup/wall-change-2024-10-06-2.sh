#!/usr/bin/env bash

# Directory of your NixOS configuration
CONFIG_DIR="/home/neo/nixos-config"

# GitHub repository URL
REPO_URL="https://github.com/anentree/modules.git"

# Function to push changes
push_changes() {
    cd "$CONFIG_DIR/modules" || exit
    git add .
    git commit -m "Auto-commit after successful NixOS rebuild"
    git push origin main
}

# Perform NixOS rebuild
if sudo nixos-rebuild switch --flake "$CONFIG_DIR#$1" --option show-trace true --fast; then
    echo "NixOS rebuild successful. Pushing changes..."
    push_changes
else
    echo "NixOS rebuild failed. Not pushing changes."
    exit 1
fi

