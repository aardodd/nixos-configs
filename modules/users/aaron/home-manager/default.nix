{ pkgs, ... }:
{
  imports = [
    ./terminal.nix  
  ];

  home.packages = with pkgs; [
    firefox
  ];
}