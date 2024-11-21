{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./bootloader.nix
    ./flatpak.nix
    ./hardware.nix
    ./libinput.nix
    ./network.nix
    ./nh.nix
    ./onedrive.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
    ./xserver.nix
  ];
}
