#!/bin/sh

set -eo pipefail

source "./bootstrap/variables.sh"

mkdir -p /mnt/etc/nixos
cp -r . /mnt/etc/nixos
cd /mnt/etc/nixos

echo "Building NixOS installation..."
if [ ! -f "./modules/hosts/${NIX_SYSTEM_NAME}/${NIX_HOST_NAME}/hardware-configuration.nix" ]; then
  nixos-generate-config --root /mnt --dir ./modules/hosts/${NIX_SYSTEM_NAME}/${NIX_HOST_NAME}
  git add "./modules/hosts/${NIX_SYSTEM_NAME}/${NIX_HOST_NAME}/hardware-configuration.nix"
fi

nixos-install --impure --no-root-password --flake .#${NIX_HOST_NAME}

echo
echo "Installation complete!"
echo
read -p "Reboot? [Y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    reboot
fi
