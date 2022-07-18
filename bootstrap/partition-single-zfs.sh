#!/bin/sh

set -eo pipefail

source "./bootstrap/zfs-variables.sh"

# Use blkdiscard to erase disks
for i in ${NIX_ZFS_INSTALL_DISK}; do
blkdiscard -f $i &
done
wait

# Partition disks
for i in ${NIX_ZFS_INSTALL_DISK}; do
sgdisk --zap-all $i
sgdisk -n1:1M:+${NIX_ZFS_PARTITION_SIZE_ESP}G -t1:EF00 $i
sgdisk -n2:0:+${NIX_ZFS_PARTITION_SIZE_BPOOL}G -t2:BE00 $i
if [ "${NIX_ZFS_PARTITION_SIZE_SWAP}" != "" ]; then
    sgdisk -n4:0:+${NIX_ZFS_PARTITION_SIZE_SWAP}G -t4:8200 $i
fi
if [ "${NIX_ZFS_PARTITION_SIZE_RPOOL}" = "" ]; then
    sgdisk -n3:0:0   -t3:BF00 $i
else
    sgdisk -n3:0:+${NIX_ZFS_PARTITION_SIZE_RPOOL}G -t3:BF00 $i
fi
sgdisk -a1 -n5:24K:+1000K -t5:EF02 $i
done

# Create boot pool
disk_num=0; for i in $NIX_ZFS_INSTALL_DISK; do disk_num=$(( $disk_num + 1 )); done
if [ $disk_num -gt 1 ]; then NIX_ZFS_INSTALL_VDEV_BPOOL=mirror; fi

zpool create \
    -o compatibility=grub2 \
    -o ashift=12 \
    -o autotrim=on \
    -O acltype=posixacl \
    -O canmount=off \
    -O compression=lz4 \
    -O devices=off \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=/boot \
    -R /mnt \
    bpool_$NIX_ZFS_INSTALL_UUID \
     $NIX_ZFS_INSTALL_VDEV_BPOOL \
    $(for i in ${NIX_ZFS_INSTALL_DISK}; do
       printf "$i-part2 ";
      done)
