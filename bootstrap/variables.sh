export NIX_INSTALL_HOST=${NIX_INSTALL_HOST:-localhost}
export NIX_INSTALL_PORT=${NIX_INSTALL_PORT:-2222}
export NIX_INSTALL_USER=${NIX_INSTALL_USER:-nixos}

export NIX_INSTALL_BLOCK_DEVICE=${NIX_INSTALL_BLOCK_DEVICE:-sda}
export NIX_INSTALL_BOOT_SIZE=${NIX_INSTALL_BOOT_SIZE:-512MiB}
export NIX_INSTALL_SWAP_SIZE=${NIX_INSTALL_SWAP_SIZE:-4GiB}

export NIX_SYSTEM_NAME=${NIX_SYSTEM_NAME:-x86_64-linux}
export NIX_HOST_NAME=${NIX_HOST_NAME:-toast}

export NIX_SYSTEM_USER=${NIX_SYSTEM_USER:-aaron}