{ config, lib, pkgs, modulesPath, ... }:
{
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "mptspi"
    "uhci_hcd"
    "ehci_pci"
    "sd_mod"
    "sr_mod"
  ];
  
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices = [ ];
}