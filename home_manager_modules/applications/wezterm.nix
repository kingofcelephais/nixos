{ ... }:

{

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      config.enable_wayland = true

      config.enable_tab_bar = false
      config.font = wezterm.font 'envypn'
      config.font_size = 10.0
      config.line_height = 1.0
      config.color_scheme = 'Custom'

      return config'';
  };

}
