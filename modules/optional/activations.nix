{
  config,
  lib,
  ...
}:
{
  home.activation = {
    createLocalBin = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p ${config.home.homeDirectory}/.local/bin
    '';
    createProjects = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p $HOME/Projects
    '';
  };
}
