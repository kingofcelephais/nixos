{ lib, config, ... }:

{
  options = { hyprlock.enable = lib.mkEnableOption "enables hyprlock"; };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 30;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [{
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }];

        input-field = [{
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "$foreground";
          inner_color = "$color2";
          outer_color = "$color3";
          outline_thickness = 5;
          shadow_passes = 2;
        }];

        source = [ "~/.cache/hypr/colors-hyprland.conf" ];
      };

    };
  };
}
