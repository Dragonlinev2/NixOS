{ 
  description = "NixOS configuration with MangoWM, FoundryVTT, and Home Manager"; 
  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager = { 
      url = "github:nix-community/home-manager"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    }; 
    flake-parts.url = "github:hercules-ci/flake-parts";
    foundryvtt.url = "github:reckenrode/nix-foundryvtt"; 
    mangowc = { 
      url = "github:DreamMaoMao/mangowc"; 
      inputs.nixpkgs.follows = "nixpkgs"; }; 
    }; 
    outputs = inputs@{ self, nixpkgs, home-manager, foundryvtt, mangowc,flake-parts, ... }: 
    { nixosConfigurations.dragon-den = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix

        home-manager.nixosModules.default
        foundryvtt.nixosModules.foundryvtt

        # Mango module
        mangowc.nixosModules.mango

        # Your config for Mango
        {
          programs.mango.enable = true;

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            users."dragonline".imports = [
              ./hosts/default/home.nix
              mangowc.hmModules.mango

              {
                wayland.windowManager.mango = {
                  enable = true;

                  settings = ''
                    output * scale 1
                  '';

                  autostart_sh = ''
                    kitty &
                    waybar &
                    kanshi &
                  '';
                };
              }
            ];
          };
        }
      ];
    }; 
    # Define Home Manager as a standalone config too (optional) 
    #homeConfigurations.dragonline = home-manager.lib.homeManagerConfiguration{ 
    # pkgs = nixpkgs.legacyPackages.x86_64-linux; 
    # extraSpecialArgs = { inherit inputs; }; 
    # modules = [ ./hosts/default/home.nix ]; 
    #}; 
    # Handy CLI app 
    apps.x86_64-linux.home-manager = {
      type = "app";
      program = "${home-manager.packages.x86_64-linux.home-manager}/bin/home-manager"; }; }; 
}