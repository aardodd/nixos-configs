{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.xmonad;
in
{
  options.cyber.xmonad = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
    configPath = mkOption {
      type = types.path;
      default = ./xmonad.hs;
    };
  };
  
  config = mkIf cfg.enable {
    xsession.windowManager.xmonad = {
      enable = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.containers
      ];
      enableContribAndExtras = true;
      config = cfg.configPath;
    };
  };
}