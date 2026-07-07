{ ... }: {
  plugins.comment = {
    enable = true;

    settings.mappings = {
      basic = true;
      extra = false;
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "i"
      ];
      key = "<C-/>";
      action = ''<cmd>lua vim.api.nvim_feedkeys("gcc", "x", true)<CR>'';
      options.desc = "Toggle Line Comment";
    }
    {
      mode = "v";
      key = "<C-/>";
      action = ''<cmd>lua vim.api.nvim_feedkeys("gb", "v", true)<CR>'';
      options.desc = "Toggle Block Comment";
    }
  ];
}
