#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "usage: $0 <username>" >&2
  exit 1
fi
nix --experimental-features "nix-command flakes" build \
  ".#homeConfigurations.$1.activationPackage"

echo
echo "Build complete! Apply to \$HOME by running:"
echo
echo "  ./result/activate"
echo
