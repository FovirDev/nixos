{ ... }: {
  plugins.lsp.servers.lemminx = {
    enable = true;

    filetypes = [
      "xml"
      "svg"
    ];
  };
}
