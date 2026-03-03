{pkgs,...}:
{
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "dragonline" ];
   programs.dconf.enable = true;

   environment.systemPackages = with pkgs; [
      gtk3
      gsettings-desktop-schemas
  ];
}
