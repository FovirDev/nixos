{ ... }: {
  programs.direnv = {
    enable = true;

    enableZshIntegration = true;
    loadInNixShell = true;
  };
}
