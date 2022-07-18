{ pkgs, ... }:
{
  programs.alacritty.enable = true;
  xdg.configFile."alacritty/alacritty.yml".source = ../../dotfiles/alacritty/alacritty.yml;
}
