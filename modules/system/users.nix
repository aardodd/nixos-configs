{ config, lib, ... }:
let
  cfg = config.universe.machine;
  genericLinux = cfg.flavor == "generic";
in {
  options.universe.machine.user = {
    name = lib.mkOption {

    };
  };

  config = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = !genericLinux;


  };
};