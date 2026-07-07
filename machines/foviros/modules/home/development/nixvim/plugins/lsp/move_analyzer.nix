{ pkgs, ... }: {
  plugins.lsp.servers.move_analyzer = {
    enable = true;

    cmd = [ "${pkgs.sui}/bin/move-analyzer" ];
    filetypes = [ "move" ];
    package = pkgs.sui;
    rootMarkers = [
      "Move.toml"
      ".git"
    ];
  };
}
