{ pkgs, ... }: {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;

    defaultCacheTtl = import ../../../values/gpg-agent-cache-ttl.nix;
    enableZshIntegration = true;
    maxCacheTtl = import ../../../values/gpg-agent-cache-ttl.nix;
    pinentry = {
      package = pkgs.pinentry-tty;
      program = "pinentry-tty";
    };
  };
}
