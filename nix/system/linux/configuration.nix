{ pkgs, ... }:
{
  imports = [
    ./automatic-upgrades.nix
    ./optimizations.nix
  ];

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = false;
  };

  users.defaultUserShell = pkgs.zsh;
  users.mutableUsers = false;
}