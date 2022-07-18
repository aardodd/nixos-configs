{ pkgs, ... }:
{
  xsession.windowManager.herbstluftwm = {
    enable = true;
    extraConfig = ''
      systemctl --user restart polybar

      # tile border
      active_colour="#9fbc00"
      normal_colour="#454545"
      urgent_colour="orange"

      # tiling
      hc set_attr theme.tiling.active.border_width 2
      hc set_attr theme.tiling.active.color        "$active_colour"

      hc set_attr theme.tiling.normal.border_width 2
      hc set_attr theme.tiling.normal.color        "$normal_colour"

      hc set_attr theme.tiling.urgent.border_width 2
      hc set_attr theme.tiling.urgent.color        "$urgent_colour"

      ### Floating window borders
      hc set_attr theme.floating.active.border_width 7
      hc set_attr theme.floating.active.color        "$active_colour"

      hc set_attr theme.floating.normal.border_width 1
      hc set_attr theme.floating.normal.color        "$normal_colour"

      hc set_attr theme.floating.urgent.border_width 3
      hc set_attr theme.floating.urgent.color        "$urgent_colour"
    '';
    keybinds = {
      # master controls
      Mod4-Shift-q = "quit";
      Mod4-Shift-r = "reload";
      Mod4-Shift-c = "close";
      
      # spawn programs
      Mod4-Return = "spawn alacritty";
      Mod4-x = "spawn gmrun";

      # basic movement
      ## focusing clients
      Mod4-Left = "focus left";
      Mod4-Down = "focus down";
      Mod4-Up = "focus up";
      Mod4-Right = "focus right";

      ## moving clients
      Mod4-Shift-Left = "shift left";
      Mod4-Shift-Down = "shift down";
      Mod4-Shift-Up = "shift up";
      Mod4-Shift-Right = "shift right";

      # splitting frames
      Mod4-u             = "split bottom 0.5";
      Mod4-o             = "split right 0.5";
      Mod4-Control-space = "split explode";
      
      # resizing frames
      Mod4-Control-Left = "resize left 0.05";
      Mod4-Control-Down = "resize down 0.05";
      Mod4-Control-Up = "resize up 0.05";
      Mod4-Control-Right = "resize right 0.05";

      # tags
      ## direct use tag switch
      Mod4-1 = "use_index 0";
      Mod4-2 = "use_index 1";
      Mod4-3 = "use_index 2";
      Mod4-4 = "use_index 3";
      Mod4-5 = "use_index 4";
      Mod4-6 = "use_index 5";
      Mod4-7 = "use_index 6";
      Mod4-8 = "use_index 7";
      Mod4-9 = "use_index 8";
      Mod4-0 = "use_index 9";

      ## direct move tag switch
      Mod4-Shift-1 = "move_index 0";
      Mod4-Shift-2 = "move_index 1";
      Mod4-Shift-3 = "move_index 2";
      Mod4-Shift-4 = "move_index 3";
      Mod4-Shift-5 = "move_index 4";
      Mod4-Shift-6 = "move_index 5";
      Mod4-Shift-7 = "move_index 6";
      Mod4-Shift-8 = "move_index 7";
      Mod4-Shift-9 = "move_index 8";
      Mod4-Shift-0 = "move_index 9";

      ## cyle through tags
      Mod4-period = "use_index +1 --skip-visible";
      Mod4-comma  = "use_index -1 --skip-visible";

      # layout
      Mod4-r     = "remove";
      Mod4-space = "cycle_layout 1";
      Mod4-s     = "floating toggle";
      Mod4-f     = "fullscreen toggle";
      Mod4-p     = "pseudotile toggle";

      # focus
      Mod4-c         = "cycle";
      Mod4-Tab       = "cycle_all +1";
      Mod4-Shift-Tab = "cycle_all -1";
    };
    settings = {
      focus_follows_mouse = 1;
      tree_style = "╾│ ├└╼─┐";

      # frame backgrounds
      frame_bg_transparent = 1;

      # frame borders
      frame_border_active_color = "#222222";
      frame_border_normal_color = "#101010";

      # padding
      frame_gap = 4;
      window_gap = 0;
      frame_padding = 0;

      smart_window_surroundings = 0;
      smart_frame_surroundings = 1;
      always_show_frame = 0;
    };
    rules = [
      "focus=off"
      "windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' pseudotile=on"
      "windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on"
      "windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off"
    ];
    tags = [
        "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
    ];
  };
}