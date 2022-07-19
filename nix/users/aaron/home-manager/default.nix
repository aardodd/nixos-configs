{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./awesomewm.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    chromium
    firefox
    discord
    feh
    keepassxc
    mpd
    mpv
    ncmpcpp
  ];
}