{...}:
{
  #WaylandEnv 
  home.sessionVariables = 
  { 
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "mango";
    MOZ_ENABLE_WAYLAND = 1; # Firefox 
    GDK_BACKEND = "wayland"; # GTK apps 
  };
}
