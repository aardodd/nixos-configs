{ inputs, lib, pkgs, home-manager, ... }:
let
  inherit (lib) makeExtensible attrValues foldr;
  inherit (modules) mapModules;

  modules = import ./modules.nix {
    inherit lib;
    self.attributes = import ./attributes.nix { inherit lib; self = {}; };
  };

  mylib = makeExtensible (self:
    with self;
    mapModules ./. (file: import file { inherit self lib pkgs inputs home-manager; }));
in
mylib.extend
  (self: super:
    foldr (a: b: a // b) {} (attrValues super))
