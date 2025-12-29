{...}:
{
  #adding mango to LY 
  environment.etc."wayland-sessions/mango.desktop".text = '' 
  [Desktop Entry]
  Name=MangoWM 
  Comment=Wayland compositor MangoWM 
  Exec=mango 
  Type=Application Desktop
  Names=Mango 
  SessionType=wayland '';
}