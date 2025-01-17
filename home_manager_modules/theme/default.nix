{ lib, ... }:

{
  imports = [
    ./theme.nix
    ./wallust.nix
  ];

  theme.enable = lib.mkDefault true;
  wallust.enable = lib.mkDefault true;
}
