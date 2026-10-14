{ config, pkgs, ... }: {
  users.users.ivaneh.packages = with pkgs; [
    firefox
    kdePackages.kate
    steam
    discord
  ];
}
