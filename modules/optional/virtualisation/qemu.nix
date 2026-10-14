{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
    virt-manager
    virtiofsd
  ];
  services = {
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
