{ config
, lib
, pkgs
, modulesPath
, ...
}:
with lib;
let
  hostName = "ephemeral";
  nixRev = if self.inputs.nixpkgs ? rev then self.inputs.nixpkgs.shortRev else "dirty";
  selfRev = if self ? rev then self.shortRev else "dirty";
in
{
  import = [
    # base profiles
    ${modulesPath}/profiles/base.nix
    ${modulesPath}/profiles/all-hardware.nix

    # Let's get it booted in here
    ${modulesPath}/installer/cd-dvd/iso-image.nix
    self.inputs.grub2-themes-png.nixosModule

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    ${modulesPath}/installer/cd-dvd/channel.nix
  ];

  networking.hostName = hostName;

  users.mutableUsers = false;

  isoImage.isoName = "${hostName}-${nixRev}-${selfRev}.iso";
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;
  isoImage.appendToMenuLabel = " live";

    boot.loader = rec {
    grub2-theme = {
      enable = true;
      icon = "white";
      theme = "whitesur";
      screen = "1080p";
      footer = true;
    };
  };

  isoImage.grubTheme = config.boot.loader.grub.theme;
  isoImage.splashImage = config.boot.loader.grub.splashImage;
  isoImage.efiSplashImage = config.boot.loader.grub.splashImage;

  # Add Memtest86+ to the ISO.
  boot.loader.grub.memtest86.enable = true;

  # An installation media cannot tolerate a host config defined file
  # system layout on a fresh machine, before it has been formatted.
  swapDevices = mkImageMediaOverride [ ];
  fileSystems = mkImageMediaOverride config.lib.isoFileSystems;
}