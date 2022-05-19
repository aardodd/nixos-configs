# How to setup a machine

 1. Boot into the NixOS installer.
 2. If your machine uses Legacy Boot, see "How to partition with Legacy Boot".
 3. If your machine uses UEFI Boot, see "How to partition with UEFI"
 4. See "Formatting Disks" for disk formatting instructions.
 5. See "Mounting Drives" for mounting instructions.
 6. Use `nixos-generate-config --root /mnt` to generate a sample configuration.
 6. Clone `https://github.com/aardodd/nixfiles` to `/etc/nixos`.
 7. Symlink the desired hosts file to `/etc/nixos/host`.
 8. Run `nixos-install`.

## How to partition with Legacy Boot

In this example, 4GiB is reserved for swap space. The default filesystem in use is ext4.

```bash
parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1MiB -4GiB
parted /dev/sda -- mkpart primary linux-swap -4GiB 100%
```

## How to partition with UEFI

In this example, 4GiB is reserved for swap space.

```bash
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -4GiB
parted /dev/sda -- mkpart primary linux-swap -4GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 esp on
```

## Formatting Disks

The default filesystem in use is ext4.

```bash
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
```

On UEFI systems you must also do the following:

```bash
mkfs.fat -F 32 -n boot /dev/sda3
```

## Mounting

```bash
mount /dev/disk/by-label/nixos /mnt
```

On UEFI systems you must also do the following:

```bash
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
```

Once the main drives are mounted you can enable swap

```bash
swapon /dev/sda2
```