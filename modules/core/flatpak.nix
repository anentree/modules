{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "com.beavernotes.beavernotes"
      "one.ablaze.floorp"
      "org.fedoraproject.MediaWriter"
      "com.github.tchx84.Flatseal"
      "md.obsidian.Obsidian"
    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      };
    };
  };
}
