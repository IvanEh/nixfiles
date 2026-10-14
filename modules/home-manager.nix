# https://github.com/ericr35811/nixos-configs/blob/461b116bcbb31686a2d6b071f82336375c06f3e5/hm/home.nix#L4

let
  plasma = builtins.fetchGit {
    url = "https://github.com/nix-community/plasma-manager";
    rev = "a4b33606111c9c5dcd10009042bb710307174f51";
  };
in { config, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
  #   "${plasma.outPath}/modules"
  ];
  home-manager.users.ivaneh = { pkgs, ... }: {
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

  };
}
