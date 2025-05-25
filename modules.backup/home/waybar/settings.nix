{ host, ... }:
let custom = {
  font = "JetBrainsMono Nerd Font";
  font_size = "18px";
  font_weight = "bold";
  text_color = "#FBF1C7";
  background_0 = "#1D2021";
  background_1 = "#282828";
  border_color = "#928374";
  red = "#CC241D";
  green = "#98971A";
  yellow = "#FABD2F";
  blue = "#458588";
  magenta = "#B16286";
  cyant = "#689D6A";
  orange = "#D65D0E";
  opacity = "1";
  indicator_height = "2px";
};
in 
{
  _module.args.custom = custom;
  programs.waybar.settings.mainBar = with custom; {
    position= "bottom";
    layer= "top";
    height= 30;
    margin-top= 0;
    margin-bottom= 0;
    margin-left= 0;
    margin-right= 0;
    modules-left= [
        "custom/launcher" 
        "hyprland/workspaces"
        "tray"
    ];
    modules-center= [
        "clock"
    ];
    modules-right= [
        "cpu"
        "memory"
        (if (host == "desktop") then "disk" else "")
        "pulseaudio" 
        "network"
        "battery"
        "custom/notification"
    ];
    clock = {
      format = if (host == "desktop") 
         then "{:%a, %b %d, %I:%M}" 
         else "{:%b %d, %I:%M}";
      tooltip = true;
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "month";
        format = {
          months = "<span color='${blue}'><b>{}</b></span>";
          days = "<span color='${text_color}'>{}</span>";
          weeks = "<span color='${orange}'><b>W{}</b></span>";
          weekdays = "<span color='${yellow}'><b>{}</b></span>";
          today = "<span color='${green}'><b><u>{}</u></b></span>";
        };
      };
      actions = {
        on-click = "shift_down";
        on-click-right = "shift_up";
      };
    };
    "hyprland/workspaces"= {
        active-only= false;
        disable-scroll= true;
        format = "{icon}";
        on-click= "activate";
        format-icons = if (host == "desktop")
          then {
            "1" = "1A";
            "2" = "2A";
            "3" = "3B";
            "4" = "4B";
            "5" = "5C";
            "6" = "6C";
          }
          else {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          }; 
             
        persistent-workspaces = if (host == "desktop")
          then {
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
            "5"= [];
            "6"= [];
          }
          else {
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
          };
    };
    cpu= {
        format= "<span foreground='${green}'> </span> {usage}%";
        # format-alt= "<span foreground='${green}'> </span> {avg_frequency} GHz";
        interval= 2;
        on-click= "io.missioncenter.MissionCenter";
        # I couldn't get this to work despite honest effort on-click= "io.missioncenter.MissionCenter";
    };
    memory= {
        format= "<span foreground='${cyant}'>󰟜 </span>{}%";
        format-alt= "<span foreground='${cyant}'>󰟜 </span>{used} GiB"; # 
        interval= 2;
    };
    disk = {
        # path = "/";
        format = "<span foreground='${orange}'>󰋊 </span>{percentage_used}%";
        interval= 60;
        on-click= "gnome-disks";
    };
    network = {
        format-wifi = "<span foreground='${magenta}'> </span> {signalStrength}%";
        format-ethernet = "<span foreground='${magenta}'>󰀂 </span>";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "<span foreground='${magenta}'>󰖪 </span>";
    };
    tray= {
        icon-size= 20;
        spacing= 8;
    };
    pulseaudio = {
        format= "{icon} {volume}%";
        format-muted= "<span foreground='${blue}'> </span> {volume}%";
        format-icons= {
            default= ["<span foreground='${blue}'> </span>"];
        };
        scroll-step= 5;
        on-click= "pavucontrol";
    };
    battery = {
        format = "<span foreground='${yellow}'>{icon}</span> {capacity}%";
        format-icons = [" " " " " " " " " "];
        format-charging = "<span foreground='${yellow}'> </span>{capacity}%";
        format-full = "<span foreground='${yellow}'> </span>{capacity}%";
        format-warning = "<span foreground='${yellow}'> </span>{capacity}%";
        interval = 5;
        states = {
            warning = 10;
        };
        format-time = "{H}h{M}m";
        tooltip = true;
        tooltip-format = "{time}";
    };
    "custom/launcher"= {
        format= "";
        on-click= "rofi -show drun";
        on-click-right= "wallpaper-picker"; 
        tooltip= "false";
    };
    "custom/notification" = {
        tooltip = false;
        format = "{icon} ";
        format-icons = {
            notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            none = "  <span foreground='${red}'></span>";
            dnd-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            dnd-none = "  <span foreground='${red}'></span>";
            inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            inhibited-none = "  <span foreground='${red}'></span>";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='${red}'></span>";
            dnd-inhibited-none = "  <span foreground='${red}'></span>";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
    };
  };
}
