{ ... }: {
  plugins.lsp.servers.rust_analyzer = {
    enable = true;

    installCargo = false;
    installRustc = false;
    installRustfmt = false;
    settings.cargo.allFeatures = true;
  };
}
