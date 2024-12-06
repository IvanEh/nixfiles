https://www.zknotes.com/page/alternate-nixpkgs-in-flakes-nixos

nixfmt *

# TODO

- Migrate to flakes
- Improve set up using https://github.com/bobvanderlinden/nixos-config/blob/master/flake.nix

# Channels

https://channels.nixos.org/ - modification time

https://unix.stackexchange.com/questions/491727/how-do-i-upgrade-nixos-to-use-a-new-channel-nixos-versions

```
sudo nix-channel --add https://nixos.org/channels/nixos-24.11 nixos
sudo nix-channel --update
./rebuild.sh
```

Upgrade is just --update + rebuild

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml
https://github.com/nix-community/plasma-manager?tab=readme-ov-file
https://github.com/nix-community/plasma-manager/blob/trunk/examples/homeManager/home.nix


```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --add https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz plasma-manager
nix-channel --update plasma-manager
```

# Debugging

nixos-generate-config --dir .
nixos-rebuild test --show-trace -I "nixos-config=/home/ivaneh/nixos/conf/configuration.nix"