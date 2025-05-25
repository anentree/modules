{ configs, pkgs, username, ... }: 
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/${username}/nixos-config";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor # look more into this in the future. I helps with debugging.
    nvd
  ];

}
