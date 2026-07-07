{ ... }: {
  plugins.tmux-navigator = {
    enable = true;

    keymaps =
      let
        mode = [
          "n"
          "i"
        ];
      in
      [
        {
          action = "left";
          key = "<c-h>";
          mode = mode;
        }
        {
          action = "down";
          key = "<c-j>";
          mode = mode;
        }
        {
          action = "up";
          key = "<c-k>";
          mode = mode;
        }
        {
          action = "right";
          key = "<c-l>";
          mode = mode;
        }
      ];
  };
}
