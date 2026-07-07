{ lib, ... }: {
  networking = {
    nftables.enable = true;

    firewall = {
      enable = lib.mkForce true;

      allowedTCPPorts = [ 443 ];
      allowedUDPPorts = [ 443 ];
    };
  };
}
