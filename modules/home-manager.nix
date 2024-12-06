# https://github.com/ericr35811/nixos-configs/blob/461b116bcbb31686a2d6b071f82336375c06f3e5/hm/home.nix#L4

let
  plasma = builtins.fetchGit {
    url = "https://github.com/nix-community/plasma-manager";
    rev = "5a0c70a007837e2db01e0bb68971792e8653d32c";
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
