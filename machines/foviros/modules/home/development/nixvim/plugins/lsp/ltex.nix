{ ... }: {
  plugins.lsp.servers.ltex = {
    enable = true;

    filetypes = [
      "bibtex"
      "latex"
      "markdown"
      "tex"
    ];
    settings = {
      checkFrequency = "save";
      enabled = [
        "bibtex"
        "latex"
        "markdown"
        "tex"
      ];
    };
  };
}
