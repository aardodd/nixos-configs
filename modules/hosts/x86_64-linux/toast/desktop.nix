{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
  };

  services.urxvtd.enable = true;
}
