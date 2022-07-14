#!/bin/sh

set -eo pipefail

source "./bootstrap/variables.sh"

if ! findmnt /mnt > /dev/null; then
  echo "Creating partitions on /dev/${NIX_INSTALL_BLOCK_DEVICE}..."
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mklabel gpt
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart primary ext4 ${NIX_INSTALL_BOOT_SIZE} -${NIX_INSTALL_SWAP_SIZE}
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart primary linux-swap -${NIX_INSTALL_SWAP_SIZE} 100%
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- mkpart ESP fat32 0% ${NIX_INSTALL_BOOT_SIZE}
  parted "/dev/${NIX_INSTALL_BLOCK_DEVICE}" -- set 3 esp on

  echo "Creating filesystems on /dev/${NIX_INSTALL_BLOCK_DEVICE}..."
  mkfs.ext4 -L nixos "/dev/${NIX_INSTALL_BLOCK_DEVICE}1"
  mkswap -L swap "/dev/${NIX_INSTALL_BLOCK_DEVICE}2"
  mkfs.fat -F 32 -n EFI "/dev/${NIX_INSTALL_BLOCK_DEVICE}3"

  echo "Mounting partitions under mount and enabling swap..."
  mount /dev/disk/by-label/nixos /mnt
  mkdir /mnt/boot
  mount /dev/disk/by-label/EFI /mnt/boot
  swapon /dev/disk/by-label/swap
fi
