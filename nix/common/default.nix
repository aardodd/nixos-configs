{ lib, pkgs, home-manager, ... }:
{
  imports = [
    ./home-manager.nix
    ./nix-flakes.nix
  ];

  environment.systemPackages = [ pkgs.git ];

  nix = {
    generateRegistryFromInputs = true;
    generateNixPathFromInputs = true;
    linkInputs = true;
  };

  programs.zsh.enable = true;
}
