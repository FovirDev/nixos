{ ... }: {
  environment.etc = {
    "caddy/self-sign.crt" = {
      mode = "0755";
      text = import ../values/caddy-self-sign-crt.nix;
    };
    "caddy/self-sign.key" = {
      mode = "0755";
      text = import ../values/caddy-self-sign-key.nix;
    };
  };

  services.caddy = {
    enable = true;

    logDir = "/var/log/caddy";
    logFormat = ''
      output file /var/log/caddy/caddy.log {
        roll_size 10MiB
        roll_keep 10
      }
      format json
    '';
    globalConfig = ''
      auto_https disable_certs
      servers {
        max_header_size 10240MB
      }
    '';
    virtualHosts = import ../values/caddy-virtual-hosts.nix;
  };
}
