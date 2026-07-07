{ pkgs, ... }: {
  # Syntax highlight.
  plugins.treesitter = {
    enable = true;

    folding.enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    highlight.enable = true;
    indent.enable = true;
  };
}
