{inputs, username, host, ...}: 
{
  imports = [
    ./bat.nix                       # better cat command
    ./btop.nix                      # resouces monitor 
    ./discord/discord.nix           # discord with catppuccin theme
    ./fastfetch.nix                 # fetch tool
    ./floorp/floorp.nix             # firefox based browser
    ./fzf.nix                       # fuzzy finder
    ./git.nix                       # version control
    ./gnome.nix                     # gnome apps
    ./gtk.nix                       # gtk theme
    ./hyprland                      # window manager
    ./kitty.nix                     # terminal
    ./micro.nix                     # nano replacement
    ./nvim.nix                      # neovim editor
    ./packages.nix                  # other packages
    ./rofi.nix                      # launcher
    ./scripts/scripts.nix           # personal scripts
    ./spicetify.nix                 # spotify client
    ./starship.nix                  # shell prompt
    ./swaylock.nix                  # lock screen
    ./swaync/swaync.nix             # notification deamon
    ./vscodium.nix                  # vscode forck
    ./waybar                        # status bar
    ./xdg-mimes.nix                 # xdg config
    ./zsh/zsh.nix
  ];
}
