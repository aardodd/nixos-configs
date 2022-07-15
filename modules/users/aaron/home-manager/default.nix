{ pkgs, ... }:
{
  imports = [
    ./awesomewm.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    firefox
    flameshot
  ];
}