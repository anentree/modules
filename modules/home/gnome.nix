{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    evince                                        # pdf
    file-roller                                   # archive
    gnome-disk-utility
    gnome-text-editor                             # gedit
<<<<<<< HEAD
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
    nautilus                                      # file manager
=======
    nautilus                                      # file manager
    sushi
    # scanner
      simple-scan
      sane-backends
      gnome-control-center
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
  ]);

  dconf.settings = {
    "org/gnome/TextEditor" = {
      custom-font = "FiraCode Nerd Font 15";
      highlight-current-line = true;
      indent-style = "space";
      restore-session = false;
      show-grid = false;
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      style-variant = "dark";
      tab-width = "uint32 4";
      use-system-font = false;
      wrap-text = false;
    };
  };
}
