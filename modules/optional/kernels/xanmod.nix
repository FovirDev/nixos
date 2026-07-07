{
  pkgs,
  lib,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;
    zfs.package = lib.mkForce pkgs.zfs;
  };
}
