{ ... }: {
  virtualisation.oci-containers.containers."rsshub" = {
    autoStart = true;
    environment = import ../values/rsshub-env.nix;
    image = "diygod/rsshub:latest";
    ports = [ "127.0.0.1:1200:1200" ];
  };
}
