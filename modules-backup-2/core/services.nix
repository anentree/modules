{ config, pkgs, ... }: 
{
  services = {
    avahi = { # for printing and scanning
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    keyd = {
      enable = true;
      keyboards.default.settings.main = {
              esc = "capslock";
              tab = "overload(control, tab)";
              capslock = "overload(meta, esc)";
              backslash = "overload(control, backslash)";
              enter = "overload(meta, enter)";
              rightalt = "layer(meta)";
      };
    };
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

