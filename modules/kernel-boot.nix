{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Acer Swift 5 specific configs, see https://wiki.archlinux.org/title/Acer_Swift_5
  # Disabled for Wifi Testing - Aug 13
  boot.kernelParams = ["acpi_backlight=video" "acpi_osi=Linux" "pci=nocrs" "i915.enable_fbc=1" "snd_rn_pci_acp3x.dmic_acpi_check" "usbcore.quirks=2386:433b:bk"];
  boot.extraModprobeConfig = ''
    options snd_sof_intel_hda_common hda_model=alc255-acer
  '';
  # Disabling end
 boot.supportedFilesystems = [ "ntfs" ];
}
