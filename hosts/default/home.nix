{ pkgs, inputs, ... }:

{

  imports = [ inputs.self.outputs.homeManagerModules.default ];
  home.username = "kuranes";
  home.homeDirectory = "/home/kuranes";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    #languages
    python3
    conda
    jdk21
    jdk
    jdt-language-server
    rustc
    rustup
    gnumake
    gcc_multi
    glibc
    gdb
    kotlin
    nodejs
    ghc
    electron
    nix-index
    sqlite
    go
    ocaml
    opam
    dune_3
    ocamlPackages.odoc
    ocamlPackages.utop

    swi-prolog

    godot_4
    gdtoolkit_4
    xterm
  ];

  programs.home-manager.enable = true;
}
