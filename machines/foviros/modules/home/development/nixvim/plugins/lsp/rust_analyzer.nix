{ pkgs, ... }: {
  extraPackages = [ pkgs.clippy ];

  plugins.lsp.servers.rust_analyzer = {
    enable = true;

    packageFallback = true;
    installCargo = false;
    installRustc = false;
    installRustfmt = false;
    settings = {
      cargo.allFeatures = true;
      check.command = "clippy";
    };
  };
}
