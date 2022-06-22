{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "toast";
  nix.automaticUpgrades.enable = true;
  time.timeZone = "Europe/London";
  system.stateVersion = "22.05";
}