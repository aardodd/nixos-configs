{ pkgs, ... }:
{
  xsession.windowManager.herbstluftwm = {
    enable = true;
    extraConfig = ''
      systemctl --user restart polybar

      herbstclient set_layout max
      herbstclient detect_monitors
    '';
    tags = [
        "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
    ];
  };
}