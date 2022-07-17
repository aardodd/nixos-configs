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
    discord
    feh
    gimp
    keepassxc
    mpd
    mpv
    ncmpcpp
    spotify
  ];
}