{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./awesomewm.nix
    ./terminal 
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
