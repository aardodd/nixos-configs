{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.herbstluftwm.enable = true;
  };
}
