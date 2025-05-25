{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "org.fedoraproject.MediaWriter"
      "com.github.tchx84.Flatseal"
      "net.cozic.joplin_desktop"
      "com.protonvpn.www"
    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      };
    };
    uninstallUnmanaged = true;
  };
}
