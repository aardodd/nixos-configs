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
        height = "25";
      };
    };
  };
}