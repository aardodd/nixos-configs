{ config, pkgs, ... }:
{
  cyber = {
    alacritty = {
      enable = true;
      configPath = ../dotfiles/alacritty/alacritty.yml;
    };
    dunst = {
      enable = true;
      configPath = ../dotfiles/dunst/dunstrc;
    };
    xmonad = {
      enable = true;
      configPath = ../dotfiles/xmonad/xmonad.hs;
    };
    zsh.enable = true;
  };

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
