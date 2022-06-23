{ ... }:
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.awesomewm.enable = true;
  };
}