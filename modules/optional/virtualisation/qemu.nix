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
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
