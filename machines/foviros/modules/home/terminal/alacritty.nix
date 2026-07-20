{ ... }: {
  programs.alacritty = {
    enable = true;
    theme = "modus_vivendi";
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };
    };
  };
}
