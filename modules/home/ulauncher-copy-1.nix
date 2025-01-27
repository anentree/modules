{ pkgs, ... }: 
{
  home.packages = with pkgs; [ 
    ulauncher 
    fd  # For better file searching
    ripgrep  # For content searching
  ];
  
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
    "show-indicator-icon": false,
    "show-recent-apps": false,
    "terminal-command": "",
    "theme-name": "dark",
    "window-width": 800,
    "window-height": 480,
    "window-x-align": "center",
    "window-y-align": "center",
    "window-background-transparency": 0,
    "hide-window-on-focus-loss": true
  }
  "extensions": {
    "com.github.brpaz.ulauncher-file-search": {
      "id": "com.github.brpaz.ulauncher-file-search",
      "url": "https://github.com/brpaz/ulauncher-file-search",
      "updated_at": "2023-12-29T00:00:00.000000",
      "last_commit": "master"
    }
  }
'';

  xdg.configFile."ulauncher/extensions.json".text = ''
  {
    "com.github.brpaz.ulauncher-file-search": {
      "id": "com.github.brpaz.ulauncher-file-search",
      "url": "https://github.com/brpaz/ulauncher-file-search",
      "updated_at": "2023-12-29T00:00:00.000000",
      "last_commit": "master"
    }
  }
  '';
  
  xdg.configFile."ulauncher/ext_preferences/com.github.brpaz.ulauncher-file-search.json".text = ''
  {
    "base_dir": {
      "value": "~"
    },
    "terminal_emulator": {
      "value": "alacritty"
    }
  }
  '';

  # Add GTK styling to remove border
  xdg.configFile."ulauncher/user-themes/custom/gtk.css".text = ''
    window {
      border: none;
      border-radius: 8px;
      background-color: transparent;
    }
    
    .app {
      border: none;
      background-color: #1D2021;
      border-radius: 8px;
    }
    
    .input {
      background-color: #282828;
      border: none;
      box-shadow: none;
      color: #FBF1C7;
    }
    
    .result-box {
      background: none;
      border: none;
    }
    
    .selected {
      background-color: #3C3836;
      border-radius: 4px;
    }
'';
}
