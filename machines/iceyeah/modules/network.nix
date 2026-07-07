{ lib, ... }: {
  networking.useDHCP = lib.mkForce true;
}
