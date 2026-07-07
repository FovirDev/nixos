{
  lib,
  pkgs,
  ...
}:
with lib;
{
  boot = {
    kernelParams = [ "zfs_force=1" ];
    zfs = {
      forceImportRoot = false;
      devNodes = "/dev/disk/by-path";
      package = pkgs.zfs_unstable;
    };
  };
  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
    };
    trim = {
      enable = false;
      interval = "weekly";
    };
    autoSnapshot.enable = true;
  };
  systemd.services = {
    zfs-share.enable = mkForce false;
    zfs-zed.enable = mkForce false;
  };
  zramSwap.enable = true;
}
