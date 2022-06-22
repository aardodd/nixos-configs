#!/bin/sh

set -eo pipefail

source "./bootstrap/variables.sh"

if ! findmnt /mnt > /dev/null; then
  echo "Creating partitions on /dev/${NIX_INSTALL_BLOCK_DEVICE}..."
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mklabel gpt
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart primary ext4 512MiB -${NIX_INSTALL_SWAP_SIZE}
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart primary linux-swap -${NIX_INSTALL_SWAP_SIZE} 100%
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart ESP fat32 0% 512MiB
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- set 3 esp on
  
  echo "Creating filesystems on /dev/${NIX_INSTALL_BLOCK_DEVICE}..."
  mkfs.ext4 -L nixos "/dev/${NIX_INSTALL_BLOCK_DEVICE}1"
  mkswap -L swap "/dev/${NIX_INSTALL_BLOCK_DEVICE}2"
  mkfs.fat -F 32 -n boot "/dev/${NIX_INSTALL_BLOCK_DEVICE}3"

  echo "Mounting partitions under mount and enabling swap..."
  mount /dev/disk/by-label/nixos /mnt
  mkdir /mnt/boot
  mount /dev/disk/by-label/boot /mnt/boot
  swapon /dev/disk/by-label/swap
fi

{
  echo "Building NixOS installation..."
  nix-shell \
    -p nixFlakes \
    -p git \
    --run "nixos-install --impure --no-root-password --flake .#${NIX_INSTALL_NAME}"

  echo "Copying installation files to user /home/${NIX_SYSTEM_USER}/nixos..."
  cp -av . "/mnt/home/${NIX_SYSTEM_USER}/nixos"
}

echo
echo "Installation complete!"
echo
read -p "Reboot? [Y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    reboot
fi
