{ ... }: 
{
  wayland.windowManager.hyprland = {
    settings = {  
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
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, c, workspace, empty"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, c, movetoworkspace, empty"
      ];
    };

    extraConfig = ''
      monitor=HDMI-A-1,1920x1080@74.97,0x0,1,transform,3
      monitor=DP-1,2560x1440@165,1080x0,1
      monitor=DP-2,1920x1080@165,3640x0,1          
    '';
  };
}

