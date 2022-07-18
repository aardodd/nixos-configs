{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./herbstluftwm.nix
    ./polybar.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    chromium
    firefox
    discord
    feh
    gimp
    gmrun
    keepassxc
    mpd
    mpv
    ncmpcpp
    spotify
  ];
}