{...}:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "dragon-den"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Home Manager integration
  home-manager.users.dragonline = import ./../../hosts/default/home.nix;
  # Enable networking
  networking.networkmanager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  system.stateVersion = "25.05"; 
}