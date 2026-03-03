{ 
  description = "NixOS configuration with MangoWM, FoundryVTT, and Home Manager"; 
  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager = { 
      url = "github:nix-community/home-manager"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    }; 
    foundryvtt.url = "github:reckenrode/nix-foundryvtt"; 
    mangowc = { 
      url = "github:DreamMaoMao/mangowc"; 
      inputs.nixpkgs.follows = "nixpkgs"; }; 
    }; 
    outputs = inputs@{ self, nixpkgs, home-manager, foundryvtt, mangowc, ... }: 
    { nixosConfigurations.dragon-den = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        # Base NixOS config 
        ./hosts/default/configuration.nix 
        # Home Manager as a NixOS module 
        home-manager.nixosModules.default 
        # FoundryVTT NixOS module 
        foundryvtt.nixosModules.foundryvtt 
        # Mango NixOS module 
        mangowc.nixosModules.mango { 
          # Enable MangoWM at the system level 
          programs.mango.enable = true;

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true; 
            backupFileExtension = "backup"; 

            users."dragonline".imports = [
              ./hosts/default/home.nix # Mango Home Manager module

               mangowc.hmModules.mango 
        
               # Mango configuration for the user
              { 
                wayland.windowManager.mango = {
                enable = true;

                settings = ''
                  output * scale 1
                '';

                autostart_sh = ''
                  # Start a terminal so you don't get a gray screen
                  foot &

                  # Status bar
                  waybar &

                  # Output management
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