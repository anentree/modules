{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048

    ## personally added
    keyd # remaps keys. see services.nix
    libsForQt5.gwenview
    kalker # math in terminal
    monitor # system monitor
    neofetch
    pdfarranger
    protonvpn-gui
    teams-for-linux
    wpsoffice
    # for disk reading
      ntfs3g
      exfat
      btrfs-progs
      xfsprogs

    ## CLI utility
    # ani-cli
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
<<<<<<< HEAD
    dconf-editor
    docfd                             # TUI multiline fuzzy document finder
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
    cliphist                          # clipboard manager
    docfd                             # TUI multiline fuzzy document finder
=======
    cliphist                          # clipboard manager
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    gtt                               # google translate TUI
    # gifsicle                          # gif utility
    gtrash                            # rm replacement, put deleted files in system trash
    # hexdump
    imv                               # image viewer
    jq                                # JSON processor
    killall
    lazygit
    libnotify
    man-pages	                      # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    # nitch                             # systhem fetch util
    # nix-prefetch-github
    openssl
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
<<<<<<< HEAD
    programmer-calculator
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
    programmer-calculator
    # qview                             # minimal image viewer
=======
    qview                             # minimal image viewer
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
    ripgrep                           # grep replacement
<<<<<<< HEAD
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
    tdf                               # cli pdf viewer
=======
    # tdf                               # cli pdf viewer
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
    tldr
    unzip
    # valgrind                          # c memory analyzer
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    # yazi                              # terminal file manager
    yt-dlp-light
    xdg-utils
    xxd

    ## GUI Apps
    bleachbit                         # cache cleaner
    gimp
    libreoffice
    pavucontrol                       # pulseaudio volume controle (GUI)
    pitivi                            # video editing
    qalculate-gtk                     # calculator
<<<<<<< HEAD
    soundwireserver
    thunderbird
||||||| parent of ba7d552 (Auto-commit after successful NixOS rebuild)
    soundwireserver                   # pass audio to android phone
    thunderbird
=======
>>>>>>> ba7d552 (Auto-commit after successful NixOS rebuild)
    vlc
    # winetricks
    # wineWowPackages.wayland
    zenity

    # C / C++
    # gcc
    # gdb
    # gnumake

    # Python
    python3

    inputs.alejandra.defaultPackage.${system}
  ]);
}
