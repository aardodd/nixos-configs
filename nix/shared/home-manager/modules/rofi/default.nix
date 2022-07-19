{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.rofi;
in
{
  options.cyber.rofi = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  
  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
    };
  };
}