{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nixos-wsl,
    darwin,
    flake-utils,
    flake-utils-plus,
    home-manager,
    sops-nix,
    ...
  }:
  let
    inherit (nixpkgs.lib) recursiveUpdate;
    lib = import ./lib;
  in
  flake-utils-plus.lib.mkFlake rec {
    inherit self inputs lib;

    hostDefaults.modules = [
      ./modules/configuration.nix
    ];

    hosts = lib.mkHosts {
      inherit self;
      hostsPath = ./modules/hosts;
    };
  };
}