{ ... }: {
  plugins.lsp.servers.buf_ls = {
    enable = true;
    packageFallback = true;
  };
}
