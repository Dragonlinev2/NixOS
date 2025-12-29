{ pkgs,...}:
{
  home.packages = with pkgs; [  
  discord 
  brave
  spotify
  steam
  vulkan-loader
  vulkan-tools
  mangohud #overlay for fps and such
  protonup-ng #proton GE
  protonup-qt
  unityhub
  prismlauncher
  xivlauncher
  jetbrains.rider
  gimp
  obs-studio
  easyeffects
  ];
}
