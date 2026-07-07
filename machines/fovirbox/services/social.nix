{ ... }: {
  virtualisation.oci-containers.containers = {
    "elk" = {
      autoStart = true;
      image = "ghcr.io/elk-zone/elk:main";
      ports = [ "127.0.0.1:1111:5314" ];
      pull = "newer";
      user = "911:911";
      volumes = [ "${import ../values/podman-data-dir.nix}/elk:/elk/data" ];
    };
    "gotosocial" = {
      autoStart = true;
      environment = import ../values/gotosocial-env.nix;
      image = "docker.io/superseriousbusiness/gotosocial:latest";
      pull = "newer";
      ports = [ "127.0.0.1:1112:8080" ];
      user = "1000:1000";
      volumes = [ "${import ../values/podman-data-dir.nix}/gotosocial/data:/gotosocial/storage" ];
    };
  };
}
