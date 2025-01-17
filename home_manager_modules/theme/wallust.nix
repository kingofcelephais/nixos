{ pkgs, lib, config, ... }:

{
  options = { wallust.enable = lib.mkEnableOption "enables wallust stuff"; };

  config = lib.mkIf config.wallust.enable {

    home.packages = with pkgs; [ wallust ];
    home.file.".config/wallust/wallust.toml".text = ''
      backend = "full"
      color_space = "lab"
      threshold = 15
      palette = "softdark"
      generation = "interpolate"
      check_contrast = true


      [templates]
      rofi = { src = 'rofi', dst = '~/.cache/rofi/colors-rofi' }
      waybar = { src = 'waybar', dst = '~/.cache/waybar/colors-waybar.css' }
      alacritty = { src = 'alacritty', dst = '~/.cache/alacritty/colors.toml' }
      hypr = { src = 'hypr', dst = '~/.cache/hypr/colors-hyprland.conf' }
      nvim = { src = "nvim", dst = '~/.cache/wallust/colors_neopywal.vim' }
      nvim2 = { src = "nvim", dst = '~/.cache/wal/colors-wal.vim' }
      gtk = { src = 'gtk', dst = '~/.config/gtk-3.0/gtk.css' }
      gtk2 = { src = 'gtk', dst = '~/.cache/gtk/my_gtk.css' }
      mako = { src = 'mako', dst = '~/.config/mako/config' }
      kitty = { src = 'kitty', dst = '~/.cache/kitty/colors.conf' }
      wez = { src = 'wez', dst = '~/.config/wezterm/colors/scheme.toml' }
      omp = { src = 'omp', dst = '~/.config/oh-my-posh/theme.yaml' }
    '';

    home.file.".config/wallust/templates/rofi".source = ./templates/colors-rofi;
    home.file.".config/wallust/templates/waybar".source =
      ./templates/colors-waybar.css;
    home.file.".config/wallust/templates/alacritty".source =
      ./templates/colors-alacritty;
    home.file.".config/wallust/templates/hypr".source =
      ./templates/colors-hyprland;
    home.file.".config/wallust/templates/nvim".source = ./templates/colors-nvim;
    home.file.".config/wallust/templates/gtk".source = ./templates/colors-gtk;
    home.file.".config/wallust/templates/omp".source = ./templates/oh-my-posh;
    home.file.".config/wallust/templates/mako".source = ./templates/colors-mako;
    home.file.".config/wallust/templates/kitty".source =
      ./templates/colors-kitty;
    home.file.".config/wallust/templates/wez".source = ./templates/colors-wez;
  };
}
