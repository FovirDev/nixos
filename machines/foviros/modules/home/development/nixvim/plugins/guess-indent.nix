{ ... }: {
  plugins.guess-indent = {
    enable = true;

    settings.auto_cmd = true;
  };

  keymaps = [
    {
      action = "<cmd>GuessIndent<CR>";
      key = "<leader>gi";
      mode = "n";
      options.desc = "[G]uess [I]ndent";
    }
  ];
}
