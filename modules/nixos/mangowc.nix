{ pkgs, ... }:

{
  # Session entry (only if Mango module doesn't provide it)
  /*environment.etc."wayland-sessions/mango.desktop".text = '' 
    [Desktop Entry]
    Name=MangoWM 
    Comment=Wayland compositor MangoWM 
    Exec=mango 
    Type=Application
    DesktopNames=Mango
    SessionType=wayland
  '';*/

  programs.xwayland.enable = true;
}