{ lib, pkgs, ... }:

{
  programs = {
    dconf.enable = true;
    gnome-disks.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      # pinentryFlavor = "";
    };
    light.enable = true; # to adjust backlight. also include "video" in extraGroups in user.nix
    nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
    zsh.enable = true;
  };
}

