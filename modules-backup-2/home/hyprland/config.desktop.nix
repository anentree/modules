{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1,2560x1440@60,0x0,1"
      "DP-2,1920x1080@60,2560x0,1"
      "HDMI-A-1,1920x1080@60,4480x0,1"
    ];

    workspace = [
      "1,name:A1,monitor:DP-1"
      "2,name:A2,monitor:DP-1"
      "3,name:B3,monitor:DP-2"
      "4,name:B4,monitor:DP-2"
      "5,name:C5,monitor:HDMI-A-1"
      "6,name:C6,monitor:HDMI-A-1"
    ];
    
    bind = [
        # switch workspace
        "$mainMod, 1, workspace, A1"
        "$mainMod, 2, workspace, A2"
        "$mainMod, 3, workspace, B3"
        "$mainMod, 4, workspace, B4"
        "$mainMod, 5, workspace, C5"
        "$mainMod, 6, workspace, C6"
        "$mainMod, c, workspace, empty"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, A1" # movetoworkspace
        "$mainMod SHIFT, 2, movetoworkspace, A2"
        "$mainMod SHIFT, 3, movetoworkspace, B3"
        "$mainMod SHIFT, 4, movetoworkspace, B4"
        "$mainMod SHIFT, 5, movetoworkspace, C5"
        "$mainMod SHIFT, 6, movetoworkspace, C6"
        "$mainMod SHIFT, c, movetoworkspace, empty"
    ];   
  };
}

