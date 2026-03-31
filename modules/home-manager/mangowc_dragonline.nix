{ pkgs,...}:
{
  home.packages = with pkgs; [
    kitty
    waybar
    kanshi
    rofi
    swaybg
    wl-clipboard
    wlogout
  ];  
}