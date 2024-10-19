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
    nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
    thunderbird.enable = true;
    zsh.enable = true;
  };
}

