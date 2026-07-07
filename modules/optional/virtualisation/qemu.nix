{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
    virt-manager
  ];
  services = {
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };
  virtualisation.libvirtd.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
