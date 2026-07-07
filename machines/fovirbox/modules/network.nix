{ lib, ... }: {
  networking = {
    useDHCP = lib.mkForce false;
    interfaces.ens3 = import ../values/interfaces.nix;
    defaultGateway = {
      address = import ../values/ipv4-gateway-address.nix;
      interface = "ens3";
    };
    defaultGateway6 = {
      address = import ../values/ipv6-gateway-address.nix;
      interface = "ens3";
    };
  };
}
