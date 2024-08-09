{ config, pkgs, ... }:
{
  imports = [ <home-manager/nixos> ];
  home-manager.users.ivaneh = { pkgs, ... }: {
    home.stateVersion = "24.05";
  };
}
