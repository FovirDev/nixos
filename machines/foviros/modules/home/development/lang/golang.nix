{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    (lib.hiPrio gopls)
    go
    golangci-lint
    gotools
    govulncheck
  ];
}
