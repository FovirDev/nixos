{ ... }: {
  virtualisation.oci-containers.containers."bentopdf" = {
    pull = "newer";
    image = "bentopdf/bentopdf-simple:latest";
    ports = [ "127.0.0.1:3719:8080" ];
  };
}
