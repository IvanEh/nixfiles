{ config, pkgs, ... }: {
  users.users.admin.packages = with pkgs; [
    firefox
    kdePackages.kate
    steam
    discord
  ];
}
