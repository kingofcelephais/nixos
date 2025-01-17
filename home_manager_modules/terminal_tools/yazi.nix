{ lib, config, ... }:

{

  options = { yazi.enable = lib.mkEnableOption "enables yazi"; };

  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      initLua = ''
        require("eza-preview"):setup()
        require("git"):setup()
        require("full-border"):setup()
      '';
      settings = {
        log = { enabled = false; };
        manager = {
          show_hidden = false;
          sort_by = "modified";
          sort_dir_first = true;
          sort_reverse = false;
        };
        opener = [{
          pdf = [{
            run = "zathura '$@'";
            block = false;
            orphan = true;
            for = "unix";
          }];
        }];
        open = [{
          prepend_rules = [{
            name = "*.pdf";
            use = "pdf";
          }];
        }];
        plugin = {
          prepend_previewers = [
            {
              name = "*/";
              run = "eza-preview";
            }
            {
              name = "*.csv";
              run = "rich-preview";
            }
            {
              name = "*.md";
              run = "rich-preview";
            }
            {
              name = "*.rst";
              run = "rich-preview";
            }
            {
              name = "*.ipynb";
              run = "rich-preview";
            }
            {
              name = "*.json";
              run = "rich-preview";
            }
          ];
          append_previewers = [{
            name = "*";
            run = "hexyl";
          }];
          prepend_fetchers = [
            {
              id = "git";
              name = "*";
              run = "git";
            }
            {
              id = "git";
              name = "*/";
              run = "git";
            }
          ];
        };
      };
      plugins = {
        eza-preview = ./yazi/eza-preview;
        full-border = ./yazi/full-border;
        hexyl = ./yazi/hexyl;
        chmod = ./yazi/chmod;
        git = ./yazi/git;
        rich-preview = ./yazi/rich-preview;
      };
      keymap = {
        input.keymap = [
          {
            run = "close";
            on = [ "<C-q>" ];
          }
          {
            run = "close --submit";
            on = [ "<Enter>" ];
          }
          {
            run = "escape";
            on = [ "<Esc>" ];
          }
          {
            run = "backspace";
            on = [ "<Backspace>" ];
          }
          {
            run = "move -1";
            on = [ "h" ];
          }
          {
            run = "move 1";
            on = [ "l" ];
          }
        ];
        manager = {
          prepend_keymap = [{
            run = "plugin chmod";
            on = [ "c" "h" ];
          }];
          keymap = [
            {
              run = "escape";
              on = [ "<Esc>" ];
            }
            {
              run = "quit";
              on = [ "q" ];
            }
            {
              run = "close";
              on = [ "<C-q>" ];
            }
            {
              run = "arrow -1";
              on = [ "k" ];
            }
            {
              run = "arrow -1";
              on = [ "<Up>" ];
            }
            {
              run = "arrow 1";
              on = [ "j" ];
            }
            {
              run = "arrow 1";
              on = [ "<Down>" ];
            }
            {
              run = "open";
              on = [ "o" ];
            }
            {
              run = "open --interactive";
              on = [ "O" ];
            }
            {
              run = "open";
              on = [ "<Enter>" ];
            }
            {
              run = "open --interactive";
              on = [ "<S-Enter>" ];
            }
            {
              run = "plugin zoxide";
              on = [ "z" ];
            }
            {
              run = "plugin fzf";
              on = [ "Z" ];
            }
            {
              run = "hidden toggle";
              on = [ "." ];
            }
            {
              run = "leave";
              on = [ "h" ];
            }
            {
              run = "enter";
              on = [ "l" ];
            }
            {
              run = "back";
              on = [ "H" ];
            }
            {
              run = "forward";
              on = [ "L" ];
            }
            {
              run = "leave";
              on = [ "<Left>" ];
            }
            {
              run = "enter";
              on = [ "<Right>" ];
            }
            {
              run = "seek -5";
              on = [ "K" ];
            }
            {
              run = "seek 5";
              on = [ "J" ];
            }
            {
              run = "tasks_show";
              on = [ "w" ];
            }
            {
              run = "search fd";
              on = [ "s" ];
            }
            {
              run = "remove";
              on = [ "d" ];
            }
            {
              run = "yank";
              on = [ "y" ];
            }
            {
              run = "yank --cut";
              on = [ "x" ];
            }
            {
              run = "paste";
              on = [ "p" ];
            }
            {
              run = "paste --force";
              on = [ "P" ];
            }
            {
              run = "create";
              on = [ "a" ];
            }
            {
              run = "rename --cursor=before_ext";
              on = [ "r" ];
            }
            {
              run = "filter --smart";
              on = [ "f" ];
            }
            # SORTING
            {
              run = [ "sort modified --reverse=no" "linemode mtime" ];
              on = [ "<Space>" "m" ];
            }
            {
              run = [ "sort modified --reverse" "linemode mtime" ];
              on = [ "<Space>" "M" ];
            }
            {
              run = [ "sort created --reverse=no" "linemode ctime" ];
              on = [ "<Space>" "c" ];
            }
            {
              run = [ "sort created --reverse" "linemode ctime" ];
              on = [ "<Space>" "C" ];
            }
            {
              run = [ "sort alphabetical --reverse=no" ];
              on = [ "<Space>" "a" ];
            }
            {
              run = [ "sort alphabetical --reverse" ];
              on = [ "<Space>" "A" ];
            }
            {
              run = [ "sort natural --reverse=no" ];
              on = [ "<Space>" "n" ];
            }
            {
              run = [ "sort natural --reverse" ];
              on = [ "<Space>" "N" ];
            }
            {
              run = [ "sort size --reverse=no" "linemode size" ];
              on = [ "<Space>" "s" ];
            }
            {
              run = [ "sort size --reverse" "linemode size" ];
              on = [ "<Space>" "N" ];
            }
            {
              run = [ "sort random --reverse=no" ];
              on = [ "<Space>" "r" ];
            }
            {
              run = "plugin eza-preview";
              on = [ "e" ];
            }
            {
              run = "plugin eza-preview toggle_ignore_command";
              on = [ "<S-e>" ];
            }
          ];
        };
      };
    };
  };
}
