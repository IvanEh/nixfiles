{ config, pkgs, ... }:
let
  # Inspired by https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=nodejs
	upstream = import (builtins.fetchTarball "channel:nixos-23.11") { config = config.nixpkgs.config;  };

in
{

  programs.partition-manager.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

  };
  programs.firefox.enable = true;

 # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    enpass
    yakuake
    pavucontrol
    tdesktop
    jetbrains.idea-community
    android-studio
    google-chrome
    libsForQt5.ark
    openjdk17-bootstrap
    anki-bin
    libreoffice-qt
    imagemagick
    ghostscript
    simplescreenrecorder
    teams
    dpkg
    coreutils-full
    coreutils
    minikube
    kubectl
    git
    percona-xtrabackup
    bc
    nushell
	partition-manager
poppler
 poppler_utils
zoom-us
# nodejs20
upstream.nodePackages_latest.pnpm
upstream.nodejs_20
obsidian
vscode
qemu
appflowy
remnote
nix-output-monitor
nixfmt
  ];
}
