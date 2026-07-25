{ ... }: {
  plugins.lsp.servers.gleam = {
    enable = true;
    packageFallback = true;
  };
}
