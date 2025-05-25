{ ... }: 
{
  wayland.windowManager.hyprland = {
    settings = {  
      workspace = [
        "1,name:1A,monitor:DP-1"
        "2,name:2A,monitor:DP-1"
        "3,name:3B,monitor:DP-2"
        "4,name:4B,monitor:DP-2"
        "5,name:5C,monitor:HDMI-A-1"
        "6,name:6C,monitor:HDMI-A-1"
      ];

      bind = [
        # keybinds
        "$mainMod, F2, exec, pamixer -d 2" # volume down
        "$mainMod, F3, exec, pamixer -i 2" # volume up
        "$mainMod, F4, exec, pamixer -t" # volume mute

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        # "$mainMod, c, workspace, empty"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        # "$mainMod SHIFT, c, movetoworkspace, empty"
      ];
    };

    extraConfig = ''
      monitor=HDMI-A-1,1920x1080@74.97,0x0,1,transform,3
      monitor=DP-1,2560x1440@165,1080x0,1
      monitor=DP-2,1920x1080@165,3640x0,1          
    '';
  };
}

