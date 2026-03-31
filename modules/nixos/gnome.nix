{...}:
{
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;
  services.dbus.enable = true;
  services.udisks2.enable = true; 
  services.accounts-daemon.enable = true; 
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
}