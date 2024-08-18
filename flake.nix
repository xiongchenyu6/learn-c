# SPDX-FileCopyrightText: 2021 Serokell <https://serokell.io/>
#
# SPDX-License-Identifier: CC0-1.0
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    jetpack-nixos.url = "github:anduril/jetpack-nixos";
  };

  outputs =
    {
      nixpkgs,
      flake-parts,
      jetpack-nixos,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          lib,
          ...
        }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ jetpack-nixos.overlays.default ];
            config = { };
          };
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              clang
              nvidia-jetpack.l4t-gstreamer
              bear
              cmake
              pcre2
              util-linux
              libselinux
              libsepol
              libsysprof-capture
              libsoup
              json-glib
              sqlite
              libpsl
              brotli
              libunwind
              elfutils
              zstd
              orc
              glib-networking
              # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
              libnice
              gst_all_1.gstreamer
              # Common plugins like "filesrc" to combine within e.g. gst-launch
              gst_all_1.gst-plugins-base
              # Specialized plugins separated by quality
              gst_all_1.gst-plugins-good
              gst_all_1.gst-plugins-bad
              gst_all_1.gst-plugins-ugly
              # Plugins to reuse ffmpeg to play almost every video format
              gst_all_1.gst-libav
              # Support the Video Audio (Hardware) Acceleration API
              gst_all_1.gst-vaapi
              pkg-config
            ];
            shellHook = ''
              export GST_PLUGIN_SYSTEM_PATH_1_0="${pkgs.gst_all_1.gstreamer.out}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-good}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-plugins-ugly}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-libav}/lib/gstreamer-1.0:${pkgs.gst_all_1.gst-vaapi}/lib/gstreamer-1.0:${pkgs.libnice.out}/lib:${pkgs.glib-networking}/lib:${pkgs.nvidia-jetpack.l4t-gstreamer}/lib"
            '';
          };
        };

    };
}
