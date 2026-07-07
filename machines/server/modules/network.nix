{ lib, ... }: {
  networking = {
    useDHCP = lib.mkDefault false;
    interfaces.eth0 = {
      ipv4 = {
        addresses = [
          {
            address = "1.1.1.1";
            prefixLength = 24;
          }
        ];
      };
      ipv6 = {
        addresses = [
          {
            address = "a:a:a:a:a:a";
            prefixLength = 64;
          }
        ];
      };
    };
    defaultGateway = {
      address = "1.1.1.1";
      interface = "eth0";
    };
    defaultGateway6 = {
      address = "a:a:a:a:a:a";
      interface = "eth0";
    };
  };
}
