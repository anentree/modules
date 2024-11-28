#!/usr/bin/env bash

nbuildpush-force() {
    # Change to the parent directory where flake.nix exists
    cd "/home/neo/nixos-config" || exit

    # Perform NixOS rebuild from the correct directory
    if sudo nixos-rebuild switch --flake ".#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."
        # Change to modules directory for git operations
        cd "modules" || exit
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

