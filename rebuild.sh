#!/bin/sh
echo "$ sudo nixos-rebuild switch"

# sudo nix-channel --add https://nixos.org/channels/nixos-24.11 nixos
# sudo nix-channel --updated
sudo sh -c  'nixos-rebuild switch --show-trace -I "nixos-config=/home/ivaneh/nixos/configuration.nix"'
# |& nom
echo "Finished building system. You can close the window..."

