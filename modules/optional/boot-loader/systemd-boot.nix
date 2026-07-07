{ lib, ... }: {
  boot.loader = {
    systemd-boot = {
      configurationLimit = lib.mkDefault 16;
      editor = true;
      enable = true;
    };
  };
}
