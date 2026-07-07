{ ... }: {
  plugins.vim-matchup = {
    enable = true;

    treesitter = {
      enable = true;
      disable_virtual_text = true;
    };
  };
}
