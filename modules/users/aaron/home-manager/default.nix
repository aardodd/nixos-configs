{ pkgs, ... }:
{
  imports = [
    ./awesomewm.nix
    ./polybar.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    firefox
  ];
}