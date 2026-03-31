{ pkgs, lib, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    #VMBOX fixes
    gtk3
    gsettings-desktop-schemas
    #Quemu + virt
    qemu
    virt-manager
    virt-viewer
  ];

  environment.variables = {
    QT_QPA_PLATFORM = lib.mkForce "xcb";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
    GTK_USE_PORTAL = "0";
  };

  boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" ];

  users.users.dragonline.extraGroups = [ "vboxusers" ];
}