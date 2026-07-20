{ ... }: {
  time.timeZone = "Asia/Kuala_Lumpur";

  environment = {
    localBinInPath = true;
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";

      _JAVA_AWT_WM_NONREPARENTING = 1;
      AWT_TOOLKIT = "MToolkit";
      CLUTTER_BACKEND = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      GDK_BACKEND = "wayland";
      GDK_SCALE = 1;
      GTK_USE_PORTAL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      MOZ_WEBRENDER = 1;
      NIXOS_OZONE_WL = 1;
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      SDL_HINT_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      USE_WAYLAND_GRIM = 1;

      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      INPUT_METHOD = "fcitx";
      GLFW_IM_MODULE = "fcitx";
      WLR_NO_HARDWARE_CURSORS = 1;
      IMSETTINGS_MODULE = "fcitx";
    };
  };
}
