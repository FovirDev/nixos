{ pkgs, ... }:
let
  polaris-path = "${import ../values/podman-data-dir.nix}/polaris";
in
{
  virtualisation.oci-containers.containers."polaris" = {
    autoStart = true;
    image = "registry.gitlab.com/connectical/container/polaris";
    ports = [ "127.0.0.1:5050:5050" ];
    volumes = [
      "${import ../values/polaris-music-path.nix}:/music"
      "${polaris-path}/data:/var/lib/polaris"
    ];
  };

  systemd.services.create-polaris-dirs = {
    wantedBy = [ "multi-user.target" ];
    before = [ "podman.service" ];
    description = "Create directories of polaris.";
    path = [ pkgs.zfs ];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
      ExecStart = [ "${pkgs.coreutils}/bin/install -d -o 100 ${polaris-path}/data" ];
    };
  };
}
