{ pkgs, lib, config, ... }:

{
  options = { waybar.enable = lib.mkEnableOption "enables waybar"; };

  config = lib.mkIf config.waybar.enable {
    home.packages = with pkgs; [ waybar ];
    programs.waybar = {
      enable = true;
      settings = lib.importJSON ./waybar/settings.json;
      style = # css
        ''
          @import "../../.cache/waybar/colors-waybar.css";
          * {
              /* `otf-font-awesome` is required to be installed for icons */
              font-family: "envypn";
              font-size: 11px;
              min-height: 24px;
          }

          window#waybar {
              background-color: @background;
              border-style: solid;
              border-radius: 4px;
              border-width: 0px;
              border-color: @color5;
          }

          window#waybar.hidden {
              opacity: 0.2;
          }

          button {
          }

          /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
          button:hover {
              background: inherit;
          }

          #workspaces button {
            background-color: @background;

              color: @foreground;
          }

          #workspaces button:hover {
              background-color: @background;
              opacity: 0.75;
          }

          #workspaces button.active {
              background-color: @color5;
          }

          #workspaces button.urgent {
              background-color: @color10;
          }

          #mode {
              background-color: #64727D;
              box-shadow: inset 0 -3px #ffffff;
          }

          #clock,
          #network,
          #keyboard-state,
          #pulseaudio,
          #tray,
          #mode,
          #bluetooth,
          #mpd {
              color: @foreground;
              margin-top: 4px;
              margin-left: 4px;
              margin-right: 4px;
              margin-bottom: 0px;
              padding-top: 4px;
              padding-bottom: 4px;
              padding-left: 4px;
              padding-right: 4px;
          }

          #memory,
          #custom-quit,
          #custom-lock,
          #custom-reboot,
          #custom-power {
              background-color: @background;
              color: @foreground;
              margin-left: 4px;
              margin-right: 4px;
              margin-bottom: 0px;
              padding-left: 4px;
              padding-right: 4px;
          }

          #custom-power {
              background-color: @background;
              margin-right: 7px;
          }

          #workspaces,
          #hardware,
          #group-power {
              background-color: @background;
              color: @foreground;
              margin-bottom: 0px;
              margin-top: 4px;
          }

          #temperature {
              background-color: @color5;
              color: @foreground;
              margin-left: 4px;
              margin-bottom: 0px;
              padding-left: 4px;
              padding-right: 4px;
              padding-top: 4px;
              padding-bottom: 4px;
          }

          #temperature.critical {
              background-color: #eb4d4b;
          }

          #network.disconnected {
              background-color: #f53c3c;
          }

          #pulseaudio.muted {
              background-color: @color8;
          }

          #tray {
              background-color: @color5;
          }

          #tray > .passive {
              -gtk-icon-effect: dim;
          }

          #tray > .needs-attention {
              -gtk-icon-effect: highlight;
              background-color: #eb4d4b;
          }

          #privacy {
              padding: 0;
          }

          #privacy-item {
              padding: 0 5px;
              color: @foreground;
          }

          #privacy-item.screenshare {
              background-color: @color5;
          }

          #privacy-item.audio-in {
              background-color: @color5;
          }

          #privacy-item.audio-out {
              background-color: @color5;
          }

        '';
    };
  };
}
