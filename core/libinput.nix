{ pkgs, ... }:

{
  # Enable libinput
  services.xserver.libinput.enable = true;

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    libinput-gestures
    xdotool
    wmctrl
  ];

  # Configure libinput-gestures
  environment.etc."libinput-gestures.conf".text = ''
    # Pull up Rofi apps tab with four-finger swipe up
    gesture swipe up 4 rofi -show drun

    # Close active window with four-finger swipe down
    gesture swipe down 4 xdotool getactivewindow windowclose
  '';

  # Enable and start libinput-gestures service
  systemd.user.services.libinput-gestures = {
    description = "Libinput Gestures";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libinput-gestures}/bin/libinput-gestures";
      Restart = "always";
      RestartSec = 3;
    };
  };

  # Ensure libinput-gestures starts automatically
  systemd.user.services.libinput-gestures.enable = true;
}

