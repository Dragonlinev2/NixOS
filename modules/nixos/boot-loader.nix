{...}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "uinput" ];
  boot.kernelParams = [ "nvidia-drm.modeset=1" ]; #trying to fix discord streaming
}
