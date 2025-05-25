{ config, pkgs, ... }:

{
  # Enable the OneDrive service
  services.onedrive = {
    enable = true;
    package = pkgs.onedrive;
  };

  # Install the OneDrive client
  environment.systemPackages = [ pkgs.onedrive ];

  # Create a systemd user service for automatic syncing
  systemd.user.services.onedrive = {
    description = "OneDrive sync service";
    wantedBy = [ "default.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
      Restart = "on-failure";
      RestartSec = 3;
      Environment = "PATH=/run/current-system/sw/bin";
    };
  };

  # Optional: Configure OneDrive sync directory
  # Uncomment and modify the following line to set a custom sync directory
  # environment.variables.ONEDRIVE_SYNC_DIR = "/home/yourusername/OneDrive";
}

