{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nur.overlays.default
    inputs.niri.overlays.niri
  ];
}
