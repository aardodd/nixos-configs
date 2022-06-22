{ pkgs, ... }:
{
  imports = [
    ./automatic-upgrades.nix
    ./optimizations.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = false;
  };

  users.defaultUserShell = pkgs.fish;
  users.mutableUsers = false;
}