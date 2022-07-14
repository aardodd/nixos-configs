{ pkgs, ... }:
{
  imports = [
    ./polybar.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    firefox
  ];
}