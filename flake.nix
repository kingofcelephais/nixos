{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    hyprland.url = "github:hyprwm/Hyprland";

    swww.url = "github:LGFae/swww";

    plugin-neopywal.url = "github:RedsXDD/neopywal.nvim";
    plugin-neopywal.flake = false;

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kura_prompt = { url = "github:kingofcelephais/kura_prompt"; };

  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/default/configuration.nix ./nixos_modules ];
    };

    homeManagerModules.default = ./home_manager_modules;
  };
}
