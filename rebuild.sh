#!/bin/sh
echo "$ sudo nixos-rebuild switch --flake /home/admin/nixos#nixos"

sudo nixos-rebuild switch --show-trace --flake /home/admin/nixos#nixos
echo "Finished building system. You can close the window..."
