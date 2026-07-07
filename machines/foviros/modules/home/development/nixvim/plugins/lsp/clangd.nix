{ ... }: {
  plugins.lsp.servers.clangd = {
    enable = true;

    cmd = [
      "clangd"
      "--clang-tidy"
    ];
  };
}
