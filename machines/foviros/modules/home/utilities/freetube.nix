{ ... }: {
  programs.freetube = {
    enable = true;

    settings = {
      allowDashAv1Formats = true;
      baseTheme = "catppuccinMocha";
      defaultQuality = 2160;
      externalPlayer = "mpv";
      useSponsorBlock = true;
    };
  };
}
