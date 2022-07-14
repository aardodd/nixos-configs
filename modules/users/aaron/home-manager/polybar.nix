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
        modules-right = "date";
      };

      "module/ewmh" = {
        type = "internal/xworkspaces";
        
        pin-workspaces = "false";
        enable-click = "true";
        enable-scroll = "true";
        reverse-scroll = "true";

        icon-0 = "0;";
        icon-1 = "1;";
        icon-2 = "2;";
        icon-3 = "3;";
        icon-4 = "4;";
        icon-5 = "5;";
        icon-6 = "6;";
        icon-7 = "7;";
        icon-8 = "8;";
        icon-9 = "9;";

        format = "<label-state>";
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        label = "%title%";
      };

      "module/date" = {
        type = "internal/date";

        date = "%Y-%m-%d%";
        time = "%H:%M:%S";
      };
    };
  };
}