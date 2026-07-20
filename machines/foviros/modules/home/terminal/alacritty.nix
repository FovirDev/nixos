{ ... }: {
  programs.alacritty = {
    enable = true;
    theme = "modus_vivendi";
    settings = {
      cursor = {
        vi_mode_style = {
          shape = "Block";
          blinking = "Off";
        };
      };
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal.family = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };
      keyboard = {
        bindings = [
          {
            action = "ToggleViMode";
            key = "Escape";
            mods = "Alt";
          }
          {
            action = "ToggleViMode";
            key = "A";
            mode = "Vi";
            mods = "Shift";
          }
        ];
      };
      window = {
        dynamic_padding = true;
        decorations = "None";
      };
    };
  };
}
