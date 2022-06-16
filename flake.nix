{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nixos-wsl,
    flake-utils,
    home-manager,
    ...
  }:
  let
    # variables
    inherit (lib.my) mapModules mapModulesRec mapHosts mapUsers;
    inherit (flake-utils.lib) system;
    inherit (home-manager.lib) homeManagerConfiguration;
    inherit (nixpkgs.lib) nixosSystem;
  
    lib = nixpkgs.lib.extend
      (self: super: { my = import ./lib { inherit pkgs inputs; lib = self; }; });
  in {
    nixosModules = mapModules ./modules {};
    nixosConfigurations = mapHosts ./hosts {};
    homeConfigurations = mapUsers ./users {};
  };
}