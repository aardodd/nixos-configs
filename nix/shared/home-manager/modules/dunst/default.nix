{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.dunst;
in
{
  options.cyber.dunst = {
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
    services.dunst = {
      enable = true;
      configFile = cfg.configPath;
    };
  };
}