{pkgs , ...}:
{
  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
    nerd-fonts.fira-code 
    font-awesome 
    material-design-icons 
    ];
}