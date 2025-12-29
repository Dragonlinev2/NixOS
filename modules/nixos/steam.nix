{pkgs, ...}:
{
  #Steam support
  programs.steam = {
   enable = true;
   gamescopeSession.enable = true;
   extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  #Enable better performance mod for certain programs
  programs.gamemode.enable = true;
}