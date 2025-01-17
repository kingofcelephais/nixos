{ lib, ... }:

{
  imports = [
    ./hypr.nix
    ./waybar.nix
    ./wlogout.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./language.nix
  ];

  hypr.enable = lib.mkDefault true;
  hyprlock.enable = lib.mkDefault true;
  hypridle.enable = lib.mkDefault true;
  waybar.enable = lib.mkDefault true;
  wlogout.enable = lib.mkDefault true;
  language.enable = lib.mkDefault true;
}
