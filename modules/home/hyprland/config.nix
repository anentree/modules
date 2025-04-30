{ host, ... }: 

{ 
  imports = if (host == "desktop")
    then [ ./config.desktop.nix ]
    else [ ./config.laptop.nix ];
   
  wayland.windowManager.hyprland = {
    settings = {
      
      # autostart
      exec-once = [        
        "flatpak run net.cozic.joplin_desktop"
        "brave"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "discord"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "hyprlock"
        "kitty"
        "nm-applet &"
        "poweralertd &"
        "spotify"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "swaync &"
        "systemctl --user import-environment &"
        "teams-for-linux"
        "ulauncher --hide-window"
        "waybar &"
        "wl-clip-persist --clipboard both"
        "wl-paste --watch cliphist store &"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1; # changed from 0 to 1
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgb(98971a) rgb(cc241d) 45deg";
        "col.inactive_border" = "0x00000000";
        border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          ignore_window = true;
          range = 20;
          render_power = 3;
          offset = "0 2";
          color = "rgba(00000055)";
        };
      };
      
      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        "ALT, Escape, exec, swaylock"
        "ALT, Space, exec, ulauncher-toggle"
        "$mainMod ALT, 0, exec, poweroff"
        "$mainMod, C, togglesplit,"
        "$mainMod, D, togglespecialworkspace, discord"
        "$mainMod, D, exec, resize-sws"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, J, togglespecialworkspace, joplin"
        "$mainMod, J, exec, resize-sws"
        "$mainMod SHIFT, J, movetoworkspacesilent, special:joplin"
        "$mainMod, M, exec, qalculate-gtk"
        "$mainMod, N, exec, swaync-client -t -sw"
        "$mainMod SHIFT, O, exec, toggle_oppacity"
        "$mainMod, P, pseudo,"
        "$mainMod, Q, killactive,"
        "$mainMod, S, togglespecialworkspace, spotify"
        "$mainMod, S, exec, resize-sws"
        "$mainMod, T, togglespecialworkspace, teams" 
        "$mainMod, T, exec, resize-sws"
        "$mainMod, E, exec, nautilus"
        "$mainMod, Return, togglespecialworkspace, kitty"
        "$mainMod, Return, exec, resize-sws"
        "$mainMod SHIFT, RETURN, exec, kitty --class floatingkitty"
        "$mainMod, Space, exec, toggle_float"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod SHIFT, V, exec, vm-start"
        "$mainMod, W, exec, rofi -show drun"
        "$mainMod SHIFT, W, exec, toggle_waybar"
        "$mainMod, F1, exec, show-keybinds"
        
        # Gesture bindings
        ", swipe:3:left, workspace, e+1"
        ", swipe:3:right, workspace, e-1"
        ", swipe:4:down, exec, rofi -show drun"
        ", swipe:4:up, exec, rofi -show window"

        # screenshot
        ", Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/screenshots/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        # ",Print, exec, grimblast --notify --cursor --freeze copy area"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioMicMute,exec, pamixer --default-source -t"
        ",XF86AudioPlay,exec, playerctl play-pause --player=spotify play-pause"
        "$mainMod, slash, exec, playerctl play-pause --player=spotify play-pause"
        ",XF86AudioNext,exec, playerctl --player=spotify next"
        "$mainMod, period, exec, playerctl --player=spotify next"
        ",XF86AudioPrev,exec, playerctl --player=spotify previous"
        "$mainMod, comma, exec, playerctl --player=spotify previous"
        ",XF86AudioStop, exec, playerctl --player=spotify stop"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy"
      ];
      
      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [        
        "tile,Aseprite"
        "float,audacious"
        "float,^(joplin)$"
        "center,^(joplin)$"
        "size 90% 85%,^(joplin)$"
        "workspace special:joplin silent,^(joplin)$"
        "float,Firefox — Sharing Indicator"
        "move 0 0,Firefox — Sharing Indicator"
        "float,imv"
        "center,imv"
        "size 90% 85%,imv"
        "float,^(discord)$"
        "center,^(discord)$"
        "size 90% 85%,^(discord)$"
        "workspace special:discord silent,^(discord)$"
        "float,^(kitty)$"
        "center,^(kitty)$"
        "size 90% 85%,^(kitty)$"
        "workspace special:kitty silent,^(kitty)$"
        "float,^(floatingkitty)$"
        "center,^(floatingkitty)$"
        "size 90% 85%,^(floatingkitty)$"
        "idleinhibit focus,mpv"
        "float,mpv"
        "center,mpv"
        "size 90% 85%,mpv"
        "tile, neovide"
        "float,qalculate-gtk"
        "center,qalculate-gtk"
        "size 440 250,qalculate-gtk"
        "float,qView"
        "center,qView"
        "size 90% 85%,qView"
        "pin,rofi"
        "float,^(Spotify)$"
        "center,^(Spotify)$"
        "size 90% 85%,^(Spotify)$"
        "workspace special:spotify silent,^(Spotify)$"
        "float,^(teams-for-linux)$"
        "center,^(teams-for-linux)$"
        "size 90% 85%,^(teams-for-linux)$"
        "workspace special:teams silent,^(teams-for-linux)$"
        "float,title:^(Transmission)$"
        "float,udiskie"
        "float,^(ulauncher)$"
        "center,^(ulauncher)$"
        "size 90% 85%,^(ulauncher)$"
        "noborder, ^(ulauncher)$"
        "noshadow, ^(ulauncher)$"
        "pin, ^(ulauncher)$"
        "float,title:^(Volume Control)$"
        "float,org.gnome.NautilusPreviewer"
        "center,org.gnome.NautilusPreviewer"
        "size 90% 85%,org.gnome.NautilusPreviewer"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "opacity 1.0 override 1.0 override, class:(floorp)"
        "opacity 1.0 override 1.0 override, class:(evince)"
        "workspace 1, class:^(floorp)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(zenity)$"
        "center,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "size 850 500,title:^(File Upload)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "size 90% 85%,class:^(org.pulseaudio.pavucontrol)$"
        "center,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

    };

    extraConfig = "
      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
