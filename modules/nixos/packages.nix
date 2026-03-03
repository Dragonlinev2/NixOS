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
    neofetch
    nixd
    alejandra
    git
    vscode  
    #mangowc setup  
    foot #base terminal
    waybar #status bar 
    wl-clipboard #command line copy paste utility for wayland 
    grim #screenshots from command line wayland 
    slurp #Select a region in a Wayland compositor and print it to the standard output. Works well with grim. 
    swaybg #wallpaper for wayland 
    wofi #app launcher 
    eww #widget manager 
    kitty #terminal emulator 
    nemo #file manager
    kanshi #display config
    quickshell#toolkit for widgets
    qemu
    virt-manager
    virt-viewer
    davinci-resolve
    r2modman
    nodejs
    virtualbox
  ];
}