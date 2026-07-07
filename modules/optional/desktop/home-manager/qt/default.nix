{ username }: { pkgs, ... }: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      qt6Packages.qt6ct
    ];
    qt = {
      enable = true;
      style.name = "kvantum";
    };
    xdg.configFile = {
      "qt5ct/qt5ct.conf".source = ./qt5ct.conf;
      "qt6ct/qt6ct.conf".source = ./qt6ct.conf;
      "qt5ct/catppuccin-mocha-lavender.conf".source = ./catppuccin-mocha-lavender.conf;
      "qt6ct/catppuccin-mocha-lavender.conf".source = ./catppuccin-mocha-lavender.conf;
      "Kvantum/kvantum.kvconfig".source = ./kvantum.kvconfig;
      "Kvantum/catppuccin-mocha-lavender/catppuccin-mocha-lavender.kvconfig".source =
        ./catppuccin-mocha-lavender/catppuccin-mocha-lavender.kvconfig;
      "Kvantum/catppuccin-mocha-lavender/catppuccin-mocha-lavender.svg".source =
        ./catppuccin-mocha-lavender/catppuccin-mocha-lavender.svg;
    };
  };
}
