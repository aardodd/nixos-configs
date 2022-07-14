{ pkgs, ... }:
{
  imports = [
    ./bootloader.nix
    ./desktop.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "toast";
  nix.automaticUpgrades.enable = true;
  sops.defaultSopsFile = ./secrets.yaml;
  time.timeZone = "Europe/London";

  system.stateVersion = "22.05";
}