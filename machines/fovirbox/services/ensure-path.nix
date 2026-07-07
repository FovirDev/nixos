{ pkgs, ... }: {
  imports = [
    (import ../../../lib/ensure-path.nix {
      inherit pkgs;
      paths = import ../values/ensure-paths.nix;
      prefix = import ../values/podman-data-dir.nix;
    })
  ];
}
