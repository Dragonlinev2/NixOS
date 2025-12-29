# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/nixos/fonts.nix
      ./../../modules/nixos/boot-loader.nix
      ./../../modules/nixos/base.nix
      ./../../modules/nixos/foundry.nix
      ./../../modules/nixos/gnome.nix
      ./../../modules/nixos/locale.nix
      ./../../modules/nixos/nvidia.nix
      ./../../modules/nixos/packages.nix
      ./../../modules/nixos/pipewire.nix
      ./../../modules/nixos/print.nix
      ./../../modules/nixos/steam.nix
      ./../../modules/nixos/user-acc.nix
      ./../../modules/nixos/x11.nix
    ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
