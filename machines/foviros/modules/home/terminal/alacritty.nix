{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    theme = "modus_vivendi";
    settings = {
      cursor = {
        style.blinking = "Never";
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
      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
        args = [
          "attach"
          "--create"
          "main"
        ];
      };
      window = {
        dynamic_padding = true;
        decorations = "None";
      };
    };
  };
}
