{ inputs, pkgs, ... }:

let
  foundryPkg = inputs.foundryvtt.packages.${pkgs.system}.default {
    src = pkgs.requireFile {
      name = "FoundryVTT-Linux-13.350.zip";
      url = "https://foundryvtt.com";
        sha256 = "sha256-CIc4CxqGmYviAUp76L8pwo+CVZ4cKyl2RcQ7qjlvkOo=";
    };
  };
in
{
  services.foundryvtt = {
    enable = true;
    package = foundryPkg;
    hostName = "dragon-den";
    proxySSL = true;
    proxyPort = 443;
  };
}
