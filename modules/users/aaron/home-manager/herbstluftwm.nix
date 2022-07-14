{ pkgs, ... }:
{
  xsession.windowManager.herbstluftwm = {
    enable = true;
    extraConfig = ''
      systemctl --user restart polybar

      herbstclient set_layout max
      herbstclient detect_monitors
    '';
    keybinds = {
      Mod4-Shift-q = "quit";
      Mod4-Shift-r = "reload";
      Mod4-Shift-c = "close";
      Mod4-Return = "spawn kitty";
    };
    tags = [
        "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
    ];
  };
}