{ ... }: {
  services.caddy = {
    enable = true;

    globalConfig = import ../values/caddy-config.nix;
    # globalConfig = ''
    #   servers {
    #     max_header_size 10240MB
    #   }
    # '';

    virtualHosts = {
      "example.com" = {
      };
    };
  };
}
