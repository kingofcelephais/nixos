{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    tewi-font
    cozette
    envypn-font
    _0xproto
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    liberation_ttf
    #   nerd-fonds.fira-code
    #   fira-code-symbols
    #   fira-code-nerdfont
  ];
}
