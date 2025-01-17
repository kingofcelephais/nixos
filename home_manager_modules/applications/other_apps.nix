{ pkgs, lib, config, ... }:

{
  options = {
    other_apps.enable = lib.mkEnableOption "enables other desktop apps";
  };

  config = lib.mkIf config.other_apps.enable {
    home.packages = with pkgs; [
      image-roll
      krita
      tor-browser
      kitty
      gimp
      helvum
      wireshark
      libreoffice
      hunspell
      hunspellDicts.en_US
      blueberry
      anki
      rich-cli
      hexyl
    ];
  };
}
