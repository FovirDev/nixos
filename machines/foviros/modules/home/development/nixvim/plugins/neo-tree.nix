{ ... }: {
  plugins.neo-tree = {
    enable = true;

    settings = {
      enable_diagnostics = true;
      enable_git_status = true;
      enable_modified_markers = true;
      use_default_mappings = false;
      close_if_last_window = true;
      popup_border_style = "rounded";
      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_by_name = [ ".git" ];
        };
        follow_current_file = {
          enabled = true;
          leave_dirs_open = false;
        };
      };
      clipboard = {
        sync = "universal";
      };
      commands = {
        close_node_with_refresh.__raw = ''
          function(state)
            local tree = state.tree
            local node = assert(tree:get_node())
            require("neo-tree.sources.common.commands").close_node(state)
            require("neo-tree.sources.manager").refresh(state.name)
          end,
        '';
      };
      window = {
        mappings = {
          "<cr>" = "open";
          "o" = "open";
          "l" = "open";
          "r" = "rename";
          "h" = "close_node_with_refresh";
          "f" = "refresh";
          "a" = {
            command = "add";
            config = {
              show_path = "relative";
            };
          };
          "A" = "add_directory";
          "y" = "copy_to_clipboard";
          "p" = "paste_from_clipboard";
          "d" = "delete";
          "." = "toggle_hidden";
        };
      };

      event_handlers.__raw = ''
        {
          {
            event = "file_opened",
            handler = function(file_path)
              require("neo-tree").close_all()
            end
          },
        }
      '';
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      mode = "n";
      options.desc = "Toggle File Explorer";
    }
    {
      key = "<leader>E";
      action = "<cmd>Neotree filesystem reveal<cr>";
      mode = "n";
      options.desc = "Follow Current File";
    }
  ];
}
