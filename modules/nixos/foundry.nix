{inputs, pkgs,  ...}:
{
    #foundry setup
  services.foundryvtt = {
    
  enable = true;
  hostName = "dragon-den.local";
  minifyStaticFiles = true;
  proxyPort = 443;
  proxySSL = true;
  upnp = false;

  package = inputs.foundryvtt.packages.${pkgs.system}.foundryvtt_13.overrideAttrs (old: {
    src = "../../../zip/FoundryVTT-Linux-13.351.zip";
  });
};
}