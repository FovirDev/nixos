{ ... }: {
  plugins.persistence = {
    enable = true;
    autoLoad = true;

    settings.need = 2;
  };

  keymaps = [
    {
      action = ''<cmd>lua require("persistence").load({ last = true })<CR>'';
      mode = "n";
      key = "<leader>rs";
      options.desc = "[R]estore [S]ession";
    }
  ];
}
