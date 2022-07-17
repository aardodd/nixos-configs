{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.herbstluftwm.enable = true;
  };
}
