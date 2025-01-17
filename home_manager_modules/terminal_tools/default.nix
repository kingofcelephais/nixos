{ lib, ... }:

{
  imports =
    [ ./lf.nix ./zsh.nix ./neovim.nix ./music.nix ./yazi.nix ./fastfetch.nix ];

  lf.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  yazi.enable = lib.mkDefault true;
  fastfetch.enable = lib.mkDefault true;
}
