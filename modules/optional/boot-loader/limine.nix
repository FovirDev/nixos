{ lib, ... }: {
  boot.loader.limine = {
    biosSupport = true;
    efiInstallAsRemovable = true;
    efiSupport = true;
    enable = true;
    maxGenerations = lib.mkDefault 3;
    partitionIndex = 1;
  };
}
