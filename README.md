https://www.zknotes.com/page/alternate-nixpkgs-in-flakes-nixos

sudo nix-channel --add https://nixos.org/channels/nixos-24.05 nixos
sudo nixos-rebuild switch --upgrade
nixfmt *

# TODO

- Migrate to flakes
- Improve set up using https://github.com/bobvanderlinden/nixos-config/blob/master/flake.nix

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml
https://github.com/nix-community/plasma-manager?tab=readme-ov-file
https://github.com/nix-community/plasma-manager/blob/trunk/examples/homeManager/home.nix


```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --add https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz plasma-manager
nix-channel --update plasma-manager
```

