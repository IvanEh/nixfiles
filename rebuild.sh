#!/bin/sh
echo "$ sudo nixos-rebuild switch --flake /home/ivaneh/nixos#nixos"

sudo nixos-rebuild switch --show-trace --flake /home/ivaneh/nixos#nixos
echo "Finished building system. You can close the window..."
