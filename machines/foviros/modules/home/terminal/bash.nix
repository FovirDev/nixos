{ pkgs, ... }: {
  home.packages = with pkgs; [
    bash-completion
    nix-bash-completions
  ];

  programs.bash = {
    enable = true;

    package = pkgs.bash;
    enableCompletion = true;
    initExtra = ''
      set -o vi
    '';
    shellAliases = {
      ls = "eza -alF --color=always --group --group-directories-first --icons=always"; # Preferred listing.
      la = "eza -a --color=always --group-directories-first --icons=always"; # All files and dirs.
      ll = "eza -l --color=always --group-directories-first --icons=always"; # Long format.
      lt = "eza -aT --color=always --group-directories-first --icons=always"; # Tree listing.
      open = "xdg-open"; # Open.
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit --verbose";
      gs = "git switch";
      gp = "git push --all";
      gd = "git diff";
      gb = "git branch";
      gm = "git merge";
      ".." = "cd ../";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
    };
  };

  home.file.".inputrc".text = ''
    "\C-h": backward-kill-word
    set completion-ignore-case on
  '';
}
