{ ... }: {
  programs.alacritty = {
    enable = true;
    theme = "modus_vivendi";
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal.family = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };
      window = {
        dynamic_padding = true;
        decorations = "None";
      };
    };
  };
}
