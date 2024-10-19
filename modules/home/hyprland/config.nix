{ ... }: 
{
  wayland.windowManager.hyprland = {
    settings = {
      
      # autostart
      exec-once = [        
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
<<<<<<< HEAD

        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "swww init && swww img $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) --transition-type none &"

||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
        "nm-applet &"
        "wl-clip-persist --clipboard both"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "poweralertd &"
        "waybar &"
        "swaync &"
        "wl-paste --watch cliphist store &"
=======
        "hash dbus-update-activation-environment 2>/dev/null &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
        "hyprlock"
        "kitty"
        "nm-applet &"
        "poweralertd &"
        "spotify"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "swaync &"
        "systemctl --user import-environment &"
        "teams-for-linux"
        "waybar &"
        "wl-clip-persist --clipboard both"
        "wl-paste --watch cliphist store &"

        ## App auto start
<<<<<<< HEAD
        # "[workspace 1 silent] floorp"
        # "[workspace 2 silent] wezterm"
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
        # "[workspace 1 silent] floorp"
        # "[workspace 2 silent] kitty"
=======
        "[workspace 1 silent] floorp"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
      ];

      input = {
        kb_layout = "us";
        # kb_options ="caps:super"; 
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
        "col.active_border" = "rgb(98971A)";
        "col.inactive_border" = "rgb(928374)";
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

        drop_shadow = true;

        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 50;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 20;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
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
<<<<<<< HEAD
          "fadeIn,      1, 3,   fade_curve"   # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve"   # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc"  # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc"  # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          # "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          # "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
          "fadeIn,      1, 3,   fade_curve"   # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve"   # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc"  # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc"  # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
=======
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
        ];
      };

      bind = [
<<<<<<< HEAD
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, Return, exec, wezterm start --always-new-process"
        "ALT, Return, exec, [float; center] wezterm start --always-new-process"
        "$mainMod SHIFT, Return, exec, [fullscreen] wezterm start --always-new-process"
        "$mainMod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, Space, exec, toggle_float"
        "$mainMod, D, exec, rofi -show drun || pkill rofi"
        "$mainMod SHIFT, D, exec, webcord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mainMod, Escape, exec, swaylock"
        "ALT, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod, P, pseudo,"
        "$mainMod, X, togglesplit,"
        "$mainMod, T, exec, toggle_oppacity"
        "$mainMod, E, exec, nemo"
        "$mainMod SHIFT, B, exec, toggle_waybar"
        "$mainMod, C ,exec, hyprpicker -a"
        "$mainMod, W,exec, wallpaper-picker"
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, Return, exec, kitty"
        "ALT, Return, exec, kitty --title float_kitty"
        "$mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "$mainMod, B, exec, hyprctl dispatch exec '[workspace 1 silent] floorp'"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, Space, exec, toggle_float"
        "$mainMod, D, exec, rofi -show drun || pkill rofi"
        "$mainMod SHIFT, D, exec, webcord --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mainMod, Escape, exec, swaylock"
        "ALT, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, T, exec, toggle_oppacity"
        "$mainMod, E, exec, nautilus"
        "$mainMod SHIFT, B, exec, toggle_waybar"
        "$mainMod, C ,exec, hyprpicker -a"
        "$mainMod, W,exec, wallpaper-picker"
=======
        "$mainMod ALT, 0, exec, sudo systemctl poweroff"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, J, togglesplit,"
        "$mainMod, M, exec, qalculate-gtk"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
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
        "$mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "$mainMod, Space, exec, toggle_float"
        "ALT, Escape, exec, swaylock"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, power-menu"
        "$mainMod SHIFT, V, exec, vm-start"
        "$mainMod SHIFT, W, exec, toggle_waybar"
        "$mainMod, F1, exec, show-keybinds"
        
        # Gesture bindings
        ", swipe:3:left, workspace, e+1"
        ", swipe:3:right, workspace, e-1"
        ", swipe:4:down, exec, rofi -show drun"
        ", swipe:4:up, exec, rofi -show window"

        # screenshot
<<<<<<< HEAD
        ",Print, exec, screenshot --copy"
        "$mainMod, Print, exec, screenshot --save"
        "$mainMod SHIFT, Print, exec, screenshot --swappy"
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
        "$mainMod, Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --cursor --freeze copy area"
=======
        ", Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/screenshots/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        # ",Print, exec, grimblast --notify --cursor --freeze copy area"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, c, workspace, empty"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1" # movetoworkspace
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod CTRL, h, resizeactive, -80 0"
        "$mainMod CTRL, j, resizeactive, 0 80"
        "$mainMod CTRL, k, resizeactive, 0 -80"
        "$mainMod CTRL, l, resizeactive, 80 0"

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"
        "$mainMod ALT, h, moveactive,  -80 0"
        "$mainMod ALT, j, moveactive, 0 80"
        "$mainMod ALT, k, moveactive, 0 -80"
        "$mainMod ALT, l, moveactive, 80 0"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioMicMute,exec, pamixer --default-source -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        "$mainMod, slash, exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        "$mainMod, period, exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        "$mainMod, comma, exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"

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
<<<<<<< HEAD
      windowrule = [
        "float,Viewnior"
        "center,Viewnior"
        "size 1200 800,Viewnior"
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
      windowrule = [
        "float,qView"
        "center,qView"
        "size 1200 725,qView"
=======
      windowrule = [        
        "tile,Aseprite"
        "float,audacious"
        "float,Firefox — Sharing Indicator"
        "move 0 0,Firefox — Sharing Indicator"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
        "float,imv"
        "center,imv"
        "size 90% 85%,imv"
        "float,^(kitty)$"
        "center,^(kitty)$"
        "size 90% 85%,^(kitty)$"
        "workspace special:kitty silent,^(kitty)$"
        "idleinhibit focus,mpv"
        "float,mpv"
        "center,mpv"
<<<<<<< HEAD
        "tile,Aseprite"
        "size 1200 725,mpv"
        "float,audacious"
        "pin,rofi"
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
        "tile,Aseprite"
        "size 1200 725,mpv"
        "float,title:^(float_kitty)$"
        "center,title:^(float_kitty)$"
        "size 950 600,title:^(float_kitty)$"
        "float,audacious"
        "pin,rofi"
=======
        "size 90% 85%,mpv"
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
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
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
