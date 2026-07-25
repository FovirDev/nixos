{ ... }: {
  plugins.lsp.servers.ts_ls = {
    enable = true;
    packageFallback = true;
  };
}
