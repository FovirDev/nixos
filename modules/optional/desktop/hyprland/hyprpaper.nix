{
  config,
  pkgs,
  ...
}:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "${config.xdg.userDirs.pictures}/Wallpaper";
          timeout = 60 * 15;
        }
      ];
    };
  };

  home = {
    packages = [ pkgs.hyprpaper ];
    file."Pictures/Wallpaper" = {
      force = true;
      recursive = true;
      source = pkgs.fetchFromGitHub {
        hash = "sha256-PLeL6pLg3+V/hUsKGLdgalzcHmdkUxA1YCY3icBoHKs=";
        owner = "Fovir-GitHub";
        repo = "wallpaper";
        rev = "30cf8276bd9b2873cd3f8c808d6dafdbf5583def";
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "hyprpaper" ];
}
