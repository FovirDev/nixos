{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.restic ];
  imports = [ ../values/restic-conf.nix ];
}
