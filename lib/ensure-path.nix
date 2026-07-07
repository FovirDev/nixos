# Ensure `prefix/paths` exist before `podman` service.
{
  pkgs,
  prefix,
  paths,
}:
let
  normalizePath =
    path:
    if builtins.isString path then
      {
        path = path;
        user = null;
      }
    else
      path;

  normalizedPaths = map normalizePath paths;

  mkdirCommands = map (p: "${pkgs.coreutils}/bin/mkdir -p ${prefix}/${p.path}") normalizedPaths;

  chownCommands = builtins.filter (cmd: cmd != null) (
    map (
      p: if p.user != null then "${pkgs.coreutils}/bin/chown ${p.user} ${prefix}/${p.path}" else null
    ) normalizedPaths
  );

  allCommands = mkdirCommands ++ chownCommands;
in
{
  systemd.services.ensure-path = {
    wantedBy = [ "multi-user.target" ];
    before = [ "podman.service" ];
    description = "Ensure paths with prefix.";
    path = with pkgs; [ zfs ];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
      ExecStart = allCommands;
    };
  };
}
