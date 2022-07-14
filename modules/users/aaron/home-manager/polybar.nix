{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    script = ''
      exec polybar main &
    '';
    settings = {
      "bar/main" = {
        wm-restack = "herbstluftwm";
        width = "100%";
        height = "30";
        radius = "0.0";

        modules-left = "ewmh";
        modules-center = "title";
      };

      "module/ewmh" = {
        type = "internal/xworkspaces";
        
        pin-workspaces = "false";
        enable-click = "true";
        enable-scroll = "true";
        reverse-scroll = "true";

        icon-0 = "1";
        icon-1 = "2";
        icon-2 = "3";
        icon-3 = "4";
        icon-4 = "5";
        icon-5 = "6";
        icon-6 = "7";
        icon-7 = "8";
        icon-8 = "9";

        format = "<label-state>";
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        label = "%title%";
      };
    };
  };
}