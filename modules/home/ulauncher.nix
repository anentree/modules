{ pkgs, ... }: 
{
  home.packages = (with pkgs; [ ulauncher ]);

  programs.ulauncher = {
    enable = true;
    settings = {
      hotkey-show-app = "<Super>space";
      show-indicator-icon = false;
      show-recent-apps = "5";
      clear-previous-query = true;
      max-search-items = 15;
      theme-name = "dark";
      render-on-screen = "mouse-pointer-monitor";
      show-tray-icon = false;
      launch-at-login = true;
      disable-desktop-filters = false;
      grab-mouse-pointer = true;
    };
    extraPreferences = {
      "blacklisted-desktop-dirs" = "/usr/share/locale:/usr/share/app-install:/usr/share/kservices5:/usr/share/fk5:/usr/share/kservicetypes5:/usr/share/applications/screensavers:/usr/share/kde4:/usr/share/mimelnk";
      "disable-window-shadow" = "true";
      "terminal-command" = "${pkgs.alacritty}/bin/alacritty -e";
      "webview-browser" = "${pkgs.firefox}/bin/firefox";
    };
  };

  systemd.user.services.ulauncher = {
    Unit = {
      Description = "Ulauncher application launcher";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}

