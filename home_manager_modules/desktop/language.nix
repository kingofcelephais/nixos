{ pkgs, lib, config, ... }:

{
  options = {
    language.enable = lib.mkEnableOption "enables language input support";
  };

  config = lib.mkIf config.language.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-nord
        fcitx5-chinese-addons
        fcitx5-m17n
      ];
    };
  };
}
