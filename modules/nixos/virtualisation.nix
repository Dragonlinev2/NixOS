{ pkgs, lib, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    virtualbox
    gtk3
    gsettings-desktop-schemas
  ];

  # Wymuszenie Qt na X11 (XWayland)
  environment.variables.QT_QPA_PLATFORM = lib.mkForce "xcb";

  boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" ];

  users.users.dragonline.extraGroups = [ "vboxusers" ];
}