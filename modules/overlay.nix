{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nur.overlays.default
    inputs.niri.overlays.niri
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (old: {
        doCheck = false;
      });
      # niri-flake (9ee3e13) still evaluates `libdisplay-info_0_2`, an alias nixpkgs
      # removed on 2026-08-04. Its assert wants version "0.2.0", but niri-unstable
      # links libdisplay-info-rs 0.3, which needs the C library >=0.1,<0.4 — so
      # build against libdisplay-info_0_3 and only fake the attr name/version for
      # the assert. Remove once sodiboo/niri-flake#1853 lands.
      libdisplay-info_0_2 = prev.libdisplay-info_0_3.overrideAttrs (_: {
        version = "0.2.0";
      });
    })
  ];
}
