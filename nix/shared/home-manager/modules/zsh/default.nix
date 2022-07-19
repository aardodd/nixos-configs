{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.cyber.zsh;
in
{
  options.cyber.zsh = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
    };
  };
}
