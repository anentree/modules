{ config, pkgs, lib, ... }:

let
  host = config.networking.hostName;
in
{
  systemd.services.fstrim = {
    enable = false;
    wantedBy = lib.mkForce [ ];
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    keyd = {
      enable = true;
      keyboards.default.settings.main = {
        esc = "capslock";
        tab = "overload(control, tab)";
        capslock = "overload(meta, esc)";
        backslash = "overload(control, backslash)";
        enter = "overload(meta, enter)";
        # rightalt = "layer(meta)";
      };
    };
    logind.extraConfig = lib.mkMerge [
      (lib.mkIf (host == "laptop") ''
        # Don't shutdown when power button is short-pressed
        HandlePowerKey=ignore
      '')
      (lib.mkIf (host != "laptop") ''
        # Shutdown when power button is short-pressed
        HandlePowerKey=poweroff
      '')
    ];
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
    udev.extraRules = ''
      # removes sudo requirement for light
      SUBSYSTEM=="backlight", ACTION=="add", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness"
      SUBSYSTEM=="backlight", ACTION=="add", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
      '';
  };
}
