# NixOS Configuration

## NixOS Installation Instructions

Format and mount partitions according to your needs, then run:

```
nix-shell \
  -p nixFlakes -p git \
  --run "nixos-install --flake github:aardodd/nixos-configs#navi"
```

## Home Manager Installation Instructions

```
nix-shell \
  -p nixFlakes -p git \
  --run "nix build github:aardodd/nixos-system#homeConfigurations.navi.activationPackage && ./result/activate"
```
