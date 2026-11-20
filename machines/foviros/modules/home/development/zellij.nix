{ pkgs, ... }: {
  programs.zellij = {
    enable = true;

    settings = {
      copy_command = "wl-copy";
      copy_on_select = true;
      default_layout = "compact";
      default_shell = "${pkgs.zsh}/bin/zsh";
      mouse_mode = true;
      pane_frames = false;
      scroll_buffer_size = 10000;
      session_serialization = false;
      show_release_notes = false;
      show_startup_tips = false;
      simplified_ui = true;
      theme = "catppuccin-mocha";

      keybinds = {
        _props.clear-defaults = true;
        normal._children = [
          {
            bind = {
              _args = [ "Ctrl Tab" ];
              GoToNextTab = { };
            };
          }
          {
            bind = {
              _args = [ "Ctrl Shift Tab" ];
              GoToPreviousTab = { };
            };
          }
          {
            bind = {
              _args = [ "Ctrl n" ];
              NewTab = { };
            };
          }
          {
            bind = {
              _args = [ "Ctrl w" ];
              CloseTab = { };
            };
          }
          {
            bind = {
              _args = [ "Alt Esc" ];
              SwitchToMode._args = [ "scroll" ];
            };
          }
        ];
        scroll._children = [
          {
            bind = {
              _args = [ "A" ];
              ScrollToBottom = { };
              SwitchToMode._args = [ "normal" ];
            };
          }
          {
            bind = {
              _args = [ "y" ];
              Copy = { };
              ScrollToBottom = { };
              SwitchToMode._args = [ "normal" ];
            };
          }
          {
            bind = {
              _args = [ "j" ];
              ScrollDown = { };
            };
          }
          {
            bind = {
              _args = [ "k" ];
              ScrollUp = { };
            };
          }
          {
            bind = {
              _args = [ "Ctrl u" ];
              HalfPageScrollUp = { };
            };
          }
          {
            bind = {
              _args = [ "Ctrl d" ];
              HalfPageScrollDown = { };
            };
          }
          {
            bind = {
              _args = [ "g" ];
              ScrollToTop = { };
            };
          }
          {
            bind = {
              _args = [ "G" ];
              ScrollToBottom = { };
            };
          }
          {
            bind = {
              _args = [ "e" ];
              EditScrollback = { };
              SwitchToMode._args = [ "normal" ];
            };
          }
        ];
      };
    };
  };
}
