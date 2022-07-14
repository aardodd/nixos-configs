# NixOS Configuration

## NixOS Installation Instructions

 1. Make sure these commands are running as the `root` user using `sudo -i`.
 2. Make nix-flakes and git available on the command line using the following:

```
nix-shell -p nixFlakes -p git
```

 3. Clone this github repository to a NixOS installation ISO and `cd` into the
    directory containing the repository.
 4. Format and mount partitions. You can run `./bootstrap/partition.sh` to
    provision a default partition scheme using ext4.
 5. Copy the repository files to the `/mnt/etc/nixos` directory and `cd` to the
    directory.
 6. Generate a `hardware-configuration.nix` for the host using the following
    command:

```
nixos-generate-config --root /mnt --dir ./modules/hosts/<SYSTEM>/<HOSTNAME>
```

 5. Run the following commands:

```
git add .
nixos-install --impure --no-root-password --flake .#<HOSTNAME>
```

NixOS will complain that the repository is dirty because we haven't committed
the `hardware-configuration.nix` file yet. I don't yet know if there is a
work-around for that.

 6. Alternatively, steps 3-5 can be automated using `./bootstrap/install.sh`.
 7. Reboot into the new system using `reboot`.
