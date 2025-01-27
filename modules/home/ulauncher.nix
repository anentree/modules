{ pkgs, ... }: 
{
  home.packages = (with pkgs; [ ulauncher ]);
  
  systemd.user.services.ulauncher = {
    Unit = {
      Description = "Linux Application Launcher";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
      Restart = "always";
      Environment = [
        "GDK_BACKEND=wayland"
        "PYTHONPATH=${pkgs.python3Packages.websocket-client}/${pkgs.python3.sitePackages}"
        "ULAUNCHER_SYSTEM_DIR=${pkgs.ulauncher}/share/ulauncher"
      ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  
  xdg.configFile."ulauncher/settings.json".text = ''
{
  "blacklisted-desktop-dirs": "/usr/share/locale:/usr/share/app-install:/usr/share/kservices5:/usr/share/fk5:/usr/share/kservicetypes5:/usr/share/applications/screensavers:/usr/share/kde4:/usr/share/mimelnk",
  "clear-previous-query": true,
  "disable-desktop-filters": false,
  "grab-mouse-pointer": false,
  "hotkey-show-app": "<Alt>space",
  "render-on-screen": "mouse-pointer-monitor",
  "show-indicator-icon": true,
  "show-recent-apps": true,
  "terminal-command": "",
  "theme-name": "dark"
}
'';
}
