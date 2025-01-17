{ lib, ... }:

{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./alacritty.nix
    ./other_apps.nix
    ./kitty.nix
    ./wezterm.nix
  ];

  firefox.enable = lib.mkDefault true;
  zathura.enable = lib.mkDefault true;
  alacritty.enable = lib.mkDefault true;
  other_apps.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
