{ ... }:

{
  virtualisation.virtualbox.host.enable = true;

  users.users.dragonline.extraGroups = [ "vboxusers" ];
}