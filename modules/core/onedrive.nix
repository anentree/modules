{ config, pkgs, ... }:

{
  services.onedrive = {
    enable = true;
    package = pkgs.onedrive;
  };

  systemd.user.services.onedrive = {
    description = "OneDrive Free Client";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      ExecStartPre = pkgs.writeShellScript "onedrive-pre-start" ''
        ${pkgs.procps}/bin/pkill onedrive || true
        ${pkgs.coreutils}/bin/sleep 2
      '';
      ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
  
  networking.firewall = {
    allowedTCPPorts = [ 443 ];  # HTTPS
    allowedUDPPorts = [ 443 ];  # QUIC
  };
  environment.systemPackages = [ pkgs.onedrive pkgs.coreutils pkgs.procps ];
}

