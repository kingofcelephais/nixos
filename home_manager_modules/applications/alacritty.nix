{ lib, config, ... }:

{
  options = { alacritty.enable = lib.mkEnableOption "enables alacritty"; };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.normal = {
          family = "envypn";
          style = "Regular";
        };
        font.size = 11;
        general.import = [ "~/.cache/alacritty/colors.toml" ];
        window.padding = {
          x = 3;
          y = 3;
        };
        window.opacity = 0.75;
      };
    };
  };
}
