{pkgs , ...}:
{
  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
    nerd-fonts.fira-code 
    font-awesome 
    material-design-icons
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-lgc-plus 
  ];
}