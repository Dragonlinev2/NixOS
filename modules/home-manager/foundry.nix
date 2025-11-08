{ inputs, pkgs, ... }:

{
  services.foundryvtt = {
    enable = true;

    # Correct way: call the foundryvtt function with src
    package = inputs.foundryvtt.packages.x86_64-linux.foundryvtt {
      src = pkgs.requireFile {
        name = "FoundryVTT-Linux-13.350.zip";
        url = "https://foundryvtt.com";
        sha256 = "sha256-CIc4CxqGmYviAUp76L8pwo+CVZ4cKyl2RcQ7qjlvkOo=";
      };
    };

    hostName = "dragon-den";
    proxySSL = true;
    proxyPort = 443;
  };
}
