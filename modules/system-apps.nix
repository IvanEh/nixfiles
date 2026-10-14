{ config, pkgs, ... }:
let
  # Inspired by https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=nodejs
  # upstream = import (builtins.fetchTarball "channel:nixos-24.11") {
  #   config = config.nixpkgs.config;
  # };
  mysterium = pkgs.stdenv.mkDerivation {
    name = "mysterium";
    src = pkgs.fetchurl {
      url = "https://github.com/mysteriumnetwork/mysterium-vpn-desktop/releases/download/10.17.10/mysterium-vpn-desktop_10.17.10_amd64.deb";
      sha256 = "sha256-aXCpQEZuJQV/HODgjL0Kn7Do+y2AZ6fxRUv7wgRh7ik=";
    };

  nativeBuildInputs = [ pkgs.dpkg pkgs.autoPatchelfHook pkgs.makeWrapper  ];

  buildInputs = with pkgs; [
    stdenv.cc.cc.lib
    libGL
    libglvnd
    mesa
    mesa.drivers
    vulkan-loader

    # X11 and graphics dependencies
    xorg.libxcb
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXrender

    # Additional libraries often needed
    gtk3
    glib
    nss
    nspr
    alsa-lib
    libdrm
    at-spi2-atk
    at-spi2-core
    dbus
    cups
    libnotify
    pango
    cairo
    expat
  ];

    unpackPhase = ''
      dpkg-deb -x $src ./
    '';

    installPhase = ''
      mkdir -p $out
      cp -r usr/* $out/
      cp -r opt/* $out/opt/
      # Adjust paths as needed

      makeWrapper $out/opt/mysterium-vpn-desktop $out/bin/mysterium-vpn-desktop\
               --prefix LD_LIBRARY_PATH  : "${pkgs.lib.makeLibraryPath mysterium.buildInputs}" \
               --set LIBGL_ALWAYS_INDIRECT "0" \
                --set MESA_GL_VERwSION_OVERRIDE "4.5" \
                --set MESA_GLSL_VERSION_OVERRIDE "450"
                # --set ELECTRON_RUN_AS_NODE "0" \
                # --set ELECTRON_NO_ATTACH_CONSOLE "1"
    '';

    dontAutoPatchelf = false;

    postFixup = ''
      if [ -f $out/share/applications/*.desktop ]; then
        substituteInPlace $out/share/applications/*.desktop \
          --replace "/opt/mysterium-vpn-desktop" "$out/opt/mysterium-vpn-desktop" \
          --replace "/usr/" "$out/"
      fi
    '';

    postInstall = ''
      # Ensure OpenGL libraries are correctly symlinked
      ln -sf ${pkgs.libGL}/lib/libGL.so.1 $out/opt/libGL.so.1
      ln -sf ${pkgs.libglvnd}/lib/libOpenGL.so.0 $out/opt/libOpenGL.so.0
      ln -sf ${pkgs.libglvnd}/lib/libGLX.so.0 $out/opt/libGLX.so.0
    '';
  };


in {

  programs.partition-manager.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server

  };
  programs.firefox.enable = true;
  programs.nix-ld.enable = true; # for uv
  # niri start:
  # programs.niri.enable = true;
# security.polkit.enable = true; # polkit
# services.gnome.gnome-keyring.enable = true; # secret service
# security.pam.services.swaylock = {};
# programs.waybar.enable = true; # top bar

#   services.greetd = {
#   enable = true;
#   settings = {
#     default_session = {
#       command = "${config.programs.niri.package}/bin/niri-session";
#       user = "ivaneh";
#     };
#   };
# };





  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    enpass
    kdePackages.yakuake
    pavucontrol
    telegram-desktop
    jetbrains.idea
    android-studio
    google-chrome
    # libsForQt5.ark
    kdePackages.ark
    openjdk17-bootstrap
    anki-bin
    libreoffice-qt
    imagemagick
    ghostscript
    simplescreenrecorder
    # teams
    dpkg
    coreutils-full
    coreutils
    minikube
    kubectl
    git
    percona-xtrabackup
    bc
    nushell
    kdePackages.partitionmanager
    poppler
    poppler-utils
    zoom-us
    # nodePackages_latest.pnpm
    nodejs_22
    obsidian
    vscode
    qemu
    appflowy
    # remnote
    nix-output-monitor
    nixfmt
    vlc
    # anytype2
    siyuan
    # libsForQt5.kio-gdrive
    # rpi-imager
    mysterium
    jupyter
    anytype
    uv
    prismlauncher
    # alacritty fuzzel swaylock mako swayidle waybar swaybg # Wallpaper tool
    # xwayland-satellite # X # niri
    kdePackages.karousel
    codex
  ];
}
