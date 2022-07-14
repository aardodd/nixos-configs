# NixOS Configuration

## NixOS Installation Instructions

 1. Clone this github repository to a NixOS installation ISO and `cd` into the
    directory containing the repository. If you are using a minimal ISO, you
    can access git using the following command:

```
nix-shell -p git
```

 2. Format and mount partitions. You can run `./bootstrap/partition.sh` to
    provision a default partition scheme.
 3. Copy the repository files to the `/mnt/etc/nixos` directory and `cd` to the
    directory.
 4. Generate a `hardware-configuration.nix` for the host using the following
    command:

```
nixos-generate-config --root /mnt --dir ./modules/hosts/<SYSTEM>/<HOSTNAME>
```

 5. Run the following commands:

```
nix-shell -p nixFlakes -p git
git add .
nixos-install --impure --no-root-password --flake .#<HOSTNAME>
```

NixOS will complain that the repository is dirty because we haven't committed
the `hardware-configuration.nix` file yet. I don't yet know if there is a
work-around for that.

 6. Reboot into the new system using `reboot`.
 7. Alternatively, steps 3-6 can be automated using `./bootstrap/install.sh`.
 8. Reboot into your new system.
