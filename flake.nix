{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    foundryvtt.url = "github:reckenrode/nix-foundryvtt/6c52bfc6824a3dba673df4894a71193ec32aa399";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, foundryvtt, ... }@inputs: {

    # NixOS system
    nixosConfigurations.dragon-den = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.default
        inputs.foundryvtt.nixosModules.foundryvtt
        ./hosts/default/configuration.nix
      ];
    };

    # Home Manager user configuration
    homeConfigurations.dragonline = home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
    modules = [ ./hosts/default/home.nix ]; 
  };

    # Expose home-manager as an app for `nix run`
    apps.x86_64-linux.home-manager = {
      type = "app";
      program = "${home-manager.packages.x86_64-linux.home-manager}/bin/home-manager";
    };
  };
}