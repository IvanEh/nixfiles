#!/bin/sh
echo "$ sudo nixos-rebuild switch"

sudo nixos-rebuild switch -I "nixos-config=/home/ivaneh/nixos/configuration.nix" |& nom

echo "Finished building system. You can close the window..."

