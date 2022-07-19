{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.alacritty;
in
{
  options.cyber.alacritty = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
    configPath = mkOption {
      type = type.str;
      default = "./alacritty.yml";
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };

    xdg.configFile."alacritty/alacritty.yml".source = cfg.configPath;
  };
}