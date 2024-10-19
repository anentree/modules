#!/usr/bin/env bash

nbuildpush() {
    # Directory of your NixOS configuration
    CONFIG_DIR="/home/neo/nixos-config"
    
    # GitHub repository URL
    REPO_URL="https://github.com/anentree/nixos-config.git"

    # Ensure we're in the correct directory
    cd "$CONFIG_DIR" || exit

    # Pull the latest changes from the repository
    git pull origin main

    # Perform NixOS rebuild
    if sudo nixos-rebuild switch --flake ".#$1" --option show-trace true; then
        echo "NixOS rebuild successful. Pushing changes..."
        
        # Check if there are any changes to commit
        if [[ -n $(git status -s) ]]; then
            git add .
            git commit -m "Auto-commit after successful NixOS rebuild on $(date '+%Y-%m-%d %H:%M:%S')"
            
            # Ensure the remote is set correctly
            git remote set-url origin "$REPO_URL"
            
            # Push changes to GitHub
            if git push origin main; then
                echo "Changes pushed successfully to GitHub."
            else
                echo "Failed to push changes to GitHub."
                exit 1
            fi
        else
            echo "No changes to commit."
        fi
    else
        echo "NixOS rebuild failed. Not pushing changes."
        exit 1
    fi
}

nbuildpush "$@"

