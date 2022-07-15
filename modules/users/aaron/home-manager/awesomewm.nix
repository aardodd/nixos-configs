{ pkgs, ... }:
{
  xsession.windowManager.awesome = {
    enable = true;
  };

  xdg.configFile."awesome/rc.lua".source = "../dotfiles/awesome/rc.lua";
}