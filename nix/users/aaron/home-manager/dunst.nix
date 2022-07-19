{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
  };

  xdg.configFile."dunst/dunstrc".source = ../dotfiles/dunst/dunstrc;
}