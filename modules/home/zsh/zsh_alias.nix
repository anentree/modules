{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # my custom aliases
      gpush = "cd ~/nixos-config && git add . && git commit -m $(date +%F_%T) && git pull --rebase && git push";
      nbuildd = "sudo nixos-rebuild switch --flake /home/neo/nixos-config#desktop --option show-trace true";
      nbuildl = "sudo nixos-rebuild switch --flake /home/neo/nixos-config#laptop --option show-trace true";
      ntestd = "sudo nixos-rebuild test --flake /home/neo/nixos-config#desktop --option show-trace true";
      ntestl = "sudo nixos-rebuild test --flake /home/neo/nixos-config#laptop --option show-trace true";
      
      #xdg-open
      open() {
        xdg-open "$@"
        exit
      }
      
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "codium";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      y = "yazi";
      py = "python";
      ipy = "ipython";
      icat = "kitten icat";
      dsize = "du -hs";
      pdf = "tdf";
      # open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
    };
  };
}
