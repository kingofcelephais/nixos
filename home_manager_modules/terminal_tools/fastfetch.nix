{ lib, config, ... }:

{
  options = { fastfetch.enable = lib.mkEnableOption "enables fastfetch"; };

  config = lib.mkIf config.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = { source = "nixos"; };
        display = {
          separator = " -> ";
          constants = [ "──────────────────────────────" ];
        };
        modules = [
          {
            type = "custom";
            format = "┌{$1}{$1}┐";
            outputColor = "90";
          }
          {
            type = "title";
            keyWidth = 10;
          }
          {
            type = "custom";
            format = "└{$1}{$1}┘";
            outputColor = "90";
          }
          {
            type = "custom";
            format = "┌{$1}{$1}┐";
            outputColor = "90";
          }
          {
            type = "os";
            key = "{icon} OS";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "│ ├󰏖";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "│ └";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = " DE/WM";
            keyColor = "blue";
          }
          {
            type = "lm";
            key = "│ ├󰧨";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "│ ├󰉼";
            keyColor = "blue";
          }
          {
            type = "icons";
            key = "│ ├󰀻";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "wallpaper";
            key = "│ └󰸉";
            keyColor = "blue";
          }
          {
            type = "host";
            key = "󰌢 PC";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "│ ├󰻠";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "│ ├󰍛";
            keyColor = "green";
          }
          {
            type = "disk";
            key = "│ ├";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "│ ├󰑭";
            keyColor = "green";
          }
          {
            type = "uptime";
            key = "│ ├󰅐";
            keyColor = "green";
          }
          {
            type = "display";
            key = "│ └󰍹";
            keyColor = "green";
          }
          {
            type = "custom";
            format = "└{$1}{$1}┘";
            outputColor = "90";
          }
          "break"
        ];
      };
    };
  };
}
