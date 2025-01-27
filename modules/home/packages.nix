{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048

    ## personally added
    (brave.override {
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation"
        "--ozone-platform=wayland"
      ];
    })
    deja-dup # simple backup tool
    firefox
    keyd # remaps keys. see services.nix
    libsForQt5.filelight # show disk usage and delee unused files
    libsForQt5.gwenview
    kalker # math in terminal
    jre # for librebase to work
    mission-center # system monitor
    monitor # system monitor
    neofetch
    obs-studio
    pdfarranger
    # protonvpn-gui # made into flatpak
    teams-for-linux
    zoom-us
    wlogout # for shutdown hyprland bind to work
    # for disk reading
      ntfs3g
      exfat
      btrfs-progs
      xfsprogs

    ## CLI utility
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    cliphist                          # clipboard manager
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    gtt                               # gif utility
    gtrash
    imv                               # image viewer
    killall
    lazygit
    libnotify
    man-pages	                      # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    qview                             # minimal image viewer
    ripgrep                           # grep replacement
    tldr
    unzip
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    yt-dlp-light
    xdg-utils
    xxd
    xz                                # helps compress and unzip xz files
    p7zip                             # helps unzip strange compressed files

    ## GUI Apps
    bleachbit                         # cache cleaner
    gimp
    libreoffice
    pavucontrol                       # pulseaudio volume controle (GUI)
    qalculate-gtk                     # calculator
    vlc
    zenity
    
    # Python
    python3

    inputs.alejandra.defaultPackage.${system}
  ]);
}
