{ config, ... }: {
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "client";
  };

  networking.firewall.trustedInterfaces = [
    config.services.tailscale.interfaceName
  ];
}
