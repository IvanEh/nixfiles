https://www.zknotes.com/page/alternate-nixpkgs-in-flakes-nixos

sudo nix-channel --add https://nixos.org/channels/nixos-24.05 nixos
sudo nixos-rebuild switch --upgrade
nixfmt *

# TODO

- Migrate to flakes
- Improve set up using https://github.com/bobvanderlinden/nixos-config/blob/master/flake.nix
