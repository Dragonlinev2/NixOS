{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    dotnet-sdk_8
    docker 
    docker-compose
    cloudflared
    pciutils 
    lshw
    fastfetch
    nixd
    alejandra
    git
    vscode  
    ncdu
    nodejs
    azuredatastudio #database management tool from Microsoft, supports SQL Server, Azure SQL Database, and Azure SQL Data Warehouse
    gitnuro
    lazydocker
  ];
}