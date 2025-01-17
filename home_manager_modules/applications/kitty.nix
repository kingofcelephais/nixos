{ config, lib, ... }:

{
  options = { kitty.enable = lib.mkEnableOption "enables kitty"; };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "EnvyCodeR Nerd Font Mono";
        size = 11.0;
      };
      settings = {
        enable_audio_bell = false;
        scrollback_lines = 10000;
        update_check_interval = 0;
      };
      extraConfig = "include ~/.cache/kitty/colors.conf";
    };
  };
}
