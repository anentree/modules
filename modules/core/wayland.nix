{ inputs, pkgs, ... }:
{
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = [ "hyprland" "gtk" ]; # sets the preferred portal backends system-wide, in the correct order, and generates /etc/xdg/xdg-desktop-portal/portals.conf
    wlr.enable = true;
    # xdgOpenUsePortal = true; # I took this out because it was messing with the portal backends
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}

