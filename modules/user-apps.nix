{ config, pkgs, ... }: {
  users.users.ivaneh.packages = with pkgs; [
    firefox
    kate
    steam
    discord
    skypeforlinux
  ];
}
