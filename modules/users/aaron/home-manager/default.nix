{ pkgs, ... }:
{
  imports = [
    ./awesomewm.nix
    ./dunst.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    firefox
    flameshot
  ];
}