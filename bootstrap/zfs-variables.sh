export NIX_ZFS_INSTALL_UUID=$(dd if=/dev/urandom bs=1 count=100 2>/dev/null | tr -dc 'a-z0-9' | cut -c-6)
export NIX_ZFS_INSTALL_ID=${NIX_INSTALL_ID:-nixos}

# list available disks with
# ls /dev/disk/by-id/*
# OR
# ls /dev/disk/by-path/* (if using virtio)
export NIX_ZFS_INSTALL_DISK=${NIX_INSTALL_DISK:-/dev/disk/by-id/disk1}
export NIX_ZFS_INSTALL_PRIMARY_DISK=$(echo $DISK | cut -f1 -d\ )

# Set vdev topology, possible values are:
#   (not set, single disk or striped; no redundancy)
#   mirror
#   raidz1
#   raidz2
#   raidz3
export NIX_ZFS_INSTALL_VDEV=${NIX_ZFS_INSTALL_VDEV:-}

export NIX_ZFS_PARTITION_SIZE_ESP=${NIX_ZFS_PARTITION_SIZE_ESP:-2}
export NIX_ZFS_PARTITION_SIZE_BPOOL=${NIX_ZFS_PARTITION_SIZE_BPOOL:-4}
export NIX_ZFS_PARTITION_SIZE_SWAP=${NIX_ZFS_PARTITION_SIZE_SWAP:-8}
export NIX_ZFS_PARTITION_SIZE_RPOOL=${NIX_ZFS_PARTITION_SIZE_RPOOL:-8}
