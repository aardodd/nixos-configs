{ pkgs, ... }:
{
  xsession.windowManager.herbstluftwm = {
    enable = true;
    extraConfig = ''
    '';
    keybinds = {
      # master controls
      Mod4-Shift-q = "quit";
      Mod4-Shift-r = "reload";
      Mod4-Shift-c = "close";
      
      # spawn programs
      Mod4-Return = "spawn kitty";

      # basic movement
      ## focusing clients
      Mod4-h = "focus left";
      Mod4-j = "focus down";
      Mod4-k = "focus up";
      Mod4-l = "focus right";

      ## moving clients
      Mod4-Shift-h = "shift left";
      Mod4-Shift-j = "shift down";
      Mod4-Shift-k = "shift up";
      Mod4-Shift-l = "shift right";

      # splitting frames
      Mod4-u             = "split bottom 0.5";
      Mod4-o             = "split right 0.5";
      Mod4-Control-space = "split explode";
      
      # resizing frames
      Mod4-Control-h = "resize left 0.05";
      Mod4-Control-j = "resize down 0.05";
      Mod4-Control-k = "resize up 0.05";
      Mod4-Control-l = "resize right 0.05";

      # tags
      ## direct use tag switch
      Mod4-1 = "use_index 1";
      Mod4-2 = "use_index 2";
      Mod4-3 = "use_index 3";
      Mod4-4 = "use_index 4";
      Mod4-5 = "use_index 5";
      Mod4-6 = "use_index 6";
      Mod4-7 = "use_index 7";
      Mod4-8 = "use_index 8";
      Mod4-9 = "use_index 9";

      ## direct move tag switch
      Mod4-Shift-1 = "move_index 1";
      Mod4-Shift-2 = "move_index 2";
      Mod4-Shift-3 = "move_index 3";
      Mod4-Shift-4 = "move_index 4";
      Mod4-Shift-5 = "move_index 5";
      Mod4-Shift-6 = "move_index 6";
      Mod4-Shift-7 = "move_index 7";
      Mod4-Shift-8 = "move_index 8";
      Mod4-Shift-9 = "move_index 9";

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
    tags = [
        "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
    ];
  };
}