{ pkgs, host, ... }: 
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 59010 59011 631 ];
      allowedUDPPorts = [ 59010 59011 631 ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
