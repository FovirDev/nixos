{ lib, ... }: {
  networking.networkmanager = {
    enable = true;

    dns = lib.mkForce "default";
  };
}
