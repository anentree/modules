{ inputs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    swww
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
  ];

  # These env vars go here at the top-level
  home.sessionVariables = {
    HYPRLAND_LOG = "1";
    HYPRLAND_LOG_WLR = "1";
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    systemd.enable = true;
    # enableNvidiaPatches = false;
  };
}
