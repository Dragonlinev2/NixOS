{...}:
{
  #WaylandEnv 
  home.sessionVariables = 
  { 
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_ENABLE_WAYLAND = "1"; # Firefox 
    NIXOS_OZONE_WL = "1"; # Chromium-based browsers
    GDK_BACKEND = "wayland,x11"; # GTK apps 
    QT_QPA_PLATFORM = "wayland";
    
  };
}
