{ config, pkgs, ... }:
{
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
