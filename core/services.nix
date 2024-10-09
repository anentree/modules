{ config, pkgs, ... }: 
{
  services = {
    avahi = { # for printing and scanning
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.enable = true;
    flatpak.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    keyd = {
      enable = true;
      keyboards.default.settings.main = {
              capslock = "overload(meta, esc)";
              compose = "meta";
              esc = "capslock";
              rightalt = "meta";
              tab = "overload(control, tab)";
              # space = "overload(control, space)";
              # shift = "oneshot(shift)";
      };
    };
    onedrive.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  };
  services.logind.extraConfig = ''
    # don't shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}

