{ inputs, lib, pkgs, ... }:

with lib;
with lib.my;
with home-manager.lib;
in {
  mkUser = path: attrs @ { system ? defaultSystem, ... }:
    homeManagerConfiguration {
      inherit system;
      specialArgs = { inherit lib inputs system; };
      modules = [
        {
          nixpkgs.pkgs = pkgs;
          networking.hostName = mkDefault (removeSuffix ".nix" (baseNameOf path));
        }
        (filterAttrs (n: v: !elem n [ "system" ]) attrs)
        ../.   # /default.nix
        (import path)
      ];
    };

  mapUsers = dir: attrs @ { system ? system, ... }:
    mapModules dir
      (hostPath: mkUser hostPath attrs);
}