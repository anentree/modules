{ self, pkgs, lib, inputs, pdfstudioFlake, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [ "spotify" ];
      };
  };

  environment.systemPackages = with pkgs; [
    (import pdfstudioFlake { 
      system = "x86_64-linux"; 
      config.allowUnfree = true; 
    }).pdfstudio2024
    wget
    git
    # for printing and cups
       cups
       cups-filters
       ghostscript
  ];

  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_US.UTF-8";
    };
  };
  system.stateVersion = "24.05";
  
}
