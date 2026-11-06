{ config, pkgs, ... }: {

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true; 

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  hardware.opengl.driSupport32Bit =
    true; # Enables support for 32bit libs that steam uses
}
