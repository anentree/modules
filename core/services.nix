{ config, pkgs, ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    flatpak.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
    avahi = { # for printing and scanning
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    keyd = {
      enable = true;
      keyboards = {
        default = {
          settings = {
            main = {
              capslock = "overload(meta, esc)";
              tab = "overload(control, tab)";
              compose = "meta";
              # space = "overload(control, space)";
              esc = "capslock";
              shift = "oneshot(shift)";
              rightalt = "super";
            };
          };
        };
      };
    };
  };
  services.logind.extraConfig = ''
    # don't shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}

