{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    pkgs.partition-manager
    pkgs.docker
    inputs.swww.packages.${pkgs.system}.swww
    inputs.kura_prompt.packages.${pkgs.system}.kura_prompt
    pkgs.mako
    pkgs.htop
    pkgs.rofi-wayland
    pkgs.file
    pkgs.ntfs3g
    pkgs.mpd
    pkgs.zsh-fzf-tab
    pkgs.hexyl
    pkgs.git
    pkgs.git-credential-manager
  ];
}
