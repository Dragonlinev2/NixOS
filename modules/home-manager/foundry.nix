
{ inputs, pkgs, ... }:

{
  services.foundryvtt = {
    enable = true;

    # Correct for nixpkgs-style Foundry package:
    package = pkgs.foundryvtt.override {
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