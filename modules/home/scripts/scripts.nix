{pkgs, ...}: let
  wall-change = pkgs.writeShellScriptBin "wall-change" (builtins.readFile ./scripts/wall-change.sh);
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" (builtins.readFile ./scripts/wallpaper-picker.sh);
  
  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  music = pkgs.writeShellScriptBin "music" (builtins.readFile ./scripts/music.sh);
  lofi = pkgs.writeScriptBin "lofi" (builtins.readFile ./scripts/lofi.sh);
  
  toggle_blur = pkgs.writeScriptBin "toggle_blur" (builtins.readFile ./scripts/toggle_blur.sh);
  toggle_oppacity = pkgs.writeScriptBin "toggle_oppacity" (builtins.readFile ./scripts/toggle_oppacity.sh);
  toggle_waybar = pkgs.writeScriptBin "toggle_waybar" (builtins.readFile ./scripts/toggle_waybar.sh);
  toggle_float = pkgs.writeScriptBin "toggle_float" (builtins.readFile ./scripts/toggle_float.sh);
  
  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);
  
  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);
  
  shutdown-script = pkgs.writeScriptBin "shutdown-script" (builtins.readFile ./scripts/shutdown-script.sh);
  
  show-keybinds = pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./scripts/keybinds.sh);
  
  vm-start = pkgs.writeScriptBin "vm-start" (builtins.readFile ./scripts/vm-start.sh);

  ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);
  
  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ./scripts/screenshot.sh);
  
  rofi-power-menu = pkgs.writeScriptBin "rofi-power-menu" (builtins.readFile ./scripts/rofi-power-menu.sh);
  power-menu = pkgs.writeScriptBin "power-menu" (builtins.readFile ./scripts/power-menu.sh);
  
  nbuildpush = pkgs.writeScriptBin "nbuildpush" (builtins.readFile ./scripts/nbuildpush.sh);
  nbuildpush-force = pkgs.writeScriptBin "nbuildpush-force" (builtins.readFile ./scripts/nbuildpush-force.sh);
  resize-sws = pkgs.writeScriptBin "resize-sws" (builtins.readFile ./scripts/resize-sws.sh);
  
in {
  home.packages = with pkgs; [
    wall-change
    wallpaper-picker
    
    runbg
    music
    lofi
  
    toggle_blur
    toggle_oppacity
    toggle_waybar
    toggle_float

    maxfetch

    compress
    extract

    shutdown-script
    
    show-keybinds

    vm-start

    ascii

    record

    screenshot

    rofi-power-menu
    power-menu
    
    nbuildpush
    nbuildpush-force
    resize-sws
  ];
}
