{ pkgs, inputs, username, host, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      programs.home-manager.enable = true;
      imports = 
        if (host == "desktop") then 
          [ ./../home/default.desktop.nix ]
        else if (host == "laptop") then
          [ ./../home/default.laptop.nix ]
        else [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
        sessionVariables = { # added for floorp to be compatible with onedrive package
          MOZ_ENABLE_WAYLAND = "1";
          MOZ_USE_XINPUT2 = "1";
          XDG_CURRENT_DESKTOP = "Hyprland";
        };
      };
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ 
      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
