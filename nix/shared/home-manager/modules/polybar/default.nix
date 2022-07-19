{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.polybar;
in
{
  options.cyber.polybar = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
    configPath = mkOption {
      type = types.path;
      default = ./dunstrc;
    };
  };
  
  config = mkIf cfg.enable {
    services.polybar = {
      enable = true;
      config = cfg.configPath;
      script = "polybar main &";
    };
  };
}