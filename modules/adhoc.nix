{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {

      # https://github.com/NixOS/nixpkgs/commit/ffd936a7bb69d47fe35631eea5b9f71dd1b72b51?diff=unified&w=0
      # https://discourse.nixos.org/t/how-to-override-package-version/2889/8
      anytype2 = let
        pname = "anytype";
        version = "0.43.6";
        name = "Anytype-${version}";
        src = super.fetchurl {
          url = "https://github.com/anyproto/anytype-ts/releases/download/v${version}/${name}.AppImage";
          name = "Anytype-${version}.AppImage";
          hash = "sha256-obF2bfFp+uRx3i3ihxkSIrAiARduM6Y8noeTX5FPyLY=";
        };
        appimageContents = super.appimageTools.extractType2 { inherit name src; };
        in super.appimageTools.wrapType2 {  
     
          inherit name src;
            extraPkgs = pkgs: [ pkgs.libsecret ];
            extraInstallCommands = ''
              mv $out/bin/${name} $out/bin/${pname}
              source "${super.makeWrapper}/nix-support/setup-hook"
              wrapProgram $out/bin/${pname} \
                --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
              install -m 444 -D ${appimageContents}/anytype.desktop -t $out/share/applications
              substituteInPlace $out/share/applications/anytype.desktop \
                --replace 'Exec=AppRun' 'Exec=${pname}'
              for size in 16 32 64 128 256 512 1024; do
                install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/anytype.png \
                  $out/share/icons/hicolor/''${size}x''${size}/apps/anytype.png
              done
            '';
            meta = with super.lib; {
              description = "P2P note-taking tool";
              homepage = "https://anytype.io/";
              license = licenses.unfree;
              maintainers = with maintainers; [ running-grass ];
              platforms = [ "x86_64-linux" ];
            };
          };

        })
  ];
}