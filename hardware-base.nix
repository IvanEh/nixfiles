{ config, pkgs, ... }:

{

  # Bluetooth, see https://nixos.wiki/wiki/Bluetooth
  # Aug 08 - Start - WIFI FIX - Search - STILL not working
  hardware.bluetooth.enable = true;

  hardware.bluetooth.settings = {
    General = { Enable = "Source,Sink,Media,Socket"; };
  };

  #   hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];
  #   hardware.pulseaudio.package = pkgs.pulseaudioFull;
  #   hardware.pulseaudio.extraConfig = "
  #	  load-module module-switch-on-connect
  #	";

}
