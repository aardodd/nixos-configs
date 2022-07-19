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
    herbstluftwm = {
      enable = true;
    };
    polybar = {
      enable = true;
      configPath = ../dotfiles/polybar/config.ini;
    };
    rofi.enable = true;
    zsh.enable = true;
  };

  home.file.".xinitrc".source = ../dotfiles/x11/xinitrc;

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
