{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    remotes = [{
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    packages = [
      "io.github.zen_browser.zen"
      "md.obsidian.Obsidian"
    ];
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}

