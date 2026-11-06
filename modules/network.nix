{ config, pkgs, ... }: {
  networking.hostName = "nixos"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
#    networking.wireless.networks = {
#     "my network" = {
#       psk = "mypasswd";
#     };
#  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot =
    true; # powers up the default Bluetooth controller on boot
  # services.blueman.enable = true;

  networking.extraHosts =
  ''
    192.168.0.18 homeassistant.local
  '';

  # https://www.reddit.com/r/GeForceNOW/comments/11qudby/network_optimization_guide_reduce_lag/
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
}
